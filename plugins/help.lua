local function run(msg, matches)
if msg.to.type == chat or channel or user  then
  local text = [[
?? ������� ���� �� �Ӂ� ���� ??
�------------------------�
??���� ������� ��ǐ�� �� 
helps
??���� ������� ��� ���� 
help_all
?? ���� ������� ����� 
help_pv
�----------------------------
Quick anti spam bot
������ ����� �� ���� ��� ���� Mehrdad R
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