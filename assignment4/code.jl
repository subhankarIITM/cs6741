### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ e9ae9f40-af72-11eb-3147-af2618a2e8c6
begin
	using Plots
	plotly()
	using StatsBase
	using Distributions
	using DataFrames
	using StatsPlots
	using Random
end

# ╔═╡ acdb785e-0d73-4a9b-80a6-38aa2292ddf1
md"### Import Modules"

# ╔═╡ 8bfd8973-e205-4012-9a45-7827bdecb6a4
md"### Question 1"

# ╔═╡ 57a6a759-1916-4ea4-8279-883ca2a99f86
begin
	Random.seed!(8)
	n_samples_q1 = 1000000
	sampler_q1 = Binomial(50, 0.5)
	p_q1 = sum(rand(sampler_q1, n_samples_q1).>=30)/n_samples_q1
end

# ╔═╡ 19dbe212-b7bb-4006-bc69-a971a2c02f8e
md"### Question 2"

# ╔═╡ f20f02b7-9801-4c86-a6a5-acc2bdf13705
begin
	Random.seed!(8)
	n_samples_q2 = 1000000
	sampler_q2 = Binomial(50, 0.59)
	p_q2 = sum(rand(sampler_q2, n_samples_q2).>=30)/n_samples_q2
end

# ╔═╡ b8205e05-7250-4f06-9dd5-8132b298f41a
1-cdf(Binomial(50, 0.59), 29)

# ╔═╡ 8243344d-2be6-4e3b-8cb7-f13bbf912b88
md"### Question 3"

# ╔═╡ d9da30f6-01b1-4b63-bb95-efb6f9f680eb
begin
	Z_q3 = Normal(0,1)
	n_q3 = 1
	while cdf(Z_q3, (3000-100*n_q3)/(30*sqrt(n_q3))) >= 0.05
		n_q3 += 1
	end
	n_q3, cdf(Z_q3, (3000-100*n_q3)/(30*sqrt(n_q3)))
end

# ╔═╡ 20e04fe1-58f8-4d3a-9ee8-baf5d7f06046
md"### Question 4"

# ╔═╡ 1ba6a35e-306c-4c79-84ec-a3bc98f29e5a
begin
	samples = rand(Bernoulli(0.5), 10^4, 10^4)
	mean(sum(samples, dims=1))
end

# ╔═╡ Cell order:
# ╟─acdb785e-0d73-4a9b-80a6-38aa2292ddf1
# ╠═e9ae9f40-af72-11eb-3147-af2618a2e8c6
# ╟─8bfd8973-e205-4012-9a45-7827bdecb6a4
# ╠═57a6a759-1916-4ea4-8279-883ca2a99f86
# ╟─19dbe212-b7bb-4006-bc69-a971a2c02f8e
# ╠═f20f02b7-9801-4c86-a6a5-acc2bdf13705
# ╠═b8205e05-7250-4f06-9dd5-8132b298f41a
# ╟─8243344d-2be6-4e3b-8cb7-f13bbf912b88
# ╠═d9da30f6-01b1-4b63-bb95-efb6f9f680eb
# ╟─20e04fe1-58f8-4d3a-9ee8-baf5d7f06046
# ╠═1ba6a35e-306c-4c79-84ec-a3bc98f29e5a
