println("# test.jl ...")
using Random
using Test
include("keys0.jl")

function eg_lib()
  @testset "lib" begin
    @testset "basic" begin
      @test same(1)==1 
      @test int(3.2)==3 
      @test per([1,2,3,4], .25) == 1 
      @test thing(".32") == .32
      Random.seed!(1)
      @test few([10,20,30,40],4) == [10,20,20,10]
      @test o([10,20,Dict(1=>2,3=>4)]) == 
            "[10, 20, {3=4, 1=2}]"
      lst=[x for x in  csv("data/auto93.csv")]
      @test typeof(lst[end][1]) == Float64
      @test 399 == length(lst)
    end end end 

eg_all() = eg_lib()

egs= Dict("$x"[4:end] => getfield(Main,x) 
           for x in names(Main)
           if length("$x")>3 && "$x"[1:3]=="eg_")

for (n,item) in enumerate(ARGS) 
  if item=="-t" && haskey(egs,ARGS[n+1])
    egs[ARGS[n+1]]() 
    exit() end 
  if  item=="-T" for (_,f) in egs f() end  end
end
