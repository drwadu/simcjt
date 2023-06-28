use rand::distributions::Uniform;
use rand::{thread_rng, Rng};
use rayon::prelude::*;
use std::sync::{Arc, Mutex};

fn read_next_arg<T: std::str::FromStr>(o: Option<String>, expected: &str) -> T {
    match o.and_then(|arg| {
        Some(match arg.parse::<T>() {
            Ok(x) => x,
            _ => {
                println!("invalid input for {}: {:?}", expected, arg);
                std::process::exit(-1)
            }
        })
    }) {
        Some(x) => x,
        _ => {
            println!("expected {}", expected);
            std::process::exit(-1)
        }
    }
}

fn main() {
    println!("5746c5059a971eca64fdd1bf9ffb58190d57f781"); 
    let mut input = std::env::args().skip(1);
    let (m, delta_p, p_hat, p_min, pi, l, k_pbs, s) = (
        read_next_arg::<usize>(input.next(), "m"),
        read_next_arg::<f32>(input.next(), "delta_p"),
        read_next_arg::<f32>(input.next(), "p_hat"),
        read_next_arg::<f32>(input.next(), "p_min"),
        read_next_arg::<f32>(input.next(), "pi"),
        read_next_arg::<usize>(input.next(), "l"),
        read_next_arg::<usize>(input.next(), "k"),
        read_next_arg::<f32>(input.next(), "s"),
    );
    assert!(pi < (delta_p / (delta_p + 1.0)));

    // search bound
    let bound = (p_hat
        * (2.0 / (delta_p.powf(2.0) * (pi - 1.0).powf(2.0)))
        * (((2.0 * (m as f32 - 1.0)) / (1.0 - p_min)).ln())
        + (1.0 - p_hat)
            * (2.0 / ((delta_p * (pi - 1.0)) + pi).powf(2.0))
            * (2.0 * ((m as f32 - 1.0) / (1.0 - p_min))).ln())
    .round() as usize;

    let u = Uniform::new(0.0, 1.0);
    let mut rng = thread_rng();

    //                 (a,b)
    //                /     \
    //          L=(a,c)     R=(c,b)
    let ub = bound + (bound as f32 * 0.1f32) as usize;
    let k = (s * (ub as f32).ln()).ceil() as usize;
    let root = (0, ub + 1); // n >= 1, but require 0 for search
    let (mut prev, mut node) = (root, root);
    let mut trace = vec![root];
    let (mut t, mut back_at) = (1,0);
    println!("{root:?}");

    loop {
        let (a, b) = node;

        if back_at == 300 {
            println!(":: threshold reached");
            println!("{trace:?}");
            print!("{m:?};{delta_p:?};{p_hat:?};{p_min:?};",);
            println!("{pi:?};{k_pbs:?};{l:?};{bound:?};{b:?};({a:?},{b:?})");
            return println!("m;delta_p;p_hat;p_min;pi;k;l;bound;n");
        }


        if rng.sample(u) < (1f32 / (ub as f32).ln()) {
            print!("tt {k:?} {node:?} ...");
            match b == a + 1 {
                true => {
                    match node == prev {
                        true => back_at += 1,
                        _ => back_at = 0,
                    }

                    let h_a_k = (0..k)
                        .into_par_iter()
                        .map(|_| coin_toss(a, delta_p, p_min, k_pbs, l, m, p_hat, pi))
                        .sum::<usize>() as f32
                        / k as f32;
                    let h_b_k = (0..k)
                        .into_par_iter()
                        .map(|_| coin_toss(b, delta_p, p_min, k_pbs, l, m, p_hat, pi))
                        .sum::<usize>() as f32
                        / k as f32;

                    println!(" {h_a_k:?} {h_b_k:?}");
                    if (h_a_k < 0.5f32) && (0.5f32 < h_b_k) {
                        println!("{trace:?}");
                        print!("{m:?};{delta_p:?};{p_hat:?};{p_min:?};",);
                        println!("{pi:?};{k_pbs:?};{l:?};{bound:?};{a:?}");
                        return println!("m;delta_p;p_hat;p_min;pi;k;l;bound;n");
                    }
                }
                _ => {
                    if let Some(n) = [a, b].into_par_iter().find_any(|n_agents| {
                        let h = (0..k)
                            .into_par_iter()
                            .map(|_| coin_toss(*n_agents, delta_p, p_min, k_pbs, l, m, p_hat, pi))
                            .sum::<usize>();
                        let v = h as f32 / k as f32;
                        print!(" {v:?}");
                        (0.25f32 <= v) && (v <= 0.75f32)
                    }) {
                        println!("\n{trace:?}");
                        print!("{m:?};{delta_p:?};{p_hat:?};{p_min:?};",);
                        println!("{pi:?};{k_pbs:?};{l:?};{bound:?};{n:?}");
                        return println!("m;delta_p;p_hat;p_min;pi;k;l;bound;n");
                    }
                    println!();

                    back_at = 0;
                }
            }
        }

        let a_flips = (0..2)
            .into_par_iter()
            .map(|_| coin_toss(a, delta_p, p_min, k_pbs, l, m, p_hat, pi))
            .sum::<usize>();
        let b_flips = (0..2)
            .into_par_iter()
            .map(|_| coin_toss(b, delta_p, p_min, k_pbs, l, m, p_hat, pi))
            .sum::<usize>();

        match a_flips == 2 || b_flips == 0 {
            true => {
                trace.pop();
                node = unsafe { *trace.last().unwrap_unchecked() };
                println!("B {:?} {t:?} {a_flips:?} {b_flips:?} {back_at:?}", node);
            }
            _ => {
                let c = ((a + b) as f32 / 2f32).floor() as usize;
                match coin_toss(c, delta_p, p_min, k_pbs, l, m, p_hat, pi) {
                    1 => {
                        prev = node;
                        node = (a, c); // left child
                        print!("L");
                    }
                    0 => {
                        prev = node;
                        node = (c, b); // right child
                        print!("R");
                    }
                    _ => panic!("coin toss > 1"),
                }
                if unsafe { *trace.last().unwrap_unchecked() } != node {
                    trace.push(node);
                }
                println!(" {:?} {t:?} {a_flips:?} {b_flips:?} {back_at:?}", node);
            }
        }

        t = t + 1;
    }
}

fn coin_toss(
    n: usize,
    delta_p: f32,
    p_min: f32,
    k_pbs: usize,
    n_votings: usize,
    m: usize,
    p_hat: f32,
    pi: f32,
) -> usize {
    // symmetric around 1/2
    let star = 0.5f32 + (delta_p / 2f32);
    let dagger = 0.5f32 - (delta_p / 2f32);

    let ps = Arc::new(Mutex::new(Vec::with_capacity(k_pbs)));

    (0..k_pbs).into_par_iter().for_each(|_| {
        let mut rng = thread_rng();

        let u = Uniform::new(0.0, 1.0);

        let mut p_values: Vec<Vec<f32>> = Vec::with_capacity(n);

        (0..n).for_each(|_| {
            let mut v = Vec::with_capacity(m);
            v.push(star);
            (0..m - 1).for_each(|_| v.push(dagger));
            p_values.push(v);
        });

        let ol_approves_star = match p_hat >= rng.sample(u) {
            true => 1,
            _ => 0,
        };

        let prob = (0..n_votings)
            .into_par_iter()
            .map(|_| {
                let voting = p_values
                    .iter()
                    .map(|ps| {
                        ps.iter()
                            .enumerate()
                            .map(|(idx, p)| {
                                let mut rng = thread_rng();
                                // agent follows OL?
                                match rng.sample(u) < pi {
                                    true => {
                                        // is true alternative?
                                        if idx == 0 {
                                            ol_approves_star
                                        } else {
                                            1
                                        }
                                    }
                                    _ => {
                                        match rng.sample(u) > *p {
                                            // agent does not vote for alternative i
                                            true => 0,
                                            // agent votes for alternative i
                                            _ => 1,
                                        }
                                    }
                                }
                            })
                            .collect::<Vec<_>>()
                    })
                    .collect::<Vec<_>>();
                let mut results = Vec::with_capacity(m);
                (0..m).for_each(|_| results.push(0));
                let counts = voting.iter().fold(results, |acc, rs| {
                    acc.iter()
                        .zip(rs.iter())
                        .map(|(a, b)| a + b)
                        .collect::<Vec<_>>()
                });
                let star_won = {
                    let star_c = unsafe { counts.get_unchecked(0) };
                    match !counts[1..].iter().any(|c| c >= star_c) {
                        true => 1,
                        _ => 0,
                    }
                };

                star_won
            })
            .sum::<usize>() as f32
            / n_votings as f32;
        ps.lock().unwrap().push(prob);
    });

    let p_ws = ps.lock().unwrap().iter().sum::<f32>() / k_pbs as f32;

    match p_ws > p_min {
        true => 1,
        _ => 0,
    }
}
