# testing evolving graph katz centrality on author network data
using EvolvingGraphs
import EzXML

jmlr_dict = Dict()

# load graph data at each year
# form evolving graph
eg= evolving_graph(String, Int)
for year in range(2001, 17)
    g = load_graphml("jmlr_$(year).graphml")
    add_graph!(eg, g, year)
end

rating = katz_centrality(eg)

# show top 10 authors
sort(rating, by = x -> x[2], rev = true)[1:10]
