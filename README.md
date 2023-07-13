# Condorcet Jury Theorem Simulations
This repository contains data and code to reproduce experiments from the *To
Lead or to be Led: A Generalized Condorcet Jury Theorem under Dependence*
paper.

- The binary used for experiments can be bound [here](https://github.com/drwadu/simcjt/blob/master/experiments/bin/simcjt);
- results can be found [here](https://github.com/drwadu/simcjt/tree/master/experiments/csvs); and
- the code for simulations can be found [here](https://github.com/drwadu/simcjt/blob/master/src/simcjt.rs).

## Build
Use cargo.
1. if not installed, [install cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
2. run `cargo build --release`
3. find the binary in `target/release/simcjt`

## Usage
$m=2~~~\Delta_p=0.5~~~\hat{p}=0.9~~~P_{\mathrm{min}}=0.9~~~\pi=0.1~~~\ell=1000~~~k=3~~~s=600$ 
```
./experiments/bin/simcjt 2 0.5 0.9 0.9 0.1 1000 3 600
5746c5059a971eca64fdd1bf9ffb58190d57f781
(0, 36)
L (0, 18) 1 0 2 0
L (0, 9) 2 0 2 0
tt 2134 (0, 9) ... 0.0 1.0
R (4, 9) 3 0 2 0
L (4, 6) 4 0 2 0
R (5, 6) 5 0 2 0
tt 2134 (5, 6) ... 0.036551077 0.74601686
[(0, 36), (0, 18), (0, 9), (4, 9), (4, 6), (5, 6)]
2;0.5;0.9;0.9;0.1;3;1000;32;5
m;delta_p;p_hat;p_min;pi;k;l;bound;n
```

