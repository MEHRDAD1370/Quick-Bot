local function history(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if tonumber(extra.con) == #result then
send_msg(extra.chatid, ''..#result..' íÇã ÇÎíÑ ÓæÑ Ñæå ÍÐÝ ÔÏ', ok_cb, false)
else
send_msg(extra.chatid, 'ÊãÇã íÇã åÇí ÓæÑ Ñæå ÍÐÝ ÔÏ', ok_cb, false)
end
end
local function run(msg, matches)
if matches[1] == 'msgrem' and is_owner(msg) then
            if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 99999 or tonumber(matches[2]) < 1 then
            return "ÎØÇ ÚÏÏ ÇäÊÎÇÈ ÔÏå ÈÇíÏ ÒíÑ 100000 ÈÇÔÏ"
            end
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
                         return "ÝÞØ ãÎÕæÕ ÓæÑÑæå ãí ÈÇÔÏ"
        end
else
return "ÝÞØ ãÎÕæÕ ãÏíÑÇä Ñæå ãí ÈÇÔÏ"
end
end
return {
    patterns = {
        '^[!/#](msgrem) (%d*)$'
    },
    run = run
}