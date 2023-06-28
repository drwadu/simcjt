if __name__ == "__main__":
    import sys

    n_tasks, cpus_per_task, time = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
    preamble = [
        "#!/bin/bash",
        "#SBATCH --account=p_jury",
        "#SBATCH --partition=haswell",
        f"#SBATCH --ntasks={n_tasks}",
        f"#SBATCH --cpus-per-task={cpus_per_task}",
        f"#SBATCH --time={time}:00:00",
        "#SBATCH --mail-type=end",
        "#SBATCH --mail-user=doru415d@tu-dresden.de",
    ]

    m, p_hat, p_min, k, l, s, rate, name, dest, bin = (
        int(sys.argv[4]),
        float(sys.argv[5]),
        float(sys.argv[6]),
        int(sys.argv[7]),
        int(sys.argv[8]),
        int(sys.argv[9]),
        int(sys.argv[10]),
        sys.argv[11],
        sys.argv[12],
        sys.argv[13],
    )
    print(n_tasks, cpus_per_task, time, m, p_hat, p_min, k, l, s, rate, name, dest, bin)

    for i in range(1, rate + 1):
        delta_p = i / rate
        for f in [0.0, 0.3, 0.6, 0.9]:
            t = delta_p / (delta_p + 1.0)
            pi = f * t
            name_ = f"{name}-{i}_{m}_{delta_p}_{p_hat}_{p_min}_{pi}_{k}_{l}_{s}-{rate}_{f}_{t}"
            job = preamble + [f"#SBATCH --job-name={name}"]
            job.append(
                f"srun ./{bin} {m} {delta_p} {p_hat} {p_min} {pi} {k} {l} {s} > out-{dest}/{name_}.out",
            )

            with open(f"{dest}/{name_}.sh", "w") as g:
                g.write("\n".join(job))
