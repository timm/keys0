{L[++N]=$0}
END {
  nil = "^[ \t]*$"
  b4=1 # true if in  comment
  last=""
  for(i=1;i<=N;i++)   {
     if (L[i] ~ /-- vim:/) continue
     now = gsub(/^--[\t ]*/,"",L[i])
     if (! (last ~ nil  && now && !b4) )
          print  last
     if  (now != b4)  {
       print  now  ? "```\n" : "\n```lua" 
     } 
     last = L[i]
     b4 = now }
  if (last !~ nil)  print last
  if (!b4) print "```"}
