include("on2ai.jl")

function run() 
  t=tag(data("auto.csv"))
  for r in sort(t.rows, by = x -> x.gt)
    print(r.tag) end end

run()
