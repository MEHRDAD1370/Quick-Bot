local function run(msg, matches)
if msg.to.type == "user" then        
  local text = [[
���� ���� ���� ���� ����� ����.
]]
    return text
  end
end 
return {
  description = "Help owner.  ", 
  usage = {
    "ownerhelp: Show help for owners.",
  },
  patterns = {
    "^([!/#]help_pv)$",
  }, 
  run = run,
}