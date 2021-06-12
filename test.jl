println("# test.jl ...")
using Random
using Test
include("keys0.jl")

function eg_lib()
  @assert same(1)==1 "not same"
  @assert int(3.2)==3  "bad int convert"
  @assert per([1,2,3,4], .25) == 1 "bad per"
  @assert thing(".32") == .32 "bad thing"
  Random.seed!(1)
  @assert few([10,20,30,40],4) == [10,20,20,10]
  @assert o([10,20,Dict(1=>2,3=>4)]) == 
            "[10, 20, {3=4, 1=2}]" "bad string"
  lst=[x for x in  csv("data/auto93.csv")]
  @assert typeof(lst[end][1]) == Float64 "badtype"
  @assert 399 == length(lst) "rows missed"
end 

function eg_some()
 s=inc!(Some(), ["a","a","a","b","b","c"])
 @assert true
end

go =  include("test.jl")

eg_all() = eg_lib(); eg_some()

egs= Dict("$x"[4:end] => getfield(Main,x) 
           for x in names(Main)
           if length("$x")>3 && "$x"[1:3]=="eg_")

function all()
  for (n,item) in enumerate(ARGS) 
    if item=="-t" && haskey(egs,ARGS[n+1])
      egs[ARGS[n+1]]() 
      exit() end 
    if  item=="-T" for (_,f) in egs f() end  end
end  end
