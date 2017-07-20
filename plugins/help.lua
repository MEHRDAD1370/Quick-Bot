local function run(msg, matches)
if msg.to.type == chat or channel or user  then
  local text = [[
?? œ” Ê—«  —»«  ÷œ «”Å„ òÊ∆Ìò ??
ó------------------------ó
??·Ì”  —«Â‰„«Ì Å·«êÌ‰ Â« 
helps
??·Ì”  —«Â‰„«Ì ò·Ì —»«  
help_all
?? ·Ì”  —«Â‰„«Ì Œ’Ê’Ì 
help_pv
ó----------------------------
Quick anti spam bot
»—‰«„Â ‰ÊÌ”Ì »Â “»«‰ ·Ê«  Ê”ÿ Mehrdad R
]]
    return text
  end
end 
return {
  description = Help owner.  , 
  usage = {
    ownerhelp Show help for owners.,
  },
  patterns = {
    ^([!#]help)$,
  }, 
  run = run,
}