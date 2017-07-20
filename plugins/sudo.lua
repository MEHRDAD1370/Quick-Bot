do


function run(msg, matches)

  return [[ ÌåÊ ÇÖÇİå ˜ÑÏä ÓæÏæ :
ÓæÏæ ÔãÇÑå ? 

ÏÓÊæÑ ÇÖÇİå ˜ÑÏä ÓæÏæ ÔãÇÑå ?
/addsudo1
________________________
ÓæÏæ ÔãÇÑå ?

ÏÓÊæÑ ÇÖÇİå ˜ÑÏä ÓæÏæ ÔãÇÑå ?
/addsudo2
________________________
 ]]

end


return {

  description = "", 

  usage = "",

  patterns = {

    "^[!/#](sudo)$"

  }, 

  run = run 

}


end