### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ c8d82e90-7150-11eb-2ab0-716ca4990e8d
using Random

# ╔═╡ e194dd0c-7150-11eb-2b00-431d8d83f43e
chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '=', '-', '`']

# ╔═╡ e7c02482-7150-11eb-1ef9-8f8dd345f981
password_length = 8

# ╔═╡ f3ac5ff6-7150-11eb-2ab5-e77a71442f41
begin
	Random.seed!(10)
	password = rand(chars, password_length)
end

# ╔═╡ f527b452-7150-11eb-396e-49cae14d1a95
function compare_strings(str1, str2, n_similarity)
	count = 0
	for i in 1:min(length(str1), length(str2))
		if str1[i] == str2[i]
			count+=1
		end
	end
	if count>=n_similarity
		return true
	else
		return false
	end
end

# ╔═╡ 251c2fe4-7151-11eb-2495-d5fb57b92498
similarity_threshold = 3

# ╔═╡ cdeb2d02-7151-11eb-3ac1-ef492523b2ed
n_experiments = 10^6

# ╔═╡ 32898136-7151-11eb-1a18-9125fd5b18b2
begin
	matches = 0
	for i in 1:n_experiments
		attempted_password = rand(chars, password_length)
		if compare_strings(attempted_password, password, similarity_threshold)
			matches+=1
		end
	end
	p_match = matches/n_experiments
end

# ╔═╡ 298badce-7152-11eb-1b62-d984bdc73355
p_match

# ╔═╡ 4adbbf32-7152-11eb-0e3b-b13757e496a2
matches

# ╔═╡ Cell order:
# ╠═c8d82e90-7150-11eb-2ab0-716ca4990e8d
# ╠═e194dd0c-7150-11eb-2b00-431d8d83f43e
# ╠═e7c02482-7150-11eb-1ef9-8f8dd345f981
# ╠═f3ac5ff6-7150-11eb-2ab5-e77a71442f41
# ╠═f527b452-7150-11eb-396e-49cae14d1a95
# ╠═251c2fe4-7151-11eb-2495-d5fb57b92498
# ╠═cdeb2d02-7151-11eb-3ac1-ef492523b2ed
# ╠═32898136-7151-11eb-1a18-9125fd5b18b2
# ╠═298badce-7152-11eb-1b62-d984bdc73355
# ╠═4adbbf32-7152-11eb-0e3b-b13757e496a2
