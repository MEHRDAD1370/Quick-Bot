local function run(msg, matches)
if is_momod(msg) and msg.to.type == "channel" then        
  local text = [[
??���� ����� ��� ��� ���� ����� ��� ���� ��� ����
?? !info
����� ������� ����� ��� ���� �� ���� �����
?? !admins
���� ����� ��� ��� ����
??!owner
��� ���� ��� ����
?? !modlist
���� ���� ��� ��� ����
??!bots
���� ��� ��� ��� ����
!who
���� ����� ����� ��� ��� ����
?? !block
����� ���� � �� ���� � ���� �� ��� ���� (����� ���� �� ��� �����)
?? !ban
�� ���� � ��� �� ��ѐ��� (����� ��� ���� �� ��� ���)
?? !unban
�� �� ���� � ��� �� ��� ����
?? !id
���� ���� ���� ��� ���� / ���� ���
- ���� ���� ���� ��: !id @UserName
?? !id from
������ ���� �� ����� �� ������� ���
?? !kickme
����� ���� � ��� �� ��� ����
?? !setowner
����� ���� ��� ����
?? !promote [username|id]
����� ���� � ��� �� ����
?? !demote [username|id]
����� ���� � ��� �� ��� ������
?? !setname
����� ��� ��� ����
?? !setphoto
����� ژ� ��� ����
?? !setrules
����� ������ ��� ����
??!setabout
����� "������" ��� ���� (����� ���� ���� �� �� ���)
?? !save [value] <text>
����� ����  ������� ����� �� ����� �� ��
?? !get [value]
������ ���� ���� �� �� ����� ������ �� ����� ??
?? !newlink
���� ��� ����
?? !link
������ ��� ����
?? !rules
������ ������ ����
?? !lock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
��� ���� ���� ����
*RTL = ���� ��� (���� ��� �� ���� �� ��)*
*strict: enable strict settings enforcement (violating user will be kicked)*
?? !unlock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
��� ���� ���� ����
*RTL = ���� ��� (���� ��� �� ���� �� ��)*
*strict: disable strict settings enforcement (violating user will not be kicked)*
?? !mute [all|audio|gifs|photo|video|service]
���� (���) ����
- ���� ��� ���� ��� ���� �ǘ ������
?? !unmute [all|audio|gifs|photo|video|service]
�� ���� ����
?? !setflood [value]
�� ���� ����� ���� ��� ��� �� �� �� ���� �� ���
- ���� ǐ� 10 ����, ���� 10 ���� ��� �� ������, �� �����.
?? !settings
������ ���� ��� ����
?? !muteslist
���� ���� ���� ��� ��� ����
?? !muteuser [username]
��� ���� � ����� �� ��� ����
- ǐ� ����� ��� ��� ����� ������, ���� ���� ��� �����
?? !mutelist
���� ����� ���� ���
?? !banlist
���� ����� �� ���
?? !clean [rules|about|modlist|mutelist]
�ǘ ���� �� �� ����� ��� ����
?? !del
�ǘ ���� � ���� (����� ����)
?? !public [yes|no]
���������� ���� ��
?? !res [username]
������ ��� � ���� � ���� �� ������� (���� @UserName)
?? !addword [word]
������ ���� � ����
?? !remword [word]
�ǘ ���� � ���� �� ���� ��������
?? !badwords 
���� ����� ������ ���. 
?? !log
������ �ǐ ����
*���� �э ���� ���� ���� �� ��� [#RTL|#spam|#lockmember]
??��� �������� �� �� �� ���ǘ�� # � ! � / �� ���� ����� �� ������� ����.
??��� ���� ��� ���� �� ���� ��� ���� ������� ����� ��� ���.
??��� ���� �� � ���� ��� ���� ������� �� ��ǘ, ��, ����, ��� ����, ������ ���, �� ���� ژ�, �� ���� ���, ���, ���, �� ���� ������, �� ���� ������� � ���� ������� ���.
??��� ���� ���� � ����� �� ������� �� ����� ��� res, promote, setowner ������� ���.
������ ���� ������� ���혗
Mehrdad R
]]
    send_msg("channel#id"..msg.to.id, text, ok_cb, false)
  end
end 
return {
  description = "Help owner.  ", 
  usage = {
    "ownerhelp: Show help for owners.",
  },
  patterns = {
    "^([!/#]help_all)$",
  }, 
  run = run,
}