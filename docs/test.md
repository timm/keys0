---
title: test.jl
---


```julia
using Test
include("peek.jl")
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

