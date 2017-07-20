do

local function set_pass(msg, pass, id)
  local hash = nil
  if msg.to.type == "channel" then
    hash = 'setpass:'
  end
  local name = string.gsub(msg.to.print_name, '_', '')
  if hash then
    redis:hset(hash, pass, id)
      return send_large_msg("channel#id"..msg.to.id, "ÑãÒ Ñæå/ÓæÑ Ñæå : ["..name.."] ÊÛííÑ ÏÇÏå ÔÏ Èå:\n> "..pass.."\n\nÍÇáÇ ãíÊæÇäíÏ ÈÇ ÇÑÓÇá ˜ÇãäÏ \n#join "..pass.." ÏÑ ÎÕæÕí ÈÇÊ, æÇÑÏ Ñæå ÔæíÏ. ", ok_cb, true)
  end
end

local function is_used(pass)
  local hash = 'setpass:'
  local used = redis:hget(hash, pass)
  return used or false
end
local function show_add(cb_extra, success, result)
  vardump(result)
    local receiver = cb_extra.receiver
    local text = "ÔãÇ ÇÏÏ ÔÏíÏ Èå: "..result.title
    send_large_msg(receiver, text)
end
local function added(msg, target)
  local receiver = get_receiver(msg)
  channel_info("channel#id"..target, show_add, {receiver=receiver})
end
local function run(msg, matches)
  if matches[1] == "setpass" and msg.to.type == "channel" and matches[2] then
    local pass = matches[2]
    local id = msg.to.id
    if is_used(pass) then
      return "Çíä ÑãÒ ŞÈáÇ ÇÓÊİÇÏå ÔÏå ÇÓÊ. "
    end
    redis:del("setpass:", id)
    return set_pass(msg, pass, id)
  end
  if matches[1] == "join" and matches[2] then
    local hash = 'setpass:'
    local pass = matches[2]
    local id = redis:hget(hash, pass)
    local receiver = get_receiver(msg)
    if not id then
      return "ãÔ˜á: Ñæåí ÈÇ Çíä ÑãÒ íÏÇ äÔÏ. ÔÇíÏ ÑãÒ Ñæå ÊÛííÑ ˜ÑÏå íÇ ÑãÒ ÑÇ ÇÔÊÈÇå æÇÑÏ ˜ÑÏå ÇíÏ"
    end
    channel_invite("channel#id"..id, "user#id"..msg.from.id, ok_cb, false) 
  return added(msg, id)
  else
  return "ãÊÇÓİã, ÇãÇ ãä äÊæÇäÓÊã ÔãÇÑæ ÇÏÏ ˜äã Èå "..string.gsub(msg.to.id.print_name, '_', ' ')
  end
  if matches[1] == "pass" then
   local hash = 'setpass:'
   local chat_id = msg.to.id
   local pass = redis:hget(hash, channel_id)
   local receiver = get_receiver(msg)
   send_large_msg(receiver, "ÑãÒ Ñæå/ÓæÑ Ñæå : ["..msg.to.print_name.."]\n\nÑãÒ: > "..pass)
 end
end

return {
  patterns = {
    "^[/!#](setpass) (.*)$",
    "^[/!#](pass)$",
    "^[/!#]([Jj]oin) (.*)$",
	"^!!tgservice (chat_add_user)$",
	"^!!tgservice (.+)$",
    "^!!tgservice (chat_del_user)$"

  },
  run = run
}

end