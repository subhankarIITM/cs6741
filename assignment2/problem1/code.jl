### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 6b0a6628-7cd0-11eb-361f-874aac5e663d
using DataFrames

# ╔═╡ aae6c9d2-7cd1-11eb-2318-45fee636a988
begin
	df1 = DataFrame(religion = String[], less_10k = Int[], _10_20k = Int[], _20_30k = Int[], _30_40k = Int[], _40_50k = Int[], _50_75k = Int[], _75_100k = Int[], _100_150k = Int[], greater_150k = Int[], refused = Int[])
	push!(df1,["Agnostic",27,34,60,81,76,137,122,109,84,96])
    push!(df1,["Atheist",12,27,37,52,35,70,62,15,1,10])
    push!(df1,["Buddhist",27,21,30,34,33,58,44,13,5,10])
    push!(df1,["Catholic",418,617,732,670,638,1116,770,438,6,10])
    push!(df1,["Don't Know/refused",15,14,15,11,10,35, 11,7,3,10])
    push!(df1,["Evangelical Prot",575,869,1064,982,881,1486,1082,681,14,10])
    push!(df1,["Hindu",1,9,7,9,11,34,19,8,3,10])
    push!(df1,["Historically Black Prot",228,244,236,238,197,223,338,97,2,10])
    push!(df1,["Jehovah's Witness",20,27,24,24,21,30,29,11,3,10])
    push!(df1,["Jewish",19,19,25,25,30,95,18,16,9,10])
end


# ╔═╡ 760fd8cc-7cfc-11eb-0da3-11e14677da6d
begin
	colnames1 = ["religion","<\$10k","\$10k-20k", "\$20k-30k", "\$30k-40k", "\$40k-50k", "\$50k-75k", "\$75k-100k", "\$100k-150k", ">\$150k", "Don't know/Refused"]
	rename!(df1, Symbol.(colnames1))
end

# ╔═╡ 31bc9568-7d04-11eb-261a-f19f269af975
begin
	stacked = stack(df1, 2:11)
	colnames1_ = ["religion", "income", "freq"]
	rename!(stacked, Symbol.(colnames1_))
	grouped = groupby(stacked, :religion)
	vcat(grouped...)
end

# ╔═╡ d1492478-7d06-11eb-3873-4179206d9452
md"### End of Question1"

# ╔═╡ ecaf3df6-7d06-11eb-2e25-6d4686e487e4
df2 = DataFrame(
	id = ["MX170004", "MX170004", "MX170004", "MX170004"],
	year = [2010, 2010, 2011, 2011],
	month = [1, 1, 2, 2],
	element = ["tmax", "tmin", "tmax", "tmin"],
	d1 = [missing, missing, 20, 10],
	d2 = [30, 20, missing, missing]
	)

# ╔═╡ 00437c8c-7d10-11eb-1114-6b392285b7b1
function parser(year, month, date)
	d = parse(Int, date[2:end])
	return string(year)*"-"*string(d, base=10, pad=2)*"-"*string(month, base=10, pad=2)
end

# ╔═╡ a6ca4570-7d0a-11eb-3222-f3026db58f93
begin
	grouped2 = groupby(df2, :element);
	tmax_data = sort(stack(grouped2[1], 5:6, variable_name=:d, value_name=:tmax));
	tmin_data = sort(stack(grouped2[2], 5:6, variable_name=:d, value_name=:tmin));
	tmax_final = transform(tmax_data, [:year, :month, :d] => ByRow((y,m,d) ->(a=parser(y,m,d))) => :date)[:, [:id, :date, :tmax]];
	tmin_final = transform(tmin_data, [:year, :month, :d] => ByRow((y,m,d) ->(a=parser(y,m,d))) => :date)[:, [:id, :date, :tmin]];
	df2_final = dropmissing(innerjoin(tmax_final, tmin_final, on = :date, makeunique=true)[:, [:id, :date, :tmax, :tmin]], [:tmax, :tmin])
end

# ╔═╡ fadbb466-7d1c-11eb-2371-0112133c6b27
md"### End of Question 2"

# ╔═╡ 6259ba16-7d1d-11eb-03f6-9bf0d2b2a261
grouped2.groups

# ╔═╡ 30657918-7d23-11eb-3465-8b7760adc54c
df3 = DataFrame(
	year = ["2000", "2000", "2000", "2000", "2001", "2001"],
	artist = ["2pac", "2pac", "2pac", "2pac", "eminem", "eminem"],
	time = ["4:22", "4:22", "3:15", "3:15", "3:53", "3:53"],
	track = ["Hello", "Hello", "World", "World", "Hi", "Hi"],
	date = ["2002-05-08", "2002-06-11", "2002-07-15", "2002-9-01", "2003-02-16", "2003-04-21"],
	week = [1, 2, 3, 4, 1, 2],
	rank = [10, 20, 40, 50, 2, 25]
	)

# ╔═╡ 29536bde-7d24-11eb-22f6-337fa0229c07
begin
	grouped3 = groupby(df3, [:artist, :track])
	df3.id = grouped3.groups
end

# ╔═╡ 50dc0a5a-7d24-11eb-0683-17fe5c0c4e08
first_part = unique(df3[:, [:id, :artist, :track, :time]])

# ╔═╡ b12da236-7d24-11eb-2df2-e3285755dad3
second_part = df3[:, [:id, :date, :rank]]

# ╔═╡ 01630c00-7d25-11eb-0000-bfff3fbcb4fd
md"### End of Question 3"

# ╔═╡ Cell order:
# ╠═6b0a6628-7cd0-11eb-361f-874aac5e663d
# ╠═aae6c9d2-7cd1-11eb-2318-45fee636a988
# ╠═760fd8cc-7cfc-11eb-0da3-11e14677da6d
# ╠═31bc9568-7d04-11eb-261a-f19f269af975
# ╟─d1492478-7d06-11eb-3873-4179206d9452
# ╠═ecaf3df6-7d06-11eb-2e25-6d4686e487e4
# ╠═00437c8c-7d10-11eb-1114-6b392285b7b1
# ╠═a6ca4570-7d0a-11eb-3222-f3026db58f93
# ╟─fadbb466-7d1c-11eb-2371-0112133c6b27
# ╠═6259ba16-7d1d-11eb-03f6-9bf0d2b2a261
# ╠═30657918-7d23-11eb-3465-8b7760adc54c
# ╠═29536bde-7d24-11eb-22f6-337fa0229c07
# ╠═50dc0a5a-7d24-11eb-0683-17fe5c0c4e08
# ╠═b12da236-7d24-11eb-2df2-e3285755dad3
# ╟─01630c00-7d25-11eb-0000-bfff3fbcb4fd
