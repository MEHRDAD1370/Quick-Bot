--[[
#
#    Time And Date
#
#    @Dragon_born
#	@GPMod
#
#
]]

function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = '?? ”«⁄  '..jdat.FAtime..' \n?? «„—Ê“ '..jdat.FAdate..' „Ì»«‘œ.\n    ----\n?? '..jdat.ENtime..'\n?? '..jdat.ENdate.. '\n@nortteam'
return text
end
return {
  patterns = {"^[/!]([Tt][iI][Mm][Ee])$"}, 
run = run 
}

