
-- Base folder
local BASE_FOLDER = "/root/"
local folder = ""

local function download_file(extra, success, result)
    vardump(result)
    local file = ""
    local filename = ""
    if result.media.type == "photo" then
        file = result.id
        filename = "somepic.jpg"
    elseif result.media.type == "document" then
        file = result.id
        filename = result.media.caption
    elseif result.media.type == "audio" then
        filename = "somevoice.ogg"
        file = result.id
    else
        return
    end
    local url = BASE_URL .. '/getFile?file_id=' .. file
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)
    if matches[2] then
        filename = matches[2]
    end

    local download = download_to_file("https://api.telegram.org/file/bot" .. bot_api_key .. "/" .. jres.result.file_path, filename)
end

function run(msg, matches)
    if is_sudo(msg) then
        receiver = get_receiver(msg)
        if matches[1]:lower() == 'cd' then
            if not matches[2] then
                return '??—‚ ?´U…?§ ?¯?± U¾Uˆ?´U‡ ?§?µU„UŒ U‡?³??UŒ?¯'
            else
                folder = matches[2]
                return '??“‚ ?´U…?§ ?¯?± ?§UŒU† U¾Uˆ?´U‡ U‡?³??UŒ?¯ : \n' .. BASE_FOLDER .. folder
            end
        end
        if matches[1]:lower() == 'ls' then
            local action = io.popen('ls "' .. BASE_FOLDER .. folder .. '"'):read("*all")
            send_large_msg(receiver, action)
        end
        if matches[1]:lower() == 'mkdir' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && mkdir \'' .. matches[2] .. '\''):read("*all")
            return 'âœ”ï¸? U¾Uˆ?´U‡ ?§UŒ?¬?§?¯ ?´?¯'
        end
        if matches[1]:lower() == 'rm' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && rm -f \'' .. matches[2] .. '\''):read("*all")
            return '???« U??§UŒU„ ?­?°U? ?´?¯'
        end
        if matches[1]:lower() == 'cat' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && cat \'' .. matches[2] .. '\''):read("*all")
            send_large_msg(receiver, action)
        end
        if matches[1]:lower() == 'rmdir' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && rmdir \'' .. matches[2] .. '\''):read("*all")
            return 'â?Œ U¾Uˆ?´U‡ ?­?°U? ?´?¯'
        end
        if matches[1]:lower() == 'touch' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && touch \'' .. matches[2] .. '\''):read("*all")
            return '?§UŒ?¬?§?¯ ?´?¯'
        end
        if matches[1]:lower() == 'tofile' and matches[2] and matches[3] then
            local file = io.open(BASE_FOLDER .. folder .. matches[2], "w")
            file:write(matches[3])
            file:flush()
            file:close()
            send_large_msg(receiver, (''))
        end
        if matches[1]:lower() == 'vps' and matches[2] then
            local text = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && ' .. matches[2]:gsub('â€”', '--')):read('*all')
            send_large_msg(receiver, text)
        end
        if matches[1]:lower() == 'cp' and matches[2] and matches[3] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && cp -r \'' .. matches[2] .. '\' \'' .. matches[3] .. '\''):read("*all")
            return '??”ƒ U??§UŒU„ U…Uˆ?±?¯ U†?¸?± ?©U¾UŒ ?´?¯'
        end
        if matches[1]:lower() == 'mv' and matches[2] and matches[3] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && mv \'' .. matches[2] .. '\' \'' .. matches[3] .. '\''):read("*all")
            return 'âœ‚ï¸? U??§UŒU„ U…Uˆ?±?¯ U†?¸?± ?§U†??U‚?§U„ UŒ?§U???'
        end
        if matches[1]:lower() == 'upload' and matches[2] then
            if io.popen('find ' .. BASE_FOLDER .. folder .. matches[2]):read("*all") == '' then
                return matches[2] .. ' â?‰ï¸? ?¯?±?³ ?³?±Uˆ?± U…Uˆ?¬Uˆ?¯ U†UŒ?³??'
            else
                send_document(receiver, BASE_FOLDER .. folder .. matches[2], ok_cb, false)
                return '?¯?± ?­?§U„ ?§?±?³?§U„'
            end
        end
        if matches[1]:lower() == 'download' then
            if type(msg.reply_id) == "nil" then
                return 'UŒ?© U??§UŒU„ ?±?§ ?±UŒU¾U„UŒ ?©U†UŒ?¯ ???§ U…U† ?¢U† ?±?§ ?¯?§U†U„Uˆ?¯ ?©U†U…'
            else
                vardump(msg)
                get_message(msg.reply_id, download_file, false)
                return '?¯?§U†U„Uˆ?¯ ?´?¯'
            end
        end
    else
        return 'U?U‚?· U…?®?µUˆ?µ ?³Uˆ?¯Uˆ U…UŒ ?¨?§?´?¯'
    end
end

return {
    description = "FILEMANAGER",
    usage =
    {
        "SUDO",
        "#cd [<directory>]: Sasha entra in <directory>, se non ?¨ specificata torna alla cartella base.",
        "#ls: Sasha manda la lista di file e cartelle della directory corrente.",
        "#mkdir <directory>: Sasha crea <directory>.",
        "#rmdir <directory>: Sasha elimina <directory>.",
        "#rm <file>: Sasha elimina <file>.",
        "#cat <file>: Sasha manda il contenuto di <file>.",
        "#tofile <file> <text>: Sasha crea <file> con <text> come contenuto.",
        "#vps <command>: Sasha esegue <command>.",
        "#cp <file> <directory>: Sasha copia <file> in <directory>.",
        "#mv <file> <directory>: Sasha sposta <file> in <directory>.",
    },
    patterns =
    {
        "^[#!/$]([Cc][Dd])$",
        "^[#!/$]([Cc][Dd]) (.*)$",
        "^[#!/$]([Ll][Ss])$",
        "^[#!/$]([Mm][Kk][Dd][Ii][Rr]) (.*)$",
        "^[#!/$]([Rr][Mm][Dd][Ii][Rr]) (.*)$",
        "^[#!/$]([Rr][Mm]) (.*)$",
        "^[#!/$]([Cc][Aa][Tt]) (.*)$",
        "^[#!/$]([Vv][Pp][Ss]) (.*)$",
        "^[#!/$]([Cc][Pp]) (.*) (.*)$",
        "^[#!/$]([Mm][Vv]) (.*) (.*)$",
        -- "^[#!/$]([Uu][Pp][Ll][Oo][Aa][Dd]) (.*)$",
        -- "^[#!/$]([Dd][Oo][Ww][Nn][Ll][Oo][Aa][Dd]) (.*)",
        -- "^[#!/$]([Dd][Oo][Ww][Nn][Ll][Oo][Aa][Dd])"
    },
    run = run,
    min_rank = 5
}