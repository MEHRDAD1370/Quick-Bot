local function run(msg, matches)
	if #matches < 2 then
		return "��� �� ��� ����ѡ �� ��� � ����� ���� �� ���� � ���� ��� �� ��� ���� ����� ���� ����"
	end
	if string.len(matches[2]) > 20 then
		return "��ǘ�� ���� ���� 20 ���ǘ�� ������ � ��� ���"
	end
	local font_base = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_"
	local font_hash = "z,y,x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A,0,1,2,3,4,5,6,7,8,9,.,_"
	local fonts = {
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,.,_",
		"?,?,c,?,?,�,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,?,?,c,?,?,�,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,c,d,e,?,?,?,?,j,?,l,?,?,o,p,q,r,?,?,?,v,w,?,y,z,?,?,c,d,e,?,?,?,?,j,?,l,?,?,o,p,q,r,?,?,?,v,w,?,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,e,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,?,?,�,?,e,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,�,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,??,7,?,?,?,?,?,??,.,_",		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,d,?,�,g,h,�,?,?,?,m,?,?,p,?,r,?,�,u,?,?,x,?,z,?,?,?,d,?,�,g,h,�,?,?,?,m,?,?,p,?,r,?,�,u,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,t,?,v,?,x,?,z,?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,t,?,v,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,Q,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,?,?,9,8,?,6,5,4,3,?,1,.,_",
		"?,?,c,?,?,?,?,h,?,j,?,l,?,?,?,?,?,?,$,�,u,?,?,?,?,z,?,?,c,?,?,?,?,h,?,j,?,l,?,?,?,?,?,?,$,�,u,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,�,?,?,l,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,?,?,?,?,?,?,�,?,?,l,?,?,?,?,?,?,?,?,?,?,?,�,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,�,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,�,?,�,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,G,H,?,J,?,?,M,?,?,P,?,?,S,T,U,V,?,?,?,Z,?,?,?,?,?,?,g,h,?,j,?,?,m,?,?,p,?,?,s,t,u,v,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,q,?,p,?,?,?,?,?,?,?,?,?,u,o,d,b,?,s,?,n,?,?,x,?,z,?,q,?,p,?,?,?,?,?,?,?,?,?,u,o,d,b,?,s,?,n,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,d,?,b,?,?,?,?,i,?,?,l,?,?,o,q,p,?,?,?,?,v,w,x,?,z,?,d,?,b,?,?,?,?,i,?,?,l,?,?,o,q,p,?,?,?,?,v,w,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"A?,?B?,?C?,?D?,?E?,?F?,?G?,?H?,?I?,?J?,?K?,?L?,?M?,?N?,?O?,?P?,?Q?,?R?,?S?,?T?,?U?,?V?,?W?,?X?,?Y?,?Z?,?a?,?b?,?c?,?d?,?e?,?f?,?g?,?h?,?i?,?j?,?k?,?l?,?m?,?n?,?o?,?p?,?q?,?r?,?s?,?t?,?u?,?v?,?w?,?x?,?y?,?z?,?0?,?9?,?8?,?7?,?6?,?5?,?4?,?3?,?2?,?1?,?.?,?_?",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,.,_",
		"?,?,c,?,?,�,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,?,?,c,?,?,�,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,c,?,?,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,x,?,z,?,?,c,?,?,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,c,d,e,?,?,?,?,j,?,l,?,?,o,p,q,r,?,?,?,v,w,?,y,z,?,?,c,d,e,?,?,?,?,j,?,l,?,?,o,p,q,r,?,?,?,v,w,?,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,x,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,x,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,e,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,?,?,�,?,e,f,g,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,�,?,?,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,??,7,?,?,?,?,?,??,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,?,?,?,?,?,?,z,?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,?,?,?,?,?,?,z,0,?,?,?,6,5,?,?,?,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,d,?,�,g,h,�,?,?,?,m,?,?,p,?,r,?,�,u,?,?,x,?,z,?,?,?,d,?,�,g,h,�,?,?,?,m,?,?,p,?,r,?,�,u,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,b,�,?,E,F,?,?,I,j,?,?,?,?,?,?,?,r,S,?,�,?,w,�,?,z,?,b,�,?,E,F,?,?,I,j,?,?,?,?,?,?,?,r,S,?,�,?,w,�,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,C,D,?,F,G,H,I,J,?,L,?,?,?,?,?,?,?,?,?,?,?,?,?,Z,?,?,?,d,?,?,?,?,?,?,?,l,?,?,?,?,?,?,s,?,?,v,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,t,?,v,?,x,?,z,?,?,?,?,?,?,?,?,?,?,?,l,?,?,?,?,?,?,?,t,?,v,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,D,?,F,?,?,?,?,?,?,M,?,?,?,?,?,S,?,?,?,?,?,Y,Z,?,?,?,D,?,F,?,?,?,?,?,?,M,?,?,?,?,?,S,?,?,?,?,?,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,Q,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,q,?,?,?,?,?,?,?,?,?,?,9,8,?,6,5,4,3,?,1,.,_",
		"?,?,c,?,?,?,?,h,?,j,?,l,?,?,?,?,?,?,$,�,u,?,?,?,?,z,?,?,c,?,?,?,?,h,?,j,?,l,?,?,?,?,?,?,$,�,u,?,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,?,f,?,h,i,?,k,l,?,?,?,p,?,r,?,t,?,?,?,x,?,?,?,?,�,?,?,f,?,h,i,?,k,l,?,?,?,p,?,r,?,t,?,?,?,x,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,�,?,?,l,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,?,?,?,?,?,?,?,�,?,?,l,?,?,?,?,?,?,?,?,?,?,?,�,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"A,?,?,?,?,?,?,?,?,?,?,?,?,?,?,P,?,R,$,?,?,V,?,X,?,?,A,?,?,?,?,?,?,?,?,?,?,?,?,?,?,P,?,R,$,?,?,V,?,X,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,�,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,?,?,�,?,�,�,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,�,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,G,H,?,J,?,?,M,?,?,P,?,?,S,T,U,V,?,?,?,Z,?,?,?,?,?,?,g,h,?,j,?,?,m,?,?,p,?,?,s,t,u,v,?,?,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,?,�,?,E,F,?,?,?,?,?,?,M,?,?,?,?,?,?,?,?,�,w,?,y,?,?,?,�,?,E,F,?,?,?,?,?,?,M,?,?,?,?,?,?,?,?,�,w,?,y,?,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,q,?,p,?,?,?,?,?,?,?,?,?,u,o,d,b,?,s,?,n,?,?,x,?,z,?,q,?,p,?,?,?,?,?,?,?,?,?,u,o,d,b,?,s,?,n,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,d,?,b,?,?,?,?,i,?,?,l,?,?,o,q,p,?,?,?,?,v,w,x,?,z,?,d,?,b,?,?,?,?,i,?,?,l,?,?,o,q,p,?,?,?,?,v,w,x,?,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,0,9,8,7,6,5,4,3,2,1,.,_",
		"?,M,X,?,Z,?,q,?,p,?,?,?,?,?,?,?,l,?,u,o,d,b,?,s,?,n,?,?,x,?,z,?,M,X,?,Z,?,q,?,p,?,?,?,?,?,?,?,l,?,u,o,d,b,?,s,?,n,?,?,x,?,z,0,9,8,7,6,5,4,3,2,1,.,?",
		"A?,?B?,?C?,?D?,?E?,?F?,?G?,?H?,?I?,?J?,?K?,?L?,?M?,?N?,?O?,?P?,?Q?,?R?,?S?,?T?,?U?,?V?,?W?,?X?,?Y?,?Z?,?a?,?b?,?c?,?d?,?e?,?f?,?g?,?h?,?i?,?j?,?k?,?l?,?m?,?n?,?o?,?p?,?q?,?r?,?s?,?t?,?u?,?v?,?w?,?x?,?y?,?z?,?0?,?9?,?8?,?7?,?6?,?5?,?4?,?3?,?2?,?1?,?.?,?_?",
		"A?,?B?,?C?,?D?,?E?,?F?,?G?,?H?,?I?,?J?,?K?,?L?,?M?,?N?,?O?,?P?,?Q?,?R?,?S?,?T?,?U?,?V?,?W?,?X?,?Y?,?Z?,?a?,?b?,?c?,?d?,?e?,?f?,?g?,?h?,?i?,?j?,?k?,?l?,?m?,?n?,?o?,?p?,?q?,?r?,?s?,?t?,?u?,?v?,?w?,?x?,?y?,?z?,?0?,?9?,?8?,?7?,?6?,?5?,?4?,?3?,?2?,?1?,?.?,?_?",
		"A?,?B?,?C?,?D?,?E?,?F?,?G?,?H?,?I?,?J?,?K?,?L?,?M?,?N?,?O?,?P?,?Q?,?R?,?S?,?T?,?U?,?V?,?W?,?X?,?Y?,?Z?,?a?,?b?,?c?,?d?,?e?,?f?,?g?,?h?,?i?,?j?,?k?,?l?,?m?,?n?,?o?,?p?,?q?,?r?,?s?,?t?,?u?,?v?,?w?,?x?,?y?,?z?,?0?,?9?,?8?,?7?,?6?,?5?,?4?,?3?,?2?,?1?,?.?,?_?",
		"A?,?B?,?C?,?D?,?E?,?F?,?G?,?H?,?I?,?J?,?K?,?L?,?M?,?N?,?O?,?P?,?Q?,?R?,?S?,?T?,?U?,?V?,?W?,?X?,?Y?,?Z?,?a?,?b?,?c?,?d?,?e?,?f?,?g?,?h?,?i?,?j?,?k?,?l?,?m?,?n?,?o?,?p?,?q?,?r?,?s?,?t?,?u?,?v?,?w?,?x?,?y?,?z?,?0?,?9?,?8?,?7?,?6?,?5?,?4?,?3?,?2?,?1?,?.?,?_?",
		"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
	}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local result = {}
	i=0
	for k=1,#fonts do
		i=i+1
		local tar_font = fonts[i]:split(",")
		local text = matches[2]
		local text = text:gsub("A",tar_font[1])
		local text = text:gsub("B",tar_font[2])
		local text = text:gsub("C",tar_font[3])
		local text = text:gsub("D",tar_font[4])
		local text = text:gsub("E",tar_font[5])
		local text = text:gsub("F",tar_font[6])
		local text = text:gsub("G",tar_font[7])
		local text = text:gsub("H",tar_font[8])
		local text = text:gsub("I",tar_font[9])
		local text = text:gsub("J",tar_font[10])
		local text = text:gsub("K",tar_font[11])
		local text = text:gsub("L",tar_font[12])
		local text = text:gsub("M",tar_font[13])
		local text = text:gsub("N",tar_font[14])
		local text = text:gsub("O",tar_font[15])
		local text = text:gsub("P",tar_font[16])
		local text = text:gsub("Q",tar_font[17])
		local text = text:gsub("R",tar_font[18])
		local text = text:gsub("S",tar_font[19])
		local text = text:gsub("T",tar_font[20])
		local text = text:gsub("U",tar_font[21])
		local text = text:gsub("V",tar_font[22])
		local text = text:gsub("W",tar_font[23])
		local text = text:gsub("X",tar_font[24])
		local text = text:gsub("Y",tar_font[25])
		local text = text:gsub("Z",tar_font[26])
		local text = text:gsub("a",tar_font[27])
		local text = text:gsub("b",tar_font[28])
		local text = text:gsub("c",tar_font[29])
		local text = text:gsub("d",tar_font[30])
		local text = text:gsub("e",tar_font[31])
		local text = text:gsub("f",tar_font[32])
		local text = text:gsub("g",tar_font[33])
		local text = text:gsub("h",tar_font[34])
		local text = text:gsub("i",tar_font[35])
		local text = text:gsub("j",tar_font[36])
		local text = text:gsub("k",tar_font[37])
		local text = text:gsub("l",tar_font[38])
		local text = text:gsub("m",tar_font[39])
		local text = text:gsub("n",tar_font[40])
		local text = text:gsub("o",tar_font[41])
		local text = text:gsub("p",tar_font[42])
		local text = text:gsub("q",tar_font[43])
		local text = text:gsub("r",tar_font[44])
		local text = text:gsub("s",tar_font[45])
		local text = text:gsub("t",tar_font[46])
		local text = text:gsub("u",tar_font[47])
		local text = text:gsub("v",tar_font[48])
		local text = text:gsub("w",tar_font[49])
		local text = text:gsub("x",tar_font[50])
		local text = text:gsub("y",tar_font[51])
		local text = text:gsub("z",tar_font[52])
		local text = text:gsub("0",tar_font[53])
		local text = text:gsub("9",tar_font[54])
		local text = text:gsub("8",tar_font[55])
		local text = text:gsub("7",tar_font[56])
		local text = text:gsub("6",tar_font[57])
		local text = text:gsub("5",tar_font[58])
		local text = text:gsub("4",tar_font[59])
		local text = text:gsub("3",tar_font[60])
		local text = text:gsub("2",tar_font[61])
		local text = text:gsub("1",tar_font[62])

		table.insert(result, text)
	end
	local result_text = "���� � �����: "..matches[2].."\n����� �� "..tostring(#fonts).." ����:\n______________________________\n"
	a=0
	for v=1,#result do
		a=a+1
		result_text = result_text..a.."- "..result[a].."\n\n"
	end
	return result_text.."______________________________\nYeah We Are Hacker ^_^"
end

return {
	description = "Fantasy Writer",
	usagehtm = '<tr><td align="center">write ���</td><td align="right">�� ������� �� ��� ��ǐ�� �������� ���� ��� �� �� ���� ��� ����� � ������ ����� ����. �� ǘ�� ���ǘ�� ��� ���� 20 ��� ������ � ��� �������� �� ���� ������ � ����� ������� ����</td></tr>',
	usage = {"write [text] : ���� �����",},
	patterns = {
		"^([Ww]rite) (.*)",
		"^([Ww]rite)$",
		},
	run = run
}