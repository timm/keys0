

```lua
# vim: set et ts=2 sw=2;

# ## Uses
using Test
using Random
using Parameters
using ResumableFunctions

# -------------------------------------------------------------------
# ## Misc Utils
# ### One-liners.
same(s)  = s                                  #noop       
int(x)   = floor(Int,x)                       #round
per(a,n) = a[int(length(a)*n)+1]                #percentile
thing(x) = try parse(Float64,x) catch _ x end #coerce
say(i)   = println(o(i))                      #print+nl
any(a)   = a[ int(length(a) * rand()) + 1 ]   #pick any one
few(a,n=it.divs.few) =                        #pick many
  length(a)<n ? a : [any(a) for _ in 1:n] 

# ### How to print a struct
# Skips any fields starting with "`_`".
o(i::String)     = i 
o(i::SubString)  = i 
o(i::Char)       = string(i) 
o(i::Number)     = string(i) 
o(i::Array)      = "["*join(map(o,i),", ")*"]" 
o(i::NamedTuple) = "("*join(map(o,i),", ")*")" 
o(i::Dict)       = "{"*join(["$k="*o(v) for (k,v) in i],", ")*"}" 
o(i::Any) = begin
  s, pre="$(typeof(i)){", ""
  for f in sort([x for x in fieldnames(typeof(i)) 
                  if !("$x"[1] == '_')])
    s = s * pre * "$f=$(o(getfield(i,f)))"
    pre=", " end
  return s * "}" end

# ### How to read a CSV File
# Skip blank lines. Coerce numeric strings to numbers.
@resumable function csv(file;zap=r"(\s+|#.*)") #iterate on file
  b4=""
  for line in eachline(file)
    line = replace(line,zap =>"")
    if length(line) != 0
      if line[end] == ',' # if line ends with ",",
        b4 = b4 * line    # join it to next
      else
        @yield [thing(x) for x in split(b4*line,",")]
        b4 = "" end end end end  

```
