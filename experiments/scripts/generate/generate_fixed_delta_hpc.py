preamble = [
        "#!/bin/bash",
        "#SBATCH --account=p_jury", 
        "#SBATCH --partition=haswell",
        "#SBATCH --ntasks=1",
        "#SBATCH --cpus-per-task=8",
        "#SBATCH --time=168:00:00",
        "#SBATCH --mail-type=end",
        "#SBATCH --mail-user=doru415d@tu-dresden.de",
        ]
steps = 40
if __name__ == "__main__":
    m, delta_p, p_min, l, k, s = 2, 0.5, 0.9, 1_000, 3, 300
    pi = 0.9 * delta_p / (delta_p +1)
    for i in range(steps+1):
        p_hat = i / steps
        name = f"{i}_{m}_{delta_p}_{p_hat}_{p_min}_{pi}_{l}_{k}_{s}"
        job = preamble + [f"#SBATCH --job-name={name}"]
        job.append(
            f"srun ./simcjt {m} {delta_p} {p_hat} {p_min} {pi} {l} {k} {s} > out-fdp/{name}.out",
        )

        with open(f"experiments/scripts/hpc-fdp/{name}.sh", "w") as g:
            g.write("\n".join(job))
