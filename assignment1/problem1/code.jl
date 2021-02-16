using Random
using Plots
pyplot()


range = -10:10
n_samples = 10^6
Random.seed!(0)
exp_ints = rand(range, n_samples)
means = []
let init = 0
    for i in 1:n_samples
        sample = exp_ints[i]
        init += sample
        push!(means, init/i)
    end
end

P = plot(1:n_samples, means, xlabel="Number of Samples", ylabel="Mean", show=true)
savefig(P,"problem1.png")