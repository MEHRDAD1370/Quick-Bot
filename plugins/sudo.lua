do


function run(msg, matches)

  return [[ ��� ����� ���� ���� :
���� ����� ? 

����� ����� ���� ���� ����� ?
/addsudo1
________________________
���� ����� ?

����� ����� ���� ���� ����� ?
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