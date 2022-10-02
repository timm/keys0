---
title: test.jl
---


```julia
<<<<<<< HEAD
using Test
include("peek.jl")
=======
println("# test.jl ...")
using Random
using Test
include("keys0.jl")

egall() = begin eglib(); egsome() end

function eglib()
  println("#-- lib")
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

function egsym()
  println("#-- sym")
  s=inc!(Sym(), ["a","a","a","a","b","b","c"])
  @assert 1.378 <= var(s) <= 1.379
end

function egsome()
  println("#-- some")
  s=Some()
  Random.seed!(1)
  s=inc!(Some(),[Random.rand() for _ in 1:1000]) 
  @assert it.some.max == length(s._all)
  @assert 0.47 <= mid(s) <= 0.53
  @assert .3 <= var(s) <=.31
end

function egsomes()
  println("#-- somes")
  s=Some()
  Random.seed!(1)
  r(z) =  round(z,digits=3) 
  for i in 1:10
    inc!(s,[Random.rand()^2 for _ in 1:100]) 
    @assert .3  <=  var(s)  <= .34
    @assert .21 <=  mid(s)  <= .26
  end
end

egsAll= Dict("$x"[3:end] => getfield(Main,x) 
             for x in names(Main)
             if length("$x")>2 && "$x"[1:2]=="eg")

for (n,item) in enumerate(ARGS) 
 if item=="-t" && haskey(egsAll,ARGS[n+1])
   egsAll[ARGS[n+1]]() 
   exit() 
 end 
 if  item=="-T" 
   for (_,f) in egs f() end  
 end
end
>>>>>>> 72d1f1b41ae3a3583944e77e50c5e4ddfe3e2cf3
```

 function run() 
   t=tag(data("auto93.csv"))
   ##for r in sort(t.rows, by = x -> x.gt)
   ##  print(r.tag) end end
 end

```julia

function eg_tests()
  @testset "a" begin
    @test true
    @testset "b" begin
       @test true end
    end
    @testset "c" begin
      @test true end end 

 
egs= ["$x"[4:end] for x in names(Main)[4:end] if length("$x")>3 && "$x"[1:3]=="eg_"]

for (n,item) in enumerate(ARGS) 
   if item=="-r" && ARGS[n+1] in egs 
      s=Symbol("eg_$(ARGS[n+1])")
      @eval $s() 
      exit() end
 end
```

