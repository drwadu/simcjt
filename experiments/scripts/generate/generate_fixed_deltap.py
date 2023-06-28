steps = 40
if __name__ == "__main__":
    m, delta_p, p_min, l, k, = 2, 0.5, 0.9, 1_000, 3
    pi = 0.9 * delta_p / (delta_p +1)
    for i in range(steps+1):
        p_hat = i / steps
        name = f"{i}_{m}_{delta_p}_{p_hat}_{p_min}_{pi}_{l}_{k}"
        job = []
        job.append(
            f"target/release/simcjt {m} {delta_p} {p_hat} {p_min} {pi} {l} {k} 600 > experiments/out/fixed_deltap/{name}.out",
        )

        with open(f"dfdp/{name}.sh", "w") as g:
            g.write("\n".join(job))
