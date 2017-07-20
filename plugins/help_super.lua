local function run(msg, matches)
if is_momod(msg) and msg.to.type == "channel" then        
  local text = [[
??áíÓÊ ˜ÇãäÏ åÇí ÓæÑ Ñæå ÍİÇÙÊ ÔÏå ÊæÓØ ÈÇÊ äæÑÊ
?? !info
ÊãÇãí ÇØáÇÚÇÊ ÑÇÌÈÚ ÓæÑ Ñæå ÑÇ äÔÇä ãíÏåÏ
?? !admins
áíÓÊ ÇÏãíä åÇí ÓæÑ Ñæå
??!owner
äÇã ÕÇÍÈ ÓæÑ Ñæå
?? !modlist
áíÓÊ ãÏíÑ åÇí ÓæÑ Ñæå
??!bots
áíÓÊ ÈÇÊ åÇí ÓæÑ Ñæå
!who
áíÓÊ ÊãÇãí ÇİÑÇÏ ÚÖæ ÓæÑ Ñæå
?? !block
ÇÎÑÇÌ ˜ÑÏä æ Èä ˜ÑÏä í˜ íæÒÑ ÇÒ ÓæÑ Ñæå (ÈÕæÑÊ ÑÓãí ÇÒ Óæí ÊáÑÇã)
?? !ban
Èä ˜ÑÏä í˜ äİÑ ÇÒ ÓæÑÑæå (ÈÕæÑÊ ÛíÑ ÑÓãí ÇÒ ÓãÊ ÈÇÊ)
?? !unban
Âä Èä ˜ÑÏä í˜ äİÑ ÇÒ ÓæÑ Ñæå
?? !id
äÔÇä ÏÇÏä ÂíÏí ÓæÑ Ñæå / ÂíÏí ÔÎÕ
- ÈÑÇí ÇíÏí íæÒÑ åÇ: !id @UserName
?? !id from
ÏÑíÇİÊ ÂíÏí ÇÒ íÇãí ˜å İæÑæÇÑÏ ÔÏå
?? !kickme
ÇÎÑÇÌ ˜ÑÏä í˜ äİÑ ÇÒ ÓæÑ Ñæå
?? !setowner
ÊÚæíÖ ÕÇÍÈ ÓæÑ Ñæå
?? !promote [username|id]
ÊÑİíÚ ÏÑÌå í˜ İÑÏ Èå ãÏíÑ
?? !demote [username|id]
ÊäÒíá ÏÑÌå í˜ İÑÏ Èå ÚÖæ ãÚãæáí
?? !setname
ÊÚæíÖ äÇã ÓæÑ Ñæå
?? !setphoto
ÊÚæíÖ Ú˜Ó ÓæÑ Ñæå
?? !setrules
äæÔÊä ŞæÇäíä ÓæÑ Ñæå
??!setabout
äæÔÊä "ÏÑÈÇÑå" ÓæÑ Ñæå (ÈÇáÇí áíÓÊ ããÈÑ åÇ ãí ÂíÏ)
?? !save [value] <text>
ĞÎíÑå ÓÇÒí  ÇØáÇÚÇÊ ÇÖÇİå ÏÑ ÑÇÈØå ÈÇ Ê
?? !get [value]
ÏÑíÇİÊ åãæä íÒí ˜å Êæ ˜ÇãäÏ ÈÇáÇíí ÓÊ ˜ÑÏíÏ ??
?? !newlink
ÓÇÎÊ áíä˜ ÌÏíÏ
?? !link
ÏÑíÇİÊ áíä˜ Ñæå
?? !rules
ãÔÇåÏå ŞæÇäíä Ñæå
?? !lock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
Şİá ˜ÑÏä ÓÊíä Ñæå
*RTL = ÑÇÓÊ íä (íÇã åÇí ÇÒ ÑÇÓÊ Èå )*
*strict: enable strict settings enforcement (violating user will be kicked)*
?? !unlock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
ÈÇÒ ˜ÑÏä ÓÊíä Ñæå
*RTL = ÑÇÓÊ íä (íÇã åÇí ÇÒ ÑÇÓÊ Èå )*
*strict: disable strict settings enforcement (violating user will not be kicked)*
?? !mute [all|audio|gifs|photo|video|service]
ãíæÊ (Îİå) ˜ÑÏä
- íÇã åÇí ãíæÊ ÔÏå ÏÑÌÇ Ç˜ ãíÔæäÏ
?? !unmute [all|audio|gifs|photo|video|service]
Âä ãíæÊ ˜ÑÏä
?? !setflood [value]
ÓÊ ˜ÑÏä ÊÚÏÇÏ íÇã åÇí ÔÊ ÓÑ åã ÊÇ íæÒÑ ˜í˜ ÔæÏ
- ãËáÇ ÇÑ 10 ÈÇÔÏ, İÑÏí 10 íÇã ÔÊ åã ÈİÑÓÊÏ, ˜í˜ ãíÔæÏ.
?? !settings
ÏÑíÇİÊ ÓÊíä ÓæÑ Ñæå
?? !muteslist
äÔÇä ÏÇÏä ãíæÊ åÇí ÓæÑ Ñæå
?? !muteuser [username]
Îİå ˜ÑÏä í˜ ˜ÇÑÈÑ ÏÑ ÓæÑ Ñæå
- ÇÑ ˜ÇÑÈÑ Îİå ÔÏå íÇãí ÈİÑÓÊÏ, ÏÑÌÇ íÇã ÍĞİ ãíÑÏÏ
?? !mutelist
áíÓÊ ÇİÑÇÏ ãíæÊ ÔÏå
?? !banlist
áíÓÊ ÇİÑÇÏ Èä ÔÏå
?? !clean [rules|about|modlist|mutelist]
Ç˜ ˜ÑÏä í˜í ÇÒ ãÊÛíÑ åÇí ÈÇáÇ
?? !del
Ç˜ ˜ÑÏä í˜ ãÓíÌ (ÑíáÇí ˜äíÏ)
?? !public [yes|no]
æíÒíÈíáíÊí íÇã åÇ
?? !res [username]
ÏÑíÇİÊ äÇã æ ÂíÏí í˜ íæÒÑ ÈÇ íæÒÑäíã (ãËáÇ @UserName)
?? !addword [word]
ÓÇäÓæÑ ˜ÑÏä í˜ ˜áãå
?? !remword [word]
Ç˜ ˜ÑÏä í˜ ˜áãå ÇÒ áíÓÊ ÓÇäÓæÑåÇ
?? !badwords 
áíÓÊ ˜áãÇÊ ÓÇäÓæÑ ÔÏå. 
?? !log
ÏÑíÇİÊ áÇ Ñæå
*ãËáÇ ÓÑ ˜äíÏ ÈÑÇí Ïáíá ˜í˜ ÔÏä [#RTL|#spam|#lockmember]
??ÔãÇ ãíÊæÇäíÏ ÇÒ åÑ Óå ˜ÇÑÇ˜ÊÑ # æ ! æ / ÏÑ ÂÛÇÒ ˜ÇãäÏ åÇ ÇÓÊİÇÏå ˜äíÏ.
??İŞØ ÕÇÍÈ ÓæÑ Ñæå ÇÒ ØÑíŞ ÇÏÏ ããÈÑ ãíÊæÇäÏ ˜ÇÑÈÑ ÇÏÏ ˜äÏ.
??İŞØ ãÏíÑ åÇ æ ÕÇÍÈ ÓæÑ Ñæå ãíÊæÇäÏ ÇÒ ÈáÇ˜, Èä, ÂäÈä, áíä˜ ÌÏíÏ, ÏÑíÇİÊ áíä˜, ÓÊ ˜ÑÏä Ú˜Ó, ÓÊ ˜ÑÏä äÇã, Şİá, ÈÇÒ, ÓÊ ˜ÑÏä ŞæÇäíä, ÓÊ ˜ÑÏä ÊæÖíÍÇÊ æ ÓÊíä ÇÓÊİÇÏå ˜äÏ.
??İŞØ ÕÇÍÈ Ñæå æ ÇÏãíä åÇ ãíÊæÇäÏ ÇÒ ˜ÇãäÏ åÇí res, promote, setowner ÇÓÊİÇÏå ˜äÏ.
—İÇÑÓí ÓÇÒí ÇÎÊÕÇÕí ˜æÆí˜—
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