#!/usr/bin/env bash

echo 0 > TID

echo ">>>>>>>>running test 1"
./replace_wrapper '-?' 'a&'  < ./inputs/temp-test/1.inp.1.1 
echo ">>>>>>>>running test 2"
./replace_wrapper ' ' '@%@&'  < ./inputs/temp-test/777.inp.334.1 
echo ">>>>>>>>running test 3"
./replace_wrapper ' ' 'NEW'  < ./inputs/temp-test/550.inp.238.1 
echo ">>>>>>>>running test 4"
./replace_wrapper ' ' 'NEW'  < ./inputs/temp-test/551.inp.238.3 
echo ">>>>>>>>running test 5"
./replace_wrapper ' ' 'rY NCDt+32Ilu>dr~s^1Q{0*{RLN>Muz'  < ./inputs/input/ruin.1224 
echo ">>>>>>>>running test 6"
./replace_wrapper ' '  < ./inputs/input/ruin.1160 
echo ">>>>>>>>running test 7"
./replace_wrapper ' *' '@%&a'  < ./inputs/temp-test/2298.inp.975.1 
echo ">>>>>>>>running test 8"
./replace_wrapper ' *' 'a&'  < ./inputs/temp-test/1839.inp.782.1 
echo ">>>>>>>>running test 9"
./replace_wrapper ' *' 'a&'  < ./inputs/temp-test/1840.inp.782.2 
echo ">>>>>>>>running test 10"
./replace_wrapper ' *' 'a&'  < ./inputs/temp-test/1841.inp.782.3 
echo ">>>>>>>>running test 11"
./replace_wrapper ' *-' '@t'  < ./inputs/temp-test/1828.inp.778.1 
echo ">>>>>>>>running test 12"
./replace_wrapper ' *-' '@t'  < ./inputs/temp-test/1829.inp.778.2 
echo ">>>>>>>>running test 13"
./replace_wrapper ' *-' '@t'  < ./inputs/temp-test/1830.inp.778.3 
echo ">>>>>>>>running test 14"
./replace_wrapper ' *?' ''  < ./inputs/temp-test/1964.inp.834.1 
echo ">>>>>>>>running test 15"
./replace_wrapper ' *?' ''  < ./inputs/temp-test/1965.inp.834.2 
echo ">>>>>>>>running test 16"
./replace_wrapper ' *[0-9]-? [^a-c]@[*-^a-c]' ''  < ./inputs/temp-test/758.inp.325.1 
echo ">>>>>>>>running test 17"
./replace_wrapper ' *[0-9]-? [^a-c]@[*-^a-c]' ''  < ./inputs/temp-test/759.inp.325.3 
echo ">>>>>>>>running test 18"
./replace_wrapper ' *[0-9]@[[9-B]??[0-9]-[^-[^0-9]-[a-c][^a-c]' 'NEW'  < ./inputs/temp-test/1133.inp.487.1 
echo ">>>>>>>>running test 19"
./replace_wrapper ' *[0-9]@[[9-B]??[0-9]-[^-[^0-9]-[a-c][^a-c]' 'NEW'  < ./inputs/temp-test/1134.inp.487.2 
echo ">>>>>>>>running test 20"
./replace_wrapper ' *[9-B]' 'a&'  < ./inputs/temp-test/1274.inp.547.1 
echo ">>>>>>>>running test 21"
./replace_wrapper ' *[9-B]' 'a&'  < ./inputs/temp-test/1275.inp.547.3 
echo ">>>>>>>>running test 22"
./replace_wrapper ' *^-]-' '@n'  < ./inputs/temp-test/956.inp.412.1 
echo ">>>>>>>>running test 23"
./replace_wrapper ' *^-]-' '@n'  < ./inputs/temp-test/957.inp.412.2 
echo ">>>>>>>>running test 24"
./replace_wrapper ' *a-c]' '&a@%'  < ./inputs/temp-test/74.inp.32.1 
echo ">>>>>>>>running test 25"
./replace_wrapper ' *a-c]' '&a@%'  < ./inputs/temp-test/75.inp.32.3 
echo ">>>>>>>>running test 26"
./replace_wrapper ' -[][^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 27"
./replace_wrapper ' -[^9-B]*$' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 28"
./replace_wrapper ' -[^9-B]*' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 29"
./replace_wrapper ' -[^9-B]?*'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 30"
./replace_wrapper ' -[^9-B][][a-c][9-B]' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 31"
./replace_wrapper ' -[^9-B][^][a-c][9-B]' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 32"
./replace_wrapper ' -[^9-B][a-c]*$' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 33"
./replace_wrapper ' -[^9-B][a-c]*' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 34"
./replace_wrapper ' -[^9-B][a-c]?*' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 35"
./replace_wrapper ' -[^9-B][a-c][9-B]'   < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 36"
./replace_wrapper ' -[^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 37"
./replace_wrapper ' -[^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 38"
./replace_wrapper ' -[^9-B][a-c][9-B]'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 39"
./replace_wrapper ' -[^][^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 40"
./replace_wrapper ' -]' 'a@nb@tc'  < ./inputs/temp-test/1638.inp.698.1 
echo ">>>>>>>>running test 41"
./replace_wrapper ' -c*[^a-c]' 'NEW'  < ./inputs/temp-test/477.inp.209.1 
echo ">>>>>>>>running test 42"
./replace_wrapper ' -c*[^a-c]' 'NEW'  < ./inputs/temp-test/478.inp.209.2 
echo ">>>>>>>>running test 43"
./replace_wrapper ' -c*[^a-c]' 'NEW'  < ./inputs/temp-test/479.inp.209.3 
echo ">>>>>>>>running test 44"
./replace_wrapper ' ?' '&'  < ./inputs/temp-test/54.inp.23.1 
echo ">>>>>>>>running test 45"
./replace_wrapper ' [a-c]' '&'  < ./inputs/temp-test/634.inp.274.1 
echo ">>>>>>>>running test 46"
./replace_wrapper ' [a-c]' '&'  < ./inputs/temp-test/635.inp.274.2 
echo ">>>>>>>>running test 47"
./replace_wrapper ' [a-c]' '&'  < ./inputs/temp-test/636.inp.274.3 
echo ">>>>>>>>running test 48"
./replace_wrapper ' [a-c]' '&@n'  < ./inputs/temp-test/634.inp.274.1 
echo ">>>>>>>>running test 49"
./replace_wrapper ' [a-c]' '&@n'  < ./inputs/temp-test/635.inp.274.2 
echo ">>>>>>>>running test 50"
./replace_wrapper ' [a-c]' '&@n'  < ./inputs/temp-test/636.inp.274.3 
echo ">>>>>>>>running test 51"
./replace_wrapper ' [a-c]' '&@nfoo'  < ./inputs/temp-test/635.inp.274.2 
echo ">>>>>>>>running test 52"
./replace_wrapper ' ^a-]' 'NEW'  < ./inputs/temp-test/2186.inp.925.1 
echo ">>>>>>>>running test 53"
./replace_wrapper ' ^a-]' 'NEW'  < ./inputs/temp-test/2187.inp.925.2 
echo ">>>>>>>>running test 54"
./replace_wrapper '!$' '^'  < ./inputs/input/ruin.1470 
echo ">>>>>>>>running test 55"
./replace_wrapper '!' 'JeQwMtQsX"@?#Q1)jO;[#@Y^SE,&N$~<>FK'  < ./inputs/input/ruin.677 
echo ">>>>>>>>running test 56"
./replace_wrapper '!' '\-'  < ./inputs/input/ruin.1946 
echo ">>>>>>>>running test 57"
./replace_wrapper '!' 'f)n'\'':Ig"_@4},'  < ./inputs/input/ruin.1784 
echo ">>>>>>>>running test 58"
./replace_wrapper '!2' 4  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 59"
./replace_wrapper '"' '6'  < ./inputs/input/ruin.197 
echo ">>>>>>>>running test 60"
./replace_wrapper '"@@' 'm'  < ./inputs/input/ruin.1890 
echo ">>>>>>>>running test 61"
./replace_wrapper '##[0-9]?[a-b]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 62"
./replace_wrapper '#' '&'  < ./inputs/input/ruin.1044 
echo ">>>>>>>>running test 63"
./replace_wrapper '#' '&G:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_J'  < ./inputs/input/ruin.1044 
echo ">>>>>>>>running test 64"
./replace_wrapper '#' '_W$'  < ./inputs/input/ruin.1198 
echo ">>>>>>>>running test 65"
./replace_wrapper '#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO-[^--z]-[^a--b][^0-9]@* *?-c' '@n'  < ./inputs/temp-test/902.inp.388.1 
echo ">>>>>>>>running test 66"
./replace_wrapper '$ -[^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/528.inp.229.1 
echo ">>>>>>>>running test 67"
./replace_wrapper '$ -[^9-B][a-c][9-B]' '@%&a'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 68"
./replace_wrapper '$$**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 69"
./replace_wrapper '$%**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 70"
./replace_wrapper '$%-[@n][^a--b]$' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 71"
./replace_wrapper '$%? ' 'a@nb@tc'  < ./inputs/temp-test/218.inp.97.5 
echo ">>>>>>>>running test 72"
./replace_wrapper '$%?@*' 'NEW'  < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 73"
./replace_wrapper '$%?^$' '@%&a'  < ./inputs/temp-test/513.inp.223.10 
echo ">>>>>>>>running test 74"
./replace_wrapper '$%@*?' '@%&a'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 75"
./replace_wrapper '$%[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 76"
./replace_wrapper '$'   < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 77"
./replace_wrapper '$' '%'  < ./inputs/input/ruin.1122 
echo ">>>>>>>>running test 78"
./replace_wrapper '$' ''\''Z y<j$`3-b6{hC,KW4dJZ\tWkm'  < ./inputs/input/ruin.1104 
echo ">>>>>>>>running test 79"
./replace_wrapper '$' 'F]"8mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%`#tLmW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%mW1FGw`iK4QO;MuiQ4{%R:h2`^Ndy W4p?5Yd9N%7tp~'  < ./inputs/input/ruin.154 
echo ">>>>>>>>running test 80"
./replace_wrapper '$' 'K'  < ./inputs/input/ruin.1121 
echo ">>>>>>>>running test 81"
./replace_wrapper '$' 'Pb'  < ./inputs/input/ruin.1111 
echo ">>>>>>>>running test 82"
./replace_wrapper '$' 'X'\'',id`ucU?Bhj!aeGJ~qW=F*9LTRouw#I-quWg}}wkR8Cwfff{{JGSTC2v7(*^3wSqSn{{\Jx9r8a'  < ./inputs/input/ruin.130 
echo ">>>>>>>>running test 83"
./replace_wrapper '$' 'xv'\''%;99C.L6GYG|5'\''B4JA{:,!;i0:/n+[q}2g+Q+T[#; `w&%3:]~,5M]m.'  < ./inputs/input/ruin.1118 
echo ">>>>>>>>running test 84"
./replace_wrapper '$- ' '&'  < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 85"
./replace_wrapper '$-'   < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 86"
./replace_wrapper '$-' '&@n'   < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 87"
./replace_wrapper '$-*[][^0-9]' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 88"
./replace_wrapper '$-*[^0-9]$' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 89"
./replace_wrapper '$-*[^0-9]' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 90"
./replace_wrapper '$-*[^0-9]' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 91"
./replace_wrapper '$-*[^0-9]' '&@n' < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 92"
./replace_wrapper '$-*[^0-9]'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 93"
./replace_wrapper '$-*[^][^0-9]' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 94"
./replace_wrapper '$-[@n][^a--b]$' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 95"
./replace_wrapper '$-[@n][^a--b]' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 96"
./replace_wrapper '$-[@n][^a--b]' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 97"
./replace_wrapper '$-[][@n][^a--b]$' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 98"
./replace_wrapper '$-[^][@n][^a--b]$' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 99"
./replace_wrapper '$? ' 'a@nb@tc'  < ./inputs/temp-test/217.inp.97.1 
echo ">>>>>>>>running test 100"
./replace_wrapper '$?-[^-z][0-9]' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 101"
./replace_wrapper '$?-[^-z][0-9]'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 102"
./replace_wrapper '$?@*'   < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 103"
./replace_wrapper '$?@*' '@%&a'  < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 104"
./replace_wrapper '$?@*' 'NEW'  < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 105"
./replace_wrapper '$?@*' 'NEW'  < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 106"
./replace_wrapper '$?[^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 107"
./replace_wrapper '$?[^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 108"
./replace_wrapper '$?^'   < ./inputs/temp-test/512.inp.223.3 
echo ">>>>>>>>running test 109"
./replace_wrapper '$?^' '@%&a'  < ./inputs/temp-test/511.inp.223.1 
echo ">>>>>>>>running test 110"
./replace_wrapper '$?^' '@%&a'  < ./inputs/temp-test/512.inp.223.3 
echo ">>>>>>>>running test 111"
./replace_wrapper '$@*?' '@%&a'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 112"
./replace_wrapper '$@[*-?[a-c$' 'a@nb@tc'  < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 113"
./replace_wrapper '$@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 114"
./replace_wrapper '$@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 115"
./replace_wrapper '$@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 116"
./replace_wrapper '$@[*-?[a-c'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 117"
./replace_wrapper '$[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 118"
./replace_wrapper '$[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 119"
./replace_wrapper '$[^0-9]?-?[^a--b]' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 120"
./replace_wrapper '$[^9-B]@['   < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 121"
./replace_wrapper '$[^9-B]@[' 'a@n'  < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 122"
./replace_wrapper '$[^9-B]@[' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 123"
./replace_wrapper '$[^9-B]@[' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 124"
./replace_wrapper '$[^9-B][9-B]'   < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 125"
./replace_wrapper '$[^9-B][9-B]' '&@n'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 126"
./replace_wrapper '$[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 127"
./replace_wrapper '$[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 128"
./replace_wrapper '$[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 129"
./replace_wrapper '$[^9-B][9-B]*$'   < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 130"
./replace_wrapper '$[^9-B][9-B][]' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 131"
./replace_wrapper '$[^9-B][9-B][^]' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 132"
./replace_wrapper '$[^a-c][9-B]'   < ./inputs/temp-test/222.inp.99.1 
echo ">>>>>>>>running test 133"
./replace_wrapper '$[^a-c][9-B]' '@%&a'  < ./inputs/temp-test/222.inp.99.1 
echo ">>>>>>>>running test 134"
./replace_wrapper '$[^a-c][9-B]' '@%&a'  < ./inputs/temp-test/223.inp.99.3 
echo ">>>>>>>>running test 135"
./replace_wrapper '$[^a-c]a-]' 'NEW'  < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 136"
./replace_wrapper '$[a-c?$' 'a&'  < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 137"
./replace_wrapper '$[a-c?'   < ./inputs/temp-test/516.inp.225.1 
echo ">>>>>>>>running test 138"
./replace_wrapper '$[a-c?'   < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 139"
./replace_wrapper '$[a-c?' 'a&'  < ./inputs/temp-test/516.inp.225.1 
echo ">>>>>>>>running test 140"
./replace_wrapper '$[a-c?' 'a&'  < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 141"
./replace_wrapper '$[a-c?' 'a&'  < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 142"
./replace_wrapper '$[a-c?' 'a&'  < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 143"
./replace_wrapper '$^-?[^9-B]' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 144"
./replace_wrapper '$a' ''  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 145"
./replace_wrapper '$c*[^a-'   < ./inputs/temp-test/514.inp.224.1 
echo ">>>>>>>>running test 146"
./replace_wrapper '$c*[^a-' 'a@nb@tc'  < ./inputs/temp-test/514.inp.224.1 
echo ">>>>>>>>running test 147"
./replace_wrapper '$c*[^a-' 'a@nb@tc'  < ./inputs/temp-test/515.inp.224.3 
echo ">>>>>>>>running test 148"
./replace_wrapper '$c[^0-9]' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 149"
./replace_wrapper '$c[^0-9]'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 150"
./replace_wrapper '% ' 'NEW'  < ./inputs/temp-test/552.inp.238.7 
echo ">>>>>>>>running test 151"
./replace_wrapper '% *' 'a&'  < ./inputs/temp-test/1842.inp.782.7 
echo ">>>>>>>>running test 152"
./replace_wrapper '% *^-]-$' '@n'  < ./inputs/temp-test/958.inp.412.11 
echo ">>>>>>>>running test 153"
./replace_wrapper '%*$' ':m9#`%w*An#HIw)ZLBs!y-|, 5 M_m9u_Lao'  < ./inputs/input/ruin.1258 
echo ">>>>>>>>running test 154"
./replace_wrapper '%*$' 'D9RnxwW@{i=z85OwG0--kJo<'  < ./inputs/input/ruin.1554 
echo ">>>>>>>>running test 155"
./replace_wrapper '%*$' 'U'  < ./inputs/input/ruin.1536 
echo ">>>>>>>>running test 156"
./replace_wrapper '%*$' 'i'  < ./inputs/input/ruin.1625 
echo ">>>>>>>>running test 157"
./replace_wrapper '%*$' 'nQ;+jYa.#8vT9@X-GD(e4]YKBjzXF(V+MTO]u;aGY^jo'\''q:'  < ./inputs/input/ruin.1390 
echo ">>>>>>>>running test 158"
./replace_wrapper '%*$' 66  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 159"
./replace_wrapper '%*' ' <+%@x-,=f$.L5#T(AD4Q@iix)H`Ce K,+UO#:wj,q7KJO@]d~.N,<'\''Hi73GN$Gl(HX1C'  < ./inputs/input/ruin.328 
echo ">>>>>>>>running test 160"
./replace_wrapper '%*' '0'  < ./inputs/input/ruin.1821 
echo ">>>>>>>>running test 161"
./replace_wrapper '%*' 'G'  < ./inputs/input/ruin.1088 
echo ">>>>>>>>running test 162"
./replace_wrapper '%*' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 163"
./replace_wrapper '%*' 'lc_lv50iK!'\''g`jS`LIK\!&3W>wi_0pbHri'  < ./inputs/input/ruin.1845 
echo ">>>>>>>>running test 164"
./replace_wrapper '%*' 'q'  < ./inputs/input/ruin.1973 
echo ">>>>>>>>running test 165"
./replace_wrapper '%*' 's'  < ./inputs/input/ruin.1058 
echo ">>>>>>>>running test 166"
./replace_wrapper '%*' 's7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp'  < ./inputs/input/ruin.1058 
echo ">>>>>>>>running test 167"
./replace_wrapper '%*' 't'  < ./inputs/input/ruin.526 
echo ">>>>>>>>running test 168"
./replace_wrapper '%*' 'yh'  < ./inputs/input/ruin.1653 
echo ">>>>>>>>running test 169"
./replace_wrapper '%*' '|/2:-r3lyg[Iq$dLi?"/#U'  < ./inputs/input/ruin.308 
echo ">>>>>>>>running test 170"
./replace_wrapper '%*?$' 'vLd?Rz=SEH)PEv2'  < ./inputs/input/ruin.1265 
echo ">>>>>>>>running test 171"
./replace_wrapper '%*?$'  < ./inputs/input/ruin.1265 
echo ">>>>>>>>running test 172"
./replace_wrapper '%*@@$' '^^+p&y=3[ZYIgTBk:JTg x?51<dbL'  < ./inputs/input/ruin.1331 
echo ">>>>>>>>running test 173"
./replace_wrapper '%*@@p&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIgTBk$' '^^+p&y=3[ZYIgTBk:JTg x?51<dbL'  < ./inputs/input/ruin.1331 
echo ">>>>>>>>running test 174"
./replace_wrapper '%*B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]B]ddB]@t]*[@t@][9-B]' ' <+%@x-,=f$.L5#T(AD4Q@iix)H`Ce K,+UO#:wj,q7KJO@]d~.N,<'\''Hi73GN$Gl(HX1C'  < ./inputs/input/ruin.328 
echo ">>>>>>>>running test 175"
./replace_wrapper '%*[O]D?'   < ./inputs/input/ruin.1161 
echo ">>>>>>>>running test 176"
./replace_wrapper '%*[O]D?' 'dR{6FgfE'  < ./inputs/input/ruin.1161 
echo ">>>>>>>>running test 177"
./replace_wrapper '%*\1Pf2' 'g'  < ./inputs/input/ruin.4 
echo ">>>>>>>>running test 178"
./replace_wrapper '%*^' 'y8sdW9T'  < ./inputs/input/ruin.1065 
echo ">>>>>>>>running test 179"
./replace_wrapper '%- ' '@t'  < ./inputs/temp-test/1790.inp.761.7 
echo ">>>>>>>>running test 180"
./replace_wrapper '%- [^@n]?[^0-9]?[0-9]?$' '@%&a'  < ./inputs/temp-test/163.inp.73.10 
echo ">>>>>>>>running test 181"
./replace_wrapper '%-' '%s$0#=(`Y2,;:8*/t"3Yn=VCI-|H6q[k%+sNf3%f`xvS*o(uD'  < ./inputs/input/ruin.1972 
echo ">>>>>>>>running test 182"
./replace_wrapper '%-' ''  < ./inputs/temp-test/1650.inp.703.5 
echo ">>>>>>>>running test 183"
./replace_wrapper '%-' 'NEW'  < ./inputs/temp-test/725.inp.312.5 
echo ">>>>>>>>running test 184"
./replace_wrapper '%-' 'a&'  < ./inputs/temp-test/1312.inp.563.7 
echo ">>>>>>>>running test 185"
./replace_wrapper '%-*-' '@n'  < ./inputs/temp-test/2009.inp.852.5 
echo ">>>>>>>>running test 186"
./replace_wrapper '%-*?$' '&a@%'  < ./inputs/temp-test/1103.inp.474.11 
echo ">>>>>>>>running test 187"
./replace_wrapper '%-*?' '&a@%'  < ./inputs/temp-test/1102.inp.474.5 
echo ">>>>>>>>running test 188"
./replace_wrapper '%--%[^9-B][0-9]--[0-9]*-$' '@%@&'  < ./inputs/temp-test/18.inp.8.11 
echo ">>>>>>>>running test 189"
./replace_wrapper '%--*a-c]?[^0-9]$' '@n'  < ./inputs/temp-test/1154.inp.496.10 
echo ">>>>>>>>running test 190"
./replace_wrapper '%--@*-[^-z]-?[^--z][^9-B]?$' '&a@%'  < ./inputs/temp-test/503.inp.219.10 
echo ">>>>>>>>running test 191"
./replace_wrapper '%--@*-[^-z]-?[^--z][^9-B]?' '&a@%'  < ./inputs/temp-test/501.inp.219.5 
echo ">>>>>>>>running test 192"
./replace_wrapper '%--[0-9]?-?$' 'NEW'  < ./inputs/temp-test/2061.inp.873.10 
echo ">>>>>>>>running test 193"
./replace_wrapper '%--[^9-B][0-9]--[0-9]*-$' '@%@&'  < ./inputs/temp-test/18.inp.8.11 
echo ">>>>>>>>running test 194"
./replace_wrapper '%-?$' '&'  < ./inputs/temp-test/375.inp.162.10 
echo ">>>>>>>>running test 195"
./replace_wrapper '%-?$' 'a&'  < ./inputs/temp-test/1079.inp.464.10 
echo ">>>>>>>>running test 196"
./replace_wrapper '%-??[^0-9][9-B][^9-B]$' 'a&'  < ./inputs/temp-test/39.inp.16.11 
echo ">>>>>>>>running test 197"
./replace_wrapper '%-?@[[^9-B]---?' 'a@n'  < ./inputs/temp-test/966.inp.416.5 
echo ">>>>>>>>running test 198"
./replace_wrapper '%-?[^0-9]?' '&'  < ./inputs/temp-test/466.inp.203.5 
echo ">>>>>>>>running test 199"
./replace_wrapper '%-@**' 'NEW'  < ./inputs/temp-test/1838.inp.781.5 
echo ">>>>>>>>running test 200"
./replace_wrapper '%-@t$' ''  < ./inputs/temp-test/42.inp.17.11 
echo ">>>>>>>>running test 201"
./replace_wrapper '%-[9-B]' '&'  < ./inputs/temp-test/1336.inp.573.5 
echo ">>>>>>>>running test 202"
./replace_wrapper '%-[@n][^a--b]$'   < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 203"
./replace_wrapper '%-[@n][^a--b]$' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 204"
./replace_wrapper '%-[@n][^a--b]*$' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 205"
./replace_wrapper '%-[@n][^a--b]*' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 206"
./replace_wrapper '%-[][@n][^a--b]$' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 207"
./replace_wrapper '%-[^0-9]' 'NEW'  < ./inputs/temp-test/2013.inp.854.7 
echo ">>>>>>>>running test 208"
./replace_wrapper '%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]%-[^9-B]' 'NEW'  < ./inputs/temp-test/892.inp.383.5 
echo ">>>>>>>>running test 209"
./replace_wrapper '%-[^9-B]' 'NEW'  < ./inputs/temp-test/892.inp.383.5 
echo ">>>>>>>>running test 210"
./replace_wrapper '%-[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1717.inp.731.7 
echo ">>>>>>>>running test 211"
./replace_wrapper '%-[^9-B][^0-9] $' 'a@n'  < ./inputs/temp-test/2026.inp.859.11 
echo ">>>>>>>>running test 212"
./replace_wrapper '%-[^9-B][^0-9][_-z]?-^*?$' '@n'  < ./inputs/temp-test/1051.inp.452.11 
echo ">>>>>>>>running test 213"
./replace_wrapper '%-[^][@n][^a--b]$' 'NEW'  < ./inputs/temp-test/216.inp.96.11 
echo ">>>>>>>>running test 214"
./replace_wrapper '%-[^a-c]' '@%@&'  < ./inputs/temp-test/863.inp.371.5 
echo ">>>>>>>>running test 215"
./replace_wrapper '%-[^a-c]' 'b@t'  < ./inputs/temp-test/1654.inp.704.5 
echo ">>>>>>>>running test 216"
./replace_wrapper '%-]-' '@n'  < ./inputs/temp-test/1123.inp.483.7 
echo ">>>>>>>>running test 217"
./replace_wrapper '%-][^0-9]' 'a@nb@tc'  < ./inputs/temp-test/580.inp.249.7 
echo ">>>>>>>>running test 218"
./replace_wrapper '%-^$' ''  < ./inputs/temp-test/575.inp.247.10 
echo ">>>>>>>>running test 219"
./replace_wrapper '%-^$' '@%&a'  < ./inputs/temp-test/1249.inp.535.10 
echo ">>>>>>>>running test 220"
./replace_wrapper '%-^-]$' '@%&a'  < ./inputs/temp-test/2311.inp.980.11 
echo ">>>>>>>>running test 221"
./replace_wrapper '%-^?*' ''  < ./inputs/temp-test/575.inp.247.10 
echo ">>>>>>>>running test 222"
./replace_wrapper '%-c---[^0-9][0-9][9-B]-' '@n'  < ./inputs/temp-test/1034.inp.444.5 
echo ">>>>>>>>running test 223"
./replace_wrapper '%-c?' '@%@&'  < ./inputs/temp-test/605.inp.260.5 
echo ">>>>>>>>running test 224"
./replace_wrapper '%.$' 'D'  < ./inputs/input/ruin.1460 
echo ">>>>>>>>running test 225"
./replace_wrapper '%? '   < ./inputs/temp-test/218.inp.97.5 
echo ">>>>>>>>running test 226"
./replace_wrapper '%? ' 'a@nb@tc'  < ./inputs/temp-test/218.inp.97.5 
echo ">>>>>>>>running test 227"
./replace_wrapper '%? *' '@t'  < ./inputs/temp-test/859.inp.369.5 
echo ">>>>>>>>running test 228"
./replace_wrapper '%?$' '2'  < ./inputs/input/ruin.1261 
echo ">>>>>>>>running test 229"
./replace_wrapper '%?$' '9e1'  < ./inputs/input/ruin.1325 
echo ">>>>>>>>running test 230"
./replace_wrapper '%?$' 'AP'  < ./inputs/input/ruin.202 
echo ">>>>>>>>running test 231"
./replace_wrapper '%?$' 'L<5GMRl"'\''7Wl'\''3=ure'\''wFll;_2}wNR7cy/'  < ./inputs/input/ruin.1356 
echo ">>>>>>>>running test 232"
./replace_wrapper '%?$' 'TU#\gNe$1p#Jb0WI'  < ./inputs/input/ruin.1320 
echo ">>>>>>>>running test 233"
./replace_wrapper '%?$' '\'  < ./inputs/input/ruin.1440 
echo ">>>>>>>>running test 234"
./replace_wrapper '%?$' 'k (M~}|3y!1|/)<WQV:Mkr1'  < ./inputs/input/ruin.774 
echo ">>>>>>>>running test 235"
./replace_wrapper '%?$' 'oN5<e4k|K|}HrFB=iZSgZHM$1+R*ygT'  < ./inputs/input/ruin.1872 
echo ">>>>>>>>running test 236"
./replace_wrapper '%?$'  < ./inputs/input/ruin.1261 
echo ">>>>>>>>running test 237"
./replace_wrapper '%?' ')]CS#C@X3[0J\$&a[[@mGOQ'  < ./inputs/input/ruin.1876 
echo ">>>>>>>>running test 238"
./replace_wrapper '%?' '+'  < ./inputs/input/ruin.556 
echo ">>>>>>>>running test 239"
./replace_wrapper '%?' '.RM'  < ./inputs/input/ruin.1857 
echo ">>>>>>>>running test 240"
./replace_wrapper '%?' '/*XX9X]4-DijN '  < ./inputs/input/ruin.727 
echo ">>>>>>>>running test 241"
./replace_wrapper '%?' '1'  < ./inputs/input/ruin.1671 
echo ">>>>>>>>running test 242"
./replace_wrapper '%?' '6b/]'  < ./inputs/input/ruin.219 
echo ">>>>>>>>running test 243"
./replace_wrapper '%?' '7 EB+%@FvoUS  '  < ./inputs/input/ruin.1526 
echo ">>>>>>>>running test 244"
./replace_wrapper '%?' 'Q!I*e$7'  < ./inputs/input/ruin.1457 
echo ">>>>>>>>running test 245"
./replace_wrapper '%?' 'd6|=C@vL&W124Sl,6$@BY9x[JBrfpE<o0p,J"WO\A/HIDw'  < ./inputs/input/ruin.585 
echo ">>>>>>>>running test 246"
./replace_wrapper '%?' 'k'  < ./inputs/input/ruin.1361 
echo ">>>>>>>>running test 247"
./replace_wrapper '%?' 'n'  < ./inputs/input/ruin.233 
echo ">>>>>>>>running test 248"
./replace_wrapper '%?' 'qwZj/of[4fLna,@rHHd<;;1Imlc@Ya*B'  < ./inputs/input/ruin.1094 
echo ">>>>>>>>running test 249"
./replace_wrapper '%?' 'w'  < ./inputs/input/ruin.1257 
echo ">>>>>>>>running test 250"
./replace_wrapper '%?' '}=$="fk-Rix[&n#bBsqn8i!#\<p1+jntBsBI74.+2qg+$7!x/R'  < ./inputs/input/ruin.1500 
echo ">>>>>>>>running test 251"
./replace_wrapper '%?*$' 'w'  < ./inputs/input/ruin.1257 
echo ">>>>>>>>running test 252"
./replace_wrapper '%?*@*' 'NEW'  < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 253"
./replace_wrapper '%?-$' '@t'  < ./inputs/temp-test/1871.inp.793.11 
echo ">>>>>>>>running test 254"
./replace_wrapper '%?-' '@n'  < ./inputs/temp-test/913.inp.393.5 
echo ">>>>>>>>running test 255"
./replace_wrapper '%?? *' 'NEW'  < ./inputs/temp-test/1531.inp.655.5 
echo ">>>>>>>>running test 256"
./replace_wrapper '%??-?[^@n][a-]-@*[^a--b][0-9]-$' '@%&a'  < ./inputs/temp-test/2249.inp.953.11 
echo ">>>>>>>>running test 257"
./replace_wrapper '%??[@n]-?[9-B]-^-]??[9-B]-*[^0-9]-' '@n'  < ./inputs/temp-test/1347.inp.578.7 
echo ">>>>>>>>running test 258"
./replace_wrapper '%??^[^9-B]@*?@**$' '@n'  < ./inputs/temp-test/251.inp.111.11 
echo ">>>>>>>>running test 259"
./replace_wrapper '%??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**??^[^9-B]@*?@**$' '@n'  < ./inputs/temp-test/251.inp.111.11 
echo ">>>>>>>>running test 260"
./replace_wrapper '%?@![$]@n' ''  < ./inputs/input/ruin.967 
echo ">>>>>>>>running test 261"
./replace_wrapper '%?@*$' '@%&a'  < ./inputs/temp-test/534.inp.231.11 
echo ">>>>>>>>running test 262"
./replace_wrapper '%?@*$' 'b@t'  < ./inputs/temp-test/935.inp.402.10 
echo ">>>>>>>>running test 263"
./replace_wrapper '%?@*'   < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 264"
./replace_wrapper '%?@*' 'NEW'  < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 265"
./replace_wrapper '%?@@' '&a@%'  < ./inputs/temp-test/2230.inp.945.7 
echo ">>>>>>>>running test 266"
./replace_wrapper '%?[-$' 'a&'  < ./inputs/temp-test/784.inp.337.11 
echo ">>>>>>>>running test 267"
./replace_wrapper '%?[0-9][9-B]-$' 'a&'  < ./inputs/temp-test/1974.inp.838.11 
echo ">>>>>>>>running test 268"
./replace_wrapper '%?[9-B][^a-c]' '@t'  < ./inputs/temp-test/939.inp.403.5 
echo ">>>>>>>>running test 269"
./replace_wrapper '%?[9-B]^a-c]-[a-c]-[^0-9]- *?-^a-]' 'NEW'  < ./inputs/temp-test/1019.inp.438.5 
echo ">>>>>>>>running test 270"
./replace_wrapper '%?[@@][^0-9][a-c]?-[^0-9]- [^9-B]$' 'NEW'  < ./inputs/temp-test/1129.inp.485.10 
echo ">>>>>>>>running test 271"
./replace_wrapper '%?[]^$' '@%&a'  < ./inputs/temp-test/513.inp.223.10 
echo ">>>>>>>>running test 272"
./replace_wrapper '%?[^9-B][^9-B]A' 'a@n'  < ./inputs/temp-test/1808.inp.768.5 
echo ">>>>>>>>running test 273"
./replace_wrapper '%?[^@@][^--z]c-[^0-9][9-B]??' 'a@n'  < ./inputs/temp-test/305.inp.136.5 
echo ">>>>>>>>running test 274"
./replace_wrapper '%?[^@n]^[@@][0-9]??-]' 'NEW'  < ./inputs/temp-test/1127.inp.484.5 
echo ">>>>>>>>running test 275"
./replace_wrapper '%?[^@n]^[@@][0-9]??-]temp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.intemp-test/1183.i-*[^a-b]-*-*[^a-b]-*-*[^a-b]-*-*[^a-b]-*n' 'NEW'  < ./inputs/temp-test/1127.inp.484.5 
echo ">>>>>>>>running test 276"
./replace_wrapper '%?[^@t]$' 'NEW'  < ./inputs/temp-test/1485.inp.637.10 
echo ">>>>>>>>running test 277"
./replace_wrapper '%?[^]^$' '@%&a'  < ./inputs/temp-test/513.inp.223.10 
echo ">>>>>>>>running test 278"
./replace_wrapper '%?[^a--b][0-9]A*[9-B]??[^9-B]?-' 'b@t'  < ./inputs/temp-test/1414.inp.606.7 
echo ">>>>>>>>running test 279"
./replace_wrapper '%?[^a-c]-^?-[a-c]-?c*?[^9-B]-?' 'NEW'  < ./inputs/temp-test/1588.inp.676.7 
echo ">>>>>>>>running test 280"
./replace_wrapper '%?[a--b]@[*[0-9][^a-c]?@*[0-9][- *[^@@][-z][9-B]- *-[a-c]$' 'NEW'  < ./inputs/temp-test/1743.inp.741.10 
echo ">>>>>>>>running test 281"
./replace_wrapper '%?[a-]$' '@t'  < ./inputs/temp-test/2165.inp.915.10 
echo ">>>>>>>>running test 282"
./replace_wrapper '%?[a-c$' 'a@n'  < ./inputs/temp-test/770.inp.330.10 
echo ">>>>>>>>running test 283"
./replace_wrapper '%?[a-c-?' 'a@nb@tc'  < ./inputs/temp-test/2201.inp.932.5 
echo ">>>>>>>>running test 284"
./replace_wrapper '%?[a-c-?' 'a@nb@tc'  < ./inputs/temp-test/2202.inp.932.7 
echo ">>>>>>>>running test 285"
./replace_wrapper '%?^$'   < ./inputs/temp-test/513.inp.223.10 
echo ">>>>>>>>running test 286"
./replace_wrapper '%?^$' '@%&a'  < ./inputs/temp-test/513.inp.223.10 
echo ">>>>>>>>running test 287"
./replace_wrapper '%?^*$' 'a@n'  < ./inputs/temp-test/1242.inp.533.11 
echo ">>>>>>>>running test 288"
./replace_wrapper '%?^*' '&a@%'  < ./inputs/temp-test/977.inp.420.7 
echo ">>>>>>>>running test 289"
./replace_wrapper '%?c*$' '@n'  < ./inputs/temp-test/350.inp.153.11 
echo ">>>>>>>>running test 290"
./replace_wrapper '%?c*$' '@n@'  < ./inputs/temp-test/350.inp.153.11 
echo ">>>>>>>>running test 291"
./replace_wrapper '%@(' 'y:s*EV b!c[n@w>v'  < ./inputs/input/ruin.1752 
echo ">>>>>>>>running test 292"
./replace_wrapper '%@*$'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 293"
./replace_wrapper '%@**-$' '&a@%'  < ./inputs/temp-test/137.inp.63.11 
echo ">>>>>>>>running test 294"
./replace_wrapper '%@**-' '&a@%'  < ./inputs/temp-test/136.inp.63.5 
echo ">>>>>>>>running test 295"
./replace_wrapper '%@**-' '@t'  < ./inputs/temp-test/1492.inp.639.5 
echo ">>>>>>>>running test 296"
./replace_wrapper '%@**--[0-9]?a-c][^-$' '&'  < ./inputs/temp-test/280.inp.125.10 
echo ">>>>>>>>running test 297"
./replace_wrapper '%@*-[^0-9]-@[[^a-c] ' 'NEW'  < ./inputs/temp-test/1489.inp.638.5 
echo ">>>>>>>>running test 298"
./replace_wrapper '%@*?' '&@n' < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 299"
./replace_wrapper '%@*?' '@%&a'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 300"
./replace_wrapper '%@*?'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 301"
./replace_wrapper '%@@ ' 'L^2'\''NNI-~vNzrKq>fKK]A mg,@5N/o2s\V7N>'  < ./inputs/input/ruin.1640 
echo ">>>>>>>>running test 302"
./replace_wrapper '%@@$' ' J5VXPw6h<vW[6**p36MrPLqh'\''Q'  < ./inputs/input/ruin.1167 
echo ">>>>>>>>running test 303"
./replace_wrapper '%@@$' '@atD,[O7M4J)7%|eNA;t(aw'  < ./inputs/input/ruin.1732 
echo ">>>>>>>>running test 304"
./replace_wrapper '%@@$' 'C=K8]r8DZs;rx:9A7J^=P3r4Te2f&G1'  < ./inputs/input/ruin.1708 
echo ">>>>>>>>running test 305"
./replace_wrapper '%@@$' 'H'  < ./inputs/input/ruin.324 
echo ">>>>>>>>running test 306"
./replace_wrapper '%@@$' 'KV5^u_vH*;0X>-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^c4^sOw%oe5'\''AZr@KBq'  < ./inputs/input/ruin.1341 
echo ">>>>>>>>running test 307"
./replace_wrapper '%@@$' 'KV5^u_vH*;0X>c4^sOw%oe5'\''AZr@KBq'  < ./inputs/input/ruin.1341 
echo ">>>>>>>>running test 308"
./replace_wrapper '%@@$' 'zAlI%9cFthJlYpJ\@u|j6dDwUDk?N}i+ Z,hIh$"#iu4zV'  < ./inputs/input/ruin.515 
echo ">>>>>>>>running test 309"
./replace_wrapper '%@@$?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*?[^--z]c[^9-B][^9-B]c?*' 'KV5^u_vH*;0X>c4^sOw%oe5'\''AZr@KBq'  < ./inputs/input/ruin.1341 
echo ">>>>>>>>running test 310"
./replace_wrapper '%@@$@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]' 'H'  < ./inputs/input/ruin.324 
echo ">>>>>>>>running test 311"
./replace_wrapper '%@@' ' B!ls?r*Bk.lC'\''l<T+]?*;};+pT+]:0qdY0\L"V0w*T2'  < ./inputs/input/ruin.767 
echo ">>>>>>>>running test 312"
./replace_wrapper '%@@' '6'  < ./inputs/input/ruin.190 
echo ">>>>>>>>running test 313"
./replace_wrapper '%@@' '7'  < ./inputs/input/ruin.209 
echo ">>>>>>>>running test 314"
./replace_wrapper '%@@' '<'  < ./inputs/input/ruin.1961 
echo ">>>>>>>>running test 315"
./replace_wrapper '%@@' 'A'  < ./inputs/input/ruin.23 
echo ">>>>>>>>running test 316"
./replace_wrapper '%@@' 'C#6L=cT|[<GnK><~'  < ./inputs/input/ruin.152 
echo ">>>>>>>>running test 317"
./replace_wrapper '%@@' 'E'  < ./inputs/input/ruin.1281 
echo ">>>>>>>>running test 318"
./replace_wrapper '%@@' 'H'  < ./inputs/input/ruin.90 
echo ">>>>>>>>running test 319"
./replace_wrapper '%@@' 'Hgsuo[7/`Q'  < ./inputs/input/ruin.123 
echo ">>>>>>>>running test 320"
./replace_wrapper '%@@' 'JOmk4tJ'  < ./inputs/input/ruin.223 
echo ">>>>>>>>running test 321"
./replace_wrapper '%@@' 'KJ={Rl7_z1X$p:%SG'  < ./inputs/input/ruin.1477 
echo ">>>>>>>>running test 322"
./replace_wrapper '%@@' 'M.10\?_|(0803q:sHHzal#;;M<2`.,HRVz"'\''il'  < ./inputs/input/ruin.133 
echo ">>>>>>>>running test 323"
./replace_wrapper '%@@' 'V@'  < ./inputs/input/ruin.1083 
echo ">>>>>>>>running test 324"
./replace_wrapper '%@@' 'Yp'  < ./inputs/input/ruin.3 
echo ">>>>>>>>running test 325"
./replace_wrapper '%@@' 'b04ZLrhsr,4"4&K!&ZA1"ZA;]/XF3SXotQ'  < ./inputs/input/ruin.1226 
echo ">>>>>>>>running test 326"
./replace_wrapper '%@@' 'i'  < ./inputs/input/ruin.472 
echo ">>>>>>>>running test 327"
./replace_wrapper '%@@' 'j'  < ./inputs/input/ruin.38 
echo ">>>>>>>>running test 328"
./replace_wrapper '%@@' 'j'  < ./inputs/input/ruin.441 
echo ">>>>>>>>running test 329"
./replace_wrapper '%@@' 'k'  < ./inputs/input/ruin.1730 
echo ">>>>>>>>running test 330"
./replace_wrapper '%@@' 'm|~+U+9'\''<y9E'  < ./inputs/input/ruin.1120 
echo ">>>>>>>>running test 331"
./replace_wrapper '%@@' 'sI1TM{>'\''bMi-}&'  < ./inputs/input/ruin.477 
echo ">>>>>>>>running test 332"
./replace_wrapper '%@@' 'tU/3F0P2)T;xy=$:fIU'  < ./inputs/input/ruin.781 
echo ">>>>>>>>running test 333"
./replace_wrapper '%@@' 'w'  < ./inputs/input/ruin.1634 
echo ">>>>>>>>running test 334"
./replace_wrapper '%@@' '}Y}'  < ./inputs/input/ruin.1314 
echo ">>>>>>>>running test 335"
./replace_wrapper '%@@*$' 'm|~+U+9'\''<y9E'  < ./inputs/input/ruin.1120 
echo ">>>>>>>>running test 336"
./replace_wrapper '%@@*' 'p'  < ./inputs/input/ruin.283 
echo ">>>>>>>>running test 337"
./replace_wrapper '%@@*[^9-B] *-c*[-' '&a@%'  < ./inputs/temp-test/1497.inp.641.7 
echo ">>>>>>>>running test 338"
./replace_wrapper '%@@=' ')&hL~6sDzLioa!)wc9QfBOO'\''qiXG^o1*za&dr |;Z%Nn^h*rq'  < ./inputs/input/ruin.399 
echo ">>>>>>>>running test 339"
./replace_wrapper '%@@?$' '>A('  < ./inputs/input/ruin.751 
echo ">>>>>>>>running test 340"
./replace_wrapper '%@@@@@@$' 'PxkC zwUtqc`<IFt"RoQ!F'\''D9z7OL;xo$/o&6XdE=StMNWl|iTbck%*z'  < ./inputs/input/ruin.525 
echo ">>>>>>>>running test 341"
./replace_wrapper '%@@@@\x[^v]@@' '/!OJ=t,WAMc%C'  < ./inputs/input/ruin.344 
echo ">>>>>>>>running test 342"
./replace_wrapper '%@@\' '_e/7aN*GF0pWy#='  < ./inputs/input/ruin.310 
echo ">>>>>>>>running test 343"
./replace_wrapper '%@[*[9-B]' '&'  < ./inputs/temp-test/492.inp.215.5 
echo ">>>>>>>>running test 344"
./replace_wrapper '%@[*[9-B]@' '&'  < ./inputs/temp-test/492.inp.215.5 
echo ">>>>>>>>running test 345"
./replace_wrapper '%@[*[a-c]$' 'NEW'  < ./inputs/temp-test/1372.inp.588.11 
echo ">>>>>>>>running test 346"
./replace_wrapper '%@[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]' 'a&'  < ./inputs/temp-test/2269.inp.961.5 
echo ">>>>>>>>running test 347"
./replace_wrapper '%@d' 'fg~4[LmRA3o6:cW<[RU@3H*M;Z:.;y'\'',gC?= VPAFmAF'\'':1)z3<<'  < ./inputs/input/ruin.377 
echo ">>>>>>>>running test 348"
./replace_wrapper '%@n' '`'  < ./inputs/input/ruin.1158 
echo ">>>>>>>>running test 349"
./replace_wrapper '%@n' 'l|'  < ./inputs/input/ruin.1775 
echo ">>>>>>>>running test 350"
./replace_wrapper '%@n' 'v'  < ./inputs/input/ruin.1561 
echo ">>>>>>>>running test 351"
./replace_wrapper '%@n'  < ./inputs/input/ruin.1158 
echo ">>>>>>>>running test 352"
./replace_wrapper '%@n?' ''  < ./inputs/input/ruin.1860 
echo ">>>>>>>>running test 353"
./replace_wrapper '%@t$' '\_'  < ./inputs/input/ruin.1586 
echo ">>>>>>>>running test 354"
./replace_wrapper '%@t*' '@'  < ./inputs/input/ruin.1787 
echo ">>>>>>>>running test 355"
./replace_wrapper '%A' ':45s3M%Yaoud%{~QFrbA`:&NwJ9(nw}Qy=?D['  < ./inputs/input/ruin.1115 
echo ">>>>>>>>running test 356"
./replace_wrapper '%A*$' ':45s3M%Yaoud%{~QFrbA`:&NwJ9(nw}Qy=?D['  < ./inputs/input/ruin.1115 
echo ">>>>>>>>running test 357"
./replace_wrapper '%A*[^0-9]*$' '@%@&'  < ./inputs/temp-test/36.inp.15.10 
echo ">>>>>>>>running test 358"
./replace_wrapper '%A[0-9]?@**[a-c][^0-9]$' '@%&a'  < ./inputs/temp-test/672.inp.292.11 
echo ">>>>>>>>running test 359"
./replace_wrapper '%E$' 'I'  < ./inputs/input/ruin.1790 
echo ">>>>>>>>running test 360"
./replace_wrapper '%E' 'E'  < ./inputs/input/ruin.1184 
echo ">>>>>>>>running test 361"
./replace_wrapper '%E?' 'h'  < ./inputs/input/ruin.903 
echo ">>>>>>>>running test 362"
./replace_wrapper '%O$' '\'  < ./inputs/input/ruin.683 
echo ">>>>>>>>running test 363"
./replace_wrapper '%P$' 'dLQ('  < ./inputs/input/ruin.1532 
echo ">>>>>>>>running test 364"
./replace_wrapper '%S' ' P'  < ./inputs/input/ruin.1601 
echo ">>>>>>>>running test 365"
./replace_wrapper '%S?*' ' P'  < ./inputs/input/ruin.1601 
echo ">>>>>>>>running test 366"
./replace_wrapper '%U' 'N+2rHDje[,A_^!$*}]k`e2{1lp*{^'  < ./inputs/input/ruin.15 
echo ">>>>>>>>running test 367"
./replace_wrapper '%U' 'h<z?cC=|(I]>/deslsGqiEdmY'  < ./inputs/input/ruin.1760 
echo ">>>>>>>>running test 368"
./replace_wrapper '%V' '`wtFDA"\YWV{x=qMe@$iJ&LgdV'  < ./inputs/input/ruin.757 
echo ">>>>>>>>running test 369"
./replace_wrapper '%V' 'd'  < ./inputs/input/ruin.1707 
echo ">>>>>>>>running test 370"
./replace_wrapper '%WQtcc@n' '( $V0B&16|L'  < ./inputs/input/ruin.270 
echo ">>>>>>>>running test 371"
./replace_wrapper '%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[[%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[' '@n'  < ./inputs/temp-test/2096.inp.888.5 
echo ">>>>>>>>running test 372"
./replace_wrapper '%[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[' '@n'  < ./inputs/temp-test/2096.inp.888.5 
echo ">>>>>>>>running test 373"
./replace_wrapper '%[0-4-1]' '-1'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 374"
./replace_wrapper '%[0-9H]$' 'l*>nm)BOulbBc1&N6A'  < ./inputs/input/ruin.549 
echo ">>>>>>>>running test 375"
./replace_wrapper '%[0-9]' 'l'  < ./inputs/input/ruin.1572 
echo ">>>>>>>>running test 376"
./replace_wrapper '%[0-9]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 377"
./replace_wrapper '%[0-9]-[9-B]?-[9-B]^-]?$' 'NEW'  < ./inputs/temp-test/1672.inp.712.10 
echo ">>>>>>>>running test 378"
./replace_wrapper '%[0-9]?' '@t'  < ./inputs/temp-test/1048.inp.451.5 
echo ">>>>>>>>running test 379"
./replace_wrapper '%[0-9]@@' '@%&a'  < ./inputs/temp-test/1696.inp.723.5 
echo ">>>>>>>>running test 380"
./replace_wrapper '%[0-9]@[*' '@n'  < ./inputs/temp-test/844.inp.362.5 
echo ">>>>>>>>running test 381"
./replace_wrapper '%[0-9][^9-B][@t][^a-c]' '@%&a'  < ./inputs/temp-test/1040.inp.447.5 
echo ">>>>>>>>running test 382"
./replace_wrapper '%[1]*@@' '@YLmg{>yPr b&3<TkY4-a|k+L63(J^$~xY:n\b6%fo3[-n, =}@e'  < ./inputs/input/ruin.626 
echo ">>>>>>>>running test 383"
./replace_wrapper '%[9-B]' '&'  < ./inputs/temp-test/2307.inp.979.7 
echo ">>>>>>>>running test 384"
./replace_wrapper '%[9-B]-$' 'NEW'  < ./inputs/temp-test/1455.inp.623.10 
echo ">>>>>>>>running test 385"
./replace_wrapper '%[9-B]?$' '&a@%'  < ./inputs/temp-test/2045.inp.867.10 
echo ">>>>>>>>running test 386"
./replace_wrapper '%[9-B]?' '@%&a'  < ./inputs/temp-test/801.inp.344.5 
echo ">>>>>>>>running test 387"
./replace_wrapper '%[9-B]?-@[*[^9-B]-@tc*a-]' '@n'  < ./inputs/temp-test/1536.inp.657.7 
echo ">>>>>>>>running test 388"
./replace_wrapper '%[9-B][^a--]' 'a@nb@tc'  < ./inputs/temp-test/1355.inp.581.5 
echo ">>>>>>>>running test 389"
./replace_wrapper '%[9-B]c*?@[*-? $' '&'  < ./inputs/temp-test/436.inp.191.10 
echo ">>>>>>>>running test 390"
./replace_wrapper '%[>-AA-G>-A]' '%'  < ./inputs/input/ruin.801 
echo ">>>>>>>>running test 391"
./replace_wrapper '%[>-A]$' 'Rob"FQFK`\,mU`gzl<R<1`Ns4W.g'  < ./inputs/input/ruin.371 
echo ">>>>>>>>running test 392"
./replace_wrapper '%[@t]- [^0-9][^a-^?@n?$' 'a&'  < ./inputs/temp-test/2252.inp.954.10 
echo ">>>>>>>>running test 393"
./replace_wrapper '%[@t]@*?[^-[9-B]-' 'b@t'  < ./inputs/temp-test/1732.inp.736.5 
echo ">>>>>>>>running test 394"
./replace_wrapper '%[A-G0-9]' 'aKzJRRKf,'\''We6;r+n+]pU-`P}I'  < ./inputs/input/ruin.988 
echo ">>>>>>>>running test 395"
./replace_wrapper '%[A-G]' 'P'  < ./inputs/input/ruin.730 
echo ">>>>>>>>running test 396"
./replace_wrapper '%[A-G]' 'xeD;,?BG|~6y8P D&x*"3r^Ej5VL$'  < ./inputs/input/ruin.1081 
echo ">>>>>>>>running test 397"
./replace_wrapper '%[I]'   < ./inputs/input/ruin.1156 
echo ">>>>>>>>running test 398"
./replace_wrapper '%[I]' 'r?alRkSvq6'  < ./inputs/input/ruin.1156 
echo ">>>>>>>>running test 399"
./replace_wrapper '%[R]$' 'f&<'  < ./inputs/input/ruin.9 
echo ">>>>>>>>running test 400"
./replace_wrapper '%[Z-a]^_`a]$' 'easgtgK\'\''\*W LdSez|/"f'  < ./inputs/input/ruin.76 
echo ">>>>>>>>running test 401"
./replace_wrapper '%[]? ' 'a@nb@tc'  < ./inputs/temp-test/218.inp.97.5 
echo ">>>>>>>>running test 402"
./replace_wrapper '%[][^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 403"
./replace_wrapper '%[^-z] ' 'NEW'  < ./inputs/temp-test/248.inp.110.5 
echo ">>>>>>>>running test 404"
./replace_wrapper '%[^0-9] [^9-B]--[0-9]??[a-c]?-' ''  < ./inputs/temp-test/568.inp.244.5 
echo ">>>>>>>>running test 405"
./replace_wrapper '%[^0-9]' '&'  < ./inputs/temp-test/665.inp.289.5 
echo ">>>>>>>>running test 406"
./replace_wrapper '%[^0-9]' '@%@&'  < ./inputs/temp-test/2005.inp.851.5 
echo ">>>>>>>>running test 407"
./replace_wrapper '%[^0-9]*$' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 408"
./replace_wrapper '%[^0-9]*' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 409"
./replace_wrapper '%[^0-9]-' '@%&a'  < ./inputs/temp-test/1570.inp.670.5 
echo ">>>>>>>>running test 410"
./replace_wrapper '%[^0-9]-?[9-B]?-[9-B]?'   < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 411"
./replace_wrapper '%[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 412"
./replace_wrapper '%[^0-9]?' '@%@&'  < ./inputs/temp-test/942.inp.404.5 
echo ">>>>>>>>running test 413"
./replace_wrapper '%[^0-9]?*' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 414"
./replace_wrapper '%[^0-9]@t*' '&a@%'  < ./inputs/temp-test/461.inp.202.5 
echo ">>>>>>>>running test 415"
./replace_wrapper '%[^0-9]A?' '@n'  < ./inputs/temp-test/1835.inp.780.7 
echo ">>>>>>>>running test 416"
./replace_wrapper '%[^0-9][^0-9][^9-B]' '@n'  < ./inputs/temp-test/1955.inp.829.5 
echo ">>>>>>>>running test 417"
./replace_wrapper '%[^0-9][a--][^9-B][^-z]$' 'a@nb@tc'  < ./inputs/temp-test/2256.inp.956.10 
echo ">>>>>>>>running test 418"
./replace_wrapper '%[^0-9][a-]$' ''  < ./inputs/temp-test/151.inp.68.10 
echo ">>>>>>>>running test 419"
./replace_wrapper '%[^0-9][a-c]$' ''  < ./inputs/temp-test/728.inp.313.10 
echo ">>>>>>>>running test 420"
./replace_wrapper '%[^9-B]$' 'a&'  < ./inputs/temp-test/1539.inp.658.10 
echo ">>>>>>>>running test 421"
./replace_wrapper '%[^9-B]-' '@%&a'  < ./inputs/temp-test/2131.inp.902.5 
echo ">>>>>>>>running test 422"
./replace_wrapper '%[^9-B]?' '&'  < ./inputs/temp-test/2161.inp.914.5 
echo ">>>>>>>>running test 423"
./replace_wrapper '%[^9-B]?' '@%@&'  < ./inputs/temp-test/1555.inp.665.5 
echo ">>>>>>>>running test 424"
./replace_wrapper '%[^9-B]?-[^9-B]-*-[^9-B][^0-9]-*-[^0-9]$' '@%&a'  < ./inputs/temp-test/1083.inp.466.10 
echo ">>>>>>>>running test 425"
./replace_wrapper '%[^9-B]?[a-c-?a-][^a-]-?-[9-B][0-9][^a-c*[0-9][^0-9]@[[9-B][^a-c]$' ''  < ./inputs/temp-test/1224.inp.525.10 
echo ">>>>>>>>running test 426"
./replace_wrapper '%[^9-B][9-B]-*?[^@@]-a-]-' '@%&a'  < ./inputs/temp-test/2143.inp.907.5 
echo ">>>>>>>>running test 427"
./replace_wrapper '%[^9-B][a-c]$' '@%&a'  < ./inputs/temp-test/1306.inp.561.10 
echo ">>>>>>>>running test 428"
./replace_wrapper '%[^>-A]' 'm})h'  < ./inputs/input/ruin.816 
echo ">>>>>>>>running test 429"
./replace_wrapper '%[^>-A]' 'rw`h-v1P5_?OU7NRz`:a9HNb]H="9cjwym["lqG<!&sYJc^dbfdN7N2ms3E ZS&g'  < ./inputs/input/ruin.666 
echo ">>>>>>>>running test 430"
./replace_wrapper '%[^>-A]' 'w'  < ./inputs/input/ruin.1698 
echo ">>>>>>>>running test 431"
./replace_wrapper '%[^?z-}>-A0-9A-GZ-a]^_`a-c-ac-a]' 'NA'  < ./inputs/input/ruin.293 
echo ">>>>>>>>running test 432"
./replace_wrapper '%[^?z-}>-A0-9A-GZ-a]^_`a-c-ac-a]@n' 'N&A'  < ./inputs/input/ruin.293 
echo ">>>>>>>>running test 433"
./replace_wrapper '%[^A-G]$' 'Pb'  < ./inputs/input/ruin.1111 
echo ">>>>>>>>running test 434"
./replace_wrapper '%[^A-G]' '(Qk '  < ./inputs/input/ruin.1205 
echo ">>>>>>>>running test 435"
./replace_wrapper '%[^B]' 'o'  < ./inputs/input/ruin.733 
echo ">>>>>>>>running test 436"
./replace_wrapper '%[^Z-a]^_`a]' 'J=iYas^_]iYPHxV5eUw(z'  < ./inputs/input/ruin.1660 
echo ">>>>>>>>running test 437"
./replace_wrapper '%[^]? ' 'a@nb@tc'  < ./inputs/temp-test/218.inp.97.5 
echo ">>>>>>>>running test 438"
./replace_wrapper '%[^][^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/527.inp.228.5 
echo ">>>>>>>>running test 439"
./replace_wrapper '%[^a-' '&'  < ./inputs/temp-test/2316.inp.982.7 
echo ">>>>>>>>running test 440"
./replace_wrapper '%[^a-?[a-]?-?-]' '&'  < ./inputs/temp-test/49.inp.20.7 
echo ">>>>>>>>running test 441"
./replace_wrapper '%[^a-c]' '@%@&'  < ./inputs/temp-test/2282.inp.966.7 
echo ">>>>>>>>running test 442"
./replace_wrapper '%[^a-c]???@*?[^a-c][a-c[^9-B]$' 'NEW'  < ./inputs/temp-test/484.inp.211.10 
echo ">>>>>>>>running test 443"
./replace_wrapper '%[^a-c]?[^0-9]a-c][9-B]c*?[^0-9]$' ''  < ./inputs/temp-test/1295.inp.555.10 
echo ">>>>>>>>running test 444"
./replace_wrapper '%[^a-c]?[^0-9]a-c][9-B]c*?[^0-9]' ''  < ./inputs/temp-test/1294.inp.555.7 
echo ">>>>>>>>running test 445"
./replace_wrapper '%[^a-c]@t*$' '@t'  < ./inputs/temp-test/1191.inp.512.10 
echo ">>>>>>>>running test 446"
./replace_wrapper '%[^a-c]@t*' '@t'  < ./inputs/temp-test/1190.inp.512.7 
echo ">>>>>>>>running test 447"
./replace_wrapper '%[^a-c][0-9]' 'a&'  < ./inputs/temp-test/1784.inp.759.5 
echo ">>>>>>>>running test 448"
./replace_wrapper '%[^a-c][9-B]$' '@%@&'  < ./inputs/temp-test/1644.inp.700.10 
echo ">>>>>>>>running test 449"
./replace_wrapper '%[^a-c]^*' '@%@&'  < ./inputs/temp-test/2300.inp.976.5 
echo ">>>>>>>>running test 450"
./replace_wrapper '%[^c-a>-A]' 'q\)&urQRC6v%ZLu%T%'  < ./inputs/input/ruin.1358 
echo ">>>>>>>>running test 451"
./replace_wrapper '%[^~>-A<]' 'W'  < ./inputs/input/ruin.1816 
echo ">>>>>>>>running test 452"
./replace_wrapper '%[_-z]-' '@n'  < ./inputs/temp-test/811.inp.348.7 
echo ">>>>>>>>running test 453"
./replace_wrapper '%[a-?$' 'NEW'  < ./inputs/temp-test/737.inp.316.11 
echo ">>>>>>>>running test 454"
./replace_wrapper '%[a-]-*[a-c][^a--]-$' '@t'  < ./inputs/temp-test/1091.inp.470.10 
echo ">>>>>>>>running test 455"
./replace_wrapper '%[a-b]?**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 456"
./replace_wrapper '%[a-c-@@[0-9][^a-]?a-c]--c*$' '@%@&'  < ./inputs/temp-test/1976.inp.839.10 
echo ">>>>>>>>running test 457"
./replace_wrapper '%[a-c[^9-B]' '@%@&'  < ./inputs/temp-test/1431.inp.614.7 
echo ">>>>>>>>running test 458"
./replace_wrapper '%[a-c]$' 'a@nb@tc'  < ./inputs/temp-test/1342.inp.576.11 
echo ">>>>>>>>running test 459"
./replace_wrapper '%[a-c]-$' 'a@nb@tc'  < ./inputs/temp-test/1632.inp.694.10 
echo ">>>>>>>>running test 460"
./replace_wrapper '%[a-c]?[^9-B][9-B][^a--b][0-9]-@@*' '@%&a'  < ./inputs/temp-test/490.inp.214.7 
echo ">>>>>>>>running test 461"
./replace_wrapper '%[a-c]?[^9-B][9-B][^a--b][0-9]-@@*@' '@%&a'  < ./inputs/temp-test/490.inp.214.7 
echo ">>>>>>>>running test 462"
./replace_wrapper '%[a-c][^0-9]*[a-c]' '&@n'  < ./inputs/temp-test/693.inp.300.5 
echo ">>>>>>>>running test 463"
./replace_wrapper '%[a-c][^0-9]*[a-c]' '&@nmohaw'  < ./inputs/temp-test/693.inp.300.5 
echo ">>>>>>>>running test 464"
./replace_wrapper '%[a-c][^0-9]-*-[a-c]-' '@n'  < ./inputs/temp-test/693.inp.300.5 
echo ">>>>>>>>running test 465"
./replace_wrapper '%[c-az-}z-}>-AA-Gz-}z-}c-a]r' '%'  < ./inputs/input/ruin.1529 
echo ">>>>>>>>running test 466"
./replace_wrapper '%[g]' 'JR]VaH^{mV&/1Ta}4.dF0WCLpBLR8AShG"$St'  < ./inputs/input/ruin.1432 
echo ">>>>>>>>running test 467"
./replace_wrapper '%[k]' 'T'  < ./inputs/input/ruin.475 
echo ">>>>>>>>running test 468"
./replace_wrapper '%[q0-9]' '.^u>`Y~4'\''!d;?[6eMR*)X+D>xU%AUWv8y$.jdQ@jBn='\''(J8f,KIL4L'  < ./inputs/input/ruin.285 
echo ">>>>>>>>running test 469"
./replace_wrapper '%[z-}Z-a]^_`a->-A>-A-c-ac-a-A-GABCDEFGl-A-GABCDEFG~-A-GABCDEFG-z-}z-}!-A-GABCDEFG]' '=h'  < ./inputs/input/ruin.770 
echo ">>>>>>>>running test 470"
./replace_wrapper '%[z-}]$' 'h'  < ./inputs/input/ruin.898 
echo ">>>>>>>>running test 471"
./replace_wrapper '%^' 'x'  < ./inputs/input/ruin.1600 
echo ">>>>>>>>running test 472"
./replace_wrapper '%^*??-$' '@%@&'  < ./inputs/temp-test/2242.inp.950.10 
echo ">>>>>>>>running test 473"
./replace_wrapper '%^*[^@@]-?^a-][a--][^@@]?-[0-9]' '@%@&'  < ./inputs/temp-test/1684.inp.717.5 
echo ">>>>>>>>running test 474"
./replace_wrapper '%^*[^a--]$' 'a&'  < ./inputs/temp-test/257.inp.113.10 
echo ">>>>>>>>running test 475"
./replace_wrapper '%^*a-c]' '@%&a'  < ./inputs/temp-test/2247.inp.952.7 
echo ">>>>>>>>running test 476"
./replace_wrapper '%^-$' '&'  < ./inputs/temp-test/875.inp.375.11 
echo ">>>>>>>>running test 477"
./replace_wrapper '%^-]?' '&'  < ./inputs/temp-test/1768.inp.752.5 
echo ">>>>>>>>running test 478"
./replace_wrapper '%^-]@**' 'b@t'  < ./inputs/temp-test/743.inp.318.5 
echo ">>>>>>>>running test 479"
./replace_wrapper '%^?*' 'x'  < ./inputs/input/ruin.1600 
echo ">>>>>>>>running test 480"
./replace_wrapper '%^a-]?a-][^a-]' ''  < ./inputs/temp-test/449.inp.196.7 
echo ">>>>>>>>running test 481"
./replace_wrapper '%^a-][9-B][^--z]??@[*?$' 'a&'  < ./inputs/temp-test/2154.inp.911.10 
echo ">>>>>>>>running test 482"
./replace_wrapper '%^a-c]-' 'NEW'  < ./inputs/temp-test/194.inp.87.7 
echo ">>>>>>>>running test 483"
./replace_wrapper '%^a-c]?*' 'NEW'  < ./inputs/temp-test/194.inp.87.7 
echo ">>>>>>>>running test 484"
./replace_wrapper '%^a-c][a-c]$' 'b@t'  < ./inputs/temp-test/1059.inp.455.10 
echo ">>>>>>>>running test 485"
./replace_wrapper '%a' kkkkkkkkkkkkk  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 486"
./replace_wrapper '%a' kkkkkkkkkkkkk$  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 487"
./replace_wrapper '%a-]-*?c[^--z]a-][^a-][a--b]?' 'a&'  < ./inputs/temp-test/1327.inp.569.5 
echo ">>>>>>>>running test 488"
./replace_wrapper '%a-]@@*$' 'NEW'  < ./inputs/temp-test/1204.inp.516.10 
echo ">>>>>>>>running test 489"
./replace_wrapper '%a-c]-[0-9]@t*@*?$' '@%@&'  < ./inputs/temp-test/993.inp.427.10 
echo ">>>>>>>>running test 490"
./replace_wrapper '%a-c][^@@]' '@t'  < ./inputs/temp-test/1515.inp.648.7 
echo ">>>>>>>>running test 491"
./replace_wrapper '%a[ ]*' '&@t'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 492"
./replace_wrapper '%a[ ]*[ ]c$' '&@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 493"
./replace_wrapper '%c' '&a@%'  < ./inputs/temp-test/312.inp.139.7 
echo ">>>>>>>>running test 494"
./replace_wrapper '%c*' '&a@%'  < ./inputs/temp-test/2088.inp.884.5 
echo ">>>>>>>>running test 495"
./replace_wrapper '%dB' 'P'  < ./inputs/input/ruin.517 
echo ">>>>>>>>running test 496"
./replace_wrapper '%e@n[^>-A/]$' '98&)4@z=|'\''-xLsL|#?_(vf/fhZ'  < ./inputs/input/ruin.201 
echo ">>>>>>>>running test 497"
./replace_wrapper '%f' '\'  < ./inputs/input/ruin.1034 
echo ">>>>>>>>running test 498"
./replace_wrapper '%f' '\KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@'  < ./inputs/input/ruin.1034 
echo ">>>>>>>>running test 499"
./replace_wrapper '[^a-c]?$' 'a@n'  < ./inputs/temp-test/70.inp.30.9 
echo ">>>>>>>>running test 500"
./replace_wrapper '[^a-c]?' '&a@%'  < ./inputs/temp-test/2031.inp.862.1 
echo ">>>>>>>>running test 501"
./replace_wrapper '[^a-c]?' '&a@%'  < ./inputs/temp-test/2032.inp.862.2 
echo ">>>>>>>>running test 502"
./replace_wrapper '[^a-c]?' '&a@%'  < ./inputs/temp-test/2033.inp.862.3 
echo ">>>>>>>>running test 503"
./replace_wrapper '[^a-c]?' ''  < ./inputs/temp-test/1148.inp.494.1 
echo ">>>>>>>>running test 504"
./replace_wrapper '[^a-c]?' ''  < ./inputs/temp-test/1149.inp.494.3 
echo ">>>>>>>>running test 505"
./replace_wrapper '[^a-c]?' 'a@n'  < ./inputs/temp-test/69.inp.30.1 
echo ">>>>>>>>running test 506"
./replace_wrapper '[^a-c]???@*?[^a-c][a-c[^9-B]' 'NEW'  < ./inputs/temp-test/482.inp.211.1 
echo ">>>>>>>>running test 507"
./replace_wrapper '[^a-c]???@*?[^a-c][a-c[^9-B]' 'NEW'  < ./inputs/temp-test/483.inp.211.4 
echo ">>>>>>>>running test 508"
./replace_wrapper '[^a-c]?[^0-9]a-c][9-B]c*?[^0-9]' ''  < ./inputs/temp-test/1293.inp.555.1 
echo ">>>>>>>>running test 509"
./replace_wrapper '[^a-c]@*' ''  < ./inputs/temp-test/827.inp.356.1 
echo ">>>>>>>>running test 510"
./replace_wrapper '[^a-c]@** *? [0-9]-?@**-' 'b@t'  < ./inputs/temp-test/396.inp.173.1 
echo ">>>>>>>>running test 511"
./replace_wrapper '[^a-c]@** *? [0-9]-?@**-' 'b@t'  < ./inputs/temp-test/397.inp.173.3 
echo ">>>>>>>>running test 512"
./replace_wrapper '[^a-c]@t*' '@t'  < ./inputs/temp-test/1187.inp.512.1 
echo ">>>>>>>>running test 513"
./replace_wrapper '[^a-c]@t*' '@t'  < ./inputs/temp-test/1188.inp.512.2 
echo ">>>>>>>>running test 514"
./replace_wrapper '[^a-c]@t*' '@t'  < ./inputs/temp-test/1189.inp.512.4 
echo ">>>>>>>>running test 515"
./replace_wrapper '[^a-c]A*' '@t'  < ./inputs/temp-test/1481.inp.636.1 
echo ">>>>>>>>running test 516"
./replace_wrapper '[^a-c]A*' '@t'  < ./inputs/temp-test/1482.inp.636.2 
echo ">>>>>>>>running test 517"
./replace_wrapper '[^a-c]A*' '@t'  < ./inputs/temp-test/1483.inp.636.3 
echo ">>>>>>>>running test 518"
./replace_wrapper '[^a-c][0-9]' 'a&'  < ./inputs/temp-test/1781.inp.759.1 
echo ">>>>>>>>running test 519"
./replace_wrapper '[^a-c][0-9]' 'a&'  < ./inputs/temp-test/1782.inp.759.2 
echo ">>>>>>>>running test 520"
./replace_wrapper '[^a-c][0-9]' 'a&'  < ./inputs/temp-test/1783.inp.759.3 
echo ">>>>>>>>running test 521"
./replace_wrapper '[^a-c][9-B]$' '&a@%'  < ./inputs/temp-test/1980.inp.840.6 
echo ">>>>>>>>running test 522"
./replace_wrapper '[^a-c][9-B]'   < ./inputs/temp-test/223.inp.99.3 
echo ">>>>>>>>running test 523"
./replace_wrapper '[^a-c][9-B]' '&a@%'  < ./inputs/temp-test/1977.inp.840.1 
echo ">>>>>>>>running test 524"
./replace_wrapper '[^a-c][9-B]' '&a@%'  < ./inputs/temp-test/1978.inp.840.3 
echo ">>>>>>>>running test 525"
./replace_wrapper '[^a-c][9-B]' '&a@%'  < ./inputs/temp-test/1979.inp.840.4 
echo ">>>>>>>>running test 526"
./replace_wrapper '[^a-c][9-B]' ''  < ./inputs/temp-test/1851.inp.786.1 
echo ">>>>>>>>running test 527"
./replace_wrapper '[^a-c][9-B]' '@%&a'  < ./inputs/temp-test/222.inp.99.1 
echo ">>>>>>>>running test 528"
./replace_wrapper '[^a-c][9-B]' '@%&a'  < ./inputs/temp-test/223.inp.99.3 
echo ">>>>>>>>running test 529"
./replace_wrapper '[^a-c][9-B]' '@%@&'  < ./inputs/temp-test/1641.inp.700.1 
echo ">>>>>>>>running test 530"
./replace_wrapper '[^a-c][9-B]' '@%@&'  < ./inputs/temp-test/1642.inp.700.2 
echo ">>>>>>>>running test 531"
./replace_wrapper '[^a-c][9-B]' '@%@&'  < ./inputs/temp-test/1643.inp.700.3 
echo ">>>>>>>>running test 532"
./replace_wrapper '[^a-c][][9-B]' '@%&a'  < ./inputs/temp-test/222.inp.99.1 
echo ">>>>>>>>running test 533"
./replace_wrapper '[^a-c][]a-]' 'NEW'  < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 534"
./replace_wrapper '[^a-c][^][9-B]' '@%&a'  < ./inputs/temp-test/222.inp.99.1 
echo ">>>>>>>>running test 535"
./replace_wrapper '[^a-c][^]a-]' 'NEW'  < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 536"
./replace_wrapper '[^a-c][a--b]' 'a@n'  < ./inputs/temp-test/789.inp.340.1 
echo ">>>>>>>>running test 537"
./replace_wrapper '[^a-c][a--b]' 'a@n'  < ./inputs/temp-test/790.inp.340.3 
echo ">>>>>>>>running test 538"
./replace_wrapper '[^a-c]^*' '@%@&'  < ./inputs/temp-test/2299.inp.976.1 
echo ">>>>>>>>running test 539"
./replace_wrapper '[^a-c]^*' 'NEW'  < ./inputs/temp-test/43.inp.18.1 
echo ">>>>>>>>running test 540"
./replace_wrapper '[^a-c]^*?---[a-c' 'a@nb@tc'  < ./inputs/temp-test/1446.inp.620.1 
echo ">>>>>>>>running test 541"
./replace_wrapper '[^a-c]^*?---[a-c' 'a@nb@tc'  < ./inputs/temp-test/1447.inp.620.2 
echo ">>>>>>>>running test 542"
./replace_wrapper '[^a-c]^*?---[a-c' 'a@nb@tc'  < ./inputs/temp-test/1448.inp.620.3 
echo ">>>>>>>>running test 543"
./replace_wrapper '[^a-c]a-]'   < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 544"
./replace_wrapper '[^a-c]a-]' '&@n'  < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 545"
./replace_wrapper '[^a-c]a-]' '@%&a'  < ./inputs/temp-test/599.inp.258.1 
echo ">>>>>>>>running test 546"
./replace_wrapper '[^a-c]a-]' '@%&a'  < ./inputs/temp-test/600.inp.258.3 
echo ">>>>>>>>running test 547"
./replace_wrapper '[^a-c]a-]' 'NEW'  < ./inputs/temp-test/211.inp.94.1 
echo ">>>>>>>>running test 548"
./replace_wrapper '[^a-c]a-][^0-9][9-B]^$' 'a@nb@tc'  < ./inputs/temp-test/678.inp.294.9 
echo ">>>>>>>>running test 549"
./replace_wrapper '[^a-c]a-][^0-9][9-B]^' 'a@nb@tc'  < ./inputs/temp-test/676.inp.294.1 
echo ">>>>>>>>running test 550"
./replace_wrapper '[^a-c]a-][^0-9][9-B]^' 'a@nb@tc'  < ./inputs/temp-test/677.inp.294.3 
echo ">>>>>>>>running test 551"
./replace_wrapper '[^a-c]a-c]' 'a@n'  < ./inputs/temp-test/581.inp.250.1 
echo ">>>>>>>>running test 552"
./replace_wrapper '[^a-c]a-c]' 'a@n'  < ./inputs/temp-test/582.inp.250.2 
echo ">>>>>>>>running test 553"
./replace_wrapper '[^a-c]a-c]@*-[^a--]-]-]-' 'a&'  < ./inputs/temp-test/1994.inp.847.1 
echo ">>>>>>>>running test 554"
./replace_wrapper '[^a-c]a-c]@*-[^a--]-]-]-' 'a&'  < ./inputs/temp-test/1995.inp.847.2 
echo ">>>>>>>>running test 555"
./replace_wrapper '[^a-c]a-c]@*-[^a--]-]-]-' 'a&'  < ./inputs/temp-test/1996.inp.847.3 
echo ">>>>>>>>running test 556"
./replace_wrapper '[^a-c]c*' 'b@t'  < ./inputs/temp-test/1558.inp.667.1 
echo ">>>>>>>>running test 557"
./replace_wrapper '[^a-c]c*' 'b@t'  < ./inputs/temp-test/1559.inp.667.2 
echo ">>>>>>>>running test 558"
./replace_wrapper '[^a-c]c*' 'b@t'  < ./inputs/temp-test/1560.inp.667.3 
echo ">>>>>>>>running test 559"
./replace_wrapper '[^a-c]c*' 'b@t'  < ./inputs/temp-test/1561.inp.667.4 
echo ">>>>>>>>running test 560"
./replace_wrapper '[^c-aA-GA-G]' '`D)'\''CsjN5-8Dcm%JYz!iFF'  < ./inputs/input/ruin.1351 
echo ">>>>>>>>running test 561"
./replace_wrapper '[^c-aA-GA]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY-G]' '`D)'\''CsjN5-8Dcm%JYz!iFF'  < ./inputs/input/ruin.1351 
echo ">>>>>>>>running test 562"
./replace_wrapper '[^c-aA-GA]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY-G]-*?* *[a' '`D)'\''CsjN5-8Dcm%JYz!iFF'  < ./inputs/input/ruin.1351 
echo ">>>>>>>>running test 563"
./replace_wrapper '[^c-aA-G]' '\.'  < ./inputs/input/ruin.1420 
echo ">>>>>>>>running test 564"
./replace_wrapper '[^c-a]$' '( $Pn*#>~&BsFeg_'  < ./inputs/input/ruin.368 
echo ">>>>>>>>running test 565"
./replace_wrapper '[^c-a]' '!'  < ./inputs/input/ruin.469 
echo ">>>>>>>>running test 566"
./replace_wrapper '[^c-a]' ''\''n52Glpp'  < ./inputs/input/ruin.1535 
echo ">>>>>>>>running test 567"
./replace_wrapper '[^c-a]' '*K2l6A0)5";'  < ./inputs/input/ruin.731 
echo ">>>>>>>>running test 568"
./replace_wrapper '[^c-a]' 'Cd'\''V/"FE%-roxA3znMH"Vj/iEO{Tr]'  < ./inputs/input/ruin.690 
echo ">>>>>>>>running test 569"
./replace_wrapper '[^c-a]' 'L=&XW&%JwE}YEQ"vBljIYg}l'  < ./inputs/input/ruin.494 
echo ">>>>>>>>running test 570"
./replace_wrapper '[^c-a]' 'Vy^EeJ{O/i]=ys,]tXg]?;,,<g;AU*QZSavRY*4'  < ./inputs/input/ruin.25 
echo ">>>>>>>>running test 571"
./replace_wrapper '[^c-a]' 'X'  < ./inputs/input/ruin.1887 
echo ">>>>>>>>running test 572"
./replace_wrapper '[^c-a]' ']dcgBzE@$fo!1~q~Mu'  < ./inputs/input/ruin.79 
echo ">>>>>>>>running test 573"
./replace_wrapper '[^c-a]' 'ai*J&OD~k5g{d%7nKT}yCFPq=tEUJEYc@Hon$lyR+t2\Cv=k&Z4'  < ./inputs/input/ruin.1818 
echo ">>>>>>>>running test 574"
./replace_wrapper '[^c-a]' 'x'  < ./inputs/input/ruin.884 
echo ">>>>>>>>running test 575"
./replace_wrapper '[^c-a]'\''' '1H}ZQ7/sx)W='  < ./inputs/input/ruin.173 
echo ">>>>>>>>running test 576"
./replace_wrapper '[^c-a]@n' 'L=&XW&%JwE}YEQ"vBljIYg}l'  < ./inputs/input/ruin.494 
echo ">>>>>>>>running test 577"
./replace_wrapper '[^c-ad]\8w[^c-ad]' '&4H~Nda9*ew0ux1#*F"*X3"/;[UiC=(Z@O-w6XEYiKkbBX-ZL%DtJ1dxHklBV\SP:C'  < ./inputs/input/ruin.1557 
echo ">>>>>>>>running test 578"
./replace_wrapper '[^ec-a]' 'T}UP?R=Z[T|IG=mM'  < ./inputs/input/ruin.166 
echo ">>>>>>>>running test 579"
./replace_wrapper '[^i]' 'aG:]y;Zm{7<\33O~hG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_J_Jp4?/`+iR&LbrJ},3'  < ./inputs/input/ruin.1040 
echo ">>>>>>>>running test 580"
./replace_wrapper '[^i]' 'aG:]y;Zm{7<\33O~h_Jp4?/`+iR&LbrJ},3'  < ./inputs/input/ruin.1040 
echo ">>>>>>>>running test 581"
./replace_wrapper '[^j]' '^'  < ./inputs/input/ruin.268 
echo ">>>>>>>>running test 582"
./replace_wrapper '[^p&y=3[ZYp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIIgTBkz-}Z-a]^_`a-z-}z-}]' 'v5xI27<*qtgs#`vmdnC IH['  < ./inputs/input/ruin.1333 
echo ">>>>>>>>running test 583"
./replace_wrapper '[^t]' '3A'  < ./inputs/input/ruin.1679 
echo ">>>>>>>>running test 584"
./replace_wrapper '[^t]\jGt|Bd' '&IOTC3<-BYFp<SrAfdt]'  < ./inputs/input/ruin.1317 
echo ">>>>>>>>running test 585"
./replace_wrapper '[^y]' 'Tc2k|h=&-k2k|h=&-kA{I^m)l>oO{GA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{Ge'  < ./inputs/input/ruin.1030 
echo ">>>>>>>>running test 586"
./replace_wrapper '[^y]' 'Tce'  < ./inputs/input/ruin.1030 
echo ">>>>>>>>running test 587"
./replace_wrapper '[^z-}0-9Z-a]^_`a]' 'U'  < ./inputs/input/ruin.1611 
echo ">>>>>>>>running test 588"
./replace_wrapper '[^z-}0-9]' '-Z&:|zzG_EZcTV.:M*0"c^'  < ./inputs/input/ruin.1843 
echo ">>>>>>>>running test 589"
./replace_wrapper '[^z-}>-A0-9A-G>-A0-9]' '7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpX'  < ./inputs/input/ruin.1054 
echo ">>>>>>>>running test 590"
./replace_wrapper '[^z-}>-A0-9A-G>-A0-9]' 'X'  < ./inputs/input/ruin.1054 
echo ">>>>>>>>running test 591"
./replace_wrapper '[^z-}>-A]' 'H'  < ./inputs/input/ruin.1933 
echo ">>>>>>>>running test 592"
./replace_wrapper '[^z-}A-Gc-ad?]' '&r)ZKX29[^e-9$'  < ./inputs/input/ruin.745 
echo ">>>>>>>>running test 593"
./replace_wrapper '[^z-}Z-a]^_`a-z-}z-}]' 'v5xI27<*qtgs#`vmdnC IH['  < ./inputs/input/ruin.1333 
echo ">>>>>>>>running test 594"
./replace_wrapper '[^z-}Z-a]^_`a-z-}z-}]' 'v5xz-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]z-}Z-a]^_`a-z-}z-}]I27<*qtgs#`vmdnC IH[0-9]*[3-4]'  < ./inputs/input/ruin.1333 
echo ">>>>>>>>running test 595"
./replace_wrapper '[^z-}Z-a]^_`a]' '&'  < ./inputs/input/ruin.96 
echo ">>>>>>>>running test 596"
./replace_wrapper '[^z-}]' '!tYvZIshp/O-, z$MMuM0D0Wl[w'  < ./inputs/input/ruin.1369 
echo ">>>>>>>>running test 597"
./replace_wrapper '[^z-}]' '#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO(B='  < ./inputs/input/ruin.1197 
echo ">>>>>>>>running test 598"
./replace_wrapper '[^z-}]' '(]E[? g0RJ5hr+k^RH|*q0V^1p#/qQFY%l3_{n[6PFv_frgx[p&G<^#K2Hfw6'  < ./inputs/input/ruin.178 
echo ">>>>>>>>running test 599"
./replace_wrapper '[^z-}]' '*C0e+YNj4(j?V|i|z,[YlSNT[z-DW(7.ByKgI2|4h16!)>y Jn)V(0wVfe'  < ./inputs/input/ruin.746 
echo ">>>>>>>>running test 600"
./replace_wrapper '[^z-}]' '1gF=n$u]g/C}w8N6'  < ./inputs/input/ruin.1207 
echo ">>>>>>>>running test 601"
./replace_wrapper '[^z-}]' '9[u+JB/|waE*e&|<.eSjw]z2%O#}`XSA%F3R['  < ./inputs/input/ruin.132 
echo ">>>>>>>>running test 602"
./replace_wrapper '[^z-}]' '>WbZbdg'\''c'  < ./inputs/input/ruin.653 
echo ">>>>>>>>running test 603"
./replace_wrapper '[^z-}]' '@NH|fHRf5]'\''w5; %%Q'\''Ft=st0eg6j\)j}H'  < ./inputs/input/ruin.1975 
echo ">>>>>>>>running test 604"
./replace_wrapper '[^z-}]' 'B\qm8SPL=zX>(KLz.kURG ?bDPFy8~p+5;Q'  < ./inputs/input/ruin.1381 
echo ">>>>>>>>running test 605"
./replace_wrapper '[^z-}]' 'G'  < ./inputs/input/ruin.796 
echo ">>>>>>>>running test 606"
./replace_wrapper '[^z-}]' 'R'  < ./inputs/input/ruin.1664 
echo ">>>>>>>>running test 607"
./replace_wrapper '[^z-}]' '_&z-.p"MapF'  < ./inputs/input/ruin.843 
echo ">>>>>>>>running test 608"
./replace_wrapper '[^z-}]*?' ' '  < ./inputs/input/ruin.1192 
echo ">>>>>>>>running test 609"
./replace_wrapper '[^z-}][^z-}]' ' fO?sCGL)h$78e5TolWx>y1s v]'  < ./inputs/input/ruin.1705 
echo ">>>>>>>>running test 610"
./replace_wrapper '[^z-}c-a]' 'h'  < ./inputs/input/ruin.1221 
echo ">>>>>>>>running test 611"
./replace_wrapper '[^z-}c-a]@n' 'h&[0-9]'  < ./inputs/input/ruin.1221 
echo ">>>>>>>>running test 612"
./replace_wrapper '[^z-}z-}*c-a]' 'L'  < ./inputs/input/ruin.1838 
echo ">>>>>>>>running test 613"
./replace_wrapper '[^{]' 'V>m9RW"i6a==?f&}(9'  < ./inputs/input/ruin.1798 
echo ">>>>>>>>running test 614"
./replace_wrapper '[^|]' '>'  < ./inputs/input/ruin.1301 
echo ">>>>>>>>running test 615"
./replace_wrapper '[_-z]' 'NEW'  < ./inputs/temp-test/1645.inp.701.1 
echo ">>>>>>>>running test 616"
./replace_wrapper '[_-z]' 'NEW'  < ./inputs/temp-test/1646.inp.701.3 
echo ">>>>>>>>running test 617"
./replace_wrapper '[_-z]-' '@n'  < ./inputs/temp-test/809.inp.348.1 
echo ">>>>>>>>running test 618"
./replace_wrapper '[_-z]-' '@n'  < ./inputs/temp-test/810.inp.348.2 
echo ">>>>>>>>running test 619"
./replace_wrapper '[_-z]-[0-9]^-] ^a-c]-??@*' 'b@t'  < ./inputs/temp-test/1420.inp.610.1 
echo ">>>>>>>>running test 620"
./replace_wrapper '[_-z]-^ [^0-9][^a-][a-c]-[^9-B]-?[^9-B]?@**[a-c@t*?' 'a@nb@tc'  < ./inputs/temp-test/1757.inp.747.1 
echo ">>>>>>>>running test 621"
./replace_wrapper '[_-z]-^ [^0-9][^a-][a-c]-[^9-B]-?[^9-B]?@**[a-c@t*?' 'a@nb@tc'  < ./inputs/temp-test/1758.inp.747.3 
echo ">>>>>>>>running test 622"
./replace_wrapper '[_-z]?' ''  < ./inputs/temp-test/169.inp.76.1 
echo ">>>>>>>>running test 623"
./replace_wrapper '[_-z]?' ''  < ./inputs/temp-test/170.inp.76.2 
echo ">>>>>>>>running test 624"
./replace_wrapper '[_-z]?' 'a@n'  < ./inputs/temp-test/308.inp.138.1 
echo ">>>>>>>>running test 625"
./replace_wrapper '[_-z]?' 'a@n'  < ./inputs/temp-test/309.inp.138.2 
echo ">>>>>>>>running test 626"
./replace_wrapper '[_-z]?' 'a@nb@tc'  < ./inputs/temp-test/1027.inp.442.1 
echo ">>>>>>>>running test 627"
./replace_wrapper '[_-z]?' 'a@nb@tc'  < ./inputs/temp-test/1028.inp.442.3 
echo ">>>>>>>>running test 628"
./replace_wrapper '[_-z]?' 'b@t'  < ./inputs/temp-test/2182.inp.923.1 
echo ">>>>>>>>running test 629"
./replace_wrapper '[_-z]@*A' '&'  < ./inputs/temp-test/1480.inp.635.1 
echo ">>>>>>>>running test 630"
./replace_wrapper '[_-z][^0-9]' '@%@&'  < ./inputs/temp-test/1380.inp.592.1 
echo ">>>>>>>>running test 631"
./replace_wrapper '[_-z][^0-9]' '@%@&'  < ./inputs/temp-test/1381.inp.592.2 
echo ">>>>>>>>running test 632"
./replace_wrapper '[_-z][^0-9]' '@%@&'  < ./inputs/temp-test/1382.inp.592.3 
echo ">>>>>>>>running test 633"
./replace_wrapper '[_-z][^a-c' '@%&a'  < ./inputs/temp-test/344.inp.151.1 
echo ">>>>>>>>running test 634"
./replace_wrapper '[_-z][^a-c' '@%&a'  < ./inputs/temp-test/345.inp.151.2 
echo ">>>>>>>>running test 635"
./replace_wrapper '[_-z][^a-c' '@%&a@'  < ./inputs/temp-test/345.inp.151.2 
echo ">>>>>>>>running test 636"
./replace_wrapper '[_-z][^a-c@' '@%&a@'  < ./inputs/temp-test/344.inp.151.1 
echo ">>>>>>>>running test 637"
./replace_wrapper '[_-z]^' '&a@%'  < ./inputs/temp-test/100.inp.45.1 
echo ">>>>>>>>running test 638"
./replace_wrapper '[_-z]^' '&a@%'  < ./inputs/temp-test/101.inp.45.3 
echo ">>>>>>>>running test 639"
./replace_wrapper '[a--' 'b@t'  < ./inputs/temp-test/2093.inp.887.1 
echo ">>>>>>>>running test 640"
./replace_wrapper '[a--' 'b@t'  < ./inputs/temp-test/2094.inp.887.3 
echo ">>>>>>>>running test 641"
./replace_wrapper '[a---*-' 'a@n'  < ./inputs/temp-test/1877.inp.796.1 
echo ">>>>>>>>running test 642"
./replace_wrapper '[a---*-' 'a@n'  < ./inputs/temp-test/1878.inp.796.3 
echo ">>>>>>>>running test 643"
./replace_wrapper '[a---*-' 'a@n'  < ./inputs/temp-test/1879.inp.796.4 
echo ">>>>>>>>running test 644"
./replace_wrapper '[a---?-a-][^0-9]^' '@%@&'  < ./inputs/temp-test/1922.inp.817.1 
echo ">>>>>>>>running test 645"
./replace_wrapper '[a---?-a-][^0-9]^' '@%@&'  < ./inputs/temp-test/1923.inp.817.3 
echo ">>>>>>>>running test 646"
./replace_wrapper '[a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9]' '@%&a'  < ./inputs/temp-test/496.inp.217.1 
echo ">>>>>>>>running test 647"
./replace_wrapper '[a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9]' '@%&a'  < ./inputs/temp-test/497.inp.217.3 
echo ">>>>>>>>running test 648"
./replace_wrapper '[a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9][a--] *^a-c]?-[0-9]?--a-]@t*?@[[^0-9]' '@%&a'  < ./inputs/temp-test/496.inp.217.1 
echo ">>>>>>>>running test 649"
./replace_wrapper '[a--]?-?@[[^a-c]' '&a@%'  < ./inputs/temp-test/109.inp.50.1 
echo ">>>>>>>>running test 650"
./replace_wrapper '[a--]?-?@[[^a-c]' '&a@%'  < ./inputs/temp-test/110.inp.50.2 
echo ">>>>>>>>running test 651"
./replace_wrapper '[a--]?-?@[[^a-c]' '&a@%'  < ./inputs/temp-test/111.inp.50.3 
echo ">>>>>>>>running test 652"
./replace_wrapper '[a--]?[a--]-@n*-[^@@][a--]-' ''  < ./inputs/temp-test/108.inp.49.1 
echo ">>>>>>>>running test 653"
./replace_wrapper '[a--]@@*^-]?-[9-B][^@@]-' 'a@nb@tc'  < ./inputs/temp-test/718.inp.310.1 
echo ">>>>>>>>running test 654"
./replace_wrapper '[a--]@@*^-]?-[9-B][^@@]-' 'a@nb@tc'  < ./inputs/temp-test/719.inp.310.2 
echo ">>>>>>>>running test 655"
./replace_wrapper '[a--][^a-c]' '@n'  < ./inputs/temp-test/914.inp.394.1 
echo ">>>>>>>>running test 656"
./replace_wrapper '[a--][^a-c]' '@n'  < ./inputs/temp-test/915.inp.394.4 
echo ">>>>>>>>running test 657"
./replace_wrapper '[a--b] *' 'b@t'  < ./inputs/temp-test/301.inp.135.2 
echo ">>>>>>>>running test 658"
./replace_wrapper '[a--b]$' '&a@%'  < ./inputs/temp-test/1422.inp.611.9 
echo ">>>>>>>>running test 659"
./replace_wrapper '[a--b]' '&a@%'  < ./inputs/temp-test/1421.inp.611.2 
echo ">>>>>>>>running test 660"
./replace_wrapper '[a--b]?$' 'b@t'  < ./inputs/temp-test/2111.inp.894.8 
echo ">>>>>>>>running test 661"
./replace_wrapper '[a--b]?' 'b@t'  < ./inputs/temp-test/2109.inp.894.1 
echo ">>>>>>>>running test 662"
./replace_wrapper '[a--b]?' 'b@t'  < ./inputs/temp-test/2110.inp.894.2 
echo ">>>>>>>>running test 663"
./replace_wrapper '[a--b]?[9-B]' '@%&a'  < ./inputs/temp-test/1237.inp.531.1 
echo ">>>>>>>>running test 664"
./replace_wrapper '[a--b]?[9-B]' '@%&a'  < ./inputs/temp-test/1238.inp.531.2 
echo ">>>>>>>>running test 665"
./replace_wrapper '[a--b]@*[^a-c] *-[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/1962.inp.833.1 
echo ">>>>>>>>running test 666"
./replace_wrapper '[a--b]@*[^a-c] *-[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/1963.inp.833.4 
echo ">>>>>>>>running test 667"
./replace_wrapper '[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]' ''  < ./inputs/temp-test/833.inp.359.1 
echo ">>>>>>>>running test 668"
./replace_wrapper '[a--b][-z][^9-B]@t*[^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]' ''  < ./inputs/temp-test/833.inp.359.1 
echo ">>>>>>>>running test 669"
./replace_wrapper '[a--b]c$' 'NEW'  < ./inputs/temp-test/711.inp.307.9 
echo ">>>>>>>>running test 670"
./replace_wrapper '[a--b]c' 'NEW'  < ./inputs/temp-test/708.inp.307.1 
echo ">>>>>>>>running test 671"
./replace_wrapper '[a--b]c' 'NEW'  < ./inputs/temp-test/709.inp.307.2 
echo ">>>>>>>>running test 672"
./replace_wrapper '[a--b]c' 'NEW'  < ./inputs/temp-test/710.inp.307.3 
echo ">>>>>>>>running test 673"
./replace_wrapper '[a-?' 'NEW'  < ./inputs/temp-test/734.inp.316.1 
echo ">>>>>>>>running test 674"
./replace_wrapper '[a-?' 'NEW'  < ./inputs/temp-test/735.inp.316.2 
echo ">>>>>>>>running test 675"
./replace_wrapper '[a-?' 'NEW'  < ./inputs/temp-test/736.inp.316.3 
echo ">>>>>>>>running test 676"
./replace_wrapper '[a-@[*' 'NEW'  < ./inputs/temp-test/860.inp.370.1 
echo ">>>>>>>>running test 677"
./replace_wrapper '[a-@[*' 'NEW'  < ./inputs/temp-test/861.inp.370.2 
echo ">>>>>>>>running test 678"
./replace_wrapper '[a-[^0-9] *-]' 'a@nb@tc'  < ./inputs/temp-test/1777.inp.757.1 
echo ">>>>>>>>running test 679"
./replace_wrapper '[a-[^0-9]' ''  < ./inputs/temp-test/839.inp.361.1 
echo ">>>>>>>>running test 680"
./replace_wrapper '[a-[^0-9]' ''  < ./inputs/temp-test/840.inp.361.2 
echo ">>>>>>>>running test 681"
./replace_wrapper '[a-[^0-9]' ''  < ./inputs/temp-test/841.inp.361.3 
echo ">>>>>>>>running test 682"
./replace_wrapper '[a-[^0-9]' ''  < ./inputs/temp-test/842.inp.361.4 
echo ">>>>>>>>running test 683"
./replace_wrapper '[a-[^0-9]' '@t'  < ./inputs/temp-test/1111.inp.478.1 
echo ">>>>>>>>running test 684"
./replace_wrapper '[a-[^0-9]' '@t'  < ./inputs/temp-test/1112.inp.478.2 
echo ">>>>>>>>running test 685"
./replace_wrapper '[a-[^0-9]' '@t'  < ./inputs/temp-test/1113.inp.478.4 
echo ">>>>>>>>running test 686"
./replace_wrapper '[a-[^0-9]A*[^9-B][^a-c[^a-c@[-?[^-[0-9]?[^a-c]' 'a@nb@tc'  < ./inputs/temp-test/97.inp.44.1 
echo ">>>>>>>>running test 687"
./replace_wrapper '[a-[^0-9]A*[^9-B][^a-c[^a-c@[-?[^-[0-9]?[^a-c]' 'a@nb@tc'  < ./inputs/temp-test/98.inp.44.2 
echo ">>>>>>>>running test 688"
./replace_wrapper '[a-[^0-9]A*[^9-B][^a-c[^a-c@[-?[^-[0-9]?[^a-c]' 'a@nb@tc'  < ./inputs/temp-test/99.inp.44.3 
echo ">>>>>>>>running test 689"
./replace_wrapper '[a-]' '&@n!4'  < ./inputs/temp-test/641.inp.277.1 
echo ">>>>>>>>running test 690"
./replace_wrapper '[a-]' '&@n'  < ./inputs/temp-test/641.inp.277.1 
echo ">>>>>>>>running test 691"
./replace_wrapper '[a-]' '&@n'  < ./inputs/temp-test/642.inp.277.3 
echo ">>>>>>>>running test 692"
./replace_wrapper '[a-]' '@%@&'  < ./inputs/temp-test/1259.inp.541.1 
echo ">>>>>>>>running test 693"
./replace_wrapper '[a-]' '@%@&'  < ./inputs/temp-test/1260.inp.541.2 
echo ">>>>>>>>running test 694"
./replace_wrapper '[a-]' '@%@&'  < ./inputs/temp-test/1261.inp.541.3 
echo ">>>>>>>>running test 695"
./replace_wrapper '[a-]' 'a@nb@tc'  < ./inputs/temp-test/1543.inp.661.1 
echo ">>>>>>>>running test 696"
./replace_wrapper '[a-]' 'a@nb@tc'  < ./inputs/temp-test/1544.inp.661.2 
echo ">>>>>>>>running test 697"
./replace_wrapper '[a-]' 'a@nb@tc'  < ./inputs/temp-test/1545.inp.661.3 
echo ">>>>>>>>running test 698"
./replace_wrapper '[a-]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 699"
./replace_wrapper '[a-]- -^a-c]?[^-?' 'NEW'  < ./inputs/temp-test/1449.inp.621.1 
echo ">>>>>>>>running test 700"
./replace_wrapper '[a-]-' '@n'  < ./inputs/temp-test/641.inp.277.1 
echo ">>>>>>>>running test 701"
./replace_wrapper '[a-]-' '@n'  < ./inputs/temp-test/642.inp.277.3 
echo ">>>>>>>>running test 702"
./replace_wrapper '[a-]-' 'NEW'  < ./inputs/temp-test/1250.inp.536.1 
echo ">>>>>>>>running test 703"
./replace_wrapper '[a-]-' 'NEW'  < ./inputs/temp-test/1251.inp.536.2 
echo ">>>>>>>>running test 704"
./replace_wrapper '[a-]-*[a-c][^a--]-' '@t'  < ./inputs/temp-test/1090.inp.470.1 
echo ">>>>>>>>running test 705"
./replace_wrapper '[a-][^9-B]?[0-9][^a-c]-?@[-?[^0-9]' '@%&a'  < ./inputs/temp-test/2317.inp.983.1 
echo ">>>>>>>>running test 706"
./replace_wrapper '[a-][^a-c]-?' '&'  < ./inputs/temp-test/745.inp.319.1 
echo ">>>>>>>>running test 707"
./replace_wrapper '[a-][^a-c]-?' '&'  < ./inputs/temp-test/746.inp.319.2 
echo ">>>>>>>>running test 708"
./replace_wrapper '[a-]^-[a-c]' 'a@n'  < ./inputs/temp-test/1556.inp.666.1 
echo ">>>>>>>>running test 709"
./replace_wrapper '[a-]^-[a-c]' 'a@n'  < ./inputs/temp-test/1557.inp.666.3 
echo ">>>>>>>>running test 710"
./replace_wrapper '[a-]c' 'NEW'  < ./inputs/temp-test/2137.inp.905.1 
echo ">>>>>>>>running test 711"
./replace_wrapper '[a-]c' 'NEW'  < ./inputs/temp-test/2138.inp.905.3 
echo ">>>>>>>>running test 712"
./replace_wrapper '[a-c%[9-B]c*^-[0-9]-^*?@[-[^a-c]?' 'b@t'  < ./inputs/temp-test/2344.inp.996.1 
echo ">>>>>>>>running test 713"
./replace_wrapper '[a-c' '&a@%'  < ./inputs/temp-test/1914.inp.813.1 
echo ">>>>>>>>running test 714"
./replace_wrapper '[a-c' '&a@%'  < ./inputs/temp-test/1915.inp.813.3 
echo ">>>>>>>>running test 715"
./replace_wrapper '[a-c' '@%@&'  < ./inputs/temp-test/1969.inp.837.2 
echo ">>>>>>>>running test 716"
./replace_wrapper '[a-c' '@%@&'  < ./inputs/temp-test/1970.inp.837.3 
echo ">>>>>>>>running test 717"
./replace_wrapper '[a-c' '@%@&'  < ./inputs/temp-test/1971.inp.837.4 
echo ">>>>>>>>running test 718"
./replace_wrapper '[a-c-@@[0-9][^a-]?a-c]--c*' '@%@&'  < ./inputs/temp-test/1975.inp.839.1 
echo ">>>>>>>>running test 719"
./replace_wrapper '[a-c?$'   < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 720"
./replace_wrapper '[a-c?$' 'a&'  < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 721"
./replace_wrapper '[a-c?'   < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 722"
./replace_wrapper '[a-c?'   < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 723"
./replace_wrapper '[a-c?' 'a&'  < ./inputs/temp-test/516.inp.225.1 
echo ">>>>>>>>running test 724"
./replace_wrapper '[a-c?' 'a&'  < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 725"
./replace_wrapper '[a-c?' 'a&'  < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 726"
./replace_wrapper '[a-c?' 'a&'  < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 727"
./replace_wrapper '[a-c?*$' 'a&'  < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 728"
./replace_wrapper '[a-c?*' 'a&'  < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 729"
./replace_wrapper '[a-c?*' 'a&'  < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 730"
./replace_wrapper '[a-c?*' 'a&'  < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 731"
./replace_wrapper '[a-c?-?-[9-B]' '@%&a'  < ./inputs/temp-test/1989.inp.845.1 
echo ">>>>>>>>running test 732"
./replace_wrapper '[a-c?-?-[9-B]' '@%&a'  < ./inputs/temp-test/1990.inp.845.3 
echo ">>>>>>>>running test 733"
./replace_wrapper '[a-c[9-B]c*^-[0-9]-^*?@[-%[^a-c]?' 'b@t'  < ./inputs/temp-test/2346.inp.996.3 
echo ">>>>>>>>running test 734"
./replace_wrapper '[a-c[9-B]c*^-[0-9]-^*?@[-[^a-c]?' 'b@t'  < ./inputs/temp-test/2344.inp.996.1 
echo ">>>>>>>>running test 735"
./replace_wrapper '[a-c[9-B]c*^-[0-9]-^*?@[-[^a-c]?' 'b@t'  < ./inputs/temp-test/2345.inp.996.2 
echo ">>>>>>>>running test 736"
./replace_wrapper '[a-c[9-B]c*^-[0-9]-^*?@[-[^a-c]?' 'b@t'  < ./inputs/temp-test/2346.inp.996.3 
echo ">>>>>>>>running test 737"
./replace_wrapper '[a-c[^-' 'a&'  < ./inputs/temp-test/1135.inp.488.1 
echo ">>>>>>>>running test 738"
./replace_wrapper '[a-c[^9-B]' '@%@&'  < ./inputs/temp-test/1429.inp.614.1 
echo ">>>>>>>>running test 739"
./replace_wrapper '[a-c[^9-B]' '@%@&'  < ./inputs/temp-test/1430.inp.614.2 
echo ">>>>>>>>running test 740"
./replace_wrapper '[a-c] *' 'a@nb@tc'  < ./inputs/temp-test/2106.inp.893.1 
echo ">>>>>>>>running test 741"
./replace_wrapper '[a-c] *' 'a@nb@tc'  < ./inputs/temp-test/2107.inp.893.2 
echo ">>>>>>>>running test 742"
./replace_wrapper '[a-c] *' 'a@nb@tc'  < ./inputs/temp-test/2108.inp.893.3 
echo ">>>>>>>>running test 743"
./replace_wrapper '[a-c]%[^9-B]' 'NEW'  < ./inputs/temp-test/2332.inp.989.1 
echo ">>>>>>>>running test 744"
./replace_wrapper '[a-c]%[^9-B]' 'NEW'  < ./inputs/temp-test/2333.inp.989.2 
echo ">>>>>>>>running test 745"
./replace_wrapper '[a-c]' '&'  < ./inputs/temp-test/944.inp.406.1 
echo ">>>>>>>>running test 746"
./replace_wrapper '[a-c]' '&'  < ./inputs/temp-test/945.inp.406.2 
echo ">>>>>>>>running test 747"
./replace_wrapper '[a-c]' '@%@&'  < ./inputs/temp-test/1207.inp.518.1 
echo ">>>>>>>>running test 748"
./replace_wrapper '[a-c]' '@%@&'  < ./inputs/temp-test/1208.inp.518.4 
echo ">>>>>>>>running test 749"
./replace_wrapper '[a-c]' 'NEW'  < ./inputs/temp-test/1772.inp.755.1 
echo ">>>>>>>>running test 750"
./replace_wrapper '[a-c]' 'NEW'  < ./inputs/temp-test/1773.inp.755.2 
echo ">>>>>>>>running test 751"
./replace_wrapper '[a-c]' 'a@n'  < ./inputs/temp-test/819.inp.353.1 
echo ">>>>>>>>running test 752"
./replace_wrapper '[a-c]' 'a@n'  < ./inputs/temp-test/820.inp.353.2 
echo ">>>>>>>>running test 753"
./replace_wrapper '[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1340.inp.576.1 
echo ">>>>>>>>running test 754"
./replace_wrapper '[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1341.inp.576.2 
echo ">>>>>>>>running test 755"
./replace_wrapper '[a-c]*' '@%&a'  < ./inputs/temp-test/83.inp.37.1 
echo ">>>>>>>>running test 756"
./replace_wrapper '[a-c]*-' 'NEW'  < ./inputs/temp-test/44.inp.19.1 
echo ">>>>>>>>running test 757"
./replace_wrapper '[a-c]*-' 'NEW'  < ./inputs/temp-test/45.inp.19.3 
echo ">>>>>>>>running test 758"
./replace_wrapper '[a-c]*??[a-c]' '@%@&'  < ./inputs/temp-test/369.inp.161.1 
echo ">>>>>>>>running test 759"
./replace_wrapper '[a-c]*??[a-c]' '@%@&'  < ./inputs/temp-test/370.inp.161.2 
echo ">>>>>>>>running test 760"
./replace_wrapper '[a-c]*??[a-c]' '@%@&'  < ./inputs/temp-test/371.inp.161.3 
echo ">>>>>>>>running test 761"
./replace_wrapper '[a-c]-' '@%&a'  < ./inputs/temp-test/1846.inp.784.1 
echo ">>>>>>>>running test 762"
./replace_wrapper '[a-c]-' '@%&a'  < ./inputs/temp-test/1847.inp.784.2 
echo ">>>>>>>>running test 763"
./replace_wrapper '[a-c]-' '@%&a'  < ./inputs/temp-test/1848.inp.784.3 
echo ">>>>>>>>running test 764"
./replace_wrapper '[a-c]-' '@%@&'  < ./inputs/temp-test/117.inp.54.1 
echo ">>>>>>>>running test 765"
./replace_wrapper '[a-c]-' 'a@nb@tc'  < ./inputs/temp-test/1630.inp.694.1 
echo ">>>>>>>>running test 766"
./replace_wrapper '[a-c]-' 'a@nb@tc'  < ./inputs/temp-test/1631.inp.694.3 
echo ">>>>>>>>running test 767"
./replace_wrapper '[a-c]?' '&@n'  < ./inputs/temp-test/644.inp.279.1 
echo ">>>>>>>>running test 768"
./replace_wrapper '[a-c]?' '&@naaaa'  < ./inputs/temp-test/644.inp.279.1 
echo ">>>>>>>>running test 769"
./replace_wrapper '[a-c]?' '@t'  < ./inputs/temp-test/1843.inp.783.1 
echo ">>>>>>>>running test 770"
./replace_wrapper '[a-c]?' '@t'  < ./inputs/temp-test/1844.inp.783.2 
echo ">>>>>>>>running test 771"
./replace_wrapper '[a-c]?' '@t'  < ./inputs/temp-test/1845.inp.783.3 
echo ">>>>>>>>running test 772"
./replace_wrapper '[a-c]?' '@t'  < ./inputs/temp-test/644.inp.279.1 
echo ">>>>>>>>running test 773"
./replace_wrapper '[a-c]?' '@t'  < ./inputs/temp-test/645.inp.279.2 
echo ">>>>>>>>running test 774"
./replace_wrapper '[a-c]?' 'NEW'  < ./inputs/temp-test/750.inp.322.1 
echo ">>>>>>>>running test 775"
./replace_wrapper '[a-c]?' 'NEW'  < ./inputs/temp-test/751.inp.322.3 
echo ">>>>>>>>running test 776"
./replace_wrapper '[a-c]??@n[^9-B]??-' '@t'  < ./inputs/temp-test/1278.inp.549.1 
echo ">>>>>>>>running test 777"
./replace_wrapper '[a-c]??@n[^9-B]??-' '@t'  < ./inputs/temp-test/1279.inp.549.2 
echo ">>>>>>>>running test 778"
./replace_wrapper '[a-c]??@n[^9-B]??-' '@t'  < ./inputs/temp-test/1280.inp.549.3 
echo ">>>>>>>>running test 779"
./replace_wrapper '[a-c]?[0-9]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 780"
./replace_wrapper '[a-c]?[0-9]^*' 'NEW'  < ./inputs/temp-test/1822.inp.775.1 
echo ">>>>>>>>running test 781"
./replace_wrapper '[a-c]?[0-9]^*' 'NEW'  < ./inputs/temp-test/1823.inp.775.3 
echo ">>>>>>>>running test 782"
./replace_wrapper '[a-c]?[^9-B][9-B][^a--b][0-9]-@@*' '@%&a'  < ./inputs/temp-test/489.inp.214.1 
echo ">>>>>>>>running test 783"
./replace_wrapper '[a-c]?[^9-B][9-B][^a--b][0-9]-@@*@' '@%&a'  < ./inputs/temp-test/489.inp.214.1 
echo ">>>>>>>>running test 784"
./replace_wrapper '[a-c]?a-]??-@*^a-c][9-B]' 'a@nb@tc'  < ./inputs/temp-test/1471.inp.631.1 
echo ">>>>>>>>running test 785"
./replace_wrapper '[a-c]?a-]??-@*^a-c][9-B]' 'a@nb@tc'  < ./inputs/temp-test/1472.inp.631.3 
echo ">>>>>>>>running test 786"
./replace_wrapper '[a-c]@t' '&'  < ./inputs/temp-test/1389.inp.596.1 
echo ">>>>>>>>running test 787"
./replace_wrapper '[a-c]@t' '&'  < ./inputs/temp-test/1390.inp.596.3 
echo ">>>>>>>>running test 788"
./replace_wrapper '[a-c]@t' ''  < ./inputs/temp-test/1986.inp.844.1 
echo ">>>>>>>>running test 789"
./replace_wrapper '[a-c]@t' ''  < ./inputs/temp-test/1987.inp.844.2 
echo ">>>>>>>>running test 790"
./replace_wrapper '[a-c]@t' ''  < ./inputs/temp-test/1988.inp.844.3 
echo ">>>>>>>>running test 791"
./replace_wrapper '[a-c]A' '&'  < ./inputs/temp-test/922.inp.398.1 
echo ">>>>>>>>running test 792"
./replace_wrapper '[a-c]A' '&'  < ./inputs/temp-test/923.inp.398.2 
echo ">>>>>>>>running test 793"
./replace_wrapper '[a-c]A' '&'  < ./inputs/temp-test/924.inp.398.3 
echo ">>>>>>>>running test 794"
./replace_wrapper '[a-c][--' '&a@%'  < ./inputs/temp-test/1598.inp.680.1 
echo ">>>>>>>>running test 795"
./replace_wrapper '[a-c][--' '&a@%'  < ./inputs/temp-test/1599.inp.680.2 
echo ">>>>>>>>running test 796"
./replace_wrapper '[a-c][^0-9]' '&@n'  < ./inputs/temp-test/694.inp.300.9 
echo ">>>>>>>>running test 797"
./replace_wrapper '[a-c][^0-9]' '&@n[0-9]'  < ./inputs/temp-test/694.inp.300.9 
echo ">>>>>>>>running test 798"
./replace_wrapper '[a-c][^0-9]' '@%@&'  < ./inputs/temp-test/535.inp.232.1 
echo ">>>>>>>>running test 799"
./replace_wrapper '[a-c][^0-9]' '@%@&'  < ./inputs/temp-test/536.inp.232.2 
echo ">>>>>>>>running test 800"
./replace_wrapper '[a-c][^0-9]' '@%@&'  < ./inputs/temp-test/537.inp.232.3 
echo ">>>>>>>>running test 801"
./replace_wrapper '[a-c][^0-9]*[a-c]' '&@n&t'  < ./inputs/temp-test/690.inp.300.1 
echo ">>>>>>>>running test 802"
./replace_wrapper '[a-c][^0-9]*[a-c]' '&@n'  < ./inputs/temp-test/690.inp.300.1 
echo ">>>>>>>>running test 803"
./replace_wrapper '[a-c][^0-9]*[a-c]' '&@n'  < ./inputs/temp-test/691.inp.300.2 
echo ">>>>>>>>running test 804"
./replace_wrapper '[a-c][^0-9]*[a-c]' '&@n'  < ./inputs/temp-test/692.inp.300.3 
echo ">>>>>>>>running test 805"
./replace_wrapper '[a-c][^0-9]*[a-c]' '&@na@t@t'  < ./inputs/temp-test/691.inp.300.2 
echo ">>>>>>>>running test 806"
./replace_wrapper '[a-c][^0-9]-*-[a-c]-$' '@n'  < ./inputs/temp-test/694.inp.300.9 
echo ">>>>>>>>running test 807"
./replace_wrapper '[a-c][^0-9]-*-[a-c]-' '@n'  < ./inputs/temp-test/690.inp.300.1 
echo ">>>>>>>>running test 808"
./replace_wrapper '[a-c][^0-9]-*-[a-c]-' '@n'  < ./inputs/temp-test/691.inp.300.2 
echo ">>>>>>>>running test 809"
./replace_wrapper '[a-c][^0-9]-*-[a-c]-' '@n'  < ./inputs/temp-test/692.inp.300.3 
echo ">>>>>>>>running test 810"
./replace_wrapper '[a-c][^9-B]' 'NEW'  < ./inputs/temp-test/2332.inp.989.1 
echo ">>>>>>>>running test 811"
./replace_wrapper '[a-c][^9-B]' 'NEW'  < ./inputs/temp-test/2333.inp.989.2 
echo ">>>>>>>>running test 812"
./replace_wrapper '[a-c][^@n]-[^a-c' '@%@&'  < ./inputs/temp-test/64.inp.28.1 
echo ">>>>>>>>running test 813"
./replace_wrapper '[a-c][^@n]-[^a-c' '@%@&'  < ./inputs/temp-test/65.inp.28.2 
echo ">>>>>>>>running test 814"
./replace_wrapper '[a-c][^a-c]' 'a&'  < ./inputs/temp-test/1685.inp.718.1 
echo ">>>>>>>>running test 815"
./replace_wrapper '[a-c][^a-c]' 'a&'  < ./inputs/temp-test/1686.inp.718.3 
echo ">>>>>>>>running test 816"
./replace_wrapper '[a-c]^-]' 'NEW'  < ./inputs/temp-test/1956.inp.830.1 
echo ">>>>>>>>running test 817"
./replace_wrapper '[a-c]^-]' 'NEW'  < ./inputs/temp-test/1957.inp.830.2 
echo ">>>>>>>>running test 818"
./replace_wrapper '[a-c]^-]' 'NEW'  < ./inputs/temp-test/1958.inp.830.3 
echo ">>>>>>>>running test 819"
./replace_wrapper '[a-cc*' 'a@n'  < ./inputs/temp-test/925.inp.399.1 
echo ">>>>>>>>running test 820"
./replace_wrapper '[a-cc*' 'a@n'  < ./inputs/temp-test/926.inp.399.2 
echo ">>>>>>>>running test 821"
./replace_wrapper '[a-cc*' 'a@n'  < ./inputs/temp-test/927.inp.399.3 
echo ">>>>>>>>running test 822"
./replace_wrapper '[a-d]' '&@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 823"
./replace_wrapper '[a-z0-9]@n' '?&<N#N4zMu+/?$@,"oa`nt=1CL!g3y*(k((w!.4aPc>wSP2w2'  < ./inputs/input/ruin.487 
echo ">>>>>>>>running test 824"
./replace_wrapper '[a-z]$' 6666666  < ./inputs/moni/f6.inp 
echo ">>>>>>>>running test 825"
./replace_wrapper '[a-z]*' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 826"
./replace_wrapper '[a-z]@n' ';S&=:zD+0/]VKClfA;8d-(~bTN"m'  < ./inputs/input/ruin.1086 
echo ">>>>>>>>running test 827"
./replace_wrapper '[a-z]@n' 'P&p'  < ./inputs/input/ruin.276 
echo ">>>>>>>>running test 828"
./replace_wrapper '[a-z]@n' 'y&8sdW9T'  < ./inputs/input/ruin.1065 
echo ">>>>>>>>running test 829"
./replace_wrapper '[c-a>-AZ-a]^_`a->-A>-A-c-ac-a-A-GABCDEFG-z-}z-}]' '/pWrCGn $(=Vs1rb~eI-_'  < ./inputs/input/ruin.243 
echo ">>>>>>>>running test 830"
./replace_wrapper '[c-a>-A]' 'Mc\}+8d\*7-pc Iw4hhz;o>M0T q:ct)|%} 5R\x8a|3y@A\-`$e'  < ./inputs/input/ruin.56 
echo ">>>>>>>>running test 831"
./replace_wrapper '[c-aA-GA-G]' '~'  < ./inputs/input/ruin.1769 
echo ">>>>>>>>running test 832"
./replace_wrapper '[c-aA-GZ-a]^_`a]@@?' 'I8-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_DDe(Gk8G'  < ./inputs/input/ruin.1050 
echo ">>>>>>>>running test 833"
./replace_wrapper '[c-aA-GZ-a]^_`a]@@?' 'I8DDe(Gk8G'  < ./inputs/input/ruin.1050 
echo ">>>>>>>>running test 834"
./replace_wrapper '[c-aA-G]' '.8bt`e.7uXtI;mb)w4,*v%}s=:<?cQ6 k=#@zJHd'  < ./inputs/input/ruin.1017 
echo ">>>>>>>>running test 835"
./replace_wrapper '[c-aA-G]@@@@' '.kBod&JKL>8L6M2SZY`We5?e BEyk?<_wc7Y(M9N='  < ./inputs/input/ruin.692 
echo ">>>>>>>>running test 836"
./replace_wrapper '[c-aCZ-a]^_`a->-A>-A]' 'MN6)$<V>G9kmDmReuQ&W%@sP%7!mP'  < ./inputs/input/ruin.1003 
echo ">>>>>>>>running test 837"
./replace_wrapper '[c-aZ-a]^_`a-A-GABCDEFG]' 'X'  < ./inputs/input/ruin.497 
echo ">>>>>>>>running test 838"
./replace_wrapper '[c-aZ-a]^_`a]' 'F'  < ./inputs/input/ruin.468 
echo ">>>>>>>>running test 839"
./replace_wrapper '[c-aZ-a]^_`a]' 'dt|NbM\.:;'\''5E]m\6;l!?&g4ikE^yZ+P{]q++Ke\6|bYujj"[\l'  < ./inputs/input/ruin.1099 
echo ">>>>>>>>running test 840"
./replace_wrapper '[c-a]$' '>'  < ./inputs/input/ruin.1635 
echo ">>>>>>>>running test 841"
./replace_wrapper '[c-a]'   < ./inputs/input/ruin.1163 
echo ">>>>>>>>running test 842"
./replace_wrapper '[c-a]' ''  < ./inputs/input/ruin.529 
echo ">>>>>>>>running test 843"
./replace_wrapper '[c-a]' '('  < ./inputs/input/ruin.1862 
echo ">>>>>>>>running test 844"
./replace_wrapper '[c-a]' '*=Ia,P2&C['  < ./inputs/input/ruin.906 
echo ">>>>>>>>running test 845"
./replace_wrapper '[c-a]' '<-'\''p@+\*cH#a!.5:5`a'  < ./inputs/input/ruin.1163 
echo ">>>>>>>>running test 846"
./replace_wrapper '[c-a]' 'M^Cj&~4#,,`zk.j6n5wIVUMC#A^32{jG//Raz[SCLQ'  < ./inputs/input/ruin.187 
echo ">>>>>>>>running test 847"
./replace_wrapper '[c-a]' 'N'  < ./inputs/input/ruin.1225 
echo ">>>>>>>>running test 848"
./replace_wrapper '[c-a]' 'Rc}U{^ dhC_9!75dFF'  < ./inputs/input/ruin.756 
echo ">>>>>>>>running test 849"
./replace_wrapper '[c-a]' 'WvfXw!)GQ;wfqA==_$'\'';jL^X}LS)ZRG#01|zqwb4Z&E{uTWowB6'  < ./inputs/input/ruin.1918 
echo ">>>>>>>>running test 850"
./replace_wrapper '[c-a]' 'g'  < ./inputs/input/ruin.288 
echo ">>>>>>>>running test 851"
./replace_wrapper '[c-a]' 'j*,aNncxD\LU/Iefe#fadF0tSa[ta$7K+i l$o>;iO>x.mhhXeutrdDfm/ 9gV?%sMY(vOdQKW^*f[5T'  < ./inputs/input/ruin.862 
echo ">>>>>>>>running test 852"
./replace_wrapper '[c-a]' 's'  < ./inputs/input/ruin.1424 
echo ">>>>>>>>running test 853"
./replace_wrapper '[c-a]' 'x'  < ./inputs/input/ruin.1599 
echo ">>>>>>>>running test 854"
./replace_wrapper '[c-a]'\''Th4oD' 'F!d~`tL_DBH) [K-oW'  < ./inputs/input/ruin.681 
echo ">>>>>>>>running test 855"
./replace_wrapper '[c-a]?*' 'x'  < ./inputs/input/ruin.1599 
echo ">>>>>>>>running test 856"
./replace_wrapper '[c-a]@@?$' 'I>'  < ./inputs/input/ruin.29 
echo ">>>>>>>>running test 857"
./replace_wrapper '[c-a]@n' 'g&h'  < ./inputs/input/ruin.288 
echo ">>>>>>>>running test 858"
./replace_wrapper '[c-a][c-a]' '?'  < ./inputs/input/ruin.703 
echo ">>>>>>>>running test 859"
./replace_wrapper '[c-a][c-a]' 'uSD-'  < ./inputs/input/ruin.1990 
echo ">>>>>>>>running test 860"
./replace_wrapper '[c-a]\$?!I' 'C5"Ugs7z;#[m'  < ./inputs/input/ruin.1075 
echo ">>>>>>>>running test 861"
./replace_wrapper '[c-a`]' 'TxfCZ,ncl`!85cZi#F6f>B[=2xb1rZXXah,}F?O2+9xtAeyi[3h9Al$KjK7.Km?K4YU~ '\'''  < ./inputs/input/ruin.434 
echo ">>>>>>>>running test 862"
./replace_wrapper '[c-at]' 'AQ'  < ./inputs/input/ruin.253 
echo ">>>>>>>>running test 863"
./replace_wrapper '[mA-G]' '}n/rz%ZQ%Z3Z+jQI'  < ./inputs/input/ruin.1927 
echo ">>>>>>>>running test 864"
./replace_wrapper '[m]*' '=>q4/4W{xj^&B|w@/f1KHWBb#R/=43XWDWT)K'  < ./inputs/input/ruin.1454 
echo ">>>>>>>>running test 865"
./replace_wrapper '[o]' '&'  < ./inputs/input/ruin.837 
echo ">>>>>>>>running test 866"
./replace_wrapper '[p]' 'qPv3t,hM>u^_Q739Rf[^O=PY^v@Sd<vR<D=(7y5Y'  < ./inputs/input/ruin.1471 
echo ">>>>>>>>running test 867"
./replace_wrapper '[q0-9]@n' '.^&u>`Y~4'\''!d;?[6eMR*)X+D>xU%AUWv8y$.jdQ@jBn='\''(J8f,KIL4L'  < ./inputs/input/ruin.285 
echo ">>>>>>>>running test 868"
./replace_wrapper '[q]' '*'  < ./inputs/input/ruin.395 
echo ">>>>>>>>running test 869"
./replace_wrapper '[s]' 'SWCmkAgq0?ml-.(QE"<D(s5YN'  < ./inputs/input/ruin.501 
echo ">>>>>>>>running test 870"
./replace_wrapper '[z-}0-9]' ')^'  < ./inputs/input/ruin.191 
echo ">>>>>>>>running test 871"
./replace_wrapper '[z-}0-9z-}Z-a]^_`a-c-ac-a-0-90123456789->-A>-A]' 'b\Uny"%(>W]TD'\''B!T#}.".bsJjH[Q\%'  < ./inputs/input/ruin.1731 
echo ">>>>>>>>running test 872"
./replace_wrapper '[z-}]$' 'x<W#6\5oQ+{Kh2/kx#w6k`0;nznycd:QlGcd,'  < ./inputs/input/ruin.1253 
echo ">>>>>>>>running test 873"
./replace_wrapper '[z-}]'   < ./inputs/input/ruin.1164 
echo ">>>>>>>>running test 874"
./replace_wrapper '[z-}]' ' <oZI`e4Og*@]nAfBB=i%[o> ?~/z5>FDJ)"'  < ./inputs/input/ruin.356 
echo ">>>>>>>>running test 875"
./replace_wrapper '[z-}]' ''  < ./inputs/input/ruin.1055 
echo ">>>>>>>>running test 876"
./replace_wrapper '[z-}]' '5S5stRu.W%X4J'  < ./inputs/input/ruin.503 
echo ">>>>>>>>running test 877"
./replace_wrapper '[z-}]' '7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp'  < ./inputs/input/ruin.1055 
echo ">>>>>>>>running test 878"
./replace_wrapper '[z-}]' ':!OthH~kXWn'  < ./inputs/input/ruin.894 
echo ">>>>>>>>running test 879"
./replace_wrapper '[z-}]' 'P'  < ./inputs/input/ruin.217 
echo ">>>>>>>>running test 880"
./replace_wrapper '[z-}]' 'Vu'  < ./inputs/input/ruin.1883 
echo ">>>>>>>>running test 881"
./replace_wrapper '[z-}]' 'f'  < ./inputs/input/ruin.872 
echo ">>>>>>>>running test 882"
./replace_wrapper '[z-}]' 'g|9'  < ./inputs/input/ruin.1164 
echo ">>>>>>>>running test 883"
./replace_wrapper '[z-}]*$' 'x<W#6\5oQ+{Kh2/kx#w6k`0;nznycd:QlGcd,'  < ./inputs/input/ruin.1253 
echo ">>>>>>>>running test 884"
./replace_wrapper '[z-}]@t' '1O'  < ./inputs/input/ruin.47 
echo ">>>>>>>>running test 885"
./replace_wrapper '[z-}c-a]' '-MPvM'\''v'  < ./inputs/input/ruin.244 
echo ">>>>>>>>running test 886"
./replace_wrapper '[{]' '=zZZTW>^oIXf'  < ./inputs/input/ruin.71 
echo ">>>>>>>>running test 887"
./replace_wrapper '[|Z-a]^_`a]' 'C'  < ./inputs/input/ruin.1090 
echo ">>>>>>>>running test 888"
./replace_wrapper '\"Q %?' 'a'  < ./inputs/input/ruin.982 
echo ">>>>>>>>running test 889"
./replace_wrapper '\' '<'  < ./inputs/input/ruin.1395 
echo ">>>>>>>>running test 890"
./replace_wrapper '\' 'YEb bc%%["wg_QT&UFt:ir*4ne~Bh*oK?f1u3)0}uzx_+!IeT+'\''/M[Yj'  < ./inputs/input/ruin.1786 
echo ">>>>>>>>running test 891"
./replace_wrapper '\*' 'g!dZjV4QD8X5M%6e((5C]ZJ/mJ$P0N~8'  < ./inputs/input/ruin.1391 
echo ">>>>>>>>running test 892"
./replace_wrapper '\7L' 'OYei+V4`(LC05cWs)XsG(6]gdF'  < ./inputs/input/ruin.1725 
echo ">>>>>>>>running test 893"
./replace_wrapper '\8V41?' 'ee8HNWCf2?*3$ft8$/6D'  < ./inputs/input/ruin.1888 
echo ">>>>>>>>running test 894"
./replace_wrapper '\<@^@@' '&*pa1X1"X@\UX>IdCGEO|f'  < ./inputs/input/ruin.901 
echo ">>>>>>>>running test 895"
./replace_wrapper '\?' '$:Kr*#&N} g}5E6ztAOMT!}qoV,Fb\h7p5Jrvqa'  < ./inputs/input/ruin.159 
echo ">>>>>>>>running test 896"
./replace_wrapper '\@@'   < ./inputs/input/ruin.1165 
echo ">>>>>>>>running test 897"
./replace_wrapper '\@@' '('\''mg>,gajn*qm-_6So|`!\UG(w,@.$=2g]>RA'  < ./inputs/input/ruin.1995 
echo ">>>>>>>>running test 898"
./replace_wrapper '\@@' 'f'  < ./inputs/input/ruin.1165 
echo ">>>>>>>>running test 899"
./replace_wrapper '\@@*$' '('\''mg>,gajn*qm-_6So|`!\UG(w,@.$=2g]>RA'  < ./inputs/input/ruin.1995 
echo ">>>>>>>>running test 900"
./replace_wrapper '\T[v*' '8-=O.xe7b;<s`,{cP`y=:>K-=B=~q/.'  < ./inputs/input/ruin.1898 
echo ">>>>>>>>running test 901"
./replace_wrapper '\VSx"Um@@' '|'  < ./inputs/input/ruin.1643 
echo ">>>>>>>>running test 902"
./replace_wrapper '\Y!%aK@@' 'G'  < ./inputs/input/ruin.142 
echo ">>>>>>>>running test 903"
./replace_wrapper '\\v<}h]' ':"f$Nb}3DcX'  < ./inputs/input/ruin.1386 
echo ">>>>>>>>running test 904"
./replace_wrapper '\a8*' 'r'  < ./inputs/input/ruin.305 
echo ">>>>>>>>running test 905"
./replace_wrapper '\l]#+wVDo{!?' 'Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8[0-9]*z$?\aq<W4'  < ./inputs/input/ruin.1347 
echo ">>>>>>>>running test 906"
./replace_wrapper '\l]#+wVDo{!?' 'Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?\aq<W4'  < ./inputs/input/ruin.1347 
echo ">>>>>>>>running test 907"
./replace_wrapper '\l]#+wVDo{!?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}[0-9]*' 'Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?\aq<W4'  < ./inputs/input/ruin.1347 
echo ">>>>>>>>running test 908"
./replace_wrapper '\u=vvW~U' '2'  < ./inputs/input/ruin.949 
echo ">>>>>>>>running test 909"
./replace_wrapper '\xn[^>-A]' 'o'  < ./inputs/input/ruin.1871 
echo ">>>>>>>>running test 910"
./replace_wrapper '\x|' '?'  < ./inputs/input/ruin.924 
echo ">>>>>>>>running test 911"
./replace_wrapper '\}Os*$' 'y'  < ./inputs/input/ruin.364 
echo ">>>>>>>>running test 912"
./replace_wrapper ']' '$'  < ./inputs/input/ruin.1809 
echo ">>>>>>>>running test 913"
./replace_wrapper ']' '=x3%"'  < ./inputs/input/ruin.203 
echo ">>>>>>>>running test 914"
./replace_wrapper ']' 'IGeVt0Z[JX~d];kXZc?D4${Q c5&'\''#u}/3LoWR#uj'  < ./inputs/input/ruin.237 
echo ">>>>>>>>running test 915"
./replace_wrapper ']' 'S'  < ./inputs/input/ruin.1619 
echo ">>>>>>>>running test 916"
./replace_wrapper ']' 'a'  < ./inputs/input/ruin.684 
echo ">>>>>>>>running test 917"
./replace_wrapper ']' 'd7t3xoKq,7NtyV+.x5<Q?H`Sa2j'  < ./inputs/input/ruin.812 
echo ">>>>>>>>running test 918"
./replace_wrapper ']' 'qu!E@^n@92)^Kms}mC/G>>0qc.q'  < ./inputs/input/ruin.1827 
echo ">>>>>>>>running test 919"
./replace_wrapper ']?*' 'S'  < ./inputs/input/ruin.1619 
echo ">>>>>>>>running test 920"
./replace_wrapper ']@n' '=&lk'  < ./inputs/input/ruin.277 
echo ">>>>>>>>running test 921"
./replace_wrapper '^$**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 922"
./replace_wrapper '^%a-c]-' '@%@&'  < ./inputs/temp-test/25.inp.11.2 
echo ">>>>>>>>running test 923"
./replace_wrapper '^' ')J&ym12(Um?ZG6'  < ./inputs/input/ruin.1718 
echo ">>>>>>>>running test 924"
./replace_wrapper '^' '/=VXw>%)rWz0.ROqC>THDqQ^Hr+jB~x]S(cp}#'  < ./inputs/input/ruin.1204 
echo ">>>>>>>>running test 925"
./replace_wrapper '^' '>'  < ./inputs/input/ruin.630 
echo ">>>>>>>>running test 926"
./replace_wrapper '^' 'RJ"uId4{]]FL|-)/'  < ./inputs/input/ruin.1789 
echo ">>>>>>>>running test 927"
./replace_wrapper '^' 'Sy]U)vS+Ig:nzR;}B#I}p0@nOb"@Yqv.A`?PuhL g0{svG=S'  < ./inputs/input/ruin.1093 
echo ">>>>>>>>running test 928"
./replace_wrapper '^' 'b@t'  < ./inputs/temp-test/124.inp.58.1 
echo ">>>>>>>>running test 929"
./replace_wrapper '^' 'b@t'  < ./inputs/temp-test/125.inp.58.3 
echo ">>>>>>>>running test 930"
./replace_wrapper '^' 'e'  < ./inputs/input/ruin.1661 
echo ">>>>>>>>running test 931"
./replace_wrapper '^' 'o:d;LeM"ts3$SRInwYpZ;bC1@HdnY?I(lB'  < ./inputs/input/ruin.1944 
echo ">>>>>>>>running test 932"
./replace_wrapper '^*%^*?-[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[?' '@%&a'  < ./inputs/temp-test/15.inp.7.1 
echo ">>>>>>>>running test 933"
./replace_wrapper '^*%^*?-[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[?' '@%&a'  < ./inputs/temp-test/16.inp.7.3 
echo ">>>>>>>>running test 934"
./replace_wrapper '^**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 935"
./replace_wrapper '^*-' '&'  < ./inputs/temp-test/183.inp.82.1 
echo ">>>>>>>>running test 936"
./replace_wrapper '^*-' '&'  < ./inputs/temp-test/184.inp.82.3 
echo ">>>>>>>>running test 937"
./replace_wrapper '^*-' '&a@%'  < ./inputs/temp-test/1932.inp.821.1 
echo ">>>>>>>>running test 938"
./replace_wrapper '^*-[a-]-[^@t]' 'a@n'  < ./inputs/temp-test/1265.inp.543.1 
echo ">>>>>>>>running test 939"
./replace_wrapper '^*-[a-]-[^@t]' 'a@n'  < ./inputs/temp-test/1266.inp.543.2 
echo ">>>>>>>>running test 940"
./replace_wrapper '^*-[a-]-[^@t]' 'a@n'  < ./inputs/temp-test/1267.inp.543.3 
echo ">>>>>>>>running test 941"
./replace_wrapper '^*?' '&a@%'  < ./inputs/temp-test/1540.inp.659.1 
echo ">>>>>>>>running test 942"
./replace_wrapper '^*??-' '@%@&'  < ./inputs/temp-test/2240.inp.950.1 
echo ">>>>>>>>running test 943"
./replace_wrapper '^*??-' '@%@&'  < ./inputs/temp-test/2241.inp.950.2 
echo ">>>>>>>>running test 944"
./replace_wrapper '^*[9-B]?' '&'  < ./inputs/temp-test/1012.inp.435.1 
echo ">>>>>>>>running test 945"
./replace_wrapper '^*[9-B]?' '&'  < ./inputs/temp-test/1013.inp.435.3 
echo ">>>>>>>>running test 946"
./replace_wrapper '^*[^-z]' '@t'  < ./inputs/temp-test/102.inp.46.1 
echo ">>>>>>>>running test 947"
./replace_wrapper '^*[^-z]' '@t'  < ./inputs/temp-test/103.inp.46.2 
echo ">>>>>>>>running test 948"
./replace_wrapper '^*[^@@]-?^a-][a--][^@@]?-[0-9]' '@%@&'  < ./inputs/temp-test/1683.inp.717.1 
echo ">>>>>>>>running test 949"
./replace_wrapper '^*[^a--]$' 'a&'  < ./inputs/temp-test/256.inp.113.8 
echo ">>>>>>>>running test 950"
./replace_wrapper '^*[^a--]' 'a&'  < ./inputs/temp-test/254.inp.113.1 
echo ">>>>>>>>running test 951"
./replace_wrapper '^*[^a--]' 'a&'  < ./inputs/temp-test/255.inp.113.2 
echo ">>>>>>>>running test 952"
./replace_wrapper '^*[^a-[a-c][0-9]?-*-?? ' ''  < ./inputs/temp-test/1933.inp.822.1 
echo ">>>>>>>>running test 953"
./replace_wrapper '^*[^a-[a-c][0-9]?-*-?? ' ''  < ./inputs/temp-test/1934.inp.822.3 
echo ">>>>>>>>running test 954"
./replace_wrapper '^*[_-z]' 'a@nb@tc'  < ./inputs/temp-test/653.inp.284.1 
echo ">>>>>>>>running test 955"
./replace_wrapper '^*[_-z]' 'a@nb@tc'  < ./inputs/temp-test/654.inp.284.2 
echo ">>>>>>>>running test 956"
./replace_wrapper '^*[_-z]' 'a@nb@tc'  < ./inputs/temp-test/655.inp.284.3 
echo ">>>>>>>>running test 957"
./replace_wrapper '^*[a--]' ''  < ./inputs/temp-test/1395.inp.598.1 
echo ">>>>>>>>running test 958"
./replace_wrapper '^*[a-c[9-B]?' 'a&'  < ./inputs/temp-test/1297.inp.557.1 
echo ">>>>>>>>running test 959"
./replace_wrapper '^*[a-c[9-B]?' 'a&'  < ./inputs/temp-test/1298.inp.557.2 
echo ">>>>>>>>running test 960"
./replace_wrapper '^*^*?-[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[?' '@%&a'  < ./inputs/temp-test/15.inp.7.1 
echo ">>>>>>>>running test 961"
./replace_wrapper '^*^*?-[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[?' '@%&a'  < ./inputs/temp-test/16.inp.7.3 
echo ">>>>>>>>running test 962"
./replace_wrapper '^*a-c]' '@%&a'  < ./inputs/temp-test/2244.inp.952.1 
echo ">>>>>>>>running test 963"
./replace_wrapper '^*a-c]' '@%&a'  < ./inputs/temp-test/2245.inp.952.2 
echo ">>>>>>>>running test 964"
./replace_wrapper '^*a-c]' '@%&a'  < ./inputs/temp-test/2246.inp.952.3 
echo ">>>>>>>>running test 965"
./replace_wrapper '^-' '&'  < ./inputs/temp-test/873.inp.375.1 
echo ">>>>>>>>running test 966"
./replace_wrapper '^-' '&'  < ./inputs/temp-test/874.inp.375.2 
echo ">>>>>>>>running test 967"
./replace_wrapper '^-' '@t'  < ./inputs/temp-test/429.inp.189.1 
echo ">>>>>>>>running test 968"
./replace_wrapper '^-' '@t'  < ./inputs/temp-test/430.inp.189.2 
echo ">>>>>>>>running test 969"
./replace_wrapper '^-' '@t'  < ./inputs/temp-test/431.inp.189.3 
echo ">>>>>>>>running test 970"
./replace_wrapper '^-?[][^9-B]' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 971"
./replace_wrapper '^-?[^9-B]'   < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 972"
./replace_wrapper '^-?[^9-B]' 'a@n'  < ./inputs/temp-test/509.inp.222.1 
echo ">>>>>>>>running test 973"
./replace_wrapper '^-?[^9-B]' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 974"
./replace_wrapper '^-?[^9-B]*$' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 975"
./replace_wrapper '^-?[^9-B]*' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 976"
./replace_wrapper '^-?[^][^9-B]' 'a@n'  < ./inputs/temp-test/510.inp.222.4 
echo ">>>>>>>>running test 977"
./replace_wrapper '^-?[a-c]' '@%@&'  < ./inputs/temp-test/881.inp.378.1 
echo ">>>>>>>>running test 978"
./replace_wrapper '^-]-[9-B]' '@%&a'  < ./inputs/temp-test/1666.inp.711.1 
echo ">>>>>>>>running test 979"
./replace_wrapper '^-]-[9-B]' '@%&a'  < ./inputs/temp-test/1667.inp.711.3 
echo ">>>>>>>>running test 980"
./replace_wrapper '^-]-[9-B]' '@%&a'  < ./inputs/temp-test/1668.inp.711.4 
echo ">>>>>>>>running test 981"
./replace_wrapper '^-]?' '&'  < ./inputs/temp-test/1766.inp.752.1 
echo ">>>>>>>>running test 982"
./replace_wrapper '^-]?' '&'  < ./inputs/temp-test/1767.inp.752.2 
echo ">>>>>>>>running test 983"
./replace_wrapper '^-]@**$' 'b@t'  < ./inputs/temp-test/744.inp.318.8 
echo ">>>>>>>>running test 984"
./replace_wrapper '^-]@**' 'b@t'  < ./inputs/temp-test/741.inp.318.1 
echo ">>>>>>>>running test 985"
./replace_wrapper '^-]@**' 'b@t'  < ./inputs/temp-test/742.inp.318.2 
echo ">>>>>>>>running test 986"
./replace_wrapper '^-][0-9]' 'NEW'  < ./inputs/temp-test/667.inp.291.1 
echo ">>>>>>>>running test 987"
./replace_wrapper '^-][0-9]' 'NEW'  < ./inputs/temp-test/668.inp.291.2 
echo ">>>>>>>>running test 988"
./replace_wrapper '^?$' '@%@&'  < ./inputs/temp-test/339.inp.148.6 
echo ">>>>>>>>running test 989"
./replace_wrapper '^?' '@%@&'  < ./inputs/temp-test/336.inp.148.1 
echo ">>>>>>>>running test 990"
./replace_wrapper '^?' '@%@&'  < ./inputs/temp-test/337.inp.148.2 
echo ">>>>>>>>running test 991"
./replace_wrapper '^?' '@%@&'  < ./inputs/temp-test/338.inp.148.3 
echo ">>>>>>>>running test 992"
./replace_wrapper '^?' 'a&'  < ./inputs/temp-test/401.inp.175.1 
echo ">>>>>>>>running test 993"
./replace_wrapper '^?' 'a&'  < ./inputs/temp-test/402.inp.175.4 
echo ">>>>>>>>running test 994"
./replace_wrapper '^?[^0-9][a--b]-@[' '&'  < ./inputs/temp-test/907.inp.391.1 
echo ">>>>>>>>running test 995"
./replace_wrapper '^?[^0-9][a--b]-@[' '&'  < ./inputs/temp-test/908.inp.391.2 
echo ">>>>>>>>running test 996"
./replace_wrapper '^@@\?[^c-a]$' 'bSRy3i[Ff.nx{B>V$n/JFtqSP6s7do)BW%F=xS_&{a'  < ./inputs/input/ruin.1580 
echo ">>>>>>>>running test 997"
./replace_wrapper '^[9-B]' '@%@&'  < ./inputs/temp-test/1967.inp.836.1 
echo ">>>>>>>>running test 998"
./replace_wrapper '^[9-B]' '@%@&'  < ./inputs/temp-test/1968.inp.836.4 
echo ">>>>>>>>running test 999"
./replace_wrapper '^[9-B]^a-]-@[^a-c]$' 'a&'  < ./inputs/temp-test/779.inp.335.6 
echo ">>>>>>>>running test 1000"
./replace_wrapper '^[9-B]^a-]-@[^a-c]' 'a&'  < ./inputs/temp-test/778.inp.335.1 
echo ">>>>>>>>running test 1001"
./replace_wrapper '^[^9-B]' 'a&'  < ./inputs/temp-test/80.inp.35.1 
echo ">>>>>>>>running test 1002"
./replace_wrapper '^[^9-B]?' 'a&'  < ./inputs/temp-test/657.inp.286.1 
echo ">>>>>>>>running test 1003"
./replace_wrapper '^[^9-B]?' 'a&'  < ./inputs/temp-test/658.inp.286.2 
echo ">>>>>>>>running test 1004"
./replace_wrapper '^[^9-B]?' 'a&'  < ./inputs/temp-test/659.inp.286.4 
echo ">>>>>>>>running test 1005"
./replace_wrapper '^[^@t]' '&a@%'  < ./inputs/temp-test/1639.inp.699.1 
echo ">>>>>>>>running test 1006"
./replace_wrapper '^[^@t]' '&a@%'  < ./inputs/temp-test/1640.inp.699.3 
echo ">>>>>>>>running test 1007"
./replace_wrapper '^[a--]' '&a@%'  < ./inputs/temp-test/984.inp.424.1 
echo ">>>>>>>>running test 1008"
./replace_wrapper '^a%-]@[*^a-]^' '&'  < ./inputs/temp-test/13.inp.6.2 
echo ">>>>>>>>running test 1009"
./replace_wrapper '^a-%]@[*^a-]^' '&'  < ./inputs/temp-test/12.inp.6.1 
echo ">>>>>>>>running test 1010"
./replace_wrapper '^a-%c]-' '@%@&'  < ./inputs/temp-test/24.inp.11.1 
echo ">>>>>>>>running test 1011"
./replace_wrapper '^a-%c]-' '@%@&'  < ./inputs/temp-test/26.inp.11.3 
echo ">>>>>>>>running test 1012"
./replace_wrapper '^a-]-*$' 'NEW'  < ./inputs/temp-test/559.inp.241.6 
echo ">>>>>>>>running test 1013"
./replace_wrapper '^a-]-*$' 'NEW'  < ./inputs/temp-test/560.inp.241.8 
echo ">>>>>>>>running test 1014"
./replace_wrapper '^a-]-*' 'NEW'  < ./inputs/temp-test/557.inp.241.1 
echo ">>>>>>>>running test 1015"
./replace_wrapper '^a-]-*' 'NEW'  < ./inputs/temp-test/558.inp.241.3 
echo ">>>>>>>>running test 1016"
./replace_wrapper '^a-]?' 'a@nb@tc'  < ./inputs/temp-test/138.inp.64.1 
echo ">>>>>>>>running test 1017"
./replace_wrapper '^a-]?a-][^a-]' ''  < ./inputs/temp-test/447.inp.196.1 
echo ">>>>>>>>running test 1018"
./replace_wrapper '^a-]?a-][^a-]' ''  < ./inputs/temp-test/448.inp.196.3 
echo ">>>>>>>>running test 1019"
./replace_wrapper '^a-]@[*^a-]%^' '&'  < ./inputs/temp-test/14.inp.6.4 
echo ">>>>>>>>running test 1020"
./replace_wrapper '^a-]@[*^a-]^' '&'  < ./inputs/temp-test/12.inp.6.1 
echo ">>>>>>>>running test 1021"
./replace_wrapper '^a-]@[*^a-]^' '&'  < ./inputs/temp-test/13.inp.6.2 
echo ">>>>>>>>running test 1022"
./replace_wrapper '^a-]@[*^a-]^' '&'  < ./inputs/temp-test/14.inp.6.4 
echo ">>>>>>>>running test 1023"
./replace_wrapper '^a-]@n*' '@%&a'  < ./inputs/temp-test/1516.inp.649.1 
echo ">>>>>>>>running test 1024"
./replace_wrapper '^a-]@n*' '@%&a'  < ./inputs/temp-test/1517.inp.649.3 
echo ">>>>>>>>running test 1025"
./replace_wrapper '^a-][9-B][^--z]??@[*?' 'a&'  < ./inputs/temp-test/2151.inp.911.1 
echo ">>>>>>>>running test 1026"
./replace_wrapper '^a-][9-B][^--z]??@[*?' 'a&'  < ./inputs/temp-test/2152.inp.911.2 
echo ">>>>>>>>running test 1027"
./replace_wrapper '^a-][9-B][^--z]??@[*?' 'a&'  < ./inputs/temp-test/2153.inp.911.3 
echo ">>>>>>>>running test 1028"
./replace_wrapper '^a-][a--b]$' '@%&a'  < ./inputs/temp-test/2065.inp.875.6 
echo ">>>>>>>>running test 1029"
./replace_wrapper '^a-][a--b]' '@%&a'  < ./inputs/temp-test/2064.inp.875.1 
echo ">>>>>>>>running test 1030"
./replace_wrapper '^a-c?*' 'NEW'  < ./inputs/temp-test/193.inp.87.3 
echo ">>>>>>>>running test 1031"
./replace_wrapper '^a-c]' '&a@%'  < ./inputs/temp-test/2072.inp.878.1 
echo ">>>>>>>>running test 1032"
./replace_wrapper '^a-c]' '&a@%'  < ./inputs/temp-test/2073.inp.878.3 
echo ">>>>>>>>running test 1033"
./replace_wrapper '^a-c]' 'a&'  < ./inputs/temp-test/626.inp.270.1 
echo ">>>>>>>>running test 1034"
./replace_wrapper '^a-c]' 'a&'  < ./inputs/temp-test/627.inp.270.4 
echo ">>>>>>>>running test 1035"
./replace_wrapper '^a-c]-' '@%@&'  < ./inputs/temp-test/24.inp.11.1 
echo ">>>>>>>>running test 1036"
./replace_wrapper '^a-c]-' '@%@&'  < ./inputs/temp-test/25.inp.11.2 
echo ">>>>>>>>running test 1037"
./replace_wrapper '^a-c]-' '@%@&'  < ./inputs/temp-test/26.inp.11.3 
echo ">>>>>>>>running test 1038"
./replace_wrapper '^a-c]-' 'NEW'  < ./inputs/temp-test/191.inp.87.1 
echo ">>>>>>>>running test 1039"
./replace_wrapper '^a-c]-' 'NEW'  < ./inputs/temp-test/192.inp.87.2 
echo ">>>>>>>>running test 1040"
./replace_wrapper '^a-c]-' 'NEW'  < ./inputs/temp-test/193.inp.87.3 
echo ">>>>>>>>running test 1041"
./replace_wrapper '^a-c]-?*' 'NEW'  < ./inputs/temp-test/191.inp.87.1 
echo ">>>>>>>>running test 1042"
./replace_wrapper '^a-c]?' ''  < ./inputs/temp-test/2196.inp.931.1 
echo ">>>>>>>>running test 1043"
./replace_wrapper '^a-c]?' ''  < ./inputs/temp-test/2197.inp.931.3 
echo ">>>>>>>>running test 1044"
./replace_wrapper '^a-c]?' 'a&'  < ./inputs/temp-test/961.inp.414.1 
echo ">>>>>>>>running test 1045"
./replace_wrapper '^a-c]?' 'a&'  < ./inputs/temp-test/962.inp.414.3 
echo ">>>>>>>>running test 1046"
./replace_wrapper '^a-c]?*' 'NEW'  < ./inputs/temp-test/192.inp.87.2 
echo ">>>>>>>>running test 1047"
./replace_wrapper '^a-c][a-c]' 'b@t'  < ./inputs/temp-test/1057.inp.455.1 
echo ">>>>>>>>running test 1048"
./replace_wrapper '^a-c][a-c]' 'b@t'  < ./inputs/temp-test/1058.inp.455.3 
echo ">>>>>>>>running test 1049"
./replace_wrapper '^a-c]a-c] [9-B]??-' '@n'  < ./inputs/temp-test/230.inp.103.1 
echo ">>>>>>>>running test 1050"
./replace_wrapper '^a-c]a-c] [9-B]??-' '@n'  < ./inputs/temp-test/231.inp.103.3 
echo ">>>>>>>>running test 1051"
./replace_wrapper '^d' f  < ./inputs/moni/f4.inp 
echo ">>>>>>>>running test 1052"
./replace_wrapper '_' '9}* bi8K(A-oQ<`>X6{_]~x)/2?ka!kso='  < ./inputs/input/ruin.22 
echo ">>>>>>>>running test 1053"
./replace_wrapper '_' 'd '\''Ts/gEB(0=$(}A.AVje3x'  < ./inputs/input/ruin.1202 
echo ">>>>>>>>running test 1054"
./replace_wrapper '_'\''w' ''  < ./inputs/input/ruin.1220 
echo ">>>>>>>>running test 1055"
./replace_wrapper '_K' '2$-2ws/Lk;]a=k~'  < ./inputs/input/ruin.1227 
echo ">>>>>>>>running test 1056"
./replace_wrapper '`' '[VP/8]e\R?;WE$d6'  < ./inputs/input/ruin.1473 
echo ">>>>>>>>running test 1057"
./replace_wrapper '`a-A-GABCDEFG]:@n' '-[&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 1058"
./replace_wrapper '`a-c-ac-a]@n' 'N&A'  < ./inputs/input/ruin.293 
echo ">>>>>>>>running test 1059"
./replace_wrapper 'a$' '{:Kvg4Y@Go<Iyg"ZP5a'\''O>)9@XxZ1a/{Y'  < ./inputs/input/ruin.1503 
echo ">>>>>>>>running test 1060"
./replace_wrapper 'a' '& #2@@@-'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1061"
./replace_wrapper 'a' '&'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1062"
./replace_wrapper 'a' '&@n'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1063"
./replace_wrapper 'a' ''  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1064"
./replace_wrapper 'a' ')zLIH{N+2AGC>Gf5'  < ./inputs/input/ruin.172 
echo ">>>>>>>>running test 1065"
./replace_wrapper 'a' '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1066"
./replace_wrapper 'a' 'Ot<f]|MW(_V*YV'\''<8N?BrfOM-IG-}b#U5KSs0gIf$F\#!n_Ll.*k@e2CjOJ<^T`'  < ./inputs/input/ruin.700 
echo ">>>>>>>>running test 1067"
./replace_wrapper 'a' '_,wpFpZ@r`UP}ZE)'  < ./inputs/input/ruin.1703 
echo ">>>>>>>>running test 1068"
./replace_wrapper 'a*' 'c-1'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1069"
./replace_wrapper 'a-**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1070"
./replace_wrapper 'a-]' '@%@&'  < ./inputs/temp-test/2288.inp.969.2 
echo ">>>>>>>>running test 1071"
./replace_wrapper 'a-]' '@%@&'  < ./inputs/temp-test/2289.inp.969.3 
echo ">>>>>>>>running test 1072"
./replace_wrapper 'a-]' 'a@nb@tc'  < ./inputs/temp-test/410.inp.180.2 
echo ">>>>>>>>running test 1073"
./replace_wrapper 'a-]' 'a@nb@tc'  < ./inputs/temp-test/411.inp.180.3 
echo ">>>>>>>>running test 1074"
./replace_wrapper 'a-]-*?c[^--z]a-][^a-][a--b]?' 'a&'  < ./inputs/temp-test/1325.inp.569.1 
echo ">>>>>>>>running test 1075"
./replace_wrapper 'a-]-*?c[^--z]a-][^a-][a--b]?' 'a&'  < ./inputs/temp-test/1326.inp.569.2 
echo ">>>>>>>>running test 1076"
./replace_wrapper 'a-]?-?^-]-[^a-^[^0-9]$' '&a@%'  < ./inputs/temp-test/2195.inp.930.9 
echo ">>>>>>>>running test 1077"
./replace_wrapper 'a-]?-?^-]-[^a-^[^0-9]' '&a@%'  < ./inputs/temp-test/2193.inp.930.1 
echo ">>>>>>>>running test 1078"
./replace_wrapper 'a-]?-?^-]-[^a-^[^0-9]' '&a@%'  < ./inputs/temp-test/2194.inp.930.2 
echo ">>>>>>>>running test 1079"
./replace_wrapper 'a-]?[^0-9]?[^a--][a-c]@[*[^0-9]a-c][^a-c' '@n'  < ./inputs/temp-test/612.inp.264.1 
echo ">>>>>>>>running test 1080"
./replace_wrapper 'a-]?[^0-9]?[^a--][a-c]@[*[^0-9]a-c][^a-c' '@n'  < ./inputs/temp-test/613.inp.264.3 
echo ">>>>>>>>running test 1081"
./replace_wrapper 'a-]@@*' 'NEW'  < ./inputs/temp-test/1202.inp.516.1 
echo ">>>>>>>>running test 1082"
./replace_wrapper 'a-]@@*' 'NEW'  < ./inputs/temp-test/1203.inp.516.3 
echo ">>>>>>>>running test 1083"
./replace_wrapper 'a-]A*[^0-9][a-c]' '@%&a'  < ./inputs/temp-test/1951.inp.828.1 
echo ">>>>>>>>running test 1084"
./replace_wrapper 'a-][^0-9]' '&'  < ./inputs/temp-test/729.inp.314.1 
echo ">>>>>>>>running test 1085"
./replace_wrapper 'a-][^0-9]' '&'  < ./inputs/temp-test/730.inp.314.2 
echo ">>>>>>>>running test 1086"
./replace_wrapper 'a-][^0-9]' '&'  < ./inputs/temp-test/731.inp.314.3 
echo ">>>>>>>>running test 1087"
./replace_wrapper 'a-][^9-B]' '@%&a'  < ./inputs/temp-test/662.inp.288.1 
echo ">>>>>>>>running test 1088"
./replace_wrapper 'a-][^9-B]' '@%&a'  < ./inputs/temp-test/663.inp.288.2 
echo ">>>>>>>>running test 1089"
./replace_wrapper 'a-][a-c' ''  < ./inputs/temp-test/555.inp.240.2 
echo ">>>>>>>>running test 1090"
./replace_wrapper 'a-][a-c' ''  < ./inputs/temp-test/556.inp.240.4 
echo ">>>>>>>>running test 1091"
./replace_wrapper 'a-]^*-?-@@*@n-[^0-9]-' 'a&'  < ./inputs/temp-test/272.inp.122.1 
echo ">>>>>>>>running test 1092"
./replace_wrapper 'a-]^*-?-@@*@n-[^0-9]-' 'a&'  < ./inputs/temp-test/273.inp.122.3 
echo ">>>>>>>>running test 1093"
./replace_wrapper 'a-c]-' 'a&'  < ./inputs/temp-test/1910.inp.811.1 
echo ">>>>>>>>running test 1094"
./replace_wrapper 'a-c]-' 'a&'  < ./inputs/temp-test/1911.inp.811.3 
echo ">>>>>>>>running test 1095"
./replace_wrapper 'a-c]-[0-9]@t*@*?' '@%@&'  < ./inputs/temp-test/991.inp.427.1 
echo ">>>>>>>>running test 1096"
./replace_wrapper 'a-c]-[0-9]@t*@*?' '@%@&'  < ./inputs/temp-test/992.inp.427.3 
echo ">>>>>>>>running test 1097"
./replace_wrapper 'a-c]@*[0-9]?*A-' 'NEW'  < ./inputs/temp-test/3.inp.2.1 
echo ">>>>>>>>running test 1098"
./replace_wrapper 'a-c]@*[0-9]?*A-' 'NEW'  < ./inputs/temp-test/4.inp.2.3 
echo ">>>>>>>>running test 1099"
./replace_wrapper 'a-c]@*[0-9]?*A-' 'NEW'  < ./inputs/temp-test/5.inp.2.4 
echo ">>>>>>>>running test 1100"
./replace_wrapper 'a-c][^@@]' '@t'  < ./inputs/temp-test/1514.inp.648.1 
echo ">>>>>>>>running test 1101"
./replace_wrapper 'ab?p**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1102"
./replace_wrapper 'abc$%**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1103"
./replace_wrapper 'b' '-HM{Qv|H1pLYv2Eb1x5)'  < ./inputs/input/ruin.589 
echo ">>>>>>>>running test 1104"
./replace_wrapper 'b' 'UK4N.tls!-g6_D0+`!hP:rH8$|5'\''xGr?'  < ./inputs/input/ruin.1633 
echo ">>>>>>>>running test 1105"
./replace_wrapper 'b' 'v+AfoGgD^s"3R2jL|'  < ./inputs/input/ruin.747 
echo ">>>>>>>>running test 1106"
./replace_wrapper 'c' '&a@%'  < ./inputs/temp-test/310.inp.139.1 
echo ">>>>>>>>running test 1107"
./replace_wrapper 'c' '&a@%'  < ./inputs/temp-test/311.inp.139.3 
echo ">>>>>>>>running test 1108"
./replace_wrapper 'c' '|-rnI[>\$@wV'  < ./inputs/input/ruin.1493 
echo ">>>>>>>>running test 1109"
./replace_wrapper 'c*' '&a@%'  < ./inputs/temp-test/2087.inp.884.1 
echo ">>>>>>>>running test 1110"
./replace_wrapper 'c*' 'a&'  < ./inputs/temp-test/1408.inp.604.1 
echo ">>>>>>>>running test 1111"
./replace_wrapper 'c*' 'a&'  < ./inputs/temp-test/1409.inp.604.3 
echo ">>>>>>>>running test 1112"
./replace_wrapper 'c*-[^--z]-?' 'a@nb@tc'  < ./inputs/temp-test/2275.inp.964.1 
echo ">>>>>>>>running test 1113"
./replace_wrapper 'c*?$' 'a@nb@tc'  < ./inputs/temp-test/805.inp.345.9 
echo ">>>>>>>>running test 1114"
./replace_wrapper 'c*?' '&'  < ./inputs/temp-test/340.inp.149.1 
echo ">>>>>>>>running test 1115"
./replace_wrapper 'c*?' '&'  < ./inputs/temp-test/341.inp.149.4 
echo ">>>>>>>>running test 1116"
./replace_wrapper 'c*?' '@%&a'  < ./inputs/temp-test/354.inp.155.1 
echo ">>>>>>>>running test 1117"
./replace_wrapper 'c*?' '@%&a'  < ./inputs/temp-test/355.inp.155.2 
echo ">>>>>>>>running test 1118"
./replace_wrapper 'c*?' '@%&a@'  < ./inputs/temp-test/354.inp.155.1 
echo ">>>>>>>>running test 1119"
./replace_wrapper 'c*?' '@%&a@'  < ./inputs/temp-test/355.inp.155.2 
echo ">>>>>>>>running test 1120"
./replace_wrapper 'c*?' 'a@nb@tc'  < ./inputs/temp-test/802.inp.345.1 
echo ">>>>>>>>running test 1121"
./replace_wrapper 'c*?' 'a@nb@tc'  < ./inputs/temp-test/803.inp.345.2 
echo ">>>>>>>>running test 1122"
./replace_wrapper 'c*?' 'a@nb@tc'  < ./inputs/temp-test/804.inp.345.3 
echo ">>>>>>>>running test 1123"
./replace_wrapper 'c*?[a--][^9-B][9-B][a-[a-c@@*[^-?' '@%@&'  < ./inputs/temp-test/785.inp.338.1 
echo ">>>>>>>>running test 1124"
./replace_wrapper 'c*?[a--][^9-B][9-B][a-[a-c@@*[^-?' '@%@&'  < ./inputs/temp-test/786.inp.338.2 
echo ">>>>>>>>running test 1125"
./replace_wrapper 'c*[9-B][9-B]-*-[^0-9]' 'a&'  < ./inputs/temp-test/1880.inp.797.1 
echo ">>>>>>>>running test 1126"
./replace_wrapper 'c*[9-B][9-B]-*-[^0-9]' 'a&'  < ./inputs/temp-test/1881.inp.797.3 
echo ">>>>>>>>running test 1127"
./replace_wrapper 'c*[][^a-' 'a@nb@tc'  < ./inputs/temp-test/514.inp.224.1 
echo ">>>>>>>>running test 1128"
./replace_wrapper 'c*[^][^a-' 'a@nb@tc'  < ./inputs/temp-test/514.inp.224.1 
echo ">>>>>>>>running test 1129"
./replace_wrapper 'c*[^a-'   < ./inputs/temp-test/515.inp.224.3 
echo ">>>>>>>>running test 1130"
./replace_wrapper 'c*[^a-' 'a@nb@tc'  < ./inputs/temp-test/514.inp.224.1 
echo ">>>>>>>>running test 1131"
./replace_wrapper 'c*[^a-' 'a@nb@tc'  < ./inputs/temp-test/515.inp.224.3 
echo ">>>>>>>>running test 1132"
./replace_wrapper 'c*^a-c]' ''  < ./inputs/temp-test/313.inp.140.1 
echo ">>>>>>>>running test 1133"
./replace_wrapper 'c*^a-c]' ''  < ./inputs/temp-test/314.inp.140.2 
echo ">>>>>>>>running test 1134"
./replace_wrapper 'c*^a-c]' ''  < ./inputs/temp-test/315.inp.140.3 
echo ">>>>>>>>running test 1135"
./replace_wrapper 'c*^a-c]' 'a@nb@tc'  < ./inputs/temp-test/2056.inp.872.1 
echo ">>>>>>>>running test 1136"
./replace_wrapper 'c*^a-c]' 'a@nb@tc'  < ./inputs/temp-test/2057.inp.872.3 
echo ">>>>>>>>running test 1137"
./replace_wrapper 'c-$' '@%@&'  < ./inputs/temp-test/1747.inp.742.8 
echo ">>>>>>>>running test 1138"
./replace_wrapper 'c-' ''  < ./inputs/temp-test/387.inp.169.1 
echo ">>>>>>>>running test 1139"
./replace_wrapper 'c-' ''  < ./inputs/temp-test/388.inp.169.2 
echo ">>>>>>>>running test 1140"
./replace_wrapper 'c-' ''  < ./inputs/temp-test/389.inp.169.3 
echo ">>>>>>>>running test 1141"
./replace_wrapper 'c-' '@%@&'  < ./inputs/temp-test/1744.inp.742.1 
echo ">>>>>>>>running test 1142"
./replace_wrapper 'c-' '@%@&'  < ./inputs/temp-test/1745.inp.742.2 
echo ">>>>>>>>running test 1143"
./replace_wrapper 'c-' '@%@&'  < ./inputs/temp-test/1746.inp.742.3 
echo ">>>>>>>>running test 1144"
./replace_wrapper 'c-[0-9][^a-c@**-' '@t'  < ./inputs/temp-test/167.inp.75.1 
echo ">>>>>>>>running test 1145"
./replace_wrapper 'c-[0-9][^a-c@**-' '@t'  < ./inputs/temp-test/168.inp.75.2 
echo ">>>>>>>>running test 1146"
./replace_wrapper 'c-^a-]?a-]-][a-c]-' '&a@%'  < ./inputs/temp-test/112.inp.51.1 
echo ">>>>>>>>running test 1147"
./replace_wrapper 'c-^a-]?a-]-][a-c]-' '&a@%'  < ./inputs/temp-test/113.inp.51.2 
echo ">>>>>>>>running test 1148"
./replace_wrapper 'c-^a-]?a-]-][a-c]-' '&a@%'  < ./inputs/temp-test/114.inp.51.3 
echo ">>>>>>>>running test 1149"
./replace_wrapper 'c?$' '@n'  < ./inputs/temp-test/1738.inp.739.8 
echo ">>>>>>>>running test 1150"
./replace_wrapper 'c?' '@%@&'  < ./inputs/temp-test/1168.inp.503.1 
echo ">>>>>>>>running test 1151"
./replace_wrapper 'c?' '@%@&'  < ./inputs/temp-test/1169.inp.503.2 
echo ">>>>>>>>running test 1152"
./replace_wrapper 'c?' '@n'  < ./inputs/temp-test/1737.inp.739.1 
echo ">>>>>>>>running test 1153"
./replace_wrapper 'c?*' ''  < ./inputs/temp-test/387.inp.169.1 
echo ">>>>>>>>running test 1154"
./replace_wrapper 'c?*' ''  < ./inputs/temp-test/388.inp.169.2 
echo ">>>>>>>>running test 1155"
./replace_wrapper 'c?*' ''  < ./inputs/temp-test/389.inp.169.3 
echo ">>>>>>>>running test 1156"
./replace_wrapper 'c?-@t?$' 'a@nb@tc'  < ./inputs/temp-test/1787.inp.760.6 
echo ">>>>>>>>running test 1157"
./replace_wrapper 'c?-@t?' 'a@nb@tc'  < ./inputs/temp-test/1785.inp.760.1 
echo ">>>>>>>>running test 1158"
./replace_wrapper 'c?-@t?' 'a@nb@tc'  < ./inputs/temp-test/1786.inp.760.4 
echo ">>>>>>>>running test 1159"
./replace_wrapper 'c[]*[^a-' 'a@nb@tc'  < ./inputs/temp-test/515.inp.224.3 
echo ">>>>>>>>running test 1160"
./replace_wrapper 'c[^0-9]'   < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1161"
./replace_wrapper 'c[^0-9]' '&@n'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1162"
./replace_wrapper 'c[^0-9]' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1163"
./replace_wrapper 'c[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/1307.inp.562.1 
echo ">>>>>>>>running test 1164"
./replace_wrapper 'c[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/1308.inp.562.3 
echo ">>>>>>>>running test 1165"
./replace_wrapper 'c[^0-9]*$' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1166"
./replace_wrapper 'c[^0-9]*' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1167"
./replace_wrapper 'c[^0-9][9-B]-' '@%@&'  < ./inputs/temp-test/1884.inp.799.1 
echo ">>>>>>>>running test 1168"
./replace_wrapper 'c[^0-9][9-B]-' '@%@&'  < ./inputs/temp-test/1885.inp.799.3 
echo ">>>>>>>>running test 1169"
./replace_wrapper 'c[^0-9][]' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1170"
./replace_wrapper 'c[^0-9][^]' '&a@%'  < ./inputs/temp-test/212.inp.95.1 
echo ">>>>>>>>running test 1171"
./replace_wrapper 'c[^9-B][^9-B]c*?[9-B]c-'   < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 1172"
./replace_wrapper 'c[^9-B][^9-B]c*?[9-B]c-'   < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 1173"
./replace_wrapper 'c[^9-B][^9-B]c*?[9-B]c-' '&@n'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 1174"
./replace_wrapper 'c[^9-B][^9-B]c*?[9-B]c-' '&@n'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 1175"
./replace_wrapper 'c[^]*[^a-' 'a@nb@tc'  < ./inputs/temp-test/515.inp.224.3 
echo ">>>>>>>>running test 1176"
./replace_wrapper 'c[^a--]-' '&'  < ./inputs/temp-test/316.inp.141.1 
echo ">>>>>>>>running test 1177"
./replace_wrapper 'c[^a--]-' '&'  < ./inputs/temp-test/317.inp.141.2 
echo ">>>>>>>>running test 1178"
./replace_wrapper 'c[^a--]-' '&'  < ./inputs/temp-test/318.inp.141.3 
echo ">>>>>>>>running test 1179"
./replace_wrapper 'd' 'MmG]j}^kC1v9&)@IDYiz'\'';OSYD&k}crmPG^5g?/'  < ./inputs/input/ruin.955 
echo ">>>>>>>>running test 1180"
./replace_wrapper 'd' 'W5QeouQGFKI&'\''2),,O1<HEyR)\#6$~\h/z#&u_Uj'  < ./inputs/input/ruin.414 
echo ">>>>>>>>running test 1181"
./replace_wrapper 'd' 'o'  < ./inputs/input/ruin.1837 
echo ">>>>>>>>running test 1182"
./replace_wrapper 'd' 'z>'  < ./inputs/input/ruin.1414 
echo ">>>>>>>>running test 1183"
./replace_wrapper 'e' '@,tDXi*;qGHNFVV$d#hd'  < ./inputs/input/ruin.736 
echo ">>>>>>>>running test 1184"
./replace_wrapper 'e' 'h'  < ./inputs/input/ruin.1833 
echo ">>>>>>>>running test 1185"
./replace_wrapper 'f' 'f \RbTgbc"N]M>?p2'\''g'\''\v'  < ./inputs/input/ruin.44 
echo ">>>>>>>>running test 1186"
./replace_wrapper 'g' 'A'  < ./inputs/input/ruin.127 
echo ">>>>>>>>running test 1187"
./replace_wrapper 'g' 'G*7D:6^_h`8n@*deLn'  < ./inputs/input/ruin.1859 
echo ">>>>>>>>running test 1188"
./replace_wrapper 'g' 'O>w-xOn _^8DDez8}PX=$`~'  < ./inputs/input/ruin.624 
echo ">>>>>>>>running test 1189"
./replace_wrapper 'h' '6'  < ./inputs/input/ruin.629 
echo ">>>>>>>>running test 1190"
./replace_wrapper 'h' 'C'  < ./inputs/input/ruin.1885 
echo ">>>>>>>>running test 1191"
./replace_wrapper 'i' '+-$GSJR|61O"bXEf~l@G#'  < ./inputs/input/ruin.1912 
echo ">>>>>>>>running test 1192"
./replace_wrapper 'i' '6'  < ./inputs/input/ruin.1031 
echo ">>>>>>>>running test 1193"
./replace_wrapper 'i' '62k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G'  < ./inputs/input/ruin.1031 
echo ">>>>>>>>running test 1194"
./replace_wrapper 'i' ';!{5}'  < ./inputs/input/ruin.115 
echo ">>>>>>>>running test 1195"
./replace_wrapper 'i' '<.'\''F=YB?N(u5L;RCvxh5pg/6B3Ma`Yy^~+2/S}'  < ./inputs/input/ruin.1938 
echo ">>>>>>>>running test 1196"
./replace_wrapper 'i' 't!8ey$58#h'  < ./inputs/input/ruin.78 
echo ">>>>>>>>running test 1197"
./replace_wrapper 'j' 'wa>o$un8[j}CvDtO'  < ./inputs/input/ruin.108 
echo ">>>>>>>>running test 1198"
./replace_wrapper 'l' 'f'  < ./inputs/input/ruin.946 
echo ">>>>>>>>running test 1199"
./replace_wrapper 'l' 'va~y^kcfJ^dEk~7R&7i`_HBl=+ccP_Sm]30txxupfl'\''{C#'  < ./inputs/input/ruin.1984 
echo ">>>>>>>>running test 1200"
./replace_wrapper 'm' '/'  < ./inputs/input/ruin.1114 
echo ">>>>>>>>running test 1201"
./replace_wrapper 'm' '0'  < ./inputs/input/ruin.879 
echo ">>>>>>>>running test 1202"
./replace_wrapper 'm' 'B9Fb'  < ./inputs/input/ruin.167 
echo ">>>>>>>>running test 1203"
./replace_wrapper 'm' 'Ml'  < ./inputs/input/ruin.1996 
echo ">>>>>>>>running test 1204"
./replace_wrapper 'm' 'X'  < ./inputs/input/ruin.459 
echo ">>>>>>>>running test 1205"
./replace_wrapper 'm*$' '/'  < ./inputs/input/ruin.1114 
echo ">>>>>>>>running test 1206"
./replace_wrapper 'm*$' 'Ml'  < ./inputs/input/ruin.1996 
echo ">>>>>>>>running test 1207"
./replace_wrapper 'm@n$' '7"py31%VhaB9=x'  < ./inputs/input/ruin.394 
echo ">>>>>>>>running test 1208"
./replace_wrapper 'n' '/T'  < ./inputs/input/ruin.594 
echo ">>>>>>>>running test 1209"
./replace_wrapper 'o' 'GX,Cu(WNj'  < ./inputs/input/ruin.1749 
echo ">>>>>>>>running test 1210"
./replace_wrapper 'o' ']'  < ./inputs/input/ruin.1577 
echo ">>>>>>>>running test 1211"
./replace_wrapper 'o'\''-' 'e'  < ./inputs/input/ruin.1907 
echo ">>>>>>>>running test 1212"
./replace_wrapper 'o@@' '+'  < ./inputs/input/ruin.568 
echo ">>>>>>>>running test 1213"
./replace_wrapper 'p' 'I'  < ./inputs/input/ruin.413 
echo ">>>>>>>>running test 1214"
./replace_wrapper 'p*' '"WJ +9!ApjK'  < ./inputs/input/ruin.1399 
echo ">>>>>>>>running test 1215"
./replace_wrapper 'p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<A[^a-c][0-9]@[*' '&a@%'  < ./inputs/temp-test/589.inp.253.1 
echo ">>>>>>>>running test 1216"
./replace_wrapper 'p@n' 'a&L'  < ./inputs/input/ruin.274 
echo ">>>>>>>>running test 1217"
./replace_wrapper 'q' 'E'  < ./inputs/input/ruin.1057 
echo ">>>>>>>>running test 1218"
./replace_wrapper 'q' 'E7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp'  < ./inputs/input/ruin.1057 
echo ">>>>>>>>running test 1219"
./replace_wrapper 'q' 'IirRPe>0iIjW%K:~^H{21R'  < ./inputs/input/ruin.1552 
echo ">>>>>>>>running test 1220"
./replace_wrapper 'q' 'cC4(j6a>IX1EH2r{.d V<%s]2X'  < ./inputs/input/ruin.1589 
echo ">>>>>>>>running test 1221"
./replace_wrapper 'q' 'wt5(~7ozr>3'\''R6}}$ro{9ghx'\''5eBz~[SZ4aw98rWZ8pN;p}dh{awT!'  < ./inputs/input/ruin.521 
echo ">>>>>>>>running test 1222"
./replace_wrapper 'q'\''Ck;oR7' 'jGU}XIi?]qLF"YtOv~~lB;!5+a):Y'  < ./inputs/input/ruin.1348 
echo ">>>>>>>>running test 1223"
./replace_wrapper 'qz' 'm'  < ./inputs/input/ruin.1357 
echo ">>>>>>>>running test 1224"
./replace_wrapper 'r' 'P wrT^[v'  < ./inputs/input/ruin.1889 
echo ">>>>>>>>running test 1225"
./replace_wrapper 'r' '['  < ./inputs/input/ruin.478 
echo ">>>>>>>>running test 1226"
./replace_wrapper 's$' '4'  < ./inputs/input/ruin.847 
echo ">>>>>>>>running test 1227"
./replace_wrapper 's' '*idnvvLz)]37D7^a'  < ./inputs/input/ruin.769 
echo ">>>>>>>>running test 1228"
./replace_wrapper 's' 'S'  < ./inputs/input/ruin.1649 
echo ">>>>>>>>running test 1229"
./replace_wrapper 's' '`o8oL$^vE P()\:5;1af!&IGg~yDx>RB6h0.,WNAuM%[x;Y'\''xp$2DN'  < ./inputs/input/ruin.860 
echo ">>>>>>>>running test 1230"
./replace_wrapper 's' 'ke_A{j'\''5'  < ./inputs/input/ruin.1648 
echo ">>>>>>>>running test 1231"
./replace_wrapper 't$' 'H'  < ./inputs/input/ruin.1464 
echo ">>>>>>>>running test 1232"
./replace_wrapper 't' '-gf@/{AfvdzFO'  < ./inputs/input/ruin.1870 
echo ">>>>>>>>running test 1233"
./replace_wrapper 't' '@~jUa){1S?_^6GN)8I|&~"/L_(iq#'  < ./inputs/input/ruin.671 
echo ">>>>>>>>running test 1234"
./replace_wrapper 't' 'h'  < ./inputs/input/ruin.1416 
echo ">>>>>>>>running test 1235"
./replace_wrapper 'u' 'DCN4"{FW^I%=M8,i]G '\''FcEpuH'\''~c2^L3Bj35$J0LOJvv}q\z]'  < ./inputs/input/ruin.510 
echo ">>>>>>>>running test 1236"
./replace_wrapper 'u' 'In1%L5k:Ru\3H# ]-QF'  < ./inputs/input/ruin.1874 
echo ">>>>>>>>running test 1237"
./replace_wrapper 'u' 'T'  < ./inputs/input/ruin.466 
echo ">>>>>>>>running test 1238"
./replace_wrapper 'u' '[8$F_eY'  < ./inputs/input/ruin.1145 
echo ">>>>>>>>running test 1239"
./replace_wrapper 'u' 't'  < ./inputs/input/ruin.1124 
echo ">>>>>>>>running test 1240"
./replace_wrapper 'u' '}'  < ./inputs/input/ruin.1382 
echo ">>>>>>>>running test 1241"
./replace_wrapper 'u*$' 'NgW3k~nFJWW0d%"'  < ./inputs/input/ruin.1110 
echo ">>>>>>>>running test 1242"
./replace_wrapper 'v' 'c'  < ./inputs/input/ruin.729 
echo ">>>>>>>>running test 1243"
./replace_wrapper 'v' 'riSuHLH;6ksnxf-y2vuU^'  < ./inputs/input/ruin.1077 
echo ">>>>>>>>running test 1244"
./replace_wrapper 'v' 'w[(s3{cZZ~mUbU2(A$UX@ KoJ4[7oA qu?_|WJ GU OQxSx"j_l[Ws#!,Z4'\''9uk\B5>"[/<P%0gb>ExJ-"97v'  < ./inputs/input/ruin.499 
echo ">>>>>>>>running test 1245"
./replace_wrapper 'v' '{ndD U;N<EuDv3]risr=A?dbryA^dbz'  < ./inputs/input/ruin.985 
echo ">>>>>>>>running test 1246"
./replace_wrapper 'v?[0-9Z-a]^_`a]' ''  < ./inputs/input/ruin.83 
echo ">>>>>>>>running test 1247"
./replace_wrapper 'w$' 'es=b1R:cvVwr[0nH'\''uMteaL<TR6oIeq'  < ./inputs/input/ruin.1701 
echo ">>>>>>>>running test 1248"
./replace_wrapper 'w' '%.:s|HwIZ`s.lwvoiM&7g$TlM%Pgcz5^x LSK@J>YVY]'  < ./inputs/input/ruin.1550 
echo ">>>>>>>>running test 1249"
./replace_wrapper 'w' '5b'  < ./inputs/input/ruin.918 
echo ">>>>>>>>running test 1250"
./replace_wrapper 'w' 'U'  < ./inputs/input/ruin.1551 
echo ">>>>>>>>running test 1251"
./replace_wrapper 'x' '!TZ_|!54C3*^$['  < ./inputs/input/ruin.1025 
echo ">>>>>>>>running test 1252"
./replace_wrapper 'x' 'Q>P#tF'  < ./inputs/input/ruin.598 
echo ">>>>>>>>running test 1253"
./replace_wrapper 'x' 'vif#21aJuxd&,I1PPnf{b,On|j&db8)b<`\|'  < ./inputs/input/ruin.334 
echo ">>>>>>>>running test 1254"
./replace_wrapper 'y' '$'  < ./inputs/input/ruin.1699 
echo ">>>>>>>>running test 1255"
./replace_wrapper 'y/' 'G'  < ./inputs/input/ruin.1713 
echo ">>>>>>>>running test 1256"
./replace_wrapper 'z' '7N?!wFKF+nl$JG]\l|P\}]'\'''  < ./inputs/input/ruin.198 
echo ">>>>>>>>running test 1257"
./replace_wrapper 'z' 'RquQ5Vxh[sU1'  < ./inputs/input/ruin.479 
echo ">>>>>>>>running test 1258"
./replace_wrapper 'z' '|!]P(D3RiY#b#z'\''7|UAr}'  < ./inputs/input/ruin.1002 
echo ">>>>>>>>running test 1259"
./replace_wrapper '{' '+*99`cWbDE]&LL%\!=ocKQ'\''O+.[_4C@]'\''8'  < ./inputs/input/ruin.688 
echo ">>>>>>>>running test 1260"
./replace_wrapper '{' 'Q'  < ./inputs/input/ruin.1832 
echo ">>>>>>>>running test 1261"
./replace_wrapper '{' 'Y'  < ./inputs/input/ruin.1448 
echo ">>>>>>>>running test 1262"
./replace_wrapper '{' 'hn3sgyo$9.^y`X";72$qC'\'')fKf!'\''B'  < ./inputs/input/ruin.719 
echo ">>>>>>>>running test 1263"
./replace_wrapper '{\uX+2-' 'R'  < ./inputs/input/ruin.316 
echo ">>>>>>>>running test 1264"
./replace_wrapper '|$' 'HfDW/Zd09jY~nUga6}A4YUa,Dqr3xYQE>t,EZ'  < ./inputs/input/ruin.715 
echo ">>>>>>>>running test 1265"
./replace_wrapper '|' '$YCh^I\Wj>ja*r1dJ<FtZj&?HW}wua}`udW[vu_T}W;'  < ./inputs/input/ruin.974 
echo ">>>>>>>>running test 1266"
./replace_wrapper '|' 'GwiK'\'']%o:MKot-V@"WY.'  < ./inputs/input/ruin.1445 
echo ">>>>>>>>running test 1267"
./replace_wrapper '|' '[zw'\''0!G]!FE'  < ./inputs/input/ruin.453 
echo ">>>>>>>>running test 1268"
./replace_wrapper '|?' 'E%+OB.\-JIJ"MhV]wdPWqi`t?QTW5`'  < ./inputs/input/ruin.555 
echo ">>>>>>>>running test 1269"
./replace_wrapper '}' ''  < ./inputs/input/ruin.824 
echo ">>>>>>>>running test 1270"
./replace_wrapper '}' 'r3pd3Trb.w]o@'  < ./inputs/input/ruin.1952 
echo ">>>>>>>>running test 1271"
./replace_wrapper '})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF[Z-a]^_[Z-a]^_*[Z-a]^_*' 'a'   < ./inputs/input/ruin.1616 
echo ">>>>>>>>running test 1272"
./replace_wrapper '~$' 'AD1^,&FOIyq7KTrQu^vZ]v\X&>^(W#CM^K@\|+;bEf2X?RkW'  < ./inputs/input/ruin.443 
echo ">>>>>>>>running test 1273"
./replace_wrapper '~' '8hxxn}h2[n]KY)mM?MnZ6t|h##e\}GBn}39c'  < ./inputs/input/ruin.1847 
echo ">>>>>>>>running test 1274"
./replace_wrapper '~' ':7WZ2'  < ./inputs/input/ruin.1295 
echo ">>>>>>>>running test 1275"
./replace_wrapper '~' 'M'  < ./inputs/input/ruin.39 
echo ">>>>>>>>running test 1276"
./replace_wrapper '~@@' 'ah'  < ./inputs/input/ruin.1313 
echo ">>>>>>>>running test 1277"
./replace_wrapper *4 5   < ./inputs/moni/f1.inp 
echo ">>>>>>>>running test 1278"
./replace_wrapper *[a-z]? 4  < ./inputs/moni/f2.inp 
echo ">>>>>>>>running test 1279"
./replace_wrapper  < ./inputs/input/ruin.1011 
echo ">>>>>>>>running test 1280"
./replace_wrapper  < ./inputs/input/ruin.1056 
echo ">>>>>>>>running test 1281"
./replace_wrapper  < ./inputs/input/ruin.1280 
echo ">>>>>>>>running test 1282"
./replace_wrapper  < ./inputs/input/ruin.1401 
echo ">>>>>>>>running test 1283"
./replace_wrapper  < ./inputs/input/ruin.1480 
echo ">>>>>>>>running test 1284"
./replace_wrapper  < ./inputs/input/ruin.1581 
echo ">>>>>>>>running test 1285"
./replace_wrapper  < ./inputs/input/ruin.1590 
echo ">>>>>>>>running test 1286"
./replace_wrapper  < ./inputs/input/ruin.1592 
echo ">>>>>>>>running test 1287"
./replace_wrapper  < ./inputs/input/ruin.1595 
echo ">>>>>>>>running test 1288"
./replace_wrapper  < ./inputs/input/ruin.1778 
echo ">>>>>>>>running test 1289"
./replace_wrapper  < ./inputs/input/ruin.1788 
echo ">>>>>>>>running test 1290"
./replace_wrapper  < ./inputs/input/ruin.1814 
echo ">>>>>>>>running test 1291"
./replace_wrapper  < ./inputs/input/ruin.2 
echo ">>>>>>>>running test 1292"
./replace_wrapper  < ./inputs/input/ruin.266 
echo ">>>>>>>>running test 1293"
./replace_wrapper  < ./inputs/input/ruin.271 
echo ">>>>>>>>running test 1294"
./replace_wrapper  < ./inputs/input/ruin.363 
echo ">>>>>>>>running test 1295"
./replace_wrapper  < ./inputs/input/ruin.400 
echo ">>>>>>>>running test 1296"
./replace_wrapper  < ./inputs/input/ruin.43 
echo ">>>>>>>>running test 1297"
./replace_wrapper  < ./inputs/input/ruin.622 
echo ">>>>>>>>running test 1298"
./replace_wrapper  < ./inputs/input/ruin.792 
echo ">>>>>>>>running test 1299"
./replace_wrapper  < ./inputs/input/ruin.957 
echo ">>>>>>>>running test 1300"
./replace_wrapper  < ./inputs/input/ruin.990 
echo ">>>>>>>>running test 1301"
./replace_wrapper '%jh[3-9]@f**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1302"
./replace_wrapper '%q' 'd'  < ./inputs/input/ruin.1813 
echo ">>>>>>>>running test 1303"
./replace_wrapper '%x' 'm~bsLkd.o0:yq^yMu$f*\Yc<'  < ./inputs/input/ruin.226 
echo ">>>>>>>>running test 1304"
./replace_wrapper '%yw,0+8@n' 'a&`'  < ./inputs/input/ruin.1158 
echo ">>>>>>>>running test 1305"
./replace_wrapper '%z$' '*'  < ./inputs/input/ruin.1693 
echo ">>>>>>>>running test 1306"
./replace_wrapper '%|$' 'j'  < ./inputs/input/ruin.944 
echo ">>>>>>>>running test 1307"
./replace_wrapper '&$ab**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1308"
./replace_wrapper '&' 'II|-#'  < ./inputs/input/ruin.673 
echo ">>>>>>>>running test 1309"
./replace_wrapper '&' 'e&R7H2HKc,  kd7Q<uPE<Zx+ ah'  < ./inputs/input/ruin.1422 
echo ">>>>>>>>running test 1310"
./replace_wrapper '&' 'e'  < ./inputs/input/ruin.1537 
echo ">>>>>>>>running test 1311"
./replace_wrapper '&' 'pg'  < ./inputs/input/ruin.124 
echo ">>>>>>>>running test 1312"
./replace_wrapper '&6 **' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1313"
./replace_wrapper '' ' '  < ./inputs/input/ruin.452 
echo ">>>>>>>>running test 1314"
./replace_wrapper '' '!'  < ./inputs/input/ruin.922 
echo ">>>>>>>>running test 1315"
./replace_wrapper '' '"'  < ./inputs/input/ruin.1728 
echo ">>>>>>>>running test 1316"
./replace_wrapper '' '$'  < ./inputs/input/ruin.1750 
echo ">>>>>>>>running test 1317"
./replace_wrapper '' ''\''Z y<j$`3-b6{hC,KW4dJZ\tWkm'  < ./inputs/input/ruin.1104 
echo ">>>>>>>>running test 1318"
./replace_wrapper '' '(,t{kot~t4%]~"i|?`&\Qrhl6SO&4rT\Y[].'  < ./inputs/input/ruin.1822 
echo ">>>>>>>>running test 1319"
./replace_wrapper '' '(h.--"zy)?N*:eh'  < ./inputs/input/ruin.1899 
echo ">>>>>>>>running test 1320"
./replace_wrapper '' ').EgV46YLA|t(jN!%1'\''AO,A_{pP_'  < ./inputs/input/ruin.1835 
echo ">>>>>>>>running test 1321"
./replace_wrapper '' '-'  < ./inputs/input/ruin.373 
echo ">>>>>>>>running test 1322"
./replace_wrapper '' '-'  < ./inputs/input/ruin.705 
echo ">>>>>>>>running test 1323"
./replace_wrapper '' '-,i3&R}<-W[ItMRB{.b2mI]T1UZKpg'  < ./inputs/input/ruin.772 
echo ">>>>>>>>running test 1324"
./replace_wrapper '' '1'  < ./inputs/input/ruin.227 
echo ">>>>>>>>running test 1325"
./replace_wrapper '' '2'  < ./inputs/input/ruin.236 
echo ">>>>>>>>running test 1326"
./replace_wrapper '' '4k2I3Sx/L.0lMc,Ct<O91xn!N!6XD)Za'  < ./inputs/input/ruin.440 
echo ">>>>>>>>running test 1327"
./replace_wrapper '' '9'  < ./inputs/input/ruin.1064 
echo ">>>>>>>>running test 1328"
./replace_wrapper '' ';C5Q#+!5V<oSjIW"k3~oP *vIBN'  < ./inputs/input/ruin.257 
echo ">>>>>>>>running test 1329"
./replace_wrapper '' '>'  < ./inputs/input/ruin.628 
echo ">>>>>>>>running test 1330"
./replace_wrapper '' '@g5fQ|ruR,ZAD+Q/'  < ./inputs/input/ruin.19 
echo ">>>>>>>>running test 1331"
./replace_wrapper '' 'BTKzQX[0{Fdkhsx%lQ<KOmjPx{RO4%y?I<*;>77`@akb|!'\''B~Awc]Rw*Jg;joAvfHhyE_e3'  < ./inputs/input/ruin.861 
echo ">>>>>>>>running test 1332"
./replace_wrapper '' 'E4\70!JDTfF[Z}ggd'  < ./inputs/input/ruin.880 
echo ">>>>>>>>running test 1333"
./replace_wrapper '' 'G'  < ./inputs/input/ruin.1466 
echo ">>>>>>>>running test 1334"
./replace_wrapper '' 'G'  < ./inputs/input/ruin.1563 
echo ">>>>>>>>running test 1335"
./replace_wrapper '' 'K'  < ./inputs/input/ruin.1852 
echo ">>>>>>>>running test 1336"
./replace_wrapper '' 'K'  < ./inputs/input/ruin.259 
echo ">>>>>>>>running test 1337"
./replace_wrapper '' 'K'  < ./inputs/input/ruin.859 
echo ">>>>>>>>running test 1338"
./replace_wrapper '' 'L/FLz+< y/Ch49G5.NnZ7s2<*w+Vf,L2'  < ./inputs/input/ruin.134 
echo ">>>>>>>>running test 1339"
./replace_wrapper '' 'M8|(B=(H(T{P 1$~klg'  < ./inputs/input/ruin.114 
echo ">>>>>>>>running test 1340"
./replace_wrapper '' 'M\?#!~.)L* N'\''8%*?\DH&Kn+Kb$@&?H! '\''b<+~(8QgW'\''k('  < ./inputs/input/ruin.1652 
echo ">>>>>>>>running test 1341"
./replace_wrapper '' 'Pd#(tEJLie`_i@Qb,]e66XCMVy8%p9<>%Z[P'  < ./inputs/input/ruin.221 
echo ">>>>>>>>running test 1342"
./replace_wrapper '' 'T'  < ./inputs/input/ruin.1744 
echo ">>>>>>>>running test 1343"
./replace_wrapper '' 'T'  < ./inputs/input/ruin.1755 
echo ">>>>>>>>running test 1344"
./replace_wrapper '' 'U@DbH]&>ZR('  < ./inputs/input/ruin.1839 
echo ">>>>>>>>running test 1345"
./replace_wrapper '' 'VcA~!1&(Sea@k2P2'  < ./inputs/input/ruin.1776 
echo ">>>>>>>>running test 1346"
./replace_wrapper '' 'Y!ME~#'  < ./inputs/input/ruin.1170 
echo ">>>>>>>>running test 1347"
./replace_wrapper '' '^TA6q#%uc@pEv0e!Gk8Z?vyYdyRhx~|6\ BY7fs}+:K7S'  < ./inputs/input/ruin.1437 
echo ">>>>>>>>running test 1348"
./replace_wrapper '' '_'  < ./inputs/input/ruin.1427 
echo ">>>>>>>>running test 1349"
./replace_wrapper '' 'a'  < ./inputs/input/ruin.696 
echo ">>>>>>>>running test 1350"
./replace_wrapper '' 'c'  < ./inputs/input/ruin.1135 
echo ">>>>>>>>running test 1351"
./replace_wrapper '' 'd'  < ./inputs/input/ruin.584 
echo ">>>>>>>>running test 1352"
./replace_wrapper '' 'dV\?Qb7f]GZ:YV(22%ESH;?$'  < ./inputs/input/ruin.1160 
echo ">>>>>>>>running test 1353"
./replace_wrapper '' 'f'  < ./inputs/input/ruin.557 
echo ">>>>>>>>running test 1354"
./replace_wrapper '' 'h'  < ./inputs/input/ruin.1966 
echo ">>>>>>>>running test 1355"
./replace_wrapper '' 'j'  < ./inputs/input/ruin.1735 
echo ">>>>>>>>running test 1356"
./replace_wrapper '' 'j@+'  < ./inputs/input/ruin.339 
echo ">>>>>>>>running test 1357"
./replace_wrapper '' 'kGv'\''@V.cj'  < ./inputs/input/ruin.1518 
echo ">>>>>>>>running test 1358"
./replace_wrapper '' 'l[*U(0T7mn'  < ./inputs/input/ruin.1352 
echo ">>>>>>>>running test 1359"
./replace_wrapper '' 'n'  < ./inputs/input/ruin.724 
echo ">>>>>>>>running test 1360"
./replace_wrapper '' 'oB'  < ./inputs/input/ruin.220 
echo ">>>>>>>>running test 1361"
./replace_wrapper '' 'ua1CB[Gc%"D/ ~h[ifc{.'\'''  < ./inputs/input/ruin.375 
echo ">>>>>>>>running test 1362"
./replace_wrapper '' 'v'  < ./inputs/input/ruin.1429 
echo ">>>>>>>>running test 1363"
./replace_wrapper '' 'x'  < ./inputs/input/ruin.886 
echo ">>>>>>>>running test 1364"
./replace_wrapper '' 'x|g=Y,'  < ./inputs/input/ruin.1880 
echo ">>>>>>>>running test 1365"
./replace_wrapper '' '{#umxUXsQww[=tD`2X'  < ./inputs/input/ruin.211 
echo ">>>>>>>>running test 1366"
./replace_wrapper '' '{'  < ./inputs/input/ruin.1255 
echo ">>>>>>>>running test 1367"
./replace_wrapper '' '|,'  < ./inputs/input/ruin.1173 
echo ">>>>>>>>running test 1368"
./replace_wrapper '' '|g4|;Y<)c'\''5\IC5utpVH'  < ./inputs/input/ruin.784 
echo ">>>>>>>>running test 1369"
./replace_wrapper '' '}'  < ./inputs/input/ruin.1066 
echo ">>>>>>>>running test 1370"
./replace_wrapper '' '~]/'  < ./inputs/input/ruin.1237 
echo ">>>>>>>>running test 1371"
./replace_wrapper '' '~]/*$'  < ./inputs/input/ruin.1237 
echo ">>>>>>>>running test 1372"
./replace_wrapper '' op  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 1373"
./replace_wrapper ''\'' nKE'\''?' '(/>AguC9He H1#DQ$_\3z;giEd'  < ./inputs/input/ruin.869 
echo ">>>>>>>>running test 1374"
./replace_wrapper ''\''$' '%'  < ./inputs/input/ruin.783 
echo ">>>>>>>>running test 1375"
./replace_wrapper ''\''' 'm%NN3G5'  < ./inputs/input/ruin.92 
echo ">>>>>>>>running test 1376"
./replace_wrapper ''\''0i[^>]' 'f%JGn8F(1'\''2X1w#F4X@ `bKu'\''z5>%"1xr,|i^;H0+u)A]'  < ./inputs/input/ruin.698 
echo ">>>>>>>>running test 1377"
./replace_wrapper ''\''3*' '!5'  < ./inputs/input/ruin.1359 
echo ">>>>>>>>running test 1378"
./replace_wrapper ''\''3fR]'\''f!t@@' 'h3'  < ./inputs/input/ruin.1757 
echo ">>>>>>>>running test 1379"
./replace_wrapper ''\''5@=' 'Zi8'  < ./inputs/input/ruin.1978 
echo ">>>>>>>>running test 1380"
./replace_wrapper ''\''<"7y7*' '$6B1-CefGQQf]dVO#lukP'  < ./inputs/input/ruin.183 
echo ">>>>>>>>running test 1381"
./replace_wrapper ''\''=,bX!+@@[y]' 'cC'  < ./inputs/input/ruin.706 
echo ">>>>>>>>running test 1382"
./replace_wrapper ''\''?*@n' 'R$W\g?~KtfT Z7}t^C<isN=sCXIezpz-\C8xg)"zcmNP'  < ./inputs/input/ruin.722 
echo ">>>>>>>>running test 1383"
./replace_wrapper ''\''A@@D' '0'  < ./inputs/input/ruin.890 
echo ">>>>>>>>running test 1384"
./replace_wrapper ''\''Hs$' 'vvG{[/ZzAySoM$[X*ij4,vM1}^Xs2$L"^/ XIb_'  < ./inputs/input/ruin.718 
echo ">>>>>>>>running test 1385"
./replace_wrapper ''\''\m' '+6DCv5ol)/q7p'  < ./inputs/input/ruin.1639 
echo ">>>>>>>>running test 1386"
./replace_wrapper ''\''`2ZFWK[^0-9A-G]' '^U7*jCT2uSAbKD0d,m2|1|q ]|'  < ./inputs/input/ruin.1624 
echo ">>>>>>>>running test 1387"
./replace_wrapper ''\''`2ZFWK[^0-9A-G]?*' '^U7*jCT2uSAbKD0d,m2|1|q ]|'  < ./inputs/input/ruin.1624 
echo ">>>>>>>>running test 1388"
./replace_wrapper ''\''ae[d_$T?' 'i'  < ./inputs/input/ruin.838 
echo ">>>>>>>>running test 1389"
./replace_wrapper ''\''dwM?' '!'  < ./inputs/input/ruin.87 
echo ">>>>>>>>running test 1390"
./replace_wrapper ''\''i,Zl' 'JocZqS0rv$$&knoDor[tO8v }wC!q.H:B~)^t^zXX)@hl%'  < ./inputs/input/ruin.348 
echo ">>>>>>>>running test 1391"
./replace_wrapper ''\''vb(#?' 'E[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur'  < ./inputs/input/ruin.1328 
echo ">>>>>>>>running test 1392"
./replace_wrapper ''\''vb(#?' 'E[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\'[a-z]*[0-9]*'+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur'  < ./inputs/input/ruin.1328 
echo ">>>>>>>>running test 1393"
./replace_wrapper ')' '%QdHuGpf=?qy 3~3QQ_2yf8K<@XUjm78_'  < ./inputs/input/ruin.42 
echo ">>>>>>>>running test 1394"
./replace_wrapper ')' 'G(:jQg6w{T Va1#rG@ Oh{y=E`8'  < ./inputs/input/ruin.1685 
echo ">>>>>>>>running test 1395"
./replace_wrapper ')' 'bj:]m@p4*VSsQ[P&I)~5Q'  < ./inputs/input/ruin.410 
echo ">>>>>>>>running test 1396"
./replace_wrapper ')[^~]' 'HnY<{aYd91.NgWAZ'  < ./inputs/input/ruin.1831 
echo ">>>>>>>>running test 1397"
./replace_wrapper '*$' '2'  < ./inputs/input/ruin.849 
echo ">>>>>>>>running test 1398"
./replace_wrapper '*$' '4'  < ./inputs/input/ruin.476 
echo ">>>>>>>>running test 1399"
./replace_wrapper '*$' '9Yd(bzS<c l?GhI'  < ./inputs/input/ruin.100 
echo ">>>>>>>>running test 1400"
./replace_wrapper '*$' 'D'  < ./inputs/input/ruin.1998 
echo ">>>>>>>>running test 1401"
./replace_wrapper '*$' 'L'  < ./inputs/input/ruin.432 
echo ">>>>>>>>running test 1402"
./replace_wrapper '*$' '`'  < ./inputs/input/ruin.1249 
echo ">>>>>>>>running test 1403"
./replace_wrapper '*$' 'ap[D!P=9JT#e4"ii]*DCP)_yR'  < ./inputs/input/ruin.1956 
echo ">>>>>>>>running test 1404"
./replace_wrapper '*$' 'f'  < ./inputs/input/ruin.1108 
echo ">>>>>>>>running test 1405"
./replace_wrapper '*$' 'l'  < ./inputs/input/ruin.1251 
echo ">>>>>>>>running test 1406"
./replace_wrapper '*$' 'nDf38_|G_<?#50:)+jM'  < ./inputs/input/ruin.1242 
echo ">>>>>>>>running test 1407"
./replace_wrapper '*$' 'w'  < ./inputs/input/ruin.1436 
echo ">>>>>>>>running test 1408"
./replace_wrapper '*$' '{'  < ./inputs/input/ruin.1255 
echo ">>>>>>>>running test 1409"
./replace_wrapper '*&\:H@@Y\' '7'  < ./inputs/input/ruin.1704 
echo ">>>>>>>>running test 1410"
./replace_wrapper '*'   < ./inputs/input/ruin.1162 
echo ">>>>>>>>running test 1411"
./replace_wrapper '*'   < ./inputs/input/ruin.1269 
echo ">>>>>>>>running test 1412"
./replace_wrapper '*'   < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 1413"
./replace_wrapper '*' ' '  < ./inputs/input/ruin.1283 
echo ">>>>>>>>running test 1414"
./replace_wrapper '*' ' '  < ./inputs/input/ruin.486 
echo ">>>>>>>>running test 1415"
./replace_wrapper '*' ' iUr?ERqn:&}P0'  < ./inputs/input/ruin.582 
echo ">>>>>>>>running test 1416"
./replace_wrapper '*' ' vf6BS n\'\''3;^AX<~{)[+<ucX8fJ%lTq*f>$x;$K(G\Dx(x5daSW'\''ig%-P<``YCp1awN5jBMe!a{ehg6AAG9%P;+G[o_d6:'  < ./inputs/input/ruin.762 
echo ">>>>>>>>running test 1417"
./replace_wrapper '*' '!'  < ./inputs/input/ruin.471 
echo ">>>>>>>>running test 1418"
./replace_wrapper '*' '!'  < ./inputs/input/ruin.659 
echo ">>>>>>>>running test 1419"
./replace_wrapper '*' '#'  < ./inputs/input/ruin.1622 
echo ">>>>>>>>running test 1420"
./replace_wrapper '*' '#'  < ./inputs/input/ruin.866 
echo ">>>>>>>>running test 1421"
./replace_wrapper '*' '$'  < ./inputs/input/ruin.1528 
echo ">>>>>>>>running test 1422"
./replace_wrapper '*' '$QoC!xsIeF,A!nqn4vnEyMHomb8wt~}yL(:1p.(ks|;anN_?6/|L'  < ./inputs/input/ruin.809 
echo ">>>>>>>>running test 1423"
./replace_wrapper '*' '$U`XG#S'  < ./inputs/input/ruin.1319 
echo ">>>>>>>>running test 1424"
./replace_wrapper '*' '%'  < ./inputs/input/ruin.1122 
echo ">>>>>>>>running test 1425"
./replace_wrapper '*' '%2 ]TOV!zB)ez~h;W'\''Rv|F"FjKHB7'  < ./inputs/input/ruin.1720 
echo ">>>>>>>>running test 1426"
./replace_wrapper '*' '%Z}!'  < ./inputs/input/ruin.740 
echo ">>>>>>>>running test 1427"
./replace_wrapper '*' '&#tvW5KHbWqppCxb#?ETu@O!uhsxBI)E%Bx6E9Db>;g[q'\''1'  < ./inputs/input/ruin.1533 
echo ">>>>>>>>running test 1428"
./replace_wrapper '*' '&'  < ./inputs/input/ruin.1071 
echo ">>>>>>>>running test 1429"
./replace_wrapper '*' '&'  < ./inputs/input/ruin.378 
echo ">>>>>>>>running test 1430"
./replace_wrapper '*' '&-EO<`uTW\}@>'  < ./inputs/input/ruin.415 
echo ">>>>>>>>running test 1431"
./replace_wrapper '*' '&@n'  < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 1432"
./replace_wrapper '*' '&tm#n4gz=9'  < ./inputs/input/ruin.1949 
echo ">>>>>>>>running test 1433"
./replace_wrapper '*' ''  < ./inputs/input/ruin.993 
echo ">>>>>>>>running test 1434"
./replace_wrapper '*' ''\''$ia|e*5g"jk"'\''6'  < ./inputs/input/ruin.516 
echo ">>>>>>>>running test 1435"
./replace_wrapper '*' ''\'''  < ./inputs/input/ruin.1968 
echo ">>>>>>>>running test 1436"
./replace_wrapper '*' ''\'',_{05yQ>]e2Ll},e5b]TTt}JwWxDfD`%\uKmF&L5CRcou0vj/m'  < ./inputs/input/ruin.1142 
echo ">>>>>>>>running test 1437"
./replace_wrapper '*' '(!('  < ./inputs/input/ruin.520 
echo ">>>>>>>>running test 1438"
./replace_wrapper '*' '*@czJB%'\''p!{sw~#<3`jZj&,nBHTJ/,[iy#['  < ./inputs/input/ruin.1272 
echo ">>>>>>>>running test 1439"
./replace_wrapper '*' '*eb47-Z1(o?{cRs3'\''-Z6a+{mK<8:Jtzs2<'  < ./inputs/input/ruin.171 
echo ">>>>>>>>running test 1440"
./replace_wrapper '*' '+'  < ./inputs/input/ruin.1137 
echo ">>>>>>>>running test 1441"
./replace_wrapper '*' '+m8CH#~??9k3<a6'  < ./inputs/input/ruin.408 
echo ">>>>>>>>running test 1442"
./replace_wrapper '*' ','  < ./inputs/input/ruin.1353 
echo ">>>>>>>>running test 1443"
./replace_wrapper '*' '-'  < ./inputs/input/ruin.1210 
echo ">>>>>>>>running test 1444"
./replace_wrapper '*' '-'  < ./inputs/input/ruin.241 
echo ">>>>>>>>running test 1445"
./replace_wrapper '*' '-4>'  < ./inputs/input/ruin.1834 
echo ">>>>>>>>running test 1446"
./replace_wrapper '*' '-D0?|{_vP-|TX(X=iq'  < ./inputs/input/ruin.1134 
echo ">>>>>>>>running test 1447"
./replace_wrapper '*' '-Sao&~r'\'':~.S]#LZyv}n8e.'  < ./inputs/input/ruin.458 
echo ">>>>>>>>running test 1448"
./replace_wrapper '*' '.'  < ./inputs/input/ruin.1675 
echo ">>>>>>>>running test 1449"
./replace_wrapper '*' '.H[:am)]H.Eaz0xd\*+'\''@~q>B~N<'\''W'  < ./inputs/input/ruin.881 
echo ">>>>>>>>running test 1450"
./replace_wrapper '*' '.L'  < ./inputs/input/ruin.17 
echo ">>>>>>>>running test 1451"
./replace_wrapper '*' '.f/!.,_~+OWno#EPEePE'\''`.sN#uxti:ia9h##A?$NO'  < ./inputs/input/ruin.59 
echo ">>>>>>>>running test 1452"
./replace_wrapper '*' '/'  < ./inputs/input/ruin.1605 
echo ">>>>>>>>running test 1453"
./replace_wrapper '*' '/'  < ./inputs/input/ruin.336 
echo ">>>>>>>>running test 1454"
./replace_wrapper '*' '0'  < ./inputs/input/ruin.1951 
echo ">>>>>>>>running test 1455"
./replace_wrapper '*' '1'  < ./inputs/input/ruin.1468 
echo ">>>>>>>>running test 1456"
./replace_wrapper '*' '2b;'\''An'  < ./inputs/input/ruin.923 
echo ">>>>>>>>running test 1457"
./replace_wrapper '*' '3'  < ./inputs/input/ruin.738 
echo ">>>>>>>>running test 1458"
./replace_wrapper '*' '3_a9tyP_K'  < ./inputs/input/ruin.224 
echo ">>>>>>>>running test 1459"
./replace_wrapper '*' '3iSUKlIcJY@zzKt\o}E]o[Nt}2@,!\FR +S:,^u'  < ./inputs/input/ruin.1795 
echo ">>>>>>>>running test 1460"
./replace_wrapper '*' '3ntGq*:GgM74d~I<l'  < ./inputs/input/ruin.104 
echo ">>>>>>>>running test 1461"
./replace_wrapper '*' '4j'  < ./inputs/input/ruin.1715 
echo ">>>>>>>>running test 1462"
./replace_wrapper '*' '5'  < ./inputs/input/ruin.651 
echo ">>>>>>>>running test 1463"
./replace_wrapper '*' '5'  < ./inputs/input/ruin.931 
echo ">>>>>>>>running test 1464"
./replace_wrapper '*' '5.'  < ./inputs/input/ruin.1186 
echo ">>>>>>>>running test 1465"
./replace_wrapper '*' '5UQx)=#p,UFSk#_5dkspr'  < ./inputs/input/ruin.449 
echo ">>>>>>>>running test 1466"
./replace_wrapper '*' '5_edflj&5h8_DCEi.gTlx*L#a)htiLD2@W$74Vc.L'  < ./inputs/input/ruin.325 
echo ">>>>>>>>running test 1467"
./replace_wrapper '*' '6'  < ./inputs/input/ruin.554 
echo ">>>>>>>>running test 1468"
./replace_wrapper '*' '7%;n!0;'  < ./inputs/input/ruin.817 
echo ">>>>>>>>running test 1469"
./replace_wrapper '*' '7'  < ./inputs/input/ruin.1442 
echo ">>>>>>>>running test 1470"
./replace_wrapper '*' '7'  < ./inputs/input/ruin.1983 
echo ">>>>>>>>running test 1471"
./replace_wrapper '*' '8'  < ./inputs/input/ruin.1052 
echo ">>>>>>>>running test 1472"
./replace_wrapper '*' '8'  < ./inputs/input/ruin.947 
echo ">>>>>>>>running test 1473"
./replace_wrapper '*' '8pAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7m'  < ./inputs/input/ruin.1052 
echo ">>>>>>>>running test 1474"
./replace_wrapper '*' '9y}x\e/hlao4-J,5Brx*UDmoT |WPY biu:":Vt'\''b?)#uE}Fft%rk;(wUa8r'  < ./inputs/input/ruin.1569 
echo ">>>>>>>>running test 1475"
./replace_wrapper '*' ': 4`?Kz] u"eMDvLqtSl$_5S"|{_5'  < ./inputs/input/ruin.788 
echo ">>>>>>>>running test 1476"
./replace_wrapper '*' ':'  < ./inputs/input/ruin.1308 
echo ">>>>>>>>running test 1477"
./replace_wrapper '*' ':'  < ./inputs/input/ruin.1967 
echo ">>>>>>>>running test 1478"
./replace_wrapper '*' ':'  < ./inputs/input/ruin.905 
echo ">>>>>>>>running test 1479"
./replace_wrapper '*' ':J->WYooGp*:r1[?,ZWzKCBB'  < ./inputs/input/ruin.640 
echo ">>>>>>>>running test 1480"
./replace_wrapper '*' ';<'\''v`iDr8;#lj`gFV{L1E`F>Wn'\''ZeP'\''LY7t6)T'  < ./inputs/input/ruin.1507 
echo ">>>>>>>>running test 1481"
./replace_wrapper '*' ';vzFr_%VsZj81=`|r?_&t6Pcx5x(hTheq0yE75]Z'  < ./inputs/input/ruin.815 
echo ">>>>>>>>running test 1482"
./replace_wrapper '*' '<.!=Ljt]D4[&K:%i/`t%;>'  < ./inputs/input/ruin.758 
echo ">>>>>>>>running test 1483"
./replace_wrapper '*' '<26no'\''uHp_tNoqJ*[!mGwAfC<bg#fVUjsVhF_U_k:[qge8m2A%!'  < ./inputs/input/ruin.1216 
echo ">>>>>>>>running test 1484"
./replace_wrapper '*' '<[IB@lD7)<VIn-|{+ijt<n}oz'\''p0w0!k]U/~],98q&^,HLc9:nJD!S k-gi]}g/m'  < ./inputs/input/ruin.1269 
echo ">>>>>>>>running test 1485"
./replace_wrapper '*' '='  < ./inputs/input/ruin.1162 
echo ">>>>>>>>running test 1486"
./replace_wrapper '*' '='  < ./inputs/input/ruin.1676 
echo ">>>>>>>>running test 1487"
./replace_wrapper '*' '>'  < ./inputs/input/ruin.1417 
echo ">>>>>>>>running test 1488"
./replace_wrapper '*' '>'  < ./inputs/input/ruin.536 
echo ">>>>>>>>running test 1489"
./replace_wrapper '*' '?'  < ./inputs/input/ruin.439 
echo ">>>>>>>>running test 1490"
./replace_wrapper '*' '?1#YUPSP}y'  < ./inputs/input/ruin.810 
echo ">>>>>>>>running test 1491"
./replace_wrapper '*' '?MXR'\''>)$r(Yfiq~ eO66s=VLR;[T'  < ./inputs/input/ruin.1800 
echo ">>>>>>>>running test 1492"
./replace_wrapper '*' '?{+v!^lJqvUd,&s,5{=7vA'  < ./inputs/input/ruin.420 
echo ">>>>>>>>running test 1493"
./replace_wrapper '*' '@'  < ./inputs/input/ruin.1262 
echo ">>>>>>>>running test 1494"
./replace_wrapper '*' '@'  < ./inputs/input/ruin.878 
echo ">>>>>>>>running test 1495"
./replace_wrapper '*' 'A8@$#5>kr^SZP|_Cg|q`l3R].uI*'  < ./inputs/input/ruin.1758 
echo ">>>>>>>>running test 1496"
./replace_wrapper '*' 'Ayxg=po%]]@lhZe,xFP.{F:@m}I)|?,Wlw>ppLMMd[{R'  < ./inputs/input/ruin.512 
echo ">>>>>>>>running test 1497"
./replace_wrapper '*' 'B'  < ./inputs/input/ruin.1219 
echo ">>>>>>>>running test 1498"
./replace_wrapper '*' 'B'  < ./inputs/input/ruin.502 
echo ">>>>>>>>running test 1499"
./replace_wrapper '*' 'BIH%mo6 M)u#WKgz[L!G}2t%[6!AE1C:jV9'  < ./inputs/input/ruin.426 
echo ">>>>>>>>running test 1500"
./replace_wrapper '*' 'C@-U'  < ./inputs/input/ruin.576 
echo ">>>>>>>>running test 1501"
./replace_wrapper '*' 'CkXBvnICbdWao|!`=Pm+@9I5TWu'  < ./inputs/input/ruin.1310 
echo ">>>>>>>>running test 1502"
./replace_wrapper '*' 'D'  < ./inputs/input/ruin.1998 
echo ">>>>>>>>running test 1503"
./replace_wrapper '*' 'D'  < ./inputs/input/ruin.88 
echo ">>>>>>>>running test 1504"
./replace_wrapper '*' 'D>gwriB0<V^6qti|/%?0C)#MA8+AZ&'  < ./inputs/input/ruin.704 
echo ">>>>>>>>running test 1505"
./replace_wrapper '*' 'DVM*w<2(OU&\_HGSyM6o2TxiF3]v37y.opwBH/&y2'\''-V4^vk?H'\''5HuognF[}F&n@V'  < ./inputs/input/ruin.1733 
echo ">>>>>>>>running test 1506"
./replace_wrapper '*' 'EzQo'\''9xwbhkZ:|Y)F,jmC}rWN$1^*3AXp\yo:rrvFH#UO#7$>_0ibL;x)G=@uxqR=0o|dZD|zN):dC'  < ./inputs/input/ruin.1910 
echo ">>>>>>>>running test 1507"
./replace_wrapper '*' 'F- 5tmxsbhUa<v*Mh)mZ{*^\$!10qKy6k>5S [5tI04mu&{.bpKg?g%,UdYLMhG&]z'  < ./inputs/input/ruin.976 
echo ">>>>>>>>running test 1508"
./replace_wrapper '*' 'GvQA5d6`7{`G3X{D9:+:'\''4^ZW$MP%0GpyOHhdXF+\dDLkTp'  < ./inputs/input/ruin.899 
echo ">>>>>>>>running test 1509"
./replace_wrapper '*' 'H'  < ./inputs/input/ruin.1945 
echo ">>>>>>>>running test 1510"
./replace_wrapper '*' 'H'  < ./inputs/input/ruin.485 
echo ">>>>>>>>running test 1511"
./replace_wrapper '*' 'H4{}`[,(g4eKdkV-$X;D32HgE %[Qrg"nm&,iYO"EGYFqntnujmPVm<T=X'  < ./inputs/input/ruin.75 
echo ">>>>>>>>running test 1512"
./replace_wrapper '*' 'H4{}`[,(g4eKdkV-$X;D32HgE %[Qrg"nm&,iYO"EGYFqntnujmPVm<T=X[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n[Z-a]^_`a]*@n'  < ./inputs/input/ruin.75 
echo ">>>>>>>>running test 1513"
./replace_wrapper '*' 'H5d'  < ./inputs/input/ruin.1452 
echo ">>>>>>>>running test 1514"
./replace_wrapper '*' 'Hg:(OEg%`74JT=z=z'\''MGGx7ocG$N'  < ./inputs/input/ruin.752 
echo ">>>>>>>>running test 1515"
./replace_wrapper '*' 'I&i'\'''  < ./inputs/input/ruin.1404 
echo ">>>>>>>>running test 1516"
./replace_wrapper '*' 'I'  < ./inputs/input/ruin.1727 
echo ">>>>>>>>running test 1517"
./replace_wrapper '*' 'J'  < ./inputs/input/ruin.357 
echo ">>>>>>>>running test 1518"
./replace_wrapper '*' 'J'  < ./inputs/input/ruin.742 
echo ">>>>>>>>running test 1519"
./replace_wrapper '*' 'J;!rYgPGr|p,NR53Q55E`:ERqiKWg,iCq3t!'  < ./inputs/input/ruin.398 
echo ">>>>>>>>running test 1520"
./replace_wrapper '*' 'JG,;t-g_\pm0Y:}<mw$;B@%pVy"`g7Y[C2m(SpRFcb|w'  < ./inputs/input/ruin.118 
echo ">>>>>>>>running test 1521"
./replace_wrapper '*' 'L'  < ./inputs/input/ruin.1987 
echo ">>>>>>>>running test 1522"
./replace_wrapper '*' 'L'  < ./inputs/input/ruin.274 
echo ">>>>>>>>running test 1523"
./replace_wrapper '*' 'LPChM#M/":OzI UXX_Jv'\''7]M!CB'  < ./inputs/input/ruin.1521 
echo ">>>>>>>>running test 1524"
./replace_wrapper '*' 'LRg'  < ./inputs/input/ruin.1960 
echo ">>>>>>>>running test 1525"
./replace_wrapper '*' 'M'  < ./inputs/input/ruin.1185 
echo ">>>>>>>>running test 1526"
./replace_wrapper '*' 'M'  < ./inputs/input/ruin.636 
echo ">>>>>>>>running test 1527"
./replace_wrapper '*' 'M'  < ./inputs/input/ruin.645 
echo ">>>>>>>>running test 1528"
./replace_wrapper '*' 'M'  < ./inputs/input/ruin.825 
echo ">>>>>>>>running test 1529"
./replace_wrapper '*' 'MPKwD.47](#W/L3Yj'  < ./inputs/input/ruin.286 
echo ">>>>>>>>running test 1530"
./replace_wrapper '*' 'MXM`j+WFd5g=e}7'  < ./inputs/input/ruin.411 
echo ">>>>>>>>running test 1531"
./replace_wrapper '*' 'N'  < ./inputs/input/ruin.1737 
echo ">>>>>>>>running test 1532"
./replace_wrapper '*' 'N'  < ./inputs/input/ruin.1954 
echo ">>>>>>>>running test 1533"
./replace_wrapper '*' 'N'  < ./inputs/input/ruin.401 
echo ">>>>>>>>running test 1534"
./replace_wrapper '*' 'NgjG8_`kVg5[D5RE6nU5#"1'  < ./inputs/input/ruin.350 
echo ">>>>>>>>running test 1535"
./replace_wrapper '*' 'O'  < ./inputs/input/ruin.229 
echo ">>>>>>>>running test 1536"
./replace_wrapper '*' 'P'  < ./inputs/input/ruin.841 
echo ">>>>>>>>running test 1537"
./replace_wrapper '*' 'P54;@=_4xdN:$7^We'  < ./inputs/input/ruin.1620 
echo ">>>>>>>>running test 1538"
./replace_wrapper '*' 'P\ea4(T~AiIC=5Aj'\''`~lPq'  < ./inputs/input/ruin.1446 
echo ">>>>>>>>running test 1539"
./replace_wrapper '*' 'Pd?g(>Fc8M$8'  < ./inputs/input/ruin.435 
echo ">>>>>>>>running test 1540"
./replace_wrapper '*' 'Pq6$0Uv>*<O%B7'  < ./inputs/input/ruin.588 
echo ">>>>>>>>running test 1541"
./replace_wrapper '*' 'Q?]'  < ./inputs/input/ruin.1864 
echo ">>>>>>>>running test 1542"
./replace_wrapper '*' 'QCW =vT/1H-P(;wWsdk8,N.{|a <'  < ./inputs/input/ruin.473 
echo ">>>>>>>>running test 1543"
./replace_wrapper '*' 'QNaHbxy4*gJ7qH&xy:k#(fN84]]raEtv9Q}'  < ./inputs/input/ruin.418 
echo ">>>>>>>>running test 1544"
./replace_wrapper '*' 'R'  < ./inputs/input/ruin.1631 
echo ">>>>>>>>running test 1545"
./replace_wrapper '*' 'R'  < ./inputs/input/ruin.299 
echo ">>>>>>>>running test 1546"
./replace_wrapper '*' 'S'  < ./inputs/input/ruin.1398 
echo ">>>>>>>>running test 1547"
./replace_wrapper '*' 'Sm'  < ./inputs/input/ruin.60 
echo ">>>>>>>>running test 1548"
./replace_wrapper '*' 'T6PKI@&0O#B1Lh^{h]k6b|.%dFTDX2_5Hk{?}iSqsk"BO)2*{p{K<y$&)'\'''  < ./inputs/input/ruin.749 
echo ">>>>>>>>running test 1549"
./replace_wrapper '*' 'UE'\''%ko!Oi)bgbC-$;2(E\Z>n'  < ./inputs/input/ruin.1365 
echo ">>>>>>>>running test 1550"
./replace_wrapper '*' 'V'  < ./inputs/input/ruin.888 
echo ">>>>>>>>running test 1551"
./replace_wrapper '*' 'VLS~rJO,!qeNNS`W"Lej?|^?u*ao2Cc\oAXv3BifHHbA.'  < ./inputs/input/ruin.592 
echo ">>>>>>>>running test 1552"
./replace_wrapper '*' 'W[Ckn0Vg.DBF0Pcjo#(vLE}v?9^%([{x6'  < ./inputs/input/ruin.1126 
echo ">>>>>>>>running test 1553"
./replace_wrapper '*' 'X'  < ./inputs/input/ruin.765 
echo ">>>>>>>>running test 1554"
./replace_wrapper '*' 'Y'  < ./inputs/input/ruin.1136 
echo ">>>>>>>>running test 1555"
./replace_wrapper '*' 'Y'  < ./inputs/input/ruin.1902 
echo ">>>>>>>>running test 1556"
./replace_wrapper '*' 'Yv*l,JBe9^%Hb^*^GD pqO~_{'  < ./inputs/input/ruin.932 
echo ">>>>>>>>running test 1557"
./replace_wrapper '*' '['  < ./inputs/input/ruin.1312 
echo ">>>>>>>>running test 1558"
./replace_wrapper '*' '['  < ./inputs/input/ruin.611 
echo ">>>>>>>>running test 1559"
./replace_wrapper '*' '\'  < ./inputs/input/ruin.623 
echo ">>>>>>>>running test 1560"
./replace_wrapper '*' '\IA>XW?'\''N,gjA$j)'  < ./inputs/input/ruin.735 
echo ">>>>>>>>running test 1561"
./replace_wrapper '*' ']'  < ./inputs/input/ruin.858 
echo ">>>>>>>>running test 1562"
./replace_wrapper '*' ']nh3$maLj{=]f`6K5>fdDES`#&1Z*mW?lp{'  < ./inputs/input/ruin.1914 
echo ">>>>>>>>running test 1563"
./replace_wrapper '*' '^5i w+3P~!nu. d<Gv%'  < ./inputs/input/ruin.580 
echo ">>>>>>>>running test 1564"
./replace_wrapper '*' '_ZWn.!dHH9c^%X"vFT<2: '\''-YSnDcUFe%XPj"H8HfAhTvkxw'\''m'  < ./inputs/input/ruin.811 
echo ">>>>>>>>running test 1565"
./replace_wrapper '*' '`'  < ./inputs/input/ruin.138 
echo ">>>>>>>>running test 1566"
./replace_wrapper '*' '`bhi>$;X'  < ./inputs/input/ruin.1632 
echo ">>>>>>>>running test 1567"
./replace_wrapper '*' '`~lB<%:Nz?4&h442N'  < ./inputs/input/ruin.1486 
echo ">>>>>>>>running test 1568"
./replace_wrapper '*' 'a33iv(a|>Z(Ol1~oyl9@+q /1T,&KV%PJ@}]Jo?2BuXAg'  < ./inputs/input/ruin.1396 
echo ">>>>>>>>running test 1569"
./replace_wrapper '*' 'aE7jUPO'\''dYm{VX"Mit;I#WmSAh}7LXL4dYC8WM|1SUzIC^=xTXQ*Ewea'  < ./inputs/input/ruin.607 
echo ">>>>>>>>running test 1570"
./replace_wrapper '*' 'b$M]}'  < ./inputs/input/ruin.1334 
echo ">>>>>>>>running test 1571"
./replace_wrapper '*' 'b$MbJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<]}*[0-9]*[a-z]'  < ./inputs/input/ruin.1334 
echo ">>>>>>>>running test 1572"
./replace_wrapper '*' 'b'  < ./inputs/input/ruin.1926 
echo ">>>>>>>>running test 1573"
./replace_wrapper '*' 'b'  < ./inputs/input/ruin.289 
echo ">>>>>>>>running test 1574"
./replace_wrapper '*' 'b'  < ./inputs/input/ruin.396 
echo ">>>>>>>>running test 1575"
./replace_wrapper '*' 'b.j<'  < ./inputs/input/ruin.340 
echo ">>>>>>>>running test 1576"
./replace_wrapper '*' 'bLE@:(bDn~LPO3(w6HCZ[@47udWt,'\''-r\CT]_(9~('  < ./inputs/input/ruin.1231 
echo ">>>>>>>>running test 1577"
./replace_wrapper '*' 'bfA]{~U1GD+4 nhtf,jNx+DWX{d'  < ./inputs/input/ruin.447 
echo ">>>>>>>>running test 1578"
./replace_wrapper '*' 'cg'  < ./inputs/input/ruin.1013 
echo ">>>>>>>>running test 1579"
./replace_wrapper '*' 'cw!~'\''*5>*Nk]<ECo#CO,4"\7^74-'  < ./inputs/input/ruin.306 
echo ">>>>>>>>running test 1580"
./replace_wrapper '*' 'dfn~zcSQ=]etkUCr'  < ./inputs/input/ruin.1915 
echo ">>>>>>>>running test 1581"
./replace_wrapper '*' 'eT)'  < ./inputs/input/ruin.794 
echo ">>>>>>>>running test 1582"
./replace_wrapper '*' 'f'  < ./inputs/input/ruin.1108 
echo ">>>>>>>>running test 1583"
./replace_wrapper '*' 'f4'  < ./inputs/input/ruin.1785 
echo ">>>>>>>>running test 1584"
./replace_wrapper '*' 'fz8_]H+3t\.]f'  < ./inputs/input/ruin.697 
echo ">>>>>>>>running test 1585"
./replace_wrapper '*' 'h.4IrxEv=BU'\'')d0,04S7*xFvN//5VOKA('  < ./inputs/input/ruin.1498 
echo ">>>>>>>>running test 1586"
./replace_wrapper '*' 'h.TSi}6|%YSU&8M.i|jIUqv!h'  < ./inputs/input/ruin.1100 
echo ">>>>>>>>running test 1587"
./replace_wrapper '*' 'i'  < ./inputs/input/ruin.1587 
echo ">>>>>>>>running test 1588"
./replace_wrapper '*' 'jVtxSiz~whG5Bsg$Yy*S]e*_ g)vm"MOL..JBLrCfn.gL,_!El'  < ./inputs/input/ruin.1098 
echo ">>>>>>>>running test 1589"
./replace_wrapper '*' 'j^b+ EL'\''jFvDb.4t'\''C]yiF`GoLQ=kEowbH"jNZOe o3*L,>2`eNn0'  < ./inputs/input/ruin.317 
echo ">>>>>>>>running test 1590"
./replace_wrapper '*' 'k +/-CZfd?F4d8]ILL9J['  < ./inputs/input/ruin.1472 
echo ">>>>>>>>running test 1591"
./replace_wrapper '*' 'k'  < ./inputs/input/ruin.493 
echo ">>>>>>>>running test 1592"
./replace_wrapper '*' 'kL'  < ./inputs/input/ruin.563 
echo ">>>>>>>>running test 1593"
./replace_wrapper '*' 'kw'  < ./inputs/input/ruin.1696 
echo ">>>>>>>>running test 1594"
./replace_wrapper '*' 'l'  < ./inputs/input/ruin.1251 
echo ">>>>>>>>running test 1595"
./replace_wrapper '*' 'le8z7y>M>6ay71HYppSuKQ5\kn*fc:XX;T+3SL#jB&[q,BTV8o'  < ./inputs/input/ruin.702 
echo ">>>>>>>>running test 1596"
./replace_wrapper '*' 'm'  < ./inputs/input/ruin.1015 
echo ">>>>>>>>running test 1597"
./replace_wrapper '*' 'mx0sD,3u'\''aUVn)!`w;[(,]ua'  < ./inputs/input/ruin.481 
echo ">>>>>>>>running test 1598"
./replace_wrapper '*' 'n"7<:4 FFMm)2fT'\''@KR!ni>(k,g'  < ./inputs/input/ruin.638 
echo ">>>>>>>>running test 1599"
./replace_wrapper '*' 'nDf38_|G_<?#50:)+jM'  < ./inputs/input/ruin.1242 
echo ">>>>>>>>running test 1600"
./replace_wrapper '*' 'o'  < ./inputs/input/ruin.1069 
echo ">>>>>>>>running test 1601"
./replace_wrapper '*' 'o'  < ./inputs/input/ruin.67 
echo ">>>>>>>>running test 1602"
./replace_wrapper '*' 'o.[m&W'\''8`'  < ./inputs/input/ruin.1458 
echo ">>>>>>>>running test 1603"
./replace_wrapper '*' 'o`'  < ./inputs/input/ruin.561 
echo ">>>>>>>>running test 1604"
./replace_wrapper '*' 'ofUr<QH^?2i;bS"E?b7eFTRXE\s<)S"0v>7v\N,z@3+^T4X'  < ./inputs/input/ruin.1783 
echo ">>>>>>>>running test 1605"
./replace_wrapper '*' 'p'  < ./inputs/input/ruin.900 
echo ">>>>>>>>running test 1606"
./replace_wrapper '*' 'p7vM1c-~m$]<e#{^ 62"j[IyS@N2dV5Hecaiot%1'  < ./inputs/input/ruin.1072 
echo ">>>>>>>>running test 1607"
./replace_wrapper '*' 'pGZzvW$G(JB1Y]5.>I/9<"@rfHP'  < ./inputs/input/ruin.1326 
echo ">>>>>>>>running test 1608"
./replace_wrapper '*' 'q'  < ./inputs/input/ruin.1298 
echo ">>>>>>>>running test 1609"
./replace_wrapper '*' 'q'  < ./inputs/input/ruin.1932 
echo ">>>>>>>>running test 1610"
./replace_wrapper '*' 'q;E%){t-m!*a!rdD+2u,A0&_l'  < ./inputs/input/ruin.1709 
echo ">>>>>>>>running test 1611"
./replace_wrapper '*' 'r"'  < ./inputs/input/ruin.1393 
echo ">>>>>>>>running test 1612"
./replace_wrapper '*' 'r'  < ./inputs/input/ruin.648 
echo ">>>>>>>>running test 1613"
./replace_wrapper '*' 'r5fa/J@lY+PAM.8bQT#kQ/%L*##X3vqVARWNU_@.lDfO+1Y1h1G)/cedT7J![!7@g@"?+*5\k{6i={'  < ./inputs/input/ruin.1791 
echo ">>>>>>>>running test 1614"
./replace_wrapper '*' 's'  < ./inputs/input/ruin.1627 
echo ">>>>>>>>running test 1615"
./replace_wrapper '*' 't[WFHbt0G| J*7:o?A,)&7:~TI#z1{ga'\''Z>FLu'\''pYw>]=kZG^O=8I86z+V6H}d\HLd%]^{P(16(+L<)1J'  < ./inputs/input/ruin.119 
echo ">>>>>>>>running test 1616"
./replace_wrapper '*' 't{'  < ./inputs/input/ruin.1815 
echo ">>>>>>>>running test 1617"
./replace_wrapper '*' 'u'  < ./inputs/input/ruin.392 
echo ">>>>>>>>running test 1618"
./replace_wrapper '*' 'u'  < ./inputs/input/ruin.406 
echo ">>>>>>>>running test 1619"
./replace_wrapper '*' 'vB|CqDQNo,Fg|RTv5;bkJFE.twyj39J13'\''TcKY1sb&G<g]|ZaPL`0=8`YdR,'  < ./inputs/input/ruin.1614 
echo ">>>>>>>>running test 1620"
./replace_wrapper '*' 'vDu6FZh%!TOgp@!'\''b}>.}c^?R-'  < ./inputs/input/ruin.934 
echo ">>>>>>>>running test 1621"
./replace_wrapper '*' 'vV{&u2QCx+'  < ./inputs/input/ruin.1911 
echo ">>>>>>>>running test 1622"
./replace_wrapper '*' 'w'  < ./inputs/input/ruin.1610 
echo ">>>>>>>>running test 1623"
./replace_wrapper '*' 'w.h:AS*N<PuJ'\''%,%YHyLui~e5i"jjK@cNS; :R,W'  < ./inputs/input/ruin.462 
echo ">>>>>>>>running test 1624"
./replace_wrapper '*' 'x'  < ./inputs/input/ruin.1591 
echo ">>>>>>>>running test 1625"
./replace_wrapper '*' 'x+Q;z@RN/2%ew9=boU'\''N5^^>GYbLS:u^`|hk.y4+RSYe'  < ./inputs/input/ruin.1140 
echo ">>>>>>>>running test 1626"
./replace_wrapper '*' 'xv'\''%;99C.L6GYG|5'\''B4JA{:,!;i0:/n+[q}2g+Q+T[#; `w&%3:]~,5M]m.'  < ./inputs/input/ruin.1118 
echo ">>>>>>>>running test 1627"
./replace_wrapper '*' 'y!~#e7LEp?9]*iTkr1HrHG0Zu}RTi[q'  < ./inputs/input/ruin.531 
echo ">>>>>>>>running test 1628"
./replace_wrapper '*' 'y'  < ./inputs/input/ruin.1962 
echo ">>>>>>>>running test 1629"
./replace_wrapper '*' 'yEyj6*dR|$%NuXL^E`WEDg^@cc^?"+?a^?/x#'  < ./inputs/input/ruin.393 
echo ">>>>>>>>running test 1630"
./replace_wrapper '*' 'yJ!rEL|Xd02,<c X[+fSSek&#=SQ%VOTJY}T) H'  < ./inputs/input/ruin.741 
echo ">>>>>>>>running test 1631"
./replace_wrapper '*' '{'  < ./inputs/input/ruin.1403 
echo ">>>>>>>>running test 1632"
./replace_wrapper '*' '{q+631T.^ oN4+;vL0W[1Rcn%`iyF7Xs71[ l"lp'  < ./inputs/input/ruin.1780 
echo ">>>>>>>>running test 1633"
./replace_wrapper '*' '{zSL3h[z%C\T6 L?'  < ./inputs/input/ruin.372 
echo ">>>>>>>>running test 1634"
./replace_wrapper '*' '|GZy1Ki'\''I'  < ./inputs/input/ruin.1360 
echo ">>>>>>>>running test 1635"
./replace_wrapper '*' '|O'  < ./inputs/input/ruin.766 
echo ">>>>>>>>running test 1636"
./replace_wrapper '*' '|m{'  < ./inputs/input/ruin.335 
echo ">>>>>>>>running test 1637"
./replace_wrapper '*' '|zYQ /?~i1Ja\,"BRs(Y)-'\''Q3-)FlvxFPXZ/SuIC'\'''  < ./inputs/input/ruin.987 
echo ">>>>>>>>running test 1638"
./replace_wrapper '*' '}  = M3kL`Z&XdB~=2f6(qC%NFD1yTO_Zn}'  < ./inputs/input/ruin.330 
echo ">>>>>>>>running test 1639"
./replace_wrapper '*' '}'  < ./inputs/input/ruin.105 
echo ">>>>>>>>running test 1640"
./replace_wrapper '*' '}k]s&Qlf:sCd-<z'\''8oc,P~Jty8k'\''CS'\''WE'  < ./inputs/input/ruin.136 
echo ">>>>>>>>running test 1641"
./replace_wrapper '*'  < ./inputs/input/ruin.1262 
echo ">>>>>>>>running test 1642"
./replace_wrapper '*'\''' '&'  < ./inputs/input/ruin.1172 
echo ">>>>>>>>running test 1643"
./replace_wrapper '*'\''-(je' 'GZ7c.-_;Miyl1L5/A'  < ./inputs/input/ruin.1955 
echo ">>>>>>>>running test 1644"
./replace_wrapper '*'\''[^H]' ':Q|SA%e$'  < ./inputs/input/ruin.74 
echo ">>>>>>>>running test 1645"
./replace_wrapper '**' '8/r]'  < ./inputs/input/ruin.574 
echo ">>>>>>>>running test 1646"
./replace_wrapper '**' '`'  < ./inputs/input/ruin.1249 
echo ">>>>>>>>running test 1647"
./replace_wrapper '**' 'i'  < ./inputs/input/ruin.753 
echo ">>>>>>>>running test 1648"
./replace_wrapper '**@@' '&,K6#M4J k\$ta='  < ./inputs/input/ruin.95 
echo ">>>>>>>>running test 1649"
./replace_wrapper '**[>-A]' 'O'  < ./inputs/input/ruin.1623 
echo ">>>>>>>>running test 1650"
./replace_wrapper '*-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?' ','  < ./inputs/input/ruin.1353 
echo ">>>>>>>>running test 1651"
./replace_wrapper '*-?'   < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 1652"
./replace_wrapper '*-?'   < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 1653"
./replace_wrapper '*-?'   < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 1654"
./replace_wrapper '*-?' '&@n'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 1655"
./replace_wrapper '*-?' '&@n'  < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 1656"
./replace_wrapper '*-?' '&@n'  < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 1657"
./replace_wrapper '*-?[a-c$'   < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 1658"
./replace_wrapper '*-?[a-c$' '&@n'  < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 1659"
./replace_wrapper '*.[Z-a]^_`a-A-GABCDEFG]@n$' '-[&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 1660"
./replace_wrapper '*.[Z-a]^_`a-A-GABCDEFG]@n$' '-[lu!8lH<2'\''b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 1661"
./replace_wrapper '*7' 'jk$'  < ./inputs/input/ruin.1097 
echo ">>>>>>>>running test 1662"
./replace_wrapper '*?' '#g]ogwHzVu~98e-+FO:{#H5(\{z };KGj5$(z.sX>"u|rv\hwX==$UZh9dSAi+s)*Fw'\''X4*c"J79];P`~rB+*#w%'  < ./inputs/input/ruin.504 
echo ">>>>>>>>running test 1663"
./replace_wrapper '*?' '3g3t=6w'  < ./inputs/input/ruin.163 
echo ">>>>>>>>running test 1664"
./replace_wrapper '*?' 'D'  < ./inputs/input/ruin.782 
echo ">>>>>>>>running test 1665"
./replace_wrapper '*?' 'g*#'  < ./inputs/input/ruin.1869 
echo ">>>>>>>>running test 1666"
./replace_wrapper '*?' 'xkg>el^/j)zWM:uoVRpav3_7LA'\''&o*+G93N^8Po?-z)C+X]XaA\)cgK/=m`AQ-r!+4Drf51/,]+;?Qed>'  < ./inputs/input/ruin.451 
echo ">>>>>>>>running test 1667"
./replace_wrapper '*?*' '/'  < ./inputs/input/ruin.1605 
echo ">>>>>>>>running test 1668"
./replace_wrapper '*?*' 'y'  < ./inputs/input/ruin.425 
echo ">>>>>>>>running test 1669"
./replace_wrapper '*??' 'ke'  < ./inputs/input/ruin.280 
echo ">>>>>>>>running test 1670"
./replace_wrapper '*?[>-A>-Ac-aA-G]' '( $V0B16|L'  < ./inputs/input/ruin.270 
echo ">>>>>>>>running test 1671"
./replace_wrapper '*@@'   < ./inputs/input/ruin.1159 
echo ">>>>>>>>running test 1672"
./replace_wrapper '*@@' ';'  < ./inputs/input/ruin.1415 
echo ">>>>>>>>running test 1673"
./replace_wrapper '*@@' 'H'  < ./inputs/input/ruin.693 
echo ">>>>>>>>running test 1674"
./replace_wrapper '*@@' 'KSssNL3yfIE*o'  < ./inputs/input/ruin.1229 
echo ">>>>>>>>running test 1675"
./replace_wrapper '*@@' 'Stu%'  < ./inputs/input/ruin.1159 
echo ">>>>>>>>running test 1676"
./replace_wrapper '*@@' 'oJ<wB]FP!-F$ jO%'  < ./inputs/input/ruin.349 
echo ">>>>>>>>running test 1677"
./replace_wrapper '*@@*' '98Ge3Ed^R|)7!s<q*mmY4<+<8VfhOfDE}6Goi^\c~i'  < ./inputs/input/ruin.1377 
echo ">>>>>>>>running test 1678"
./replace_wrapper '*@@@@' '>nsYA'  < ./inputs/input/ruin.1873 
echo ">>>>>>>>running test 1679"
./replace_wrapper '*@@G' 'nI'\''+MH'  < ./inputs/input/ruin.743 
echo ">>>>>>>>running test 1680"
./replace_wrapper '*@e' '>'  < ./inputs/input/ruin.1371 
echo ">>>>>>>>running test 1681"
./replace_wrapper '*@n' '0&yd{(t"'\''bw/ i+JO/F,1bSmIlg'  < ./inputs/input/ruin.282 
echo ">>>>>>>>running test 1682"
./replace_wrapper '*@n' '>3tNX^|@zI@;>zg  2%Cd#FNs#U)`U7h#9dYHdo'  < ./inputs/input/ruin.865 
echo ">>>>>>>>running test 1683"
./replace_wrapper '*@n' 'KsxI474&Q(C}u4M|o2T`<`;S^`NUPxX'  < ./inputs/input/ruin.291 
echo ">>>>>>>>running test 1684"
./replace_wrapper '*@n' 'MP&KwD.47](#W/L3Yj'  < ./inputs/input/ruin.286 
echo ">>>>>>>>running test 1685"
./replace_wrapper '*@n' 'X&XXXXXXXXXX'  < ./inputs/input/ruin.321 
echo ">>>>>>>>running test 1686"
./replace_wrapper '*@n' 'b&[0-9]p'  < ./inputs/input/ruin.289 
echo ">>>>>>>>running test 1687"
./replace_wrapper '*@n' 'n&f$BLCD}tiigf@3'  < ./inputs/input/ruin.553 
echo ">>>>>>>>running test 1688"
./replace_wrapper '*@n' 'zCF&lL=IT'  < ./inputs/input/ruin.287 
echo ">>>>>>>>running test 1689"
./replace_wrapper '*@n[^n]*0' 'h1u$*tU$1o;]2xb7CvhE:p@~}PQo+M!UMpJn4Z-zgBh(U'  < ./inputs/input/ruin.983 
echo ">>>>>>>>running test 1690"
./replace_wrapper '*@t' 'F'  < ./inputs/input/ruin.320 
echo ">>>>>>>>running test 1691"
./replace_wrapper '*@t[@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9]' 'F'  < ./inputs/input/ruin.320 
echo ">>>>>>>>running test 1692"
./replace_wrapper '*O' '[SnK:ScY3|gj)p9qF'  < ./inputs/input/ruin.1107 
echo ">>>>>>>>running test 1693"
./replace_wrapper '*R' 'x<\BNOp-x\IfU1 A$8'  < ./inputs/input/ruin.785 
echo ">>>>>>>>running test 1694"
./replace_wrapper '*W@@@@' '~DL\#\S%Frr,MSYXpPBT.^?@ {3sT&TXz"H"$Sf<'  < ./inputs/input/ruin.1476 
echo ">>>>>>>>running test 1695"
./replace_wrapper '*[0-90-9]?' '%'  < ./inputs/input/ruin.830 
echo ">>>>>>>>running test 1696"
./replace_wrapper '*[A-G]?*[A-G]?' '(:,w5(X6)W%qon=YYaq]Q_&nZ~A'  < ./inputs/input/ruin.637 
echo ">>>>>>>>running test 1697"
./replace_wrapper '*[A-G]@t' '=!Gs:fsxv_A58F 5 0YKWB#<UlTQ))[eqI4DwKfd~gZNmB'  < ./inputs/input/ruin.232 
echo ">>>>>>>>running test 1698"
./replace_wrapper '*[Z-a]^_`a]'\''H8WstZ' 'B'  < ./inputs/input/ruin.808 
echo ">>>>>>>>running test 1699"
./replace_wrapper '*[^0-9]@n' 'd`?K#C~VsV'  < ./inputs/input/ruin.10 
echo ">>>>>>>>running test 1700"
./replace_wrapper '*[^M]' 'C;meWLSSV1S!'  < ./inputs/input/ruin.597 
echo ">>>>>>>>running test 1701"
./replace_wrapper '*[^Z-a]^_`a]' 'M'  < ./inputs/input/ruin.804 
echo ">>>>>>>>running test 1702"
./replace_wrapper '*[^z-})]<' 'v'  < ./inputs/input/ruin.616 
echo ">>>>>>>>running test 1703"
./replace_wrapper '*[^z-}]' 'Ud+`L?HbK/{T'  < ./inputs/input/ruin.787 
echo ">>>>>>>>running test 1704"
./replace_wrapper '*\' ''  < ./inputs/input/ruin.1686 
echo ">>>>>>>>running test 1705"
./replace_wrapper '*\' '|'  < ./inputs/input/ruin.1449 
echo ">>>>>>>>running test 1706"
./replace_wrapper '*\tk' 'hkNiPT'  < ./inputs/input/ruin.1886 
echo ">>>>>>>>running test 1707"
./replace_wrapper '*]' '['  < ./inputs/input/ruin.1797 
echo ">>>>>>>>running test 1708"
./replace_wrapper '*f@@' 'E'  < ./inputs/input/ruin.978 
echo ">>>>>>>>running test 1709"
./replace_wrapper '*p&y=3p&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYI[p&y=3[ZYIZYIgTBk' 'b$M]}'  < ./inputs/input/ruin.1334 
echo ">>>>>>>>running test 1710"
./replace_wrapper '+' 'u'  < ./inputs/input/ruin.842 
echo ">>>>>>>>running test 1711"
./replace_wrapper ',$' 'ZCOQ%-V%r?8G'\''%#V'  < ./inputs/input/ruin.930 
echo ">>>>>>>>running test 1712"
./replace_wrapper ',' 'd'  < ./inputs/input/ruin.1082 
echo ">>>>>>>>running test 1713"
./replace_wrapper '- $' 'NEW'  < ./inputs/temp-test/570.inp.245.9 
echo ">>>>>>>>running test 1714"
./replace_wrapper '- '   < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 1715"
./replace_wrapper '- ' '&'  < ./inputs/temp-test/1856.inp.788.1 
echo ">>>>>>>>running test 1716"
./replace_wrapper '- ' '&'  < ./inputs/temp-test/1857.inp.788.2 
echo ">>>>>>>>running test 1717"
./replace_wrapper '- ' '&'  < ./inputs/temp-test/1858.inp.788.3 
echo ">>>>>>>>running test 1718"
./replace_wrapper '- ' '&'  < ./inputs/temp-test/1859.inp.788.4 
echo ">>>>>>>>running test 1719"
./replace_wrapper '- ' '&'  < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 1720"
./replace_wrapper '- ' '@%@&'  < ./inputs/temp-test/2171.inp.918.1 
echo ">>>>>>>>running test 1721"
./replace_wrapper '- ' '@%@&'  < ./inputs/temp-test/2172.inp.918.2 
echo ">>>>>>>>running test 1722"
./replace_wrapper '- ' '@t'  < ./inputs/temp-test/1788.inp.761.1 
echo ">>>>>>>>running test 1723"
./replace_wrapper '- ' '@t'  < ./inputs/temp-test/1789.inp.761.2 
echo ">>>>>>>>running test 1724"
./replace_wrapper '- ' 'NEW'  < ./inputs/temp-test/569.inp.245.1 
echo ">>>>>>>>running test 1725"
./replace_wrapper '- *$' ''  < ./inputs/temp-test/767.inp.328.8 
echo ">>>>>>>>running test 1726"
./replace_wrapper '- *' ''  < ./inputs/temp-test/766.inp.328.1 
echo ">>>>>>>>running test 1727"
./replace_wrapper '- *' 'a@nb@tc'  < ./inputs/temp-test/1373.inp.589.1 
echo ">>>>>>>>running test 1728"
./replace_wrapper '- *' 'b@t'  < ./inputs/temp-test/155.inp.70.1 
echo ">>>>>>>>running test 1729"
./replace_wrapper '- *' 'b@t'  < ./inputs/temp-test/156.inp.70.2 
echo ">>>>>>>>running test 1730"
./replace_wrapper '- *-?' 'a@nb@tc'  < ./inputs/temp-test/1074.inp.462.1 
echo ">>>>>>>>running test 1731"
./replace_wrapper '- [^@n]?[^0-9]?[0-9]?' '@%&a'  < ./inputs/temp-test/162.inp.73.1 
echo ">>>>>>>>running test 1732"
./replace_wrapper '-$' '&@n'  < ./inputs/temp-test/633.inp.273.9 
echo ">>>>>>>>running test 1733"
./replace_wrapper '-$' '*U:an"OMpY#Ei1WdZ>`'  < ./inputs/input/ruin.1277 
echo ">>>>>>>>running test 1734"
./replace_wrapper '-$' '@%@&'  < ./inputs/temp-test/633.inp.273.9 
echo ">>>>>>>>running test 1735"
./replace_wrapper '-%[^a-c' ''  < ./inputs/temp-test/2354.inp.999.2 
echo ">>>>>>>>running test 1736"
./replace_wrapper '-%[^a-c' ''  < ./inputs/temp-test/2355.inp.999.3 
echo ">>>>>>>>running test 1737"
./replace_wrapper '-' '&@n'  < ./inputs/temp-test/631.inp.273.1 
echo ">>>>>>>>running test 1738"
./replace_wrapper '-' '&@n'  < ./inputs/temp-test/632.inp.273.3 
echo ">>>>>>>>running test 1739"
./replace_wrapper '-' '&a@%'  < ./inputs/temp-test/1383.inp.593.1 
echo ">>>>>>>>running test 1740"
./replace_wrapper '-' '&a@%'  < ./inputs/temp-test/2265.inp.960.1 
echo ">>>>>>>>running test 1741"
./replace_wrapper '-' ''  < ./inputs/temp-test/1648.inp.703.1 
echo ">>>>>>>>running test 1742"
./replace_wrapper '-' ''  < ./inputs/temp-test/1649.inp.703.3 
echo ">>>>>>>>running test 1743"
./replace_wrapper '-' ''  < ./inputs/temp-test/258.inp.114.1 
echo ">>>>>>>>running test 1744"
./replace_wrapper '-' ''  < ./inputs/temp-test/259.inp.114.2 
echo ">>>>>>>>running test 1745"
./replace_wrapper '-' ''  < ./inputs/temp-test/706.inp.306.1 
echo ">>>>>>>>running test 1746"
./replace_wrapper '-' ''  < ./inputs/temp-test/707.inp.306.3 
echo ">>>>>>>>running test 1747"
./replace_wrapper '-' '+'  < ./inputs/input/ruin.1488 
echo ">>>>>>>>running test 1748"
./replace_wrapper '-' ';g/&.}:{js8R^#VPXDq2$?H7JEik*Lg_}N\ I(T"'  < ./inputs/input/ruin.1180 
echo ">>>>>>>>running test 1749"
./replace_wrapper '-' '=6F{LtJ|XyCKJD'  < ./inputs/input/ruin.294 
echo ">>>>>>>>running test 1750"
./replace_wrapper '-' '@%&a'  < ./inputs/temp-test/1252.inp.537.1 
echo ">>>>>>>>running test 1751"
./replace_wrapper '-' '@%&a'  < ./inputs/temp-test/1253.inp.537.4 
echo ">>>>>>>>running test 1752"
./replace_wrapper '-' '@%&a'  < ./inputs/temp-test/480.inp.210.1 
echo ">>>>>>>>running test 1753"
./replace_wrapper '-' '@%&a'  < ./inputs/temp-test/481.inp.210.2 
echo ">>>>>>>>running test 1754"
./replace_wrapper '-' '@%@&'  < ./inputs/temp-test/1141.inp.491.1 
echo ">>>>>>>>running test 1755"
./replace_wrapper '-' '@%@&'  < ./inputs/temp-test/631.inp.273.1 
echo ">>>>>>>>running test 1756"
./replace_wrapper '-' '@%@&'  < ./inputs/temp-test/632.inp.273.3 
echo ">>>>>>>>running test 1757"
./replace_wrapper '-' '@n'  < ./inputs/temp-test/2253.inp.955.1 
echo ">>>>>>>>running test 1758"
./replace_wrapper '-' '@n'  < ./inputs/temp-test/994.inp.428.1 
echo ">>>>>>>>running test 1759"
./replace_wrapper '-' '@n'  < ./inputs/temp-test/995.inp.428.2 
echo ">>>>>>>>running test 1760"
./replace_wrapper '-' '@n'  < ./inputs/temp-test/996.inp.428.3 
echo ">>>>>>>>running test 1761"
./replace_wrapper '-' 'NEW'  < ./inputs/temp-test/722.inp.312.1 
echo ">>>>>>>>running test 1762"
./replace_wrapper '-' 'NEW'  < ./inputs/temp-test/723.inp.312.2 
echo ">>>>>>>>running test 1763"
./replace_wrapper '-' 'NEW'  < ./inputs/temp-test/724.inp.312.3 
echo ">>>>>>>>running test 1764"
./replace_wrapper '-' 'T(LYE-ao)s9O(i6'\''Q)yz&A9og__<mtw`8]7CijJ?N#3Q/iGR|RjL$tV_+z6fA:[d'  < ./inputs/input/ruin.1823 
echo ">>>>>>>>running test 1765"
./replace_wrapper '-' 'a&'  < ./inputs/temp-test/1309.inp.563.1 
echo ">>>>>>>>running test 1766"
./replace_wrapper '-' 'a&'  < ./inputs/temp-test/1310.inp.563.2 
echo ">>>>>>>>running test 1767"
./replace_wrapper '-' 'a&'  < ./inputs/temp-test/1311.inp.563.4 
echo ">>>>>>>>running test 1768"
./replace_wrapper '-' 'a@n'  < ./inputs/temp-test/764.inp.327.1 
echo ">>>>>>>>running test 1769"
./replace_wrapper '-' 'a@n'  < ./inputs/temp-test/765.inp.327.3 
echo ">>>>>>>>running test 1770"
./replace_wrapper '-' 'a@nb@tc'  < ./inputs/temp-test/666.inp.290.1 
echo ">>>>>>>>running test 1771"
./replace_wrapper '-' 'a@nb@tc'  < ./inputs/temp-test/876.inp.376.1 
echo ">>>>>>>>running test 1772"
./replace_wrapper '-' 'a@nb@tc'  < ./inputs/temp-test/877.inp.376.3 
echo ">>>>>>>>running test 1773"
./replace_wrapper '-' 'a@nb@tc'  < ./inputs/temp-test/878.inp.376.4 
echo ">>>>>>>>running test 1774"
./replace_wrapper '-' 'c}}1&+CkqDp{"XR613}Oox='\''k&j?itc/lkerG9p]GH'  < ./inputs/input/ruin.1175 
echo ">>>>>>>>running test 1775"
./replace_wrapper '-' 'j_hn&VVQ|;n)#xS;9N.vh@gpT'\''?oF-^_,j_\j[n;{VkW#;EB*C)%(xYY"Oget'\''B!=P7|cKKNU<rkU-GYLmy![G'  < ./inputs/input/ruin.6 
echo ">>>>>>>>running test 1776"
./replace_wrapper '-' 'v'  < ./inputs/input/ruin.1663 
echo ">>>>>>>>running test 1777"
./replace_wrapper '-' '}'  < ./inputs/input/ruin.1734 
echo ">>>>>>>>running test 1778"
./replace_wrapper '-*$'   < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1779"
./replace_wrapper '-*$'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 1780"
./replace_wrapper '-*-' '@n'  < ./inputs/temp-test/2006.inp.852.1 
echo ">>>>>>>>running test 1781"
./replace_wrapper '-*-' '@n'  < ./inputs/temp-test/2007.inp.852.2 
echo ">>>>>>>>running test 1782"
./replace_wrapper '-*-' '@n'  < ./inputs/temp-test/2008.inp.852.3 
echo ">>>>>>>>running test 1783"
./replace_wrapper '-*--' '@t'  < ./inputs/temp-test/286.inp.128.1 
echo ">>>>>>>>running test 1784"
./replace_wrapper '-*?' '&a@%'  < ./inputs/temp-test/1099.inp.474.1 
echo ">>>>>>>>running test 1785"
./replace_wrapper '-*?' '&a@%'  < ./inputs/temp-test/1100.inp.474.2 
echo ">>>>>>>>running test 1786"
./replace_wrapper '-*?' '&a@%'  < ./inputs/temp-test/1101.inp.474.3 
echo ">>>>>>>>running test 1787"
./replace_wrapper '-*?@[?[@@]-' '@%&a'  < ./inputs/temp-test/264.inp.117.1 
echo ">>>>>>>>running test 1788"
./replace_wrapper '-*?@[?[@@]-' '@%&a'  < ./inputs/temp-test/265.inp.117.3 
echo ">>>>>>>>running test 1789"
./replace_wrapper '-*?@t*[^0-9][0-9]' 'b@t'  < ./inputs/temp-test/228.inp.102.1 
echo ">>>>>>>>running test 1790"
./replace_wrapper '-*?@t*[^0-9][0-9]' 'b@t'  < ./inputs/temp-test/229.inp.102.2 
echo ">>>>>>>>running test 1791"
./replace_wrapper '-*[9-B][0-9]@*' '&a@%'  < ./inputs/temp-test/1406.inp.603.1 
echo ">>>>>>>>running test 1792"
./replace_wrapper '-*[9-B][0-9]@*' '&a@%'  < ./inputs/temp-test/1407.inp.603.2 
echo ">>>>>>>>running test 1793"
./replace_wrapper '-*[][^0-9]$' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1794"
./replace_wrapper '-*[^0-9]$'  '&@n' < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1795"
./replace_wrapper '-*[^0-9]$'   < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1796"
./replace_wrapper '-*[^0-9]$' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1797"
./replace_wrapper '-*[^0-9]'   < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1798"
./replace_wrapper '-*[^0-9]'   < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 1799"
./replace_wrapper '-*[^0-9]' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1800"
./replace_wrapper '-*[^0-9]' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 1801"
./replace_wrapper '-*[^0-9]' '&@n'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1802"
./replace_wrapper '-*[^0-9]' '@t'  < ./inputs/temp-test/176.inp.79.1 
echo ">>>>>>>>running test 1803"
./replace_wrapper '-*[^0-9]*$' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1804"
./replace_wrapper '-*[^0-9]*$' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 1805"
./replace_wrapper '-*[^0-9]*$' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1806"
./replace_wrapper '-*[^0-9]*' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 1807"
./replace_wrapper '-*[^0-9]*' '&'  < ./inputs/temp-test/201.inp.90.3 
echo ">>>>>>>>running test 1808"
./replace_wrapper '-*[^0-9]*' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1809"
./replace_wrapper '-*[^9-B]-[a--]' 'a@n'  < ./inputs/temp-test/467.inp.204.1 
echo ">>>>>>>>running test 1810"
./replace_wrapper '-*[^9-B]-[a--]' 'a@n'  < ./inputs/temp-test/468.inp.204.3 
echo ">>>>>>>>running test 1811"
./replace_wrapper '-*[^][^0-9]$' '&'  < ./inputs/temp-test/202.inp.90.6 
echo ">>>>>>>>running test 1812"
./replace_wrapper '-*[^a--b]' '@%&a'  < ./inputs/temp-test/393.inp.172.1 
echo ">>>>>>>>running test 1813"
./replace_wrapper '-*[^a--b]' '@%&a'  < ./inputs/temp-test/394.inp.172.2 
echo ">>>>>>>>running test 1814"
./replace_wrapper '-*[^a--b]' '@%&a'  < ./inputs/temp-test/395.inp.172.3 
echo ">>>>>>>>running test 1815"
./replace_wrapper '-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]-*[^a--b]' '@%&a'  < ./inputs/temp-test/393.inp.172.1 
echo ">>>>>>>>running test 1816"
./replace_wrapper '-*[^a-c]@[[^0-9]-[9-B]' '@n'  < ./inputs/temp-test/1321.inp.567.1 
echo ">>>>>>>>running test 1817"
./replace_wrapper '--%[^9-B][0-9]--[0-9]*-' '@%@&'  < ./inputs/temp-test/17.inp.8.1 
echo ">>>>>>>>running test 1818"
./replace_wrapper '--' ''  < ./inputs/temp-test/1896.inp.804.1 
echo ">>>>>>>>running test 1819"
./replace_wrapper '--' 'a@nb@tc'  < ./inputs/temp-test/951.inp.410.1 
echo ">>>>>>>>running test 1820"
./replace_wrapper '--' 'a@nb@tc'  < ./inputs/temp-test/952.inp.410.2 
echo ">>>>>>>>running test 1821"
./replace_wrapper '--' 'a@nb@tc'  < ./inputs/temp-test/953.inp.410.3 
echo ">>>>>>>>running test 1822"
./replace_wrapper '--*' ''  < ./inputs/temp-test/1282.inp.551.1 
echo ">>>>>>>>running test 1823"
./replace_wrapper '--*' ''  < ./inputs/temp-test/1283.inp.551.2 
echo ">>>>>>>>running test 1824"
./replace_wrapper '--*' ''  < ./inputs/temp-test/1284.inp.551.3 
echo ">>>>>>>>running test 1825"
./replace_wrapper '--*' '@%&a'  < ./inputs/temp-test/807.inp.347.1 
echo ">>>>>>>>running test 1826"
./replace_wrapper '--*' '@%&a'  < ./inputs/temp-test/808.inp.347.3 
echo ">>>>>>>>running test 1827"
./replace_wrapper '--*-A-[0-9]-[^a-c]' 'a@n'  < ./inputs/temp-test/186.inp.84.1 
echo ">>>>>>>>running test 1828"
./replace_wrapper '--*[@t]-' 'b@t'  < ./inputs/temp-test/174.inp.78.1 
echo ">>>>>>>>running test 1829"
./replace_wrapper '--*[@t]-' 'b@t'  < ./inputs/temp-test/175.inp.78.3 
echo ">>>>>>>>running test 1830"
./replace_wrapper '--*[^a-c[0-9]a-c][^0-9][0-9][^0-9]?-' 'NEW'  < ./inputs/temp-test/997.inp.429.1 
echo ">>>>>>>>running test 1831"
./replace_wrapper '--*a-c]?[^0-9]' '@n'  < ./inputs/temp-test/1152.inp.496.1 
echo ">>>>>>>>running test 1832"
./replace_wrapper '--*a-c]?[^0-9]' '@n'  < ./inputs/temp-test/1153.inp.496.2 
echo ">>>>>>>>running test 1833"
./replace_wrapper '--?^[9-B]?' ''  < ./inputs/temp-test/1467.inp.629.1 
echo ">>>>>>>>running test 1834"
./replace_wrapper '--?^[9-B]?' ''  < ./inputs/temp-test/1468.inp.629.2 
echo ">>>>>>>>running test 1835"
./replace_wrapper '--@*-[^-z]-?[^--z][^9-B]?$' '&a@%'  < ./inputs/temp-test/502.inp.219.6 
echo ">>>>>>>>running test 1836"
./replace_wrapper '--@*-[^-z]-?[^--z][^9-B]?' '&a@%'  < ./inputs/temp-test/499.inp.219.1 
echo ">>>>>>>>running test 1837"
./replace_wrapper '--@*-[^-z]-?[^--z][^9-B]?' '&a@%'  < ./inputs/temp-test/500.inp.219.3 
echo ">>>>>>>>running test 1838"
./replace_wrapper '--[0-9]?-?' 'NEW'  < ./inputs/temp-test/2058.inp.873.1 
echo ">>>>>>>>running test 1839"
./replace_wrapper '--[0-9]?-?' 'NEW'  < ./inputs/temp-test/2059.inp.873.2 
echo ">>>>>>>>running test 1840"
./replace_wrapper '--[0-9]?-?' 'NEW'  < ./inputs/temp-test/2060.inp.873.3 
echo ">>>>>>>>running test 1841"
./replace_wrapper '--[^9-B][0-9]--[0-9]*-' '@%@&'  < ./inputs/temp-test/17.inp.8.1 
echo ">>>>>>>>running test 1842"
./replace_wrapper '--]$' '&'  < ./inputs/temp-test/2001.inp.850.6 
echo ">>>>>>>>running test 1843"
./replace_wrapper '--]$' 'NEW'  < ./inputs/temp-test/1940.inp.824.6 
echo ">>>>>>>>running test 1844"
./replace_wrapper '--]$' 'NEW'  < ./inputs/temp-test/1941.inp.824.9 
echo ">>>>>>>>running test 1845"
./replace_wrapper '--]' '&'  < ./inputs/temp-test/2000.inp.850.1 
echo ">>>>>>>>running test 1846"
./replace_wrapper '--]' 'NEW'  < ./inputs/temp-test/1937.inp.824.1 
echo ">>>>>>>>running test 1847"
./replace_wrapper '--]' 'NEW'  < ./inputs/temp-test/1938.inp.824.2 
echo ">>>>>>>>running test 1848"
./replace_wrapper '--]' 'NEW'  < ./inputs/temp-test/1939.inp.824.3 
echo ">>>>>>>>running test 1849"
./replace_wrapper '--][^--z]-' '&a@%'  < ./inputs/temp-test/1271.inp.546.1 
echo ">>>>>>>>running test 1850"
./replace_wrapper '--][^--z]-' '&a@%'  < ./inputs/temp-test/1272.inp.546.2 
echo ">>>>>>>>running test 1851"
./replace_wrapper '--][^--z]-' '&a@%'  < ./inputs/temp-test/1273.inp.546.3 
echo ">>>>>>>>running test 1852"
./replace_wrapper '-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?*[0-9]*' ','  < ./inputs/input/ruin.1353 
echo ">>>>>>>>running test 1853"
./replace_wrapper '-?' '&'  < ./inputs/temp-test/372.inp.162.1 
echo ">>>>>>>>running test 1854"
./replace_wrapper '-?' '&'  < ./inputs/temp-test/373.inp.162.3 
echo ">>>>>>>>running test 1855"
./replace_wrapper '-?' '&'  < ./inputs/temp-test/374.inp.162.4 
echo ">>>>>>>>running test 1856"
./replace_wrapper '-?' '&a@%'  < ./inputs/temp-test/1337.inp.574.1 
echo ">>>>>>>>running test 1857"
./replace_wrapper '-?' ''  < ./inputs/temp-test/1211.inp.520.1 
echo ">>>>>>>>running test 1858"
./replace_wrapper '-?' ''  < ./inputs/temp-test/1577.inp.673.1 
echo ">>>>>>>>running test 1859"
./replace_wrapper '-?' ''  < ./inputs/temp-test/1578.inp.673.2 
echo ">>>>>>>>running test 1860"
./replace_wrapper '-?' ''  < ./inputs/temp-test/1579.inp.673.3 
echo ">>>>>>>>running test 1861"
./replace_wrapper '-?' ''  < ./inputs/temp-test/1580.inp.673.4 
echo ">>>>>>>>running test 1862"
./replace_wrapper '-?' '@%&a'  < ./inputs/temp-test/2052.inp.870.1 
echo ">>>>>>>>running test 1863"
./replace_wrapper '-?' '@%@&'  < ./inputs/temp-test/1764.inp.751.1 
echo ">>>>>>>>running test 1864"
./replace_wrapper '-?' '@%@&'  < ./inputs/temp-test/1765.inp.751.2 
echo ">>>>>>>>running test 1865"
./replace_wrapper '-?' '@%@&'  < ./inputs/temp-test/50.inp.21.1 
echo ">>>>>>>>running test 1866"
./replace_wrapper '-?' '@%@&'  < ./inputs/temp-test/51.inp.21.2 
echo ">>>>>>>>running test 1867"
./replace_wrapper '-?' '@%@&'  < ./inputs/temp-test/52.inp.21.4 
echo ">>>>>>>>running test 1868"
./replace_wrapper '-?' '@n'  < ./inputs/temp-test/2297.inp.974.1 
echo ">>>>>>>>running test 1869"
./replace_wrapper '-?' '@n'  < ./inputs/temp-test/232.inp.104.1 
echo ">>>>>>>>running test 1870"
./replace_wrapper '-?' '@n'  < ./inputs/temp-test/233.inp.104.2 
echo ">>>>>>>>running test 1871"
./replace_wrapper '-?' '@n'  < ./inputs/temp-test/234.inp.104.3 
echo ">>>>>>>>running test 1872"
./replace_wrapper '-?' '@t'  < ./inputs/temp-test/1450.inp.622.1 
echo ">>>>>>>>running test 1873"
./replace_wrapper '-?' '@t'  < ./inputs/temp-test/1451.inp.622.2 
echo ">>>>>>>>running test 1874"
./replace_wrapper '-?' '@t'  < ./inputs/temp-test/306.inp.137.1 
echo ">>>>>>>>running test 1875"
./replace_wrapper '-?' '@t'  < ./inputs/temp-test/307.inp.137.3 
echo ">>>>>>>>running test 1876"
./replace_wrapper '-?' 'NEW'  < ./inputs/temp-test/2066.inp.876.1 
echo ">>>>>>>>running test 1877"
./replace_wrapper '-?' 'NEW'  < ./inputs/temp-test/2067.inp.876.3 
echo ">>>>>>>>running test 1878"
./replace_wrapper '-?' 'a&'  < ./inputs/temp-test/1076.inp.464.1 
echo ">>>>>>>>running test 1879"
./replace_wrapper '-?' 'a&'  < ./inputs/temp-test/1077.inp.464.2 
echo ">>>>>>>>running test 1880"
./replace_wrapper '-?' 'a&'  < ./inputs/temp-test/1078.inp.464.4 
echo ">>>>>>>>running test 1881"
./replace_wrapper '-?' 'a&'  < ./inputs/temp-test/2.inp.1.2 
echo ">>>>>>>>running test 1882"
./replace_wrapper '-?' 'a@n'  < ./inputs/temp-test/61.inp.26.1 
echo ">>>>>>>>running test 1883"
./replace_wrapper '-?' 'a@n'  < ./inputs/temp-test/62.inp.26.3 
echo ">>>>>>>>running test 1884"
./replace_wrapper '-?' 'a@nb@tc'  < ./inputs/temp-test/1142.inp.492.1 
echo ">>>>>>>>running test 1885"
./replace_wrapper '-?' 'a@nb@tc'  < ./inputs/temp-test/1143.inp.492.2 
echo ">>>>>>>>running test 1886"
./replace_wrapper '-?' 'a@nb@tc'  < ./inputs/temp-test/1144.inp.492.3 
echo ">>>>>>>>running test 1887"
./replace_wrapper '-?' 'a@nb@tc'  < ./inputs/temp-test/1145.inp.492.4 
echo ">>>>>>>>running test 1888"
./replace_wrapper '-?*$'   < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 1889"
./replace_wrapper '-?*$'   < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 1890"
./replace_wrapper '-?*$'   < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 1891"
./replace_wrapper '-?*' '&'  < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 1892"
./replace_wrapper '-?-' '@%@&'  < ./inputs/temp-test/943.inp.405.1 
echo ">>>>>>>>running test 1893"
./replace_wrapper '-?-?' 'a@n'  < ./inputs/temp-test/1700.inp.725.1 
echo ">>>>>>>>running test 1894"
./replace_wrapper '-?-?@n[9-B]' '&a@%'  < ./inputs/temp-test/1212.inp.521.1 
echo ">>>>>>>>running test 1895"
./replace_wrapper '-?-?@n[9-B]' '&a@%'  < ./inputs/temp-test/1213.inp.521.2 
echo ">>>>>>>>running test 1896"
./replace_wrapper '-?-?@n[9-B]' '&a@%'  < ./inputs/temp-test/1214.inp.521.3 
echo ">>>>>>>>running test 1897"
./replace_wrapper '-?-@**[^0-9]-' '@%@&'  < ./inputs/temp-test/2076.inp.880.1 
echo ">>>>>>>>running test 1898"
./replace_wrapper '-?-@**[^0-9]-@@*[^9-B]?@n*$' '@%@&'  < ./inputs/temp-test/2078.inp.880.6 
echo ">>>>>>>>running test 1899"
./replace_wrapper '-?-@**[^0-9]-@@*[^9-B]?@n*' '@%@&'  < ./inputs/temp-test/2076.inp.880.1 
echo ">>>>>>>>running test 1900"
./replace_wrapper '-?-@**[^0-9]-@@*[^9-B]?@n*' '@%@&'  < ./inputs/temp-test/2077.inp.880.2 
echo ">>>>>>>>running test 1901"
./replace_wrapper '-?-@n *?' '@%@&'  < ./inputs/temp-test/617.inp.266.1 
echo ">>>>>>>>running test 1902"
./replace_wrapper '-?-@n *?' '@%@&'  < ./inputs/temp-test/618.inp.266.2 
echo ">>>>>>>>running test 1903"
./replace_wrapper '-?-[^-z]' 'NEW'  < ./inputs/temp-test/164.inp.74.1 
echo ">>>>>>>>running test 1904"
./replace_wrapper '-?-[^-z]' 'NEW'  < ./inputs/temp-test/165.inp.74.2 
echo ">>>>>>>>running test 1905"
./replace_wrapper '-?-[^-z]' 'NEW'  < ./inputs/temp-test/166.inp.74.3 
echo ">>>>>>>>running test 1906"
./replace_wrapper '-?-c*[0-9]' 'NEW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A'  < ./inputs/temp-test/1760.inp.748.3 
echo ">>>>>>>>running test 1907"
./replace_wrapper '-?-c*[0-9][a-c]-?A' 'NEW'  < ./inputs/temp-test/1759.inp.748.1 
echo ">>>>>>>>running test 1908"
./replace_wrapper '-?-c*[0-9][a-c]-?A' 'NEW'  < ./inputs/temp-test/1760.inp.748.3 
echo ">>>>>>>>running test 1909"
./replace_wrapper '-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A' 'NEW'  < ./inputs/temp-test/1760.inp.748.3 
echo ">>>>>>>>running test 1910"
./replace_wrapper '-??[^0-9][9-B][^9-B]' 'a&'  < ./inputs/temp-test/37.inp.16.1 
echo ">>>>>>>>running test 1911"
./replace_wrapper '-??[^0-9][9-B][^9-B]' 'a&'  < ./inputs/temp-test/38.inp.16.2 
echo ">>>>>>>>running test 1912"
./replace_wrapper '-??[a-c]' '@%&a'  < ./inputs/temp-test/1161.inp.500.1 
echo ">>>>>>>>running test 1913"
./replace_wrapper '-??[a-c]' '@%&a'  < ./inputs/temp-test/1162.inp.500.2 
echo ">>>>>>>>running test 1914"
./replace_wrapper '-?@*[^9-B]?' ''  < ./inputs/temp-test/607.inp.261.1 
echo ">>>>>>>>running test 1915"
./replace_wrapper '-?@*[^9-B]?' ''  < ./inputs/temp-test/608.inp.261.3 
echo ">>>>>>>>running test 1916"
./replace_wrapper '-?@@*[_-z][^0-9]' '&'  < ./inputs/temp-test/821.inp.354.1 
echo ">>>>>>>>running test 1917"
./replace_wrapper '-?@@*[_-z][^0-9]' '&'  < ./inputs/temp-test/822.inp.354.4 
echo ">>>>>>>>running test 1918"
./replace_wrapper '-?@[[^9-B]---?' 'a@n'  < ./inputs/temp-test/965.inp.416.1 
echo ">>>>>>>>running test 1919"
./replace_wrapper '-?@[[a-][9-B]- *[a--b]' 'a@n'  < ./inputs/temp-test/1037.inp.446.1 
echo ">>>>>>>>running test 1920"
./replace_wrapper '-?[9-B]--' '&a@%'  < ./inputs/temp-test/1139.inp.490.1 
echo ">>>>>>>>running test 1921"
./replace_wrapper '-?[9-B]--' '&a@%'  < ./inputs/temp-test/1140.inp.490.2 
echo ">>>>>>>>running test 1922"
./replace_wrapper '-?[9-B]@t*$' '@%&a'  < ./inputs/temp-test/816.inp.351.9 
echo ">>>>>>>>running test 1923"
./replace_wrapper '-?[9-B]@t*' '@%&a'  < ./inputs/temp-test/815.inp.351.1 
echo ">>>>>>>>running test 1924"
./replace_wrapper '-?[@n]?[@@][^9-B][0-9]?$' 'NEW'  < ./inputs/temp-test/885.inp.380.6 
echo ">>>>>>>>running test 1925"
./replace_wrapper '-?[@n]?[@@][^9-B][0-9]?' 'NEW'  < ./inputs/temp-test/883.inp.380.1 
echo ">>>>>>>>running test 1926"
./replace_wrapper '-?[@n]?[@@][^9-B][0-9]?' 'NEW'  < ./inputs/temp-test/884.inp.380.2 
echo ">>>>>>>>running test 1927"
./replace_wrapper '-?[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/2062.inp.874.1 
echo ">>>>>>>>running test 1928"
./replace_wrapper '-?[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/2063.inp.874.3 
echo ">>>>>>>>running test 1929"
./replace_wrapper '-?[^0-9]?' '&'  < ./inputs/temp-test/463.inp.203.1 
echo ">>>>>>>>running test 1930"
./replace_wrapper '-?[^0-9]?' '&'  < ./inputs/temp-test/464.inp.203.3 
echo ">>>>>>>>running test 1931"
./replace_wrapper '-?[^0-9]?' '&'  < ./inputs/temp-test/465.inp.203.4 
echo ">>>>>>>>running test 1932"
./replace_wrapper '-?[^9-B]?-?' 'a@nb@tc'  < ./inputs/temp-test/2099.inp.890.1 
echo ">>>>>>>>running test 1933"
./replace_wrapper '-?[^9-B]?-?' 'a@nb@tc'  < ./inputs/temp-test/2100.inp.890.2 
echo ">>>>>>>>running test 1934"
./replace_wrapper '-?[^9-B]?-?' 'a@nb@tc'  < ./inputs/temp-test/2101.inp.890.3 
echo ">>>>>>>>running test 1935"
./replace_wrapper '-?[^9-B]?-?' 'a@nb@tc'  < ./inputs/temp-test/2102.inp.890.4 
echo ">>>>>>>>running test 1936"
./replace_wrapper '-?[^9-B]@**[0-9]' '@n'  < ./inputs/temp-test/1872.inp.794.1 
echo ">>>>>>>>running test 1937"
./replace_wrapper '-?[^9-B]@**[0-9]' '@n'  < ./inputs/temp-test/1873.inp.794.3 
echo ">>>>>>>>running test 1938"
./replace_wrapper '-?[^9-B]@**[0-9]' '@n-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?-?A-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?'  < ./inputs/temp-test/1872.inp.794.1 
echo ">>>>>>>>running test 1939"
./replace_wrapper '-?[^a--]@[*[^9-B]A-[@@]' 'a@nb@tc'  < ./inputs/temp-test/1724.inp.734.1 
echo ">>>>>>>>running test 1940"
./replace_wrapper '-?[^a--]@[*[^9-B]A-[@@]' 'a@nb@tc'  < ./inputs/temp-test/1725.inp.734.2 
echo ">>>>>>>>running test 1941"
./replace_wrapper '-?[^a--]@[*[^9-B]A-[@@]' 'a@nb@tc'  < ./inputs/temp-test/1726.inp.734.3 
echo ">>>>>>>>running test 1942"
./replace_wrapper '-?[^a-c-*' 'a@n'  < ./inputs/temp-test/1262.inp.542.1 
echo ">>>>>>>>running test 1943"
./replace_wrapper '-?[^a-c-*' 'a@n'  < ./inputs/temp-test/1263.inp.542.3 
echo ">>>>>>>>running test 1944"
./replace_wrapper '-?[^a-c-*' 'a@n'  < ./inputs/temp-test/1264.inp.542.4 
echo ">>>>>>>>running test 1945"
./replace_wrapper '-?[^a-c]' 'b@t'  < ./inputs/temp-test/2238.inp.949.1 
echo ">>>>>>>>running test 1946"
./replace_wrapper '-?[^a-c]' 'b@t'  < ./inputs/temp-test/2239.inp.949.2 
echo ">>>>>>>>running test 1947"
./replace_wrapper '-?[^a-c]??-' '@%&a'  < ./inputs/temp-test/360.inp.158.1 
echo ">>>>>>>>running test 1948"
./replace_wrapper '-?[^a-c]??-' '@%&a'  < ./inputs/temp-test/361.inp.158.3 
echo ">>>>>>>>running test 1949"
./replace_wrapper '-?[^a-c]??-' '@%&a@'  < ./inputs/temp-test/361.inp.158.3 
echo ">>>>>>>>running test 1950"
./replace_wrapper '-?[^a-c]??-@' '@%&a'  < ./inputs/temp-test/360.inp.158.1 
echo ">>>>>>>>running test 1951"
./replace_wrapper '-?[a-c$*$'   < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 1952"
./replace_wrapper '-?^*?-[^9-B]-[@n]-?[9-B]' '@%&a'  < ./inputs/temp-test/712.inp.308.1 
echo ">>>>>>>>running test 1953"
./replace_wrapper '-?^*?-[^9-B]-[@n]-?[9-B]' '@%&a'  < ./inputs/temp-test/713.inp.308.2 
echo ">>>>>>>>running test 1954"
./replace_wrapper '-?^*?-[^9-B]-[@n]-?[9-B]' '@%&a'  < ./inputs/temp-test/714.inp.308.3 
echo ">>>>>>>>running test 1955"
./replace_wrapper '-?^a-c]?^-]' 'a@nb@tc'  < ./inputs/temp-test/1423.inp.612.1 
echo ">>>>>>>>running test 1956"
./replace_wrapper '-?^a-c]?^-]' 'a@nb@tc'  < ./inputs/temp-test/1424.inp.612.2 
echo ">>>>>>>>running test 1957"
./replace_wrapper '-?^a-c]?^-]' 'a@nb@tc'  < ./inputs/temp-test/1425.inp.612.3 
echo ">>>>>>>>running test 1958"
./replace_wrapper '-@*' '@%&a'  < ./inputs/temp-test/319.inp.142.1 
echo ">>>>>>>>running test 1959"
./replace_wrapper '-@*' '@%&a'  < ./inputs/temp-test/320.inp.142.2 
echo ">>>>>>>>running test 1960"
./replace_wrapper '-@**' '&a@%'  < ./inputs/temp-test/830.inp.358.1 
echo ">>>>>>>>running test 1961"
./replace_wrapper '-@**' '&a@%'  < ./inputs/temp-test/831.inp.358.2 
echo ">>>>>>>>running test 1962"
./replace_wrapper '-@**' '&a@%'  < ./inputs/temp-test/832.inp.358.3 
echo ">>>>>>>>running test 1963"
./replace_wrapper '-@**' '@%@&'  < ./inputs/temp-test/2295.inp.973.1 
echo ">>>>>>>>running test 1964"
./replace_wrapper '-@**' '@%@&'  < ./inputs/temp-test/2296.inp.973.2 
echo ">>>>>>>>running test 1965"
./replace_wrapper '-@**' 'NEW'  < ./inputs/temp-test/1836.inp.781.1 
echo ">>>>>>>>running test 1966"
./replace_wrapper '-@**' 'NEW'  < ./inputs/temp-test/1837.inp.781.3 
echo ">>>>>>>>running test 1967"
./replace_wrapper '-@**' 'a@n'  < ./inputs/temp-test/896.inp.385.1 
echo ">>>>>>>>running test 1968"
./replace_wrapper '-@**?[^0-9][9-B]---[^0-9]-?' ''  < ./inputs/temp-test/2135.inp.904.1 
echo ">>>>>>>>running test 1969"
./replace_wrapper '-@**?[^0-9][9-B]---[^0-9]-?' ''  < ./inputs/temp-test/2136.inp.904.3 
echo ">>>>>>>>running test 1970"
./replace_wrapper '-@**[^a--]-^*[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1391.inp.597.1 
echo ">>>>>>>>running test 1971"
./replace_wrapper '-@**[^a--]-^*[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1392.inp.597.2 
echo ">>>>>>>>running test 1972"
./replace_wrapper '-@**[^a--]-^*[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1393.inp.597.3 
echo ">>>>>>>>running test 1973"
./replace_wrapper '-@**[^a--]-^*[a-c]' 'a@nb@tc'  < ./inputs/temp-test/1394.inp.597.4 
echo ">>>>>>>>running test 1974"
./replace_wrapper '-@**[^a-c]?@[[^a-c]$' '@%&a'  < ./inputs/temp-test/1900.inp.805.8 
echo ">>>>>>>>running test 1975"
./replace_wrapper '-@**[^a-c]?@[[^a-c]' '@%&a'  < ./inputs/temp-test/1897.inp.805.1 
echo ">>>>>>>>running test 1976"
./replace_wrapper '-@**[^a-c]?@[[^a-c]' '@%&a'  < ./inputs/temp-test/1898.inp.805.2 
echo ">>>>>>>>running test 1977"
./replace_wrapper '-@**[^a-c]?@[[^a-c]' '@%&a'  < ./inputs/temp-test/1899.inp.805.3 
echo ">>>>>>>>running test 1978"
./replace_wrapper '-@*?[9-B]' 'a@nb@tc'  < ./inputs/temp-test/1657.inp.706.1 
echo ">>>>>>>>running test 1979"
./replace_wrapper '-@*[^a--]--' '&'  < ./inputs/temp-test/853.inp.367.1 
echo ">>>>>>>>running test 1980"
./replace_wrapper '-@*[^a--]--' '&'  < ./inputs/temp-test/854.inp.367.2 
echo ">>>>>>>>running test 1981"
./replace_wrapper '-@*[^a--]--' '&'  < ./inputs/temp-test/855.inp.367.3 
echo ">>>>>>>>running test 1982"
./replace_wrapper '-@*[a-c]? *[a-[^a-c]-' '@%&a'  < ./inputs/temp-test/685.inp.298.1 
echo ">>>>>>>>running test 1983"
./replace_wrapper '-@*[a-c]? *[a-[^a-c]-' '@%&a'  < ./inputs/temp-test/686.inp.298.2 
echo ">>>>>>>>running test 1984"
./replace_wrapper '-@*[a-c]? *[a-[^a-c]-' '@%&a'  < ./inputs/temp-test/687.inp.298.3 
echo ">>>>>>>>running test 1985"
./replace_wrapper '-@*a-c]?a-]^a-][^9-B]' 'a@nb@tc'  < ./inputs/temp-test/2174.inp.920.1 
echo ">>>>>>>>running test 1986"
./replace_wrapper '-@*a-c]?a-]^a-][^9-B]' 'a@nb@tc'  < ./inputs/temp-test/2175.inp.920.2 
echo ">>>>>>>>running test 1987"
./replace_wrapper '-@@(@@$' '.'  < ./inputs/input/ruin.994 
echo ">>>>>>>>running test 1988"
./replace_wrapper '-@@*[^9-B][_-z]@t*?' '&a@%'  < ./inputs/temp-test/415.inp.183.1 
echo ">>>>>>>>running test 1989"
./replace_wrapper '-@@*[^9-B][_-z]@t*?' '&a@%'  < ./inputs/temp-test/416.inp.183.3 
echo ">>>>>>>>running test 1990"
./replace_wrapper '-@[' '@%&a'  < ./inputs/temp-test/864.inp.372.1 
echo ">>>>>>>>running test 1991"
./replace_wrapper '-@[' '@%&a'  < ./inputs/temp-test/865.inp.372.2 
echo ">>>>>>>>running test 1992"
./replace_wrapper '-@[' '@%&a'  < ./inputs/temp-test/866.inp.372.4 
echo ">>>>>>>>running test 1993"
./replace_wrapper '-@[' 'NEW'  < ./inputs/temp-test/1761.inp.749.1 
echo ">>>>>>>>running test 1994"
./replace_wrapper '-@[*' '@%&a'  < ./inputs/temp-test/1403.inp.602.1 
echo ">>>>>>>>running test 1995"
./replace_wrapper '-@[*' '@%&a'  < ./inputs/temp-test/1404.inp.602.2 
echo ">>>>>>>>running test 1996"
./replace_wrapper '-@[*' '@%&a'  < ./inputs/temp-test/1405.inp.602.3 
echo ">>>>>>>>running test 1997"
./replace_wrapper '-@[*' '@%@&'  < ./inputs/temp-test/1456.inp.624.1 
echo ">>>>>>>>running test 1998"
./replace_wrapper '-@[*' '@%@&'  < ./inputs/temp-test/1457.inp.624.2 
echo ">>>>>>>>running test 1999"
./replace_wrapper '-@[*' '@%@&'  < ./inputs/temp-test/1458.inp.624.3 
echo ">>>>>>>>running test 2000"
./replace_wrapper '-@[*-[0-9]?[^a-c][a-c]' '&'  < ./inputs/temp-test/1710.inp.729.1 
echo ">>>>>>>>running test 2001"
./replace_wrapper '-@[*-[0-9]?[^a-c][a-c]' '&'  < ./inputs/temp-test/1711.inp.729.3 
echo ">>>>>>>>running test 2002"
./replace_wrapper '-@[*[^9-B]?[^a-c *?--?' 'NEW'  < ./inputs/temp-test/1254.inp.538.1 
echo ">>>>>>>>running test 2003"
./replace_wrapper '-@[*[^9-B]?[^a-c *?--?' 'NEW'  < ./inputs/temp-test/1255.inp.538.2 
echo ">>>>>>>>running test 2004"
./replace_wrapper '-@[[^@@]-@**[a-c]' ''  < ./inputs/temp-test/453.inp.198.1 
echo ">>>>>>>>running test 2005"
./replace_wrapper '-@[[^@@]-@**[a-c]' ''  < ./inputs/temp-test/454.inp.198.3 
echo ">>>>>>>>running test 2006"
./replace_wrapper '-@n' '*U&:an"OMpY#Ei1WdZ>`'  < ./inputs/input/ruin.1277 
echo ">>>>>>>>running test 2007"
./replace_wrapper '-@n*' 'a&'  < ./inputs/temp-test/329.inp.146.1 
echo ">>>>>>>>running test 2008"
./replace_wrapper '-@n*' 'a&'  < ./inputs/temp-test/330.inp.146.2 
echo ">>>>>>>>running test 2009"
./replace_wrapper '-@n*' 'a&'  < ./inputs/temp-test/331.inp.146.3 
echo ">>>>>>>>running test 2010"
./replace_wrapper '-@n*' 'a&'  < ./inputs/temp-test/332.inp.146.4 
echo ">>>>>>>>running test 2011"
./replace_wrapper '-@n-@[[a-c]^a-c]-*?[^-z]-' '&a@%'  < ./inputs/temp-test/292.inp.132.1 
echo ">>>>>>>>running test 2012"
./replace_wrapper '-@n-@[[a-c]^a-c]-*?[^-z]-' '&a@%'  < ./inputs/temp-test/293.inp.132.2 
echo ">>>>>>>>running test 2013"
./replace_wrapper '-@n-@[[a-c]^a-c]-*?[^-z]-' '&a@%'  < ./inputs/temp-test/294.inp.132.4 
echo ">>>>>>>>running test 2014"
./replace_wrapper '-@t' ''  < ./inputs/temp-test/40.inp.17.1 
echo ">>>>>>>>running test 2015"
./replace_wrapper '-@t' ''  < ./inputs/temp-test/41.inp.17.2 
echo ">>>>>>>>running test 2016"
./replace_wrapper '-@t*-[@@]?-@[*?[^9-B]?[^0-9]-[^a--b] ' '@t'  < ./inputs/temp-test/1796.inp.764.1 
echo ">>>>>>>>running test 2017"
./replace_wrapper '-@t*-[@@]?-@[*?[^9-B]?[^0-9]-[^a--b] ' '@t'  < ./inputs/temp-test/1797.inp.764.2 
echo ">>>>>>>>running test 2018"
./replace_wrapper '-@t*@t*-@t?[-[a--]?[^a-c[0-9]^-]?-' '&'  < ./inputs/temp-test/1888.inp.801.1 
echo ">>>>>>>>running test 2019"
./replace_wrapper '-@t*@t*-@t?[-[a--]?[^a-c[0-9]^-]?-' '&'  < ./inputs/temp-test/1889.inp.801.2 
echo ">>>>>>>>running test 2020"
./replace_wrapper '-@t*@t*-@t?[-[a--]?[^a-c[0-9]^-]?-' '&'  < ./inputs/temp-test/1890.inp.801.3 
echo ">>>>>>>>running test 2021"
./replace_wrapper '-[-z]$' 'NEW'  < ./inputs/temp-test/368.inp.160.6 
echo ">>>>>>>>running test 2022"
./replace_wrapper '-[-z]' 'NEW'  < ./inputs/temp-test/366.inp.160.1 
echo ">>>>>>>>running test 2023"
./replace_wrapper '-[-z]' 'NEW'  < ./inputs/temp-test/367.inp.160.3 
echo ">>>>>>>>running test 2024"
./replace_wrapper '-[0-9]' 'NEW'  < ./inputs/temp-test/1410.inp.605.1 
echo ">>>>>>>>running test 2025"
./replace_wrapper '-[0-9]' 'a&'  < ./inputs/temp-test/646.inp.280.1 
echo ">>>>>>>>running test 2026"
./replace_wrapper '-[0-9]' 'a&'  < ./inputs/temp-test/647.inp.280.2 
echo ">>>>>>>>running test 2027"
./replace_wrapper '-[0-9]-?@[ -' ''  < ./inputs/temp-test/252.inp.112.1 
echo ">>>>>>>>running test 2028"
./replace_wrapper '-[0-9]-?@[ -' ''  < ./inputs/temp-test/253.inp.112.3 
echo ">>>>>>>>running test 2029"
./replace_wrapper '-[0-9]-[9-B][^0-9]-[0-9]?c-?[a-c@*-' ''  < ./inputs/temp-test/1322.inp.568.1 
echo ">>>>>>>>running test 2030"
./replace_wrapper '-[0-9]-[9-B][^0-9]-[0-9]?c-?[a-c@*-' ''  < ./inputs/temp-test/1323.inp.568.2 
echo ">>>>>>>>running test 2031"
./replace_wrapper '-[0-9]-[9-B][^0-9]-[0-9]?c-?[a-c@*-' ''  < ./inputs/temp-test/1324.inp.568.3 
echo ">>>>>>>>running test 2032"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]$' '@%@&'  < ./inputs/temp-test/365.inp.159.6 
echo ">>>>>>>>running test 2033"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]' '@%@&'  < ./inputs/temp-test/362.inp.159.1 
echo ">>>>>>>>running test 2034"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]' '@%@&'  < ./inputs/temp-test/363.inp.159.2 
echo ">>>>>>>>running test 2035"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]' '@%@&'  < ./inputs/temp-test/364.inp.159.3 
echo ">>>>>>>>running test 2036"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]' '@%@&@'  < ./inputs/temp-test/363.inp.159.2 
echo ">>>>>>>>running test 2037"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]' '@%@&@'  < ./inputs/temp-test/364.inp.159.3 
echo ">>>>>>>>running test 2038"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2039"
./replace_wrapper '-[0-9][^-z]@**[^9-B]?[^a--]@[ *[9-B]@' '@%@&'  < ./inputs/temp-test/362.inp.159.1 
echo ">>>>>>>>running test 2040"
./replace_wrapper '-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 2041"
./replace_wrapper '-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 2042"
./replace_wrapper '-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1398.inp.600.2 
echo ">>>>>>>>running test 2043"
./replace_wrapper '-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1399.inp.600.3 
echo ">>>>>>>>running test 2044"
./replace_wrapper '-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1400.inp.600.4 
echo ">>>>>>>>running test 2045"
./replace_wrapper '-[0-9][^9-B][0-9]?[^0-9]' '@t'  < ./inputs/temp-test/1215.inp.522.1 
echo ">>>>>>>>running test 2046"
./replace_wrapper '-[0-9][^a-c]-?-[^9-B][0-9]' '&a@%'  < ./inputs/temp-test/2139.inp.906.1 
echo ">>>>>>>>running test 2047"
./replace_wrapper '-[9-B] [^0-9][0-9][^0-9]' '@%@&'  < ./inputs/temp-test/619.inp.267.1 
echo ">>>>>>>>running test 2048"
./replace_wrapper '-[9-B] [^0-9][0-9][^0-9]' '@%@&'  < ./inputs/temp-test/620.inp.267.2 
echo ">>>>>>>>running test 2049"
./replace_wrapper '-[9-B]' '&'  < ./inputs/temp-test/1335.inp.573.1 
echo ">>>>>>>>running test 2050"
./replace_wrapper '-[9-B]' '&'  < ./inputs/temp-test/1754.inp.745.1 
echo ">>>>>>>>running test 2051"
./replace_wrapper '-[9-B]' '&'  < ./inputs/temp-test/1755.inp.745.3 
echo ">>>>>>>>running test 2052"
./replace_wrapper '-[9-B]' ''  < ./inputs/temp-test/238.inp.106.1 
echo ">>>>>>>>running test 2053"
./replace_wrapper '-[9-B]' ''  < ./inputs/temp-test/239.inp.106.3 
echo ">>>>>>>>running test 2054"
./replace_wrapper '-[9-B]-[^0-9]' '&a@%'  < ./inputs/temp-test/1664.inp.710.1 
echo ">>>>>>>>running test 2055"
./replace_wrapper '-[9-B]-[^0-9]' '&a@%'  < ./inputs/temp-test/1665.inp.710.3 
echo ">>>>>>>>running test 2056"
./replace_wrapper '-[9-B][9-B] *-^*^a-]' '@n'  < ./inputs/temp-test/1044.inp.450.2 
echo ">>>>>>>>running test 2057"
./replace_wrapper '-[9-B][9-B] *-^*^a-][@n]' '@n'  < ./inputs/temp-test/1043.inp.450.1 
echo ">>>>>>>>running test 2058"
./replace_wrapper '-[9-B][9-B] *-^*^a-][@n]' '@n'  < ./inputs/temp-test/1044.inp.450.2 
echo ">>>>>>>>running test 2059"
./replace_wrapper '-[9-B][9-B] *-^*^a-][@n]' '@n'  < ./inputs/temp-test/1045.inp.450.3 
echo ">>>>>>>>running test 2060"
./replace_wrapper '-[9-B]a-] *[^0-9]' '&'  < ./inputs/temp-test/1042.inp.449.1 
echo ">>>>>>>>running test 2061"
./replace_wrapper '-[@n]'   < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2062"
./replace_wrapper '-[@n]*$' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2063"
./replace_wrapper '-[@n]*' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2064"
./replace_wrapper '-[@n][][^a--b]' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2065"
./replace_wrapper '-[@n][][^a--b]' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2066"
./replace_wrapper '-[@n][^][^a--b]' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2067"
./replace_wrapper '-[@n][^][^a--b]' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2068"
./replace_wrapper '-[@n][^a--b]$'   < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 2069"
./replace_wrapper '-[@n][^a--b]$' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 2070"
./replace_wrapper '-[@n][^a--b]'   < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2071"
./replace_wrapper '-[@n][^a--b]'   < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2072"
./replace_wrapper '-[@n][^a--b]' '&@n'   < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2073"
./replace_wrapper '-[@n][^a--b]' 'NEW'  < ./inputs/temp-test/213.inp.96.1 
echo ">>>>>>>>running test 2074"
./replace_wrapper '-[@n][^a--b]' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2075"
./replace_wrapper '-[@n][^a--b]*$' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2076"
./replace_wrapper '-[@n][^a--b]*$' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 2077"
./replace_wrapper '-[@n][^a--b]*' 'NEW'  < ./inputs/temp-test/214.inp.96.3 
echo ">>>>>>>>running test 2078"
./replace_wrapper '-[@n][^a--b]*' 'NEW'  < ./inputs/temp-test/215.inp.96.8 
echo ">>>>>>>>running test 2079"
./replace_wrapper '-[@t]$' 'NEW'  < ./inputs/temp-test/1800.inp.765.9 
echo ">>>>>>>>running test 2080"
./replace_wrapper '-[@t]' 'NEW'  < ./inputs/temp-test/1798.inp.765.1 
echo ">>>>>>>>running test 2081"
./replace_wrapper '-[@t]' 'NEW'  < ./inputs/temp-test/1799.inp.765.4 
echo ">>>>>>>>running test 2082"
./replace_wrapper '-[^-' 'a@nb@tc'  < ./inputs/temp-test/1678.inp.715.1 
echo ">>>>>>>>running test 2083"
./replace_wrapper '-[^-' 'a@nb@tc'  < ./inputs/temp-test/1679.inp.715.2 
echo ">>>>>>>>running test 2084"
./replace_wrapper '-[^-' 'a@nb@tc'  < ./inputs/temp-test/1680.inp.715.3 
echo ">>>>>>>>running test 2085"
./replace_wrapper '-[^--z]' '@n'  < ./inputs/temp-test/1917.inp.815.1 
echo ">>>>>>>>running test 2086"
./replace_wrapper '-[^--z]' '@n'  < ./inputs/temp-test/1918.inp.815.2 
echo ">>>>>>>>running test 2087"
./replace_wrapper '-[^--z]' '@n'  < ./inputs/temp-test/1919.inp.815.3 
echo ">>>>>>>>running test 2088"
./replace_wrapper '-[^--z]-[^a--b][^0-9]@* *?-c' '@n'  < ./inputs/temp-test/902.inp.388.1 
echo ">>>>>>>>running test 2089"
./replace_wrapper '-[^--z]-[^a--b][^0-9]@* *?-c' '@n'  < ./inputs/temp-test/903.inp.388.3 
echo ">>>>>>>>running test 2090"
./replace_wrapper '-[^-z]' '&a@%'  < ./inputs/temp-test/768.inp.329.1 
echo ">>>>>>>>running test 2091"
./replace_wrapper '-[^-z]' ''  < ./inputs/temp-test/1163.inp.501.1 
echo ">>>>>>>>running test 2092"
./replace_wrapper '-[^-z]' ''  < ./inputs/temp-test/1164.inp.501.2 
echo ">>>>>>>>running test 2093"
./replace_wrapper '-[^-z]' ''  < ./inputs/temp-test/1165.inp.501.4 
echo ">>>>>>>>running test 2094"
./replace_wrapper '-[^-z][^a-c]-[a-c][^a-c]-*-?^?^a-c]?-?' 'a&'  < ./inputs/temp-test/2312.inp.981.1 
echo ">>>>>>>>running test 2095"
./replace_wrapper '-[^-z][^a-c]-[a-c][^a-c]-*-?^?^a-c]?-?' 'a&'  < ./inputs/temp-test/2313.inp.981.3 
echo ">>>>>>>>running test 2096"
./replace_wrapper '-[^-z][^a-c]-[a-c][^a-c]-*-?^?^a-c]?-?' 'a&'  < ./inputs/temp-test/2314.inp.981.4 
echo ">>>>>>>>running test 2097"
./replace_wrapper '-[^0-9] a-c]-@[[^0-9][a--b]A*' '&'  < ./inputs/temp-test/2209.inp.936.1 
echo ">>>>>>>>running test 2098"
./replace_wrapper '-[^0-9] a-c]-@[[^0-9][a--b]A*' '&'  < ./inputs/temp-test/2210.inp.936.2 
echo ">>>>>>>>running test 2099"
./replace_wrapper '-[^0-9]' '&a@%'  < ./inputs/temp-test/2213.inp.938.1 
echo ">>>>>>>>running test 2100"
./replace_wrapper '-[^0-9]' '&a@%'  < ./inputs/temp-test/2214.inp.938.2 
echo ">>>>>>>>running test 2101"
./replace_wrapper '-[^0-9]' '&a@%'  < ./inputs/temp-test/2215.inp.938.3 
echo ">>>>>>>>running test 2102"
./replace_wrapper '-[^0-9]' '@t'  < ./inputs/temp-test/1229.inp.527.1 
echo ">>>>>>>>running test 2103"
./replace_wrapper '-[^0-9]' '@t'  < ./inputs/temp-test/1230.inp.527.2 
echo ">>>>>>>>running test 2104"
./replace_wrapper '-[^0-9]' 'NEW'  < ./inputs/temp-test/2011.inp.854.1 
echo ">>>>>>>>running test 2105"
./replace_wrapper '-[^0-9]' 'NEW'  < ./inputs/temp-test/2012.inp.854.3 
echo ">>>>>>>>running test 2106"
./replace_wrapper '-[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/476.inp.208.1 
echo ">>>>>>>>running test 2107"
./replace_wrapper '-[^0-9]-?-[^9-B]?[^a--]a-c]-$' '@%&a'  < ./inputs/temp-test/1929.inp.819.9 
echo ">>>>>>>>running test 2108"
./replace_wrapper '-[^0-9]-?-[^9-B]?[^a--]a-c]-' '@%&a'  < ./inputs/temp-test/1926.inp.819.1 
echo ">>>>>>>>running test 2109"
./replace_wrapper '-[^0-9]-?-[^9-B]?[^a--]a-c]-' '@%&a'  < ./inputs/temp-test/1927.inp.819.2 
echo ">>>>>>>>running test 2110"
./replace_wrapper '-[^0-9]-?-[^9-B]?[^a--]a-c]-' '@%&a'  < ./inputs/temp-test/1928.inp.819.3 
echo ">>>>>>>>running test 2111"
./replace_wrapper '-[^0-9]?[a-c' '@t'  < ./inputs/temp-test/384.inp.167.1 
echo ">>>>>>>>running test 2112"
./replace_wrapper '-[^0-9][0-9]A@@*[^0-9][9-B]@@[^a-c]--[0-9][9-B][^a-]' 'NEW'  < ./inputs/temp-test/1584.inp.675.1 
echo ">>>>>>>>running test 2113"
./replace_wrapper '-[^0-9][0-9][^a--' 'a&'  < ./inputs/temp-test/1733.inp.737.1 
echo ">>>>>>>>running test 2114"
./replace_wrapper '-[^9-B]$' '&a@%'  < ./inputs/temp-test/178.inp.80.6 
echo ">>>>>>>>running test 2115"
./replace_wrapper '-[^9-B]$' '&a@%'  < ./inputs/temp-test/179.inp.80.9 
echo ">>>>>>>>running test 2116"
./replace_wrapper '-[^9-B]$' '@t'  < ./inputs/temp-test/973.inp.419.9 
echo ">>>>>>>>running test 2117"
./replace_wrapper '-[^9-B]$' 'NEW'  < ./inputs/temp-test/1219.inp.523.6 
echo ">>>>>>>>running test 2118"
./replace_wrapper '-[^9-B]' '&a@%'  < ./inputs/temp-test/177.inp.80.1 
echo ">>>>>>>>running test 2119"
./replace_wrapper '-[^9-B]' '@%&a'  < ./inputs/temp-test/2079.inp.881.1 
echo ">>>>>>>>running test 2120"
./replace_wrapper '-[^9-B]' '@%&a'  < ./inputs/temp-test/2080.inp.881.2 
echo ">>>>>>>>running test 2121"
./replace_wrapper '-[^9-B]' '@%&a'  < ./inputs/temp-test/2081.inp.881.3 
echo ">>>>>>>>running test 2122"
./replace_wrapper '-[^9-B]' '@%@&'  < ./inputs/temp-test/561.inp.242.1 
echo ">>>>>>>>running test 2123"
./replace_wrapper '-[^9-B]' '@%@&'  < ./inputs/temp-test/562.inp.242.2 
echo ">>>>>>>>running test 2124"
./replace_wrapper '-[^9-B]' '@%@&'  < ./inputs/temp-test/563.inp.242.4 
echo ">>>>>>>>running test 2125"
./replace_wrapper '-[^9-B]' '@%@&'  < ./inputs/temp-test/897.inp.386.1 
echo ">>>>>>>>running test 2126"
./replace_wrapper '-[^9-B]' '@%@&'  < ./inputs/temp-test/898.inp.386.3 
echo ">>>>>>>>running test 2127"
./replace_wrapper '-[^9-B]' '@n'  < ./inputs/temp-test/748.inp.321.1 
echo ">>>>>>>>running test 2128"
./replace_wrapper '-[^9-B]' '@n'  < ./inputs/temp-test/749.inp.321.2 
echo ">>>>>>>>running test 2129"
./replace_wrapper '-[^9-B]' '@t'  < ./inputs/temp-test/972.inp.419.1 
echo ">>>>>>>>running test 2130"
./replace_wrapper '-[^9-B]' 'NEW'  < ./inputs/temp-test/1216.inp.523.1 
echo ">>>>>>>>running test 2131"
./replace_wrapper '-[^9-B]' 'NEW'  < ./inputs/temp-test/1217.inp.523.3 
echo ">>>>>>>>running test 2132"
./replace_wrapper '-[^9-B]' 'NEW'  < ./inputs/temp-test/1218.inp.523.4 
echo ">>>>>>>>running test 2133"
./replace_wrapper '-[^9-B]' 'NEW'  < ./inputs/temp-test/890.inp.383.1 
echo ">>>>>>>>running test 2134"
./replace_wrapper '-[^9-B]' 'NEW'  < ./inputs/temp-test/891.inp.383.2 
echo ">>>>>>>>running test 2135"
./replace_wrapper '-[^9-B]' 'a&'  < ./inputs/temp-test/989.inp.426.1 
echo ">>>>>>>>running test 2136"
./replace_wrapper '-[^9-B]' 'a&'  < ./inputs/temp-test/990.inp.426.3 
echo ">>>>>>>>running test 2137"
./replace_wrapper '-[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1716.inp.731.1 
echo ">>>>>>>>running test 2138"
./replace_wrapper '-[^9-B]' 'b@t'  < ./inputs/temp-test/1818.inp.773.1 
echo ">>>>>>>>running test 2139"
./replace_wrapper '-[^9-B]' 'b@t'  < ./inputs/temp-test/1819.inp.773.2 
echo ">>>>>>>>running test 2140"
./replace_wrapper '-[^9-B]' 'b@t'  < ./inputs/temp-test/1820.inp.773.4 
echo ">>>>>>>>running test 2141"
./replace_wrapper '-[^9-B]-' ''  < ./inputs/temp-test/2097.inp.889.1 
echo ">>>>>>>>running test 2142"
./replace_wrapper '-[^9-B]-' ''  < ./inputs/temp-test/2098.inp.889.3 
echo ">>>>>>>>running test 2143"
./replace_wrapper '-[^9-B]?[a-cc*[a-c][^a-c' 'a@nb@tc'  < ./inputs/temp-test/1852.inp.787.1 
echo ">>>>>>>>running test 2144"
./replace_wrapper '-[^9-B]?[a-cc*[a-c][^a-c' 'a@nb@tc'  < ./inputs/temp-test/1853.inp.787.2 
echo ">>>>>>>>running test 2145"
./replace_wrapper '-[^9-B]?[a-cc*[a-c][^a-c' 'a@nb@tc'  < ./inputs/temp-test/1854.inp.787.3 
echo ">>>>>>>>running test 2146"
./replace_wrapper '-[^9-B]?[a-cc*[a-c][^a-c' 'a@nb@tc'  < ./inputs/temp-test/1855.inp.787.4 
echo ">>>>>>>>running test 2147"
./replace_wrapper '-[^9-B][^0-9] ' 'a@n'  < ./inputs/temp-test/2024.inp.859.1 
echo ">>>>>>>>running test 2148"
./replace_wrapper '-[^9-B][^0-9] ' 'a@n'  < ./inputs/temp-test/2025.inp.859.2 
echo ">>>>>>>>running test 2149"
./replace_wrapper '-[^9-B][^0-9]-' 'a&'  < ./inputs/temp-test/95.inp.43.1 
echo ">>>>>>>>running test 2150"
./replace_wrapper '-[^9-B][^0-9]-' 'a&'  < ./inputs/temp-test/96.inp.43.2 
echo ">>>>>>>>running test 2151"
./replace_wrapper '-[^9-B][^0-9]-[-' '&a@%'  < ./inputs/temp-test/774.inp.333.1 
echo ">>>>>>>>running test 2152"
./replace_wrapper '-[^9-B][^0-9]-[-' '&a@%'  < ./inputs/temp-test/775.inp.333.2 
echo ">>>>>>>>running test 2153"
./replace_wrapper '-[^9-B][^0-9]-[-' '&a@%'  < ./inputs/temp-test/776.inp.333.3 
echo ">>>>>>>>running test 2154"
./replace_wrapper '-[^9-B][^0-9]?*' '&a@%'  < ./inputs/temp-test/391.inp.171.1 
echo ">>>>>>>>running test 2155"
./replace_wrapper '-[^9-B][^0-9]?*' '&a@%'  < ./inputs/temp-test/392.inp.171.2 
echo ">>>>>>>>running test 2156"
./replace_wrapper '-[^9-B][^0-9][^-z]' '&a@%'  < ./inputs/temp-test/391.inp.171.1 
echo ">>>>>>>>running test 2157"
./replace_wrapper '-[^9-B][^0-9][^-z]' '&a@%'  < ./inputs/temp-test/392.inp.171.2 
echo ">>>>>>>>running test 2158"
./replace_wrapper '-[^9-B][^0-9][_-z]?-^*?' '@n'  < ./inputs/temp-test/1049.inp.452.1 
echo ">>>>>>>>running test 2159"
./replace_wrapper '-[^9-B][^0-9][_-z]?-^*?' '@n'  < ./inputs/temp-test/1050.inp.452.3 
echo ">>>>>>>>running test 2160"
./replace_wrapper '-[^9-B][a--b][^9-B]--[^a--]' '&a@%'  < ./inputs/temp-test/1756.inp.746.1 
echo ">>>>>>>>running test 2161"
./replace_wrapper '-[^@n]?-?$' '&'  < ./inputs/temp-test/1613.inp.685.9 
echo ">>>>>>>>running test 2162"
./replace_wrapper '-[^@n]?-?' '&'  < ./inputs/temp-test/1610.inp.685.1 
echo ">>>>>>>>running test 2163"
./replace_wrapper '-[^@n]?-?' '&'  < ./inputs/temp-test/1611.inp.685.2 
echo ">>>>>>>>running test 2164"
./replace_wrapper '-[^@n]?-?' '&'  < ./inputs/temp-test/1612.inp.685.3 
echo ">>>>>>>>running test 2165"
./replace_wrapper '-[^a-' 'a&'  < ./inputs/temp-test/379.inp.165.1 
echo ">>>>>>>>running test 2166"
./replace_wrapper '-[^a-' 'a&'  < ./inputs/temp-test/380.inp.165.2 
echo ">>>>>>>>running test 2167"
./replace_wrapper '-[^a-c%' ''  < ./inputs/temp-test/2353.inp.999.1 
echo ">>>>>>>>running test 2168"
./replace_wrapper '-[^a-c' '&a@%'  < ./inputs/temp-test/422.inp.186.1 
echo ">>>>>>>>running test 2169"
./replace_wrapper '-[^a-c' '&a@%'  < ./inputs/temp-test/423.inp.186.3 
echo ">>>>>>>>running test 2170"
./replace_wrapper '-[^a-c' ''  < ./inputs/temp-test/2353.inp.999.1 
echo ">>>>>>>>running test 2171"
./replace_wrapper '-[^a-c' ''  < ./inputs/temp-test/2354.inp.999.2 
echo ">>>>>>>>running test 2172"
./replace_wrapper '-[^a-c' ''  < ./inputs/temp-test/2355.inp.999.3 
echo ">>>>>>>>running test 2173"
./replace_wrapper '-[^a-c' 'b@t'  < ./inputs/temp-test/1824.inp.776.1 
echo ">>>>>>>>running test 2174"
./replace_wrapper '-[^a-c]' '@%@&'  < ./inputs/temp-test/862.inp.371.1 
echo ">>>>>>>>running test 2175"
./replace_wrapper '-[^a-c]' 'b@t'  < ./inputs/temp-test/1651.inp.704.1 
echo ">>>>>>>>running test 2176"
./replace_wrapper '-[^a-c]' 'b@t'  < ./inputs/temp-test/1652.inp.704.3 
echo ">>>>>>>>running test 2177"
./replace_wrapper '-[^a-c]' 'b@t'  < ./inputs/temp-test/1653.inp.704.4 
echo ">>>>>>>>running test 2178"
./replace_wrapper '-[^a-c]--a-]' 'NEW'  < ./inputs/temp-test/1566.inp.669.1 
echo ">>>>>>>>running test 2179"
./replace_wrapper '-[^a-c]--a-]' 'NEW'  < ./inputs/temp-test/1567.inp.669.3 
echo ">>>>>>>>running test 2180"
./replace_wrapper '-[_-z]' '&'  < ./inputs/temp-test/1816.inp.772.1 
echo ">>>>>>>>running test 2181"
./replace_wrapper '-[_-z]' '&'  < ./inputs/temp-test/1817.inp.772.3 
echo ">>>>>>>>running test 2182"
./replace_wrapper '-[_-z]' '@%&a'  < ./inputs/temp-test/1960.inp.832.1 
echo ">>>>>>>>running test 2183"
./replace_wrapper '-[_-z]' '@%&a'  < ./inputs/temp-test/1961.inp.832.2 
echo ">>>>>>>>running test 2184"
./replace_wrapper '-[_-z]' 'a&'  < ./inputs/temp-test/498.inp.218.1 
echo ">>>>>>>>running test 2185"
./replace_wrapper '-[a--b]' 'a&'  < ./inputs/temp-test/1617.inp.687.1 
echo ">>>>>>>>running test 2186"
./replace_wrapper '-[a--b]' 'a&'  < ./inputs/temp-test/1618.inp.687.3 
echo ">>>>>>>>running test 2187"
./replace_wrapper '-[a--b]-' '@%&a'  < ./inputs/temp-test/2219.inp.940.1 
echo ">>>>>>>>running test 2188"
./replace_wrapper '-[a--b][0-9][^a-c[^9-B]-' 'a&'  < ./inputs/temp-test/1475.inp.633.1 
echo ">>>>>>>>running test 2189"
./replace_wrapper '-[a--b][0-9][^a-c[^9-B]-' 'a&'  < ./inputs/temp-test/1476.inp.633.2 
echo ">>>>>>>>running test 2190"
./replace_wrapper '-[a--b][0-9][^a-c[^9-B]-' 'a&'  < ./inputs/temp-test/1477.inp.633.3 
echo ">>>>>>>>running test 2191"
./replace_wrapper '-[a--b][^a--b]-@[a-c][^-z][a--b][^9-B]' ''  < ./inputs/temp-test/650.inp.282.1 
echo ">>>>>>>>running test 2192"
./replace_wrapper '-[a--b][^a--b]-@[a-c][^-z][a--b][^9-B]' ''  < ./inputs/temp-test/651.inp.282.3 
echo ">>>>>>>>running test 2193"
./replace_wrapper '-[a-c' ''  < ./inputs/temp-test/1681.inp.716.1 
echo ">>>>>>>>running test 2194"
./replace_wrapper '-[a-c' ''  < ./inputs/temp-test/1682.inp.716.2 
echo ">>>>>>>>running test 2195"
./replace_wrapper '-[a-c' 'a@nb@tc'  < ./inputs/temp-test/1225.inp.526.1 
echo ">>>>>>>>running test 2196"
./replace_wrapper '-[a-c' 'a@nb@tc'  < ./inputs/temp-test/1226.inp.526.2 
echo ">>>>>>>>running test 2197"
./replace_wrapper '-[a-c' 'a@nb@tc'  < ./inputs/temp-test/1227.inp.526.3 
echo ">>>>>>>>running test 2198"
./replace_wrapper '-[a-c' 'a@nb@tc'  < ./inputs/temp-test/1228.inp.526.4 
echo ">>>>>>>>running test 2199"
./replace_wrapper '-[a-c]' '&'  < ./inputs/temp-test/1023.inp.440.1 
echo ">>>>>>>>running test 2200"
./replace_wrapper '-[a-c]' '&'  < ./inputs/temp-test/1024.inp.440.2 
echo ">>>>>>>>running test 2201"
./replace_wrapper '-[a-c]' '@%@&'  < ./inputs/temp-test/358.inp.157.1 
echo ">>>>>>>>running test 2202"
./replace_wrapper '-[a-c]' '@%@&'  < ./inputs/temp-test/359.inp.157.3 
echo ">>>>>>>>running test 2203"
./replace_wrapper '-[a-c]' '@%@&@'  < ./inputs/temp-test/359.inp.157.3 
echo ">>>>>>>>running test 2204"
./replace_wrapper '-[a-c]' '@n'  < ./inputs/temp-test/1155.inp.497.1 
echo ">>>>>>>>running test 2205"
./replace_wrapper '-[a-c]' '@n'  < ./inputs/temp-test/1156.inp.497.3 
echo ">>>>>>>>running test 2206"
./replace_wrapper '-[a-c]' 'a@n'  < ./inputs/temp-test/1387.inp.595.1 
echo ">>>>>>>>running test 2207"
./replace_wrapper '-[a-c]' 'a@n'  < ./inputs/temp-test/1388.inp.595.3 
echo ">>>>>>>>running test 2208"
./replace_wrapper '-[a-c]' 'b@t'  < ./inputs/temp-test/2291.inp.971.1 
echo ">>>>>>>>running test 2209"
./replace_wrapper '-[a-c]-[^-z]' '@%&a'  < ./inputs/temp-test/1831.inp.779.1 
echo ">>>>>>>>running test 2210"
./replace_wrapper '-[a-c]-[^-z]' '@%&a'  < ./inputs/temp-test/1832.inp.779.2 
echo ">>>>>>>>running test 2211"
./replace_wrapper '-[a-c]@' '@%@&'  < ./inputs/temp-test/358.inp.157.1 
echo ">>>>>>>>running test 2212"
./replace_wrapper '-\|h4+5~' 'A+2wF)'  < ./inputs/input/ruin.948 
echo ">>>>>>>>running test 2213"
./replace_wrapper '-] ' 'NEW'  < ./inputs/temp-test/611.inp.263.1 
echo ">>>>>>>>running test 2214"
./replace_wrapper '-]' 'NEW'  < ./inputs/temp-test/2191.inp.928.1 
echo ">>>>>>>>running test 2215"
./replace_wrapper '-]-' '@n'  < ./inputs/temp-test/1122.inp.483.1 
echo ">>>>>>>>running test 2216"
./replace_wrapper '-]?' 'a&'  < ./inputs/temp-test/1121.inp.482.1 
echo ">>>>>>>>running test 2217"
./replace_wrapper '-]@**' '&'  < ./inputs/temp-test/406.inp.178.1 
echo ">>>>>>>>running test 2218"
./replace_wrapper '-]@**' '&'  < ./inputs/temp-test/407.inp.178.2 
echo ">>>>>>>>running test 2219"
./replace_wrapper '-]@**' '&'  < ./inputs/temp-test/408.inp.178.3 
echo ">>>>>>>>running test 2220"
./replace_wrapper '-]A*' '@%&a'  < ./inputs/temp-test/1209.inp.519.2 
echo ">>>>>>>>running test 2221"
./replace_wrapper '-]A*' '@%&a'  < ./inputs/temp-test/1210.inp.519.3 
echo ">>>>>>>>running test 2222"
./replace_wrapper '-][^0-9]' '@%@&'  < ./inputs/temp-test/629.inp.272.1 
echo ">>>>>>>>running test 2223"
./replace_wrapper '-][^0-9]' '@%@&'  < ./inputs/temp-test/630.inp.272.3 
echo ">>>>>>>>running test 2224"
./replace_wrapper '-][^0-9]' 'a@nb@tc'  < ./inputs/temp-test/578.inp.249.1 
echo ">>>>>>>>running test 2225"
./replace_wrapper '-][^0-9]' 'a@nb@tc'  < ./inputs/temp-test/579.inp.249.2 
echo ">>>>>>>>running test 2226"
./replace_wrapper '-][^0-9][a-' '&'  < ./inputs/temp-test/2262.inp.959.1 
echo ">>>>>>>>running test 2227"
./replace_wrapper '-][^0-9][a-' '&'  < ./inputs/temp-test/2263.inp.959.2 
echo ">>>>>>>>running test 2228"
./replace_wrapper '-][^0-9][a-' '&'  < ./inputs/temp-test/2264.inp.959.3 
echo ">>>>>>>>running test 2229"
./replace_wrapper '-]c*??- [^9-B]' 'b@t'  < ./inputs/temp-test/1981.inp.841.1 
echo ">>>>>>>>running test 2230"
./replace_wrapper '-]c*??- [^9-B]' 'b@t'  < ./inputs/temp-test/1982.inp.841.2 
echo ">>>>>>>>running test 2231"
./replace_wrapper '-^$' 'NEW'  < ./inputs/temp-test/1289.inp.553.6 
echo ">>>>>>>>running test 2232"
./replace_wrapper '-^$' 'a@nb@tc'  < ./inputs/temp-test/763.inp.326.6 
echo ">>>>>>>>running test 2233"
./replace_wrapper '-^' ''  < ./inputs/temp-test/573.inp.247.1 
echo ">>>>>>>>running test 2234"
./replace_wrapper '-^' ''  < ./inputs/temp-test/574.inp.247.2 
echo ">>>>>>>>running test 2235"
./replace_wrapper '-^' '@%&a'  < ./inputs/temp-test/1247.inp.535.1 
echo ">>>>>>>>running test 2236"
./replace_wrapper '-^' '@%&a'  < ./inputs/temp-test/1248.inp.535.2 
echo ">>>>>>>>running test 2237"
./replace_wrapper '-^' 'NEW'  < ./inputs/temp-test/1287.inp.553.1 
echo ">>>>>>>>running test 2238"
./replace_wrapper '-^' 'NEW'  < ./inputs/temp-test/1288.inp.553.3 
echo ">>>>>>>>running test 2239"
./replace_wrapper '-^' 'a&'  < ./inputs/temp-test/1426.inp.613.1 
echo ">>>>>>>>running test 2240"
./replace_wrapper '-^' 'a&'  < ./inputs/temp-test/1427.inp.613.2 
echo ">>>>>>>>running test 2241"
./replace_wrapper '-^' 'a&'  < ./inputs/temp-test/1428.inp.613.3 
echo ">>>>>>>>running test 2242"
./replace_wrapper '-^' 'a@nb@tc'  < ./inputs/temp-test/760.inp.326.1 
echo ">>>>>>>>running test 2243"
./replace_wrapper '-^' 'a@nb@tc'  < ./inputs/temp-test/761.inp.326.2 
echo ">>>>>>>>running test 2244"
./replace_wrapper '-^' 'a@nb@tc'  < ./inputs/temp-test/762.inp.326.3 
echo ">>>>>>>>running test 2245"
./replace_wrapper '-^*' '@t'  < ./inputs/temp-test/1060.inp.456.1 
echo ">>>>>>>>running test 2246"
./replace_wrapper '-^*' '@t'  < ./inputs/temp-test/1061.inp.456.3 
echo ">>>>>>>>running test 2247"
./replace_wrapper '-^*' 'NEW'  < ./inputs/temp-test/648.inp.281.1 
echo ">>>>>>>>running test 2248"
./replace_wrapper '-^*' 'NEW'  < ./inputs/temp-test/649.inp.281.3 
echo ">>>>>>>>running test 2249"
./replace_wrapper '-^*' 'a@nb@tc'  < ./inputs/temp-test/1721.inp.733.1 
echo ">>>>>>>>running test 2250"
./replace_wrapper '-^*' 'a@nb@tc'  < ./inputs/temp-test/1722.inp.733.2 
echo ">>>>>>>>running test 2251"
./replace_wrapper '-^*' 'a@nb@tc'  < ./inputs/temp-test/1723.inp.733.3 
echo ">>>>>>>>running test 2252"
./replace_wrapper '-^-]' '@%&a'  < ./inputs/temp-test/2309.inp.980.1 
echo ">>>>>>>>running test 2253"
./replace_wrapper '-^-]' '@%&a'  < ./inputs/temp-test/2310.inp.980.3 
echo ">>>>>>>>running test 2254"
./replace_wrapper '-^-]' '@%@&'  < ./inputs/temp-test/376.inp.163.1 
echo ">>>>>>>>running test 2255"
./replace_wrapper '-^-]' '@t'  < ./inputs/temp-test/1071.inp.461.1 
echo ">>>>>>>>running test 2256"
./replace_wrapper '-^-]' '@t'  < ./inputs/temp-test/1072.inp.461.2 
echo ">>>>>>>>running test 2257"
./replace_wrapper '-^-]' '@t'  < ./inputs/temp-test/1073.inp.461.3 
echo ">>>>>>>>running test 2258"
./replace_wrapper '-^?*' ''  < ./inputs/temp-test/574.inp.247.2 
echo ">>>>>>>>running test 2259"
./replace_wrapper '-^[^--z]--[a-c?[^-@[[^a-c]^-]@**?-' '@t'  < ./inputs/temp-test/2115.inp.897.1 
echo ">>>>>>>>running test 2260"
./replace_wrapper '-^[^--z]--[a-c?[^-@[[^a-c]^-]@**?-' '@t'  < ./inputs/temp-test/2116.inp.897.3 
echo ">>>>>>>>running test 2261"
./replace_wrapper '-^a-]-]?' '&a@%'  < ./inputs/temp-test/1459.inp.625.1 
echo ">>>>>>>>running test 2262"
./replace_wrapper '-^a-]-]?' '&a@%'  < ./inputs/temp-test/1460.inp.625.2 
echo ">>>>>>>>running test 2263"
./replace_wrapper '-^a-c][^a-c][a--]a-c]? ?@n*^a-c]a-]?' ''  < ./inputs/temp-test/1493.inp.640.1 
echo ">>>>>>>>running test 2264"
./replace_wrapper '-a-]?[^a-c]--[_-z]-' '@n'  < ./inputs/temp-test/1891.inp.802.1 
echo ">>>>>>>>running test 2265"
./replace_wrapper '-a-]?[^a-c]--[_-z]-' '@n'  < ./inputs/temp-test/1892.inp.802.2 
echo ">>>>>>>>running test 2266"
./replace_wrapper '-a-c]-A[^@@]' '@%&a'  < ./inputs/temp-test/417.inp.184.1 
echo ">>>>>>>>running test 2267"
./replace_wrapper '-a-c]-A[^@@]' '@%&a'  < ./inputs/temp-test/418.inp.184.3 
echo ">>>>>>>>running test 2268"
./replace_wrapper '-a-c]A*-?' ''  < ./inputs/temp-test/260.inp.115.1 
echo ">>>>>>>>running test 2269"
./replace_wrapper '-a-c][^0-9][0-9]?@n*[^0-9]@*c[0-9]' 'b@t'  < ./inputs/temp-test/1655.inp.705.1 
echo ">>>>>>>>running test 2270"
./replace_wrapper '-a-c][^0-9][0-9]?@n*[^0-9]@*c[0-9]' 'b@t'  < ./inputs/temp-test/1656.inp.705.2 
echo ">>>>>>>>running test 2271"
./replace_wrapper '-a]#[0-9]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2272"
./replace_wrapper '-c*' 'a&'  < ./inputs/temp-test/2027.inp.860.1 
echo ">>>>>>>>running test 2273"
./replace_wrapper '-c*' 'a&'  < ./inputs/temp-test/2028.inp.860.3 
echo ">>>>>>>>running test 2274"
./replace_wrapper '-c*?-?' 'NEW'  < ./inputs/temp-test/547.inp.237.1 
echo ">>>>>>>>running test 2275"
./replace_wrapper '-c*?-?' 'NEW'  < ./inputs/temp-test/548.inp.237.2 
echo ">>>>>>>>running test 2276"
./replace_wrapper '-c*?-?' 'NEW'  < ./inputs/temp-test/549.inp.237.3 
echo ">>>>>>>>running test 2277"
./replace_wrapper '-c---[^0-9][0-9][9-B]-' '@n'  < ./inputs/temp-test/1032.inp.444.1 
echo ">>>>>>>>running test 2278"
./replace_wrapper '-c---[^0-9][0-9][9-B]-' '@n'  < ./inputs/temp-test/1033.inp.444.2 
echo ">>>>>>>>running test 2279"
./replace_wrapper '-c?$' '@%@&'  < ./inputs/temp-test/606.inp.260.9 
echo ">>>>>>>>running test 2280"
./replace_wrapper '-c?' '@%@&'  < ./inputs/temp-test/603.inp.260.1 
echo ">>>>>>>>running test 2281"
./replace_wrapper '-c?' '@%@&'  < ./inputs/temp-test/604.inp.260.3 
echo ">>>>>>>>running test 2282"
./replace_wrapper '-c[^9-B][9-B]-[^-z]?-' '&a@%'  < ./inputs/temp-test/2010.inp.853.1 
echo ">>>>>>>>running test 2283"
./replace_wrapper '-c[^9-B][9-B]-[^-z]?-c[^9-B][9-B]-[^-z]?---c[^9-B][9-B]-[^-z]?--c[^9-B][9-B]-[^-z]?--c[^9-B][9-B]-[^-z]?--c[^9-B][9-B]-[^-z]?--c[^9-B][9-B]-[^-z]?-' '&a@%'  < ./inputs/temp-test/2010.inp.853.1 
echo ">>>>>>>>running test 2284"
./replace_wrapper '.' '+h8aqrDP='  < ./inputs/input/ruin.513 
echo ">>>>>>>>running test 2285"
./replace_wrapper '.' '8]AE9Lk)owK TbxK<5-7bhAVK2'  < ./inputs/input/ruin.1409 
echo ">>>>>>>>running test 2286"
./replace_wrapper '.' '<~Q;^ZUey}p(>R: eER_h|%#heV=M~P8uEQV_#T72=Gg-O'\''}iI8H]=^c[MV]GR7_t'  < ./inputs/input/ruin.670 
echo ">>>>>>>>running test 2287"
./replace_wrapper '.' 'R'  < ./inputs/input/ruin.1930 
echo ">>>>>>>>running test 2288"
./replace_wrapper '/$' ','  < ./inputs/input/ruin.1840 
echo ">>>>>>>>running test 2289"
./replace_wrapper '/' 'P'  < ./inputs/input/ruin.755 
echo ">>>>>>>>running test 2290"
./replace_wrapper '/' 'd=f'  < ./inputs/input/ruin.1856 
echo ">>>>>>>>running test 2291"
./replace_wrapper '/' 't'  < ./inputs/input/ruin.1826 
echo ">>>>>>>>running test 2292"
./replace_wrapper '/' '}wTFVi.Wr"L7RYg!cd\XO7'  < ./inputs/input/ruin.1651 
echo ">>>>>>>>running test 2293"
./replace_wrapper '0' 'EXO^}tG*4[M'\'''\''UEUY^*K}AhDu'  < ./inputs/input/ruin.1617 
echo ">>>>>>>>running test 2294"
./replace_wrapper '0' 'LB'  < ./inputs/input/ruin.1028 
echo ">>>>>>>>running test 2295"
./replace_wrapper '0' 'Z?7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpn'  < ./inputs/input/ruin.1060 
echo ">>>>>>>>running test 2296"
./replace_wrapper '0' 'Z?n'  < ./inputs/input/ruin.1060 
echo ">>>>>>>>running test 2297"
./replace_wrapper '0' '{q2n8KrM4f"NA#l+YD-M].S{C4vS@{!w!\]@)zzgx'  < ./inputs/input/ruin.1562 
echo ">>>>>>>>running test 2298"
./replace_wrapper '0-9][a-c]-?A-?-c[0-9][a-c]-?AWzWz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`]-*[*0-9][^0-9]*[@t][@t@]' ''  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 2299"
./replace_wrapper '0?' 'XBu4dy6FR#+F"V|Z-B.[{PW'  < ./inputs/input/ruin.936 
echo ">>>>>>>>running test 2300"
./replace_wrapper '0?*' 'EXO^}tG*4[M'\'''\''UEUY^*K}AhDu'  < ./inputs/input/ruin.1617 
echo ">>>>>>>>running test 2301"
./replace_wrapper '1' '0%!X/d_[P@,!+=*a!b4ci!'  < ./inputs/input/ruin.763 
echo ">>>>>>>>running test 2302"
./replace_wrapper '1' 'M_Toh|[aPbaYoj5Uau@&qg]4@sRFU+FAt-LwrFS'  < ./inputs/input/ruin.1091 
echo ">>>>>>>>running test 2303"
./replace_wrapper '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2304"
./replace_wrapper '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2305"
./replace_wrapper '2' 'gU'  < ./inputs/input/ruin.1497 
echo ">>>>>>>>running test 2306"
./replace_wrapper '2' 'n'  < ./inputs/input/ruin.153 
echo ">>>>>>>>running test 2307"
./replace_wrapper '2?' '6'\''C'  < ./inputs/input/ruin.1558 
echo ">>>>>>>>running test 2308"
./replace_wrapper '3 3 ?' '@t67@t67@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 2309"
./replace_wrapper '3' '%j^S0TxA[;rv*vwcH0v}f1]?o+\Kjds,MC;@Qu@Vr2}HP#{c&FBfG"&JR\(=>ZU;D]@O$xv;xaoScl;%3'  < ./inputs/input/ruin.828 
echo ">>>>>>>>running test 2310"
./replace_wrapper '3' '4R NQlkJ:NBlz'  < ./inputs/input/ruin.754 
echo ">>>>>>>>running test 2311"
./replace_wrapper '3' '5'  < ./inputs/input/ruin.675 
echo ">>>>>>>>running test 2312"
./replace_wrapper '3' '9|'  < ./inputs/input/ruin.122 
echo ">>>>>>>>running test 2313"
./replace_wrapper '3' '=-9R'\''azqd96m</'  < ./inputs/input/ruin.169 
echo ">>>>>>>>running test 2314"
./replace_wrapper '3' '_r*?'\''z?z8x$#._@8RQ3b:[UxRVn>M[D7xnp,+G|zM.mV.dDGw`@<ZRoT]_W'  < ./inputs/input/ruin.1867 
echo ">>>>>>>>running test 2315"
./replace_wrapper '3@@' ' '  < ./inputs/input/ruin.971 
echo ">>>>>>>>running test 2316"
./replace_wrapper '3BLytQ3BLytQ69ILh[Q=v@3BLytQ69ILh[Q=v@69ILh[Q=v@3B3BLytQ69ILh[Q=v@3BLytQ69ILh[Q=v@3BLytQ69ILh[Q=v@3BLytQ69ILh[Q=v@LytQ69ILh[Q=v@[0-9]*' ''  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 2317"
./replace_wrapper '4' 'GC~b-h:p- 1}(N|2'  < ./inputs/input/ruin.1096 
echo ">>>>>>>>running test 2318"
./replace_wrapper '4?' '0#z#_$#r'  < ./inputs/input/ruin.48 
echo ">>>>>>>>running test 2319"
./replace_wrapper '4@t@@\M)BP@@d@@' '(J%$7-Km+F*y,%RQ::$`Oxsb-*k*$<nGwt43]!f.+D{'  < ./inputs/input/ruin.1706 
echo ">>>>>>>>running test 2320"
./replace_wrapper '5' '3xcvLGp",ED"xmUT]z-FB'  < ./inputs/input/ruin.834 
echo ">>>>>>>>running test 2321"
./replace_wrapper '5' 'Pcgl|PFbg#{4>i$ZgBymQ}A2<i>(]8Au:C}VK4Akc#oM'  < ./inputs/input/ruin.1171 
echo ">>>>>>>>running test 2322"
./replace_wrapper '5' 'R}^(/YRR'  < ./inputs/input/ruin.347 
echo ">>>>>>>>running test 2323"
./replace_wrapper '5' 'd'  < ./inputs/input/ruin.1428 
echo ">>>>>>>>running test 2324"
./replace_wrapper '5' 'h7xEY D >9[8^X.N2xO}Ne'\''Ar'\''cKa7}*S'  < ./inputs/input/ruin.723 
echo ">>>>>>>>running test 2325"
./replace_wrapper '5' 'p$jpcdc+?y'  < ./inputs/input/ruin.1527 
echo ">>>>>>>>running test 2326"
./replace_wrapper '5[>-A]' 'rv0,](\@J5=CG3F%m;"*|]gT)V'  < ./inputs/input/ruin.342 
echo ">>>>>>>>running test 2327"
./replace_wrapper '6' '_%>N,Bf#:|\xD>emL$bK^QbIRG?jle]Jf=it6/.`'  < ./inputs/input/ruin.131 
echo ">>>>>>>>running test 2328"
./replace_wrapper '6*' ')W"v#jga.ue\v[5syHzI,K,QJ+\k#52`Q%<B(@I^t'  < ./inputs/input/ruin.1736 
echo ">>>>>>>>running test 2329"
./replace_wrapper '7' ''  < ./inputs/input/ruin.545 
echo ">>>>>>>>running test 2330"
./replace_wrapper '8' '"'  < ./inputs/input/ruin.484 
echo ">>>>>>>>running test 2331"
./replace_wrapper '8' ''  < ./inputs/input/ruin.448 
echo ">>>>>>>>running test 2332"
./replace_wrapper '8' '[|'  < ./inputs/input/ruin.1573 
echo ">>>>>>>>running test 2333"
./replace_wrapper '8' 'b'  < ./inputs/input/ruin.1768 
echo ">>>>>>>>running test 2334"
./replace_wrapper '8' 'e'  < ./inputs/input/ruin.1076 
echo ">>>>>>>>running test 2335"
./replace_wrapper '9' ':'  < ./inputs/input/ruin.206 
echo ">>>>>>>>running test 2336"
./replace_wrapper '9' '>=rt)q>M}/'  < ./inputs/input/ruin.748 
echo ">>>>>>>>running test 2337"
./replace_wrapper '9' '@Z-Co8/r+-k_V3^|>xU#m:Zn4 '  < ./inputs/input/ruin.836 
echo ">>>>>>>>running test 2338"
./replace_wrapper '9@@*[^Z-a]^_`a]' '"'  < ./inputs/input/ruin.28 
echo ">>>>>>>>running test 2339"
./replace_wrapper ':' '-'  < ./inputs/input/ruin.1037 
echo ">>>>>>>>running test 2340"
./replace_wrapper ':' 'KNy,h0_sbVxG=nOfKNy,h0_sbVxG=nOfj@j@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@-'  < ./inputs/input/ruin.1037 
echo ">>>>>>>>running test 2341"
./replace_wrapper ':@@*' '&'  < ./inputs/input/ruin.1279 
echo ">>>>>>>>running test 2342"
./replace_wrapper ';' 'PuDC_y|{43P)%'\'';2IMC'  < ./inputs/input/ruin.1459 
echo ">>>>>>>>running test 2343"
./replace_wrapper ';?' 'l'  < ./inputs/input/ruin.835 
echo ">>>>>>>>running test 2344"
./replace_wrapper ';v;vc2#{V7TVUA[lGcZR)h\M7+(Fn;vc2#{V7TVUA[lGcZR)h\M7+(Fn;vc2#{V7TVUA[lGcZR)h\M7+(Fn;vc2#{V7TVUA[lGcZR)h\M7+(Fnc2#{V7TVUA[lGcZR)h\M7+(Fn[Z-a]^_*[Z-a]^_*' 'foo&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 2345"
./replace_wrapper '<' 'S'  < ./inputs/input/ruin.775 
echo ">>>>>>>>running test 2346"
./replace_wrapper '<' 'v'  < ./inputs/input/ruin.428 
echo ">>>>>>>>running test 2347"
./replace_wrapper '<n[D6' ''  < ./inputs/input/ruin.49 
echo ">>>>>>>>running test 2348"
./replace_wrapper '=' '&g=Vs@DVtKv;1f. _Ep8=Z <(H&'\''qa&&0rVBXTKdv<G31kbGiPE1^kzBV;j=@'  < ./inputs/input/ruin.552 
echo ">>>>>>>>running test 2349"
./replace_wrapper '=' 'B'  < ./inputs/input/ruin.412 
echo ">>>>>>>>running test 2350"
./replace_wrapper '=' 'FHShmfVlkj.v$ 8Jrza"8Lbzb\h.[l$/_FJ9Ws?'  < ./inputs/input/ruin.13 
echo ">>>>>>>>running test 2351"
./replace_wrapper '=' 'M8s?F;+~?xx;<>"i![@}paufqF[PvP.5C/xIc;i-vj0:Fbo'  < ./inputs/input/ruin.1553 
echo ">>>>>>>>running test 2352"
./replace_wrapper '>' 'l'  < ./inputs/input/ruin.1462 
echo ">>>>>>>>running test 2353"
./replace_wrapper '>[0-9]' 'YUt'\''=R]f\U&)'  < ./inputs/input/ruin.1548 
echo ">>>>>>>>running test 2354"
./replace_wrapper '? '   < ./inputs/temp-test/217.inp.97.1 
echo ">>>>>>>>running test 2355"
./replace_wrapper '? ' 'a&'  < ./inputs/temp-test/609.inp.262.1 
echo ">>>>>>>>running test 2356"
./replace_wrapper '? ' 'a&'  < ./inputs/temp-test/610.inp.262.2 
echo ">>>>>>>>running test 2357"
./replace_wrapper '? ' 'a@nb@tc'  < ./inputs/temp-test/217.inp.97.1 
echo ">>>>>>>>running test 2358"
./replace_wrapper '? *' '@t'  < ./inputs/temp-test/858.inp.369.1 
echo ">>>>>>>>running test 2359"
./replace_wrapper '? *--[a--b]?-]?[a-c]' 'a&'  < ./inputs/temp-test/346.inp.152.1 
echo ">>>>>>>>running test 2360"
./replace_wrapper '? *--[a--b]?-]?[a-c]' 'a&'  < ./inputs/temp-test/347.inp.152.2 
echo ">>>>>>>>running test 2361"
./replace_wrapper '? *--[a--b]?-]?[a-c]' 'a&'  < ./inputs/temp-test/348.inp.152.3 
echo ">>>>>>>>running test 2362"
./replace_wrapper '? *--[a--b]?-]?[a-c]' 'a&@'  < ./inputs/temp-test/346.inp.152.1 
echo ">>>>>>>>running test 2363"
./replace_wrapper '? *--[a--b]?-]?[a-c]' 'a&@'  < ./inputs/temp-test/348.inp.152.3 
echo ">>>>>>>>running test 2364"
./replace_wrapper '? *--[a--b]?-]?[a-c]@' 'a&'  < ./inputs/temp-test/347.inp.152.2 
echo ">>>>>>>>running test 2365"
./replace_wrapper '? *@[[^9-B][^0-9]A[^a-c]' 'a&'  < ./inputs/temp-test/1908.inp.810.1 
echo ">>>>>>>>running test 2366"
./replace_wrapper '? *@[[^9-B][^0-9]A[^a-c]' 'a&'  < ./inputs/temp-test/1909.inp.810.2 
echo ">>>>>>>>running test 2367"
./replace_wrapper '? *[^--^a-c]$' 'a&'  < ./inputs/temp-test/1369.inp.587.6 
echo ">>>>>>>>running test 2368"
./replace_wrapper '? *[^--^a-c]' 'a&'  < ./inputs/temp-test/1367.inp.587.1 
echo ">>>>>>>>running test 2369"
./replace_wrapper '? *[^--^a-c]' 'a&'  < ./inputs/temp-test/1368.inp.587.3 
echo ">>>>>>>>running test 2370"
./replace_wrapper '? *[^a-][9-B]--' '@%&a'  < ./inputs/temp-test/1705.inp.727.1 
echo ">>>>>>>>running test 2371"
./replace_wrapper '? *[^a-][9-B]--' '@%&a'  < ./inputs/temp-test/1706.inp.727.2 
echo ">>>>>>>>running test 2372"
./replace_wrapper '? *[^a-][9-B]--' '@%&a'  < ./inputs/temp-test/1707.inp.727.3 
echo ">>>>>>>>running test 2373"
./replace_wrapper '?!' 'E2}-sQuI['  < ./inputs/input/ruin.639 
echo ">>>>>>>>running test 2374"
./replace_wrapper '?$' '$Ci@3^s4Mt/r6s/"jopElFXsAmp8CE#!&p!d:J&e7*F0`/RFf*M[8l3*.CM@/|pucY'  < ./inputs/input/ruin.1937 
echo ">>>>>>>>running test 2375"
./replace_wrapper '?$' '$Z'  < ./inputs/input/ruin.387 
echo ">>>>>>>>running test 2376"
./replace_wrapper '?$' '*U*'\''I8uu@VloES@|VT4+e|'  < ./inputs/input/ruin.1285 
echo ">>>>>>>>running test 2377"
./replace_wrapper '?$' '2'  < ./inputs/input/ruin.505 
echo ">>>>>>>>running test 2378"
./replace_wrapper '?$' '=MoPU`!tL"6E$'  < ./inputs/input/ruin.1084 
echo ">>>>>>>>running test 2379"
./replace_wrapper '?$' 'E'  < ./inputs/input/ruin.1113 
echo ">>>>>>>>running test 2380"
./replace_wrapper '?$' 'Mbtz>x/9wXMF<9)g/A-g#!ci/5cX}I+x\'\''AU$*rX0&~5q'  < ./inputs/input/ruin.759 
echo ">>>>>>>>running test 2381"
./replace_wrapper '?$' 'a&'  < ./inputs/temp-test/826.inp.355.6 
echo ">>>>>>>>running test 2382"
./replace_wrapper '?$' 'k#j>k?tL'\''lxD6JM$0j,))D@-]OI]DpDxwc?,xlmDr5F}}h"qU.Lp;'  < ./inputs/input/ruin.1406 
echo ">>>>>>>>running test 2383"
./replace_wrapper '?$' 'q'  < ./inputs/input/ruin.644 
echo ">>>>>>>>running test 2384"
./replace_wrapper '?%-' '&'  < ./inputs/temp-test/2347.inp.997.1 
echo ">>>>>>>>running test 2385"
./replace_wrapper '?%-' '&'  < ./inputs/temp-test/2348.inp.997.2 
echo ">>>>>>>>running test 2386"
./replace_wrapper '?%-**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2387"
./replace_wrapper '?%[^9-B]' ''  < ./inputs/temp-test/11.inp.5.2 
echo ">>>>>>>>running test 2388"
./replace_wrapper '?'   < ./inputs/input/ruin.1153 
echo ">>>>>>>>running test 2389"
./replace_wrapper '?' ' '  < ./inputs/input/ruin.1434 
echo ">>>>>>>>running test 2390"
./replace_wrapper '?' ' '  < ./inputs/input/ruin.457 
echo ">>>>>>>>running test 2391"
./replace_wrapper '?' '!wR{-znFqOsen$'  < ./inputs/input/ruin.643 
echo ">>>>>>>>running test 2392"
./replace_wrapper '?' '"\]({uYH3x5zs{.$s)G2Pzxji.o]- _Pzt'\''~6m#[}UH+'  < ./inputs/input/ruin.318 
echo ">>>>>>>>running test 2393"
./replace_wrapper '?' '"w4yF;^%V{=[g" GQ!^)U'\''6G+5J[ejzJ=>IXG>MUU*;c:LUh'\''sz` ;i)-cxBKFwk%b`+L'  < ./inputs/input/ruin.1189 
echo ">>>>>>>>running test 2394"
./replace_wrapper '?' '#((G)KKH'  < ./inputs/input/ruin.1245 
echo ">>>>>>>>running test 2395"
./replace_wrapper '?' '#:07uLCQLG\b`P(5t'  < ./inputs/input/ruin.939 
echo ">>>>>>>>running test 2396"
./replace_wrapper '?' '$'  < ./inputs/input/ruin.1336 
echo ">>>>>>>>running test 2397"
./replace_wrapper '?' '$bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<bJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<'  < ./inputs/input/ruin.1336 
echo ">>>>>>>>running test 2398"
./replace_wrapper '?' '%'  < ./inputs/input/ruin.72 
echo ">>>>>>>>running test 2399"
./replace_wrapper '?' '%5\")?O5'\''y2k>Z=\MH%y:6*~h'  < ./inputs/input/ruin.969 
echo ">>>>>>>>running test 2400"
./replace_wrapper '?' '%HMhn>OvlKt*Ca5KQC"Zjjtm<0$4C\@!u_Lp`%J)qy("dr>Im'\''IRO'  < ./inputs/input/ruin.296 
echo ">>>>>>>>running test 2401"
./replace_wrapper '?' '&'  < ./inputs/input/ruin.1767 
echo ">>>>>>>>running test 2402"
./replace_wrapper '?' '&'  < ./inputs/input/ruin.185 
echo ">>>>>>>>running test 2403"
./replace_wrapper '?' '&/CK/ck ZYhUC('  < ./inputs/input/ruin.1355 
echo ">>>>>>>>running test 2404"
./replace_wrapper '?' '&4fw/&r2!st;I9'  < ./inputs/input/ruin.1689 
echo ">>>>>>>>running test 2405"
./replace_wrapper '?' '&RO-^P6-QT4o%.LR>%%g@7t3Yn7!#QeIrm}[.1.'  < ./inputs/input/ruin.1501 
echo ">>>>>>>>running test 2406"
./replace_wrapper '?' '&a@%'  < ./inputs/temp-test/88.inp.40.1 
echo ">>>>>>>>running test 2407"
./replace_wrapper '?' '&a@%'  < ./inputs/temp-test/89.inp.40.2 
echo ">>>>>>>>running test 2408"
./replace_wrapper '?' '&a@%'  < ./inputs/temp-test/90.inp.40.3 
echo ">>>>>>>>running test 2409"
./replace_wrapper '?' '&mY@.8om'  < ./inputs/input/ruin.1923 
echo ">>>>>>>>running test 2410"
./replace_wrapper '?' ''  < ./inputs/input/ruin.1235 
echo ">>>>>>>>running test 2411"
./replace_wrapper '?' ''  < ./inputs/input/ruin.1723 
echo ">>>>>>>>running test 2412"
./replace_wrapper '?' ''  < ./inputs/input/ruin.1830 
echo ">>>>>>>>running test 2413"
./replace_wrapper '?' ''  < ./inputs/input/ruin.571 
echo ">>>>>>>>running test 2414"
./replace_wrapper '?' ''  < ./inputs/input/ruin.590 
echo ">>>>>>>>running test 2415"
./replace_wrapper '?' ''  < ./inputs/input/ruin.821 
echo ">>>>>>>>running test 2416"
./replace_wrapper '?' ''\'''  < ./inputs/input/ruin.1176 
echo ">>>>>>>>running test 2417"
./replace_wrapper '?' ''\''7P5n5'\''lRpz=:pn#5?'  < ./inputs/input/ruin.1370 
echo ">>>>>>>>running test 2418"
./replace_wrapper '?' ''\''["<]>V(0?ks?"32CO!wk-P)_U,v\,?v$/eL7Gk$'  < ./inputs/input/ruin.507 
echo ">>>>>>>>running test 2419"
./replace_wrapper '?' ''\''m'  < ./inputs/input/ruin.646 
echo ">>>>>>>>running test 2420"
./replace_wrapper '?' ''\''~'  < ./inputs/input/ruin.1252 
echo ">>>>>>>>running test 2421"
./replace_wrapper '?' '('  < ./inputs/input/ruin.1296 
echo ">>>>>>>>running test 2422"
./replace_wrapper '?' '('  < ./inputs/input/ruin.179 
echo ">>>>>>>>running test 2423"
./replace_wrapper '?' ')'  < ./inputs/input/ruin.1751 
echo ">>>>>>>>running test 2424"
./replace_wrapper '?' ')'  < ./inputs/input/ruin.600 
echo ">>>>>>>>running test 2425"
./replace_wrapper '?' ')P\g38V7('\''R<=PA[vEnl}V;-'  < ./inputs/input/ruin.1375 
echo ">>>>>>>>running test 2426"
./replace_wrapper '?' '*Y)d1^+BPVi6}-,@Fhp%c9[8=7PJ$[+'  < ./inputs/input/ruin.725 
echo ">>>>>>>>running test 2427"
./replace_wrapper '?' '*dvM[t?`D}k'\'';y+;`)<Z%e TPV`D5\Vcq9bq/1:3Q@+RnI'  < ./inputs/input/ruin.1407 
echo ">>>>>>>>running test 2428"
./replace_wrapper '?' '+q^RHGG^&;>#u@F]^1iRwc1mpuk_2 FZS)?aAVpejj96'  < ./inputs/input/ruin.1299 
echo ">>>>>>>>running test 2429"
./replace_wrapper '?' ','  < ./inputs/input/ruin.1508 
echo ">>>>>>>>running test 2430"
./replace_wrapper '?' ','  < ./inputs/input/ruin.1909 
echo ">>>>>>>>running test 2431"
./replace_wrapper '?' ','  < ./inputs/input/ruin.658 
echo ">>>>>>>>running test 2432"
./replace_wrapper '?' ',^BP#j2(t'  < ./inputs/input/ruin.1804 
echo ">>>>>>>>running test 2433"
./replace_wrapper '?' ',gAEa`/^PQWZZa^F'  < ./inputs/input/ruin.1612 
echo ">>>>>>>>running test 2434"
./replace_wrapper '?' '.'  < ./inputs/input/ruin.264 
echo ">>>>>>>>running test 2435"
./replace_wrapper '?' '.'  < ./inputs/input/ruin.496 
echo ">>>>>>>>running test 2436"
./replace_wrapper '?' '.koDO;b.|5'  < ./inputs/input/ruin.402 
echo ">>>>>>>>running test 2437"
./replace_wrapper '?' '.mCbJwgx z1X{xc0.PG"hg]OjMQ$ol]SYG!<.<VS(.DdErr'  < ./inputs/input/ruin.403 
echo ">>>>>>>>running test 2438"
./replace_wrapper '?' '/DcINi{MtBKO9S<U>&]qaS&QFn#Ow0U<1.yn>bIQ<,ak#&_vVh6:2{^#'  < ./inputs/input/ruin.1841 
echo ">>>>>>>>running test 2439"
./replace_wrapper '?' '/~OE"QNi/dprl$J~oOt0kPNb:6#I&zya SA~OXg/l+^bcES"n5ig.M:E<Ygto))h'\''<j~E:I@sFaiXXf'\'''  < ./inputs/input/ruin.155 
echo ">>>>>>>>running test 2440"
./replace_wrapper '?' '0yd{(t"'\''bw/ i+JO/F,1bSmIlg'  < ./inputs/input/ruin.282 
echo ">>>>>>>>running test 2441"
./replace_wrapper '?' '1'  < ./inputs/input/ruin.1877 
echo ">>>>>>>>running test 2442"
./replace_wrapper '?' '1'  < ./inputs/input/ruin.868 
echo ">>>>>>>>running test 2443"
./replace_wrapper '?' '1u;:JqX:hb3bS'  < ./inputs/input/ruin.1153 
echo ">>>>>>>>running test 2444"
./replace_wrapper '?' '2'  < ./inputs/input/ruin.1865 
echo ">>>>>>>>running test 2445"
./replace_wrapper '?' '2Ax#Mv_@DjcWz"~F]km'  < ./inputs/input/ruin.1241 
echo ">>>>>>>>running test 2446"
./replace_wrapper '?' '2U+URc}6Uk:Eso9T'  < ./inputs/input/ruin.1726 
echo ">>>>>>>>running test 2447"
./replace_wrapper '?' '4J R'  < ./inputs/input/ruin.845 
echo ">>>>>>>>running test 2448"
./replace_wrapper '?' '5'  < ./inputs/input/ruin.1878 
echo ">>>>>>>>running test 2449"
./replace_wrapper '?' '5<WMaE'\''r{G`Diz:pyjW'  < ./inputs/input/ruin.1979 
echo ">>>>>>>>running test 2450"
./replace_wrapper '?' '6'  < ./inputs/input/ruin.1494 
echo ">>>>>>>>running test 2451"
./replace_wrapper '?' '7/@`=G"5tu`>7#`st[D~6!6"/PndJ'  < ./inputs/input/ruin.586 
echo ">>>>>>>>running test 2452"
./replace_wrapper '?' '8"'  < ./inputs/input/ruin.511 
echo ">>>>>>>>running test 2453"
./replace_wrapper '?' '80LT@fdFy'  < ./inputs/input/ruin.601 
echo ">>>>>>>>running test 2454"
./replace_wrapper '?' '8l;V'  < ./inputs/input/ruin.1337 
echo ">>>>>>>>running test 2455"
./replace_wrapper '?' '8l;V3&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J43&YEy?NDqT |ye3E+7WmBD#X-J4'  < ./inputs/input/ruin.1337 
echo ">>>>>>>>running test 2456"
./replace_wrapper '?' '9'  < ./inputs/input/ruin.1743 
echo ">>>>>>>>running test 2457"
./replace_wrapper '?' '9'  < ./inputs/input/ruin.419 
echo ">>>>>>>>running test 2458"
./replace_wrapper '?' '9'  < ./inputs/input/ruin.533 
echo ">>>>>>>>running test 2459"
./replace_wrapper '?' '980/#_O^H>7fd&'  < ./inputs/input/ruin.532 
echo ">>>>>>>>running test 2460"
./replace_wrapper '?' '9ytHHUHo0O{;N1(n*Se{S < 3k'  < ./inputs/input/ruin.405 
echo ">>>>>>>>running test 2461"
./replace_wrapper '?' ':'  < ./inputs/input/ruin.1641 
echo ">>>>>>>>running test 2462"
./replace_wrapper '?' ':'  < ./inputs/input/ruin.366 
echo ">>>>>>>>running test 2463"
./replace_wrapper '?' ';'  < ./inputs/input/ruin.1018 
echo ">>>>>>>>running test 2464"
./replace_wrapper '?' ';'  < ./inputs/input/ruin.1520 
echo ">>>>>>>>running test 2465"
./replace_wrapper '?' ';exh\3*?mQqR,l:89C5.q2u\,`qPW:[zYi<c+xL`A^d[&PA:xddT0Et0-ux H8'  < ./inputs/input/ruin.962 
echo ">>>>>>>>running test 2466"
./replace_wrapper '?' ';kh2\M8\&a4Pm=OF^-(G|-p8:i9ovm>xcJ,5e]>y%~kSEJ$[z@RzG}'  < ./inputs/input/ruin.966 
echo ">>>>>>>>running test 2467"
./replace_wrapper '?' '<'  < ./inputs/input/ruin.143 
echo ">>>>>>>>running test 2468"
./replace_wrapper '?' '<-DXZCR-P^y]}]T`l!/ue4S|LI|TZ\E~Bm>ZK!ml'  < ./inputs/input/ruin.46 
echo ">>>>>>>>running test 2469"
./replace_wrapper '?' '</Dco9Q(Uc0D'\''t:qBs3QUn;'\'''  < ./inputs/input/ruin.474 
echo ">>>>>>>>running test 2470"
./replace_wrapper '?' '<O'  < ./inputs/input/ruin.1579 
echo ">>>>>>>>running test 2471"
./replace_wrapper '?' '<Vod'\''|tm%p>|GpQ{JP^'  < ./inputs/input/ruin.1868 
echo ">>>>>>>>running test 2472"
./replace_wrapper '?' '<{'  < ./inputs/input/ruin.101 
echo ">>>>>>>>running test 2473"
./replace_wrapper '?' '='  < ./inputs/input/ruin.1217 
echo ">>>>>>>>running test 2474"
./replace_wrapper '?' '='  < ./inputs/input/ruin.1556 
echo ">>>>>>>>running test 2475"
./replace_wrapper '?' '=S&l@*,k=#&'  < ./inputs/input/ruin.470 
echo ">>>>>>>>running test 2476"
./replace_wrapper '?' '=|0$@9jg(x)\|.;{:xQ'  < ./inputs/input/ruin.970 
echo ">>>>>>>>running test 2477"
./replace_wrapper '?' '>'  < ./inputs/input/ruin.345 
echo ">>>>>>>>running test 2478"
./replace_wrapper '?' '>0\MtN5k&5!Q./'  < ./inputs/input/ruin.358 
echo ">>>>>>>>running test 2479"
./replace_wrapper '?' '>\cj;-`N(Qi&s5nTV-3sEXm*'  < ./inputs/input/ruin.882 
echo ">>>>>>>>running test 2480"
./replace_wrapper '?' '>b})}d%:+~EdJc2\! ug7;'  < ./inputs/input/ruin.1335 
echo ">>>>>>>>running test 2481"
./replace_wrapper '?' '>nHA0p'\''Ou1foR!WVdb0*KDL3]#o35lH%'  < ./inputs/input/ruin.1364 
echo ">>>>>>>>running test 2482"
./replace_wrapper '?' '?&'  < ./inputs/input/ruin.744 
echo ">>>>>>>>running test 2483"
./replace_wrapper '?' '?Tp4fnmE6"Pe_j`:'  < ./inputs/input/ruin.247 
echo ">>>>>>>>running test 2484"
./replace_wrapper '?' '?b&+AjmcI]eV'\''|:7(2&q@pmv;p3/#;RBU8z}&?C4hjPC3x1{3?wfI6hN-'  < ./inputs/input/ruin.168 
echo ">>>>>>>>running test 2485"
./replace_wrapper '?' '?wWkfB0{Olvu!$q9j0|Q&niewx~wpw+G.dVNB$$x0&VHId'  < ./inputs/input/ruin.1389 
echo ">>>>>>>>running test 2486"
./replace_wrapper '?' '@%&a'  < ./inputs/temp-test/71.inp.31.1 
echo ">>>>>>>>running test 2487"
./replace_wrapper '?' '@%&a'  < ./inputs/temp-test/72.inp.31.2 
echo ">>>>>>>>running test 2488"
./replace_wrapper '?' '@%&a'  < ./inputs/temp-test/73.inp.31.3 
echo ">>>>>>>>running test 2489"
./replace_wrapper '?' '@'  < ./inputs/input/ruin.951 
echo ">>>>>>>>running test 2490"
./replace_wrapper '?' '@V@=ehA6m.N^nI2LfcXe_'  < ./inputs/input/ruin.1919 
echo ">>>>>>>>running test 2491"
./replace_wrapper '?' '@b +$xs[.Nh$2O|'  < ./inputs/input/ruin.952 
echo ">>>>>>>>running test 2492"
./replace_wrapper '?' '@fcA'\''DvQsI^6t.kwEqv'  < ./inputs/input/ruin.116 
echo ">>>>>>>>running test 2493"
./replace_wrapper '?' '@n'  < ./inputs/temp-test/53.inp.22.1 
echo ">>>>>>>>running test 2494"
./replace_wrapper '?' '@o@KFH{>4`U9P+*vh?|$QnmR!k"^X=gQm3_JMfyxy}.ZI<K!U( GS"A4I7AHNHp?x!nL%T{Og%LeK8>PdhyfE$yz5a</&:6{&`/3:zG'  < ./inputs/input/ruin.384 
echo ">>>>>>>>running test 2495"
./replace_wrapper '?' 'A'  < ./inputs/input/ruin.1010 
echo ">>>>>>>>running test 2496"
./replace_wrapper '?' 'AF'  < ./inputs/input/ruin.1836 
echo ">>>>>>>>running test 2497"
./replace_wrapper '?' 'B'  < ./inputs/input/ruin.1412 
echo ">>>>>>>>running test 2498"
./replace_wrapper '?' 'BUoa41Xis8O!z)THM+k-UQ'  < ./inputs/input/ruin.433 
echo ">>>>>>>>running test 2499"
./replace_wrapper '?' 'Bf/nz5#;N'  < ./inputs/input/ruin.242 
echo ">>>>>>>>running test 2500"
./replace_wrapper '?' 'C'  < ./inputs/input/ruin.1343 
echo ">>>>>>>>running test 2501"
./replace_wrapper '?' 'C@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-@*[a--b]^*-[^-'  < ./inputs/input/ruin.1343 
echo ">>>>>>>>running test 2502"
./replace_wrapper '?' 'CC'\''vJXblh:Zwt&:'  < ./inputs/input/ruin.338 
echo ">>>>>>>>running test 2503"
./replace_wrapper '?' 'CE(8]nlKTDmLw~YL"~TMBV%#@B1b'\''9$'  < ./inputs/input/ruin.374 
echo ">>>>>>>>running test 2504"
./replace_wrapper '?' 'D'  < ./inputs/input/ruin.1196 
echo ">>>>>>>>running test 2505"
./replace_wrapper '?' 'D+7t>fY~<_'  < ./inputs/input/ruin.1904 
echo ">>>>>>>>running test 2506"
./replace_wrapper '?' 'DF\2'  < ./inputs/input/ruin.1482 
echo ">>>>>>>>running test 2507"
./replace_wrapper '?' 'F'  < ./inputs/input/ruin.926 
echo ">>>>>>>>running test 2508"
./replace_wrapper '?' 'F@DPQ8u2.0:==Dsj251Al-d\Z'  < ./inputs/input/ruin.111 
echo ">>>>>>>>running test 2509"
./replace_wrapper '?' 'FSaq)g'  < ./inputs/input/ruin.844 
echo ">>>>>>>>running test 2510"
./replace_wrapper '?' 'Gj154]Jjcc\^H?[iW;|>#5"?lm_#?K8no~(Z?!lV%m=?Gx*4,)-orqHg?`B|P-nsUv#a@k%zXg('\''\=G`4,0'  < ./inputs/input/ruin.1166 
echo ">>>>>>>>running test 2511"
./replace_wrapper '?' 'H#I|."*BcMtK)["_)'  < ./inputs/input/ruin.995 
echo ">>>>>>>>running test 2512"
./replace_wrapper '?' 'H'  < ./inputs/input/ruin.642 
echo ">>>>>>>>running test 2513"
./replace_wrapper '?' 'HqJ[APZc=u{VE'  < ./inputs/input/ruin.103 
echo ">>>>>>>>running test 2514"
./replace_wrapper '?' 'Iv*a+"a+_d)K~"^<AvGzg.*0pQl1[Yrs;,`%"AB7k'  < ./inputs/input/ruin.1582 
echo ">>>>>>>>running test 2515"
./replace_wrapper '?' 'J'  < ./inputs/input/ruin.1977 
echo ">>>>>>>>running test 2516"
./replace_wrapper '?' 'K'  < ./inputs/input/ruin.1121 
echo ">>>>>>>>running test 2517"
./replace_wrapper '?' 'K<?B4$`6O1>J#&OM4K$2QDiT<ji'  < ./inputs/input/ruin.524 
echo ">>>>>>>>running test 2518"
./replace_wrapper '?' 'KsxI474&Q(C}u4M|o2T`<`;S^`NUPxX'  < ./inputs/input/ruin.291 
echo ">>>>>>>>running test 2519"
./replace_wrapper '?' 'L/kw\'  < ./inputs/input/ruin.404 
echo ">>>>>>>>running test 2520"
./replace_wrapper '?' 'L;vc2#{V7TVUA[lGcZR)h\M7+(FnC`>q'  < ./inputs/input/ruin.1593 
echo ">>>>>>>>running test 2521"
./replace_wrapper '?' 'Lvu77k}K'  < ./inputs/input/ruin.1239 
echo ">>>>>>>>running test 2522"
./replace_wrapper '?' 'M%&;~-{;<(48m;Dv)aQS0bkh'\''eK'  < ./inputs/input/ruin.1613 
echo ">>>>>>>>running test 2523"
./replace_wrapper '?' 'M'  < ./inputs/input/ruin.135 
echo ">>>>>>>>running test 2524"
./replace_wrapper '?' 'M\M/(+Q(30LI2#Tq'  < ./inputs/input/ruin.1777 
echo ">>>>>>>>running test 2525"
./replace_wrapper '?' 'N#D{(1Gn[8UCLC}OnP^},P|FWYtd99MB_Kco_$[Z-<i-RL'  < ./inputs/input/ruin.953 
echo ">>>>>>>>running test 2526"
./replace_wrapper '?' 'N&5vC\L {wtz|wCl|^@'  < ./inputs/input/ruin.165 
echo ">>>>>>>>running test 2527"
./replace_wrapper '?' 'N)[e.{p6mu6~p;u0r*3|}'  < ./inputs/input/ruin.1168 
echo ">>>>>>>>running test 2528"
./replace_wrapper '?' 'NEW'  < ./inputs/temp-test/1384.inp.594.1 
echo ">>>>>>>>running test 2529"
./replace_wrapper '?' 'NEW'  < ./inputs/temp-test/1385.inp.594.3 
echo ">>>>>>>>running test 2530"
./replace_wrapper '?' 'NEW'  < ./inputs/temp-test/1386.inp.594.4 
echo ">>>>>>>>running test 2531"
./replace_wrapper '?' 'NT*x]<L/3",r6SrEiVl>/'  < ./inputs/input/ruin.40 
echo ">>>>>>>>running test 2532"
./replace_wrapper '?' 'O'  < ./inputs/input/ruin.1950 
echo ">>>>>>>>running test 2533"
./replace_wrapper '?' 'P'  < ./inputs/input/ruin.1300 
echo ">>>>>>>>running test 2534"
./replace_wrapper '?' 'P'  < ./inputs/input/ruin.63 
echo ">>>>>>>>running test 2535"
./replace_wrapper '?' 'P'  < ./inputs/input/ruin.977 
echo ">>>>>>>>running test 2536"
./replace_wrapper '?' 'Q'  < ./inputs/input/ruin.385 
echo ">>>>>>>>running test 2537"
./replace_wrapper '?' 'QAbcG]<+#'  < ./inputs/input/ruin.1431 
echo ">>>>>>>>running test 2538"
./replace_wrapper '?' 'QCGA\X(?Z#pI;PhS&YE|'  < ./inputs/input/ruin.1232 
echo ">>>>>>>>running test 2539"
./replace_wrapper '?' 'R(J/X%MoiFZWrD3`LiS^'  < ./inputs/input/ruin.354 
echo ">>>>>>>>running test 2540"
./replace_wrapper '?' 'S'  < ./inputs/input/ruin.887 
echo ">>>>>>>>running test 2541"
./replace_wrapper '?' 'T'  < ./inputs/input/ruin.1866 
echo ">>>>>>>>running test 2542"
./replace_wrapper '?' 'T'  < ./inputs/input/ruin.543 
echo ">>>>>>>>running test 2543"
./replace_wrapper '?' 'TVr2G'  < ./inputs/input/ruin.381 
echo ">>>>>>>>running test 2544"
./replace_wrapper '?' 'V'  < ./inputs/input/ruin.519 
echo ">>>>>>>>running test 2545"
./replace_wrapper '?' 'W'  < ./inputs/input/ruin.5 
echo ">>>>>>>>running test 2546"
./replace_wrapper '?' 'X'  < ./inputs/input/ruin.541 
echo ">>>>>>>>running test 2547"
./replace_wrapper '?' 'XM:AR~,."oRZ=YEND@<A}O16:Prv[2k&'  < ./inputs/input/ruin.1144 
echo ">>>>>>>>running test 2548"
./replace_wrapper '?' 'Z#:;1Z}X$]Lyh~'  < ./inputs/input/ruin.534 
echo ">>>>>>>>running test 2549"
./replace_wrapper '?' 'Z'  < ./inputs/input/ruin.1278 
echo ">>>>>>>>running test 2550"
./replace_wrapper '?' 'Z'  < ./inputs/input/ruin.1658 
echo ">>>>>>>>running test 2551"
./replace_wrapper '?' '[!%Kk\zSLS\.sd"~7vJ0E0<FN7Qt@<1!@{TtBay}DndZ 7]An5h{EZ0Tk;h;T> $qR7oi3a.D8}y]'  < ./inputs/input/ruin.1647 
echo ">>>>>>>>running test 2552"
./replace_wrapper '?' '['  < ./inputs/input/ruin.463 
echo ">>>>>>>>running test 2553"
./replace_wrapper '?' '[fu'  < ./inputs/input/ruin.1366 
echo ">>>>>>>>running test 2554"
./replace_wrapper '?' '\'  < ./inputs/input/ruin.1490 
echo ">>>>>>>>running test 2555"
./replace_wrapper '?' '\'  < ./inputs/input/ruin.907 
echo ">>>>>>>>running test 2556"
./replace_wrapper '?' '].&7+CP1"L0aV#jId`1nde#Cn==C6@v<"]'  < ./inputs/input/ruin.1284 
echo ">>>>>>>>running test 2557"
./replace_wrapper '?' ']P@11+*4RS!'\''mW<:nB9.Oi%rf%ZIQkWmu'  < ./inputs/input/ruin.761 
echo ">>>>>>>>running test 2558"
./replace_wrapper '?' ']rZLj'  < ./inputs/input/ruin.1566 
echo ">>>>>>>>running test 2559"
./replace_wrapper '?' '^0aw^ijt96Qs<g\Ykb8w0,vv]v-#L'  < ./inputs/input/ruin.500 
echo ">>>>>>>>running test 2560"
./replace_wrapper '?' '^ce]WKN5- s+C)y11|8o7z'  < ./inputs/input/ruin.204 
echo ">>>>>>>>running test 2561"
./replace_wrapper '?' '_'  < ./inputs/input/ruin.1024 
echo ">>>>>>>>running test 2562"
./replace_wrapper '?' '_'  < ./inputs/input/ruin.248 
echo ">>>>>>>>running test 2563"
./replace_wrapper '?' '_Zm,B$H3+dOxCXpLjJB<}WOIix\+*'  < ./inputs/input/ruin.913 
echo ">>>>>>>>running test 2564"
./replace_wrapper '?' '_^ [H<2pLeGVat'  < ./inputs/input/ruin.1289 
echo ">>>>>>>>running test 2565"
./replace_wrapper '?' '_r-c9Hs(>!-fB8qY'  < ./inputs/input/ruin.1293 
echo ">>>>>>>>running test 2566"
./replace_wrapper '?' '`'  < ./inputs/input/ruin.1288 
echo ">>>>>>>>running test 2567"
./replace_wrapper '?' '`'  < ./inputs/input/ruin.1812 
echo ">>>>>>>>running test 2568"
./replace_wrapper '?' '`OM,I.7$B>8KwR3#e1>SqfWB3_5]@4o'  < ./inputs/input/ruin.776 
echo ">>>>>>>>running test 2569"
./replace_wrapper '?' 'a&'  < ./inputs/temp-test/823.inp.355.1 
echo ">>>>>>>>running test 2570"
./replace_wrapper '?' 'a&'  < ./inputs/temp-test/824.inp.355.2 
echo ">>>>>>>>running test 2571"
./replace_wrapper '?' 'a&'  < ./inputs/temp-test/825.inp.355.3 
echo ">>>>>>>>running test 2572"
./replace_wrapper '?' 'a'  < ./inputs/input/ruin.1884 
echo ">>>>>>>>running test 2573"
./replace_wrapper '?' 'a'  < ./inputs/input/ruin.1994 
echo ">>>>>>>>running test 2574"
./replace_wrapper '?' 'a9e6'  < ./inputs/input/ruin.1861 
echo ">>>>>>>>running test 2575"
./replace_wrapper '?' 'a@nb@tc'  < ./inputs/temp-test/385.inp.168.1 
echo ">>>>>>>>running test 2576"
./replace_wrapper '?' 'a@nb@tc'  < ./inputs/temp-test/386.inp.168.3 
echo ">>>>>>>>running test 2577"
./replace_wrapper '?' 'b'  < ./inputs/input/ruin.91 
echo ">>>>>>>>running test 2578"
./replace_wrapper '?' 'b@t'  < ./inputs/temp-test/274.inp.123.1 
echo ">>>>>>>>running test 2579"
./replace_wrapper '?' 'b@t'  < ./inputs/temp-test/275.inp.123.3 
echo ">>>>>>>>running test 2580"
./replace_wrapper '?' 'cLZbxdY4&gv/6)zVmA7Uw_^3:l'  < ./inputs/input/ruin.1383 
echo ">>>>>>>>running test 2581"
./replace_wrapper '?' 'cS*DPP`6W8y'  < ./inputs/input/ruin.1799 
echo ">>>>>>>>running test 2582"
./replace_wrapper '?' 'ct1wu;.15`H=u?$2O^&hCvZ\'  < ./inputs/input/ruin.260 
echo ">>>>>>>>running test 2583"
./replace_wrapper '?' 'd%/a-$ATcA3nUs!95iZeLi;y+G}h)hT=\9'  < ./inputs/input/ruin.1322 
echo ">>>>>>>>running test 2584"
./replace_wrapper '?' 'd'  < ./inputs/input/ruin.833 
echo ">>>>>>>>running test 2585"
./replace_wrapper '?' 'd6URU'  < ./inputs/input/ruin.480 
echo ">>>>>>>>running test 2586"
./replace_wrapper '?' 'e'  < ./inputs/input/ruin.1817 
echo ">>>>>>>>running test 2587"
./replace_wrapper '?' 'e'  < ./inputs/input/ruin.583 
echo ">>>>>>>>running test 2588"
./replace_wrapper '?' 'ee@u{Iy+h&o"Z'  < ./inputs/input/ruin.1942 
echo ">>>>>>>>running test 2589"
./replace_wrapper '?' 'f'  < ./inputs/input/ruin.1740 
echo ">>>>>>>>running test 2590"
./replace_wrapper '?' 'fB'  < ./inputs/input/ruin.250 
echo ">>>>>>>>running test 2591"
./replace_wrapper '?' 'g//MMd|LTvsuwT0p=!+1pK6/L{i^ja[u`.s--2#{3i)"1UtS|p~Nab;nu~M;r+C'\''$'  < ./inputs/input/ruin.1327 
echo ">>>>>>>>running test 2592"
./replace_wrapper '?' 'g//MMd|LTvsuwT0p=!+1pK6/L{i^ja[u`.s--2#{3i)"1UtS|p~Nab;nu~M;r+C'\''$pK6/L{i^ja[0-9]*[a-p]K6/L{i^japK6/L{i^japK6/L{i^japK6/L{i^japK6/L{i^japK6/L{i^japK6/L[0-9]*[a-b]{i^ja'  < ./inputs/input/ruin.1327 
echo ">>>>>>>>running test 2593"
./replace_wrapper '?' 'gZ<vfWgGbk.(3R1<u^p|)<Y!kD90 l'  < ./inputs/input/ruin.984 
echo ">>>>>>>>running test 2594"
./replace_wrapper '?' 'gqPd|-L'  < ./inputs/input/ruin.581 
echo ">>>>>>>>running test 2595"
./replace_wrapper '?' 'h'  < ./inputs/input/ruin.1629 
echo ">>>>>>>>running test 2596"
./replace_wrapper '?' 'h,r7xS45pAkON:?;ON=1V3'  < ./inputs/input/ruin.654 
echo ">>>>>>>>running test 2597"
./replace_wrapper '?' 'hFJAsc%Fy%fQcz'  < ./inputs/input/ruin.680 
echo ">>>>>>>>running test 2598"
./replace_wrapper '?' 'i'  < ./inputs/input/ruin.1849 
echo ">>>>>>>>running test 2599"
./replace_wrapper '?' 'i'  < ./inputs/input/ruin.1971 
echo ">>>>>>>>running test 2600"
./replace_wrapper '?' 'i'  < ./inputs/input/ruin.961 
echo ">>>>>>>>running test 2601"
./replace_wrapper '?' 'i1BOet56'  < ./inputs/input/ruin.1133 
echo ">>>>>>>>running test 2602"
./replace_wrapper '?' 'iZVC>'  < ./inputs/input/ruin.1509 
echo ">>>>>>>>running test 2603"
./replace_wrapper '?' 'j'  < ./inputs/input/ruin.711 
echo ">>>>>>>>running test 2604"
./replace_wrapper '?' 'j[&q,X^+;N{V?Cs(!KE2XmLQ2n;x6'  < ./inputs/input/ruin.65 
echo ">>>>>>>>running test 2605"
./replace_wrapper '?' 'jfG;doo?~`NQIn:H#b9M)wdL3[2EMTs37JH.s$"ct_o8 D.8_1_w'  < ./inputs/input/ruin.89 
echo ">>>>>>>>running test 2606"
./replace_wrapper '?' 'kaSvYO>o!'\'':$'\''u~K4o/z,rY6#)BhoGsz=M.8,/'  < ./inputs/input/ruin.1128 
echo ">>>>>>>>running test 2607"
./replace_wrapper '?' 'l!&'  < ./inputs/input/ruin.1897 
echo ">>>>>>>>running test 2608"
./replace_wrapper '?' 'm$$CvL9Dqle@V'  < ./inputs/input/ruin.911 
echo ">>>>>>>>running test 2609"
./replace_wrapper '?' 'm'  < ./inputs/input/ruin.625 
echo ">>>>>>>>running test 2610"
./replace_wrapper '?' 'n@3l'  < ./inputs/input/ruin.386 
echo ">>>>>>>>running test 2611"
./replace_wrapper '?' 'nFP*8oz+T]]SY'\''xlii [u^qu}PRh:+t4H@8pA;j}2CBL+ I%i>v9LV&SOia"Y'  < ./inputs/input/ruin.1980 
echo ">>>>>>>>running test 2612"
./replace_wrapper '?' 'o/MQMfmP2]QS'  < ./inputs/input/ruin.1934 
echo ">>>>>>>>running test 2613"
./replace_wrapper '?' 'p'  < ./inputs/input/ruin.140 
echo ">>>>>>>>running test 2614"
./replace_wrapper '?' 'p'  < ./inputs/input/ruin.1805 
echo ">>>>>>>>running test 2615"
./replace_wrapper '?' 'pvDPT~*,@txdKMQwIQtir+O|sN{.P'\''\=TrH15QQ8^]u"F,OcZ~GOn|XDA5jxdO!Y83'  < ./inputs/input/ruin.301 
echo ">>>>>>>>running test 2616"
./replace_wrapper '?' 'r'  < ./inputs/input/ruin.319 
echo ">>>>>>>>running test 2617"
./replace_wrapper '?' 'rZDfy0eU~Ie6=aT!R0Q[sra^>2/hN:'  < ./inputs/input/ruin.739 
echo ">>>>>>>>running test 2618"
./replace_wrapper '?' 'sI0(^vBOJ,`h%VIM+k;cgE*KoPv-ioemER5bmc@K,~bKUI7"b8QG'  < ./inputs/input/ruin.1807 
echo ">>>>>>>>running test 2619"
./replace_wrapper '?' 'sWf&v]I=(jlZm2xA__O~'  < ./inputs/input/ruin.355 
echo ">>>>>>>>running test 2620"
./replace_wrapper '?' 'tv*#&:J!wgjLzvS${r p~[7[6\=,S[0m$kk'  < ./inputs/input/ruin.14 
echo ">>>>>>>>running test 2621"
./replace_wrapper '?' 'u'  < ./inputs/input/ruin.1672 
echo ">>>>>>>>running test 2622"
./replace_wrapper '?' 'uGaumQ2'\''P{3:r"B"#2]?Kx k&'  < ./inputs/input/ruin.819 
echo ">>>>>>>>running test 2623"
./replace_wrapper '?' 'v'  < ./inputs/input/ruin.1362 
echo ">>>>>>>>running test 2624"
./replace_wrapper '?' 'v}sNX;c8YQyksA'  < ./inputs/input/ruin.311 
echo ">>>>>>>>running test 2625"
./replace_wrapper '?' 'wkbyQaEQ'  < ./inputs/input/ruin.1770 
echo ">>>>>>>>running test 2626"
./replace_wrapper '?' 'xv/w'  < ./inputs/input/ruin.234 
echo ">>>>>>>>running test 2627"
./replace_wrapper '?' 'y"?0u];'\''_xwJ.X|p#(5;):1DsdamaV'  < ./inputs/input/ruin.199 
echo ">>>>>>>>running test 2628"
./replace_wrapper '?' 'y,l/Nu^x9o4<WBXS,6]j{R^EdlGsRtTVRa\OY+'  < ./inputs/input/ruin.1463 
echo ">>>>>>>>running test 2629"
./replace_wrapper '?' 'yH{$>>[3/4E<+|`x:M>wzhBPey#L1'  < ./inputs/input/ruin.1958 
echo ">>>>>>>>running test 2630"
./replace_wrapper '?' 'y[}5M!Ju"H&-Vu+rks'  < ./inputs/input/ruin.240 
echo ">>>>>>>>running test 2631"
./replace_wrapper '?' 'zs'  < ./inputs/input/ruin.591 
echo ">>>>>>>>running test 2632"
./replace_wrapper '?' '{Y|k{o'\''V/{R&sucpF{M|ZuJKnay&:E6]H=xd,zj'  < ./inputs/input/ruin.839 
echo ">>>>>>>>running test 2633"
./replace_wrapper '?' '{yuSgfAgJ?'  < ./inputs/input/ruin.16 
echo ">>>>>>>>running test 2634"
./replace_wrapper '?' '}'  < ./inputs/input/ruin.1692 
echo ">>>>>>>>running test 2635"
./replace_wrapper '?' '}'  < ./inputs/input/ruin.26 
echo ">>>>>>>>running test 2636"
./replace_wrapper '?' '})0'\''J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF'  < ./inputs/input/ruin.1616 
echo ">>>>>>>>running test 2637"
./replace_wrapper '?' '}v]6Mz6_|{XHut)!tVgIrm<|P,ANu(q]B](~0W@z'  < ./inputs/input/ruin.1989 
echo ">>>>>>>>running test 2638"
./replace_wrapper '?' '~%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$%A*[^0-9]*$'  < ./inputs/input/ruin.1339 
echo ">>>>>>>>running test 2639"
./replace_wrapper '?' '~'  < ./inputs/input/ruin.1236 
echo ">>>>>>>>running test 2640"
./replace_wrapper '?' '~'  < ./inputs/input/ruin.1339 
echo ">>>>>>>>running test 2641"
./replace_wrapper '?' '~AG[TM12_x}fd`$WQ_vmxUl!4p,f,g[UF^.N7qG'  < ./inputs/input/ruin.897 
echo ">>>>>>>>running test 2642"
./replace_wrapper '?'\''!!rY' '`LWwk[pKuya#yj Y%;9I4#0o]4wG$X^FP9;"Hr1Gzlciu+[#'  < ./inputs/input/ruin.1565 
echo ">>>>>>>>running test 2643"
./replace_wrapper '?'\''"V)9' 'Gw:<Ace)+JC}83'\''|qfH4!.gc@OrMnEi9:ZRYM;9}aFF'  < ./inputs/input/ruin.1683 
echo ">>>>>>>>running test 2644"
./replace_wrapper '?'\''' 'V<}${'  < ./inputs/input/ruin.780 
echo ">>>>>>>>running test 2645"
./replace_wrapper '?'\''@@' 'v\`{+AlBygo>42G2jE|6;A=U7|>_+"H6*0nmx7nS/%c6>(E6>b&TP'  < ./inputs/input/ruin.1027 
echo ">>>>>>>>running test 2646"
./replace_wrapper '?*$' '#((G)KKH'  < ./inputs/input/ruin.1245 
echo ">>>>>>>>running test 2647"
./replace_wrapper '?*$' ''\''~'  < ./inputs/input/ruin.1252 
echo ">>>>>>>>running test 2648"
./replace_wrapper '?*$' '2Ax#Mv_@DjcWz"~F]km'  < ./inputs/input/ruin.1241 
echo ">>>>>>>>running test 2649"
./replace_wrapper '?*$' 'E'  < ./inputs/input/ruin.1113 
echo ">>>>>>>>running test 2650"
./replace_wrapper '?*$' 'Lvu77k}K'  < ./inputs/input/ruin.1239 
echo ">>>>>>>>running test 2651"
./replace_wrapper '?*$' 'i'  < ./inputs/input/ruin.1625 
echo ">>>>>>>>running test 2652"
./replace_wrapper '?*$' '~'  < ./inputs/input/ruin.1236 
echo ">>>>>>>>running test 2653"
./replace_wrapper '?*' '#'  < ./inputs/input/ruin.1622 
echo ">>>>>>>>running test 2654"
./replace_wrapper '?*' '&'  < ./inputs/temp-test/577.inp.248.2 
echo ">>>>>>>>running test 2655"
./replace_wrapper '?*' '&a@%'  < ./inputs/temp-test/196.inp.88.2 
echo ">>>>>>>>running test 2656"
./replace_wrapper '?*' ',gAEa`/^PQWZZa^F'  < ./inputs/input/ruin.1612 
echo ">>>>>>>>running test 2657"
./replace_wrapper '?*' '.'  < ./inputs/input/ruin.391 
echo ">>>>>>>>running test 2658"
./replace_wrapper '?*' '9'  < ./inputs/input/ruin.109 
echo ">>>>>>>>running test 2659"
./replace_wrapper '?*' 'M%&;~-{;<(48m;Dv)aQS0bkh'\''eK'  < ./inputs/input/ruin.1613 
echo ">>>>>>>>running test 2660"
./replace_wrapper '?*' 'P54;@=_4xdN:$7^We'  < ./inputs/input/ruin.1620 
echo ">>>>>>>>running test 2661"
./replace_wrapper '?*' 'vB|CqDQNo,Fg|RTv5;bkJFE.twyj39J13'\''TcKY1sb&G<g]|ZaPL`0=8`YdR,'  < ./inputs/input/ruin.1614 
echo ">>>>>>>>running test 2662"
./replace_wrapper '?*' 'w'  < ./inputs/input/ruin.1610 
echo ">>>>>>>>running test 2663"
./replace_wrapper '?*' 'zCF&lL=IT'  < ./inputs/input/ruin.287 
echo ">>>>>>>>running test 2664"
./replace_wrapper '?*' '})0'\''J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF'  < ./inputs/input/ruin.1616 
echo ">>>>>>>>running test 2665"
./replace_wrapper '?*@*' 'NEW'  < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 2666"
./replace_wrapper '?*@*' 'NEW'  < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 2667"
./replace_wrapper '?*[9-B]?%[9-B]*?-[9-B]' '&a@%'  < ./inputs/temp-test/9.inp.4.1 
echo ">>>>>>>>running test 2668"
./replace_wrapper '?*[9-B]?[9-B]*?-[9-B]' '&a@%'  < ./inputs/temp-test/9.inp.4.1 
echo ">>>>>>>>running test 2669"
./replace_wrapper '?*[>-A]' 'O'  < ./inputs/input/ruin.1623 
echo ">>>>>>>>running test 2670"
./replace_wrapper '?*[A-G]' '`'  < ./inputs/input/ruin.998 
echo ">>>>>>>>running test 2671"
./replace_wrapper '?*z-}0-9Z-a]^_`a]' 'U'  < ./inputs/input/ruin.1611 
echo ">>>>>>>>running test 2672"
./replace_wrapper '?- ?[9-B]-*$' 'a&'  < ./inputs/temp-test/2320.inp.984.6 
echo ">>>>>>>>running test 2673"
./replace_wrapper '?- ?[9-B]-*' 'a&'  < ./inputs/temp-test/2318.inp.984.1 
echo ">>>>>>>>running test 2674"
./replace_wrapper '?- ?[9-B]-*' 'a&'  < ./inputs/temp-test/2319.inp.984.2 
echo ">>>>>>>>running test 2675"
./replace_wrapper '?-$' '@%&a'  < ./inputs/temp-test/572.inp.246.6 
echo ">>>>>>>>running test 2676"
./replace_wrapper '?-%' '&'  < ./inputs/temp-test/2349.inp.997.3 
echo ">>>>>>>>running test 2677"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/180.inp.81.1 
echo ">>>>>>>>running test 2678"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/181.inp.81.2 
echo ">>>>>>>>running test 2679"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/182.inp.81.3 
echo ">>>>>>>>running test 2680"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/2347.inp.997.1 
echo ">>>>>>>>running test 2681"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/2348.inp.997.2 
echo ">>>>>>>>running test 2682"
./replace_wrapper '?-' '&'  < ./inputs/temp-test/2349.inp.997.3 
echo ">>>>>>>>running test 2683"
./replace_wrapper '?-' '&a@%'  < ./inputs/temp-test/1104.inp.475.1 
echo ">>>>>>>>running test 2684"
./replace_wrapper '?-' '&a@%'  < ./inputs/temp-test/1105.inp.475.3 
echo ">>>>>>>>running test 2685"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1117.inp.480.1 
echo ">>>>>>>>running test 2686"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1118.inp.480.2 
echo ">>>>>>>>running test 2687"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1791.inp.762.1 
echo ">>>>>>>>running test 2688"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1792.inp.762.2 
echo ">>>>>>>>running test 2689"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1793.inp.762.3 
echo ">>>>>>>>running test 2690"
./replace_wrapper '?-' ''  < ./inputs/temp-test/1794.inp.762.4 
echo ">>>>>>>>running test 2691"
./replace_wrapper '?-' '@%&a'  < ./inputs/temp-test/571.inp.246.1 
echo ">>>>>>>>running test 2692"
./replace_wrapper '?-' '@%@&'  < ./inputs/temp-test/1200.inp.515.1 
echo ">>>>>>>>running test 2693"
./replace_wrapper '?-' '@%@&'  < ./inputs/temp-test/1201.inp.515.2 
echo ">>>>>>>>running test 2694"
./replace_wrapper '?-' '@n'  < ./inputs/temp-test/911.inp.393.1 
echo ">>>>>>>>running test 2695"
./replace_wrapper '?-' '@n'  < ./inputs/temp-test/912.inp.393.2 
echo ">>>>>>>>running test 2696"
./replace_wrapper '?-' '@n'  < ./inputs/temp-test/94.inp.42.1 
echo ">>>>>>>>running test 2697"
./replace_wrapper '?-' '@t'  < ./inputs/temp-test/1016.inp.437.1 
echo ">>>>>>>>running test 2698"
./replace_wrapper '?-' '@t'  < ./inputs/temp-test/1868.inp.793.1 
echo ">>>>>>>>running test 2699"
./replace_wrapper '?-' '@t'  < ./inputs/temp-test/1869.inp.793.2 
echo ">>>>>>>>running test 2700"
./replace_wrapper '?-' '@t'  < ./inputs/temp-test/1870.inp.793.3 
echo ">>>>>>>>running test 2701"
./replace_wrapper '?-' 'NEW'  < ./inputs/temp-test/893.inp.384.1 
echo ">>>>>>>>running test 2702"
./replace_wrapper '?-' 'NEW'  < ./inputs/temp-test/894.inp.384.3 
echo ">>>>>>>>running test 2703"
./replace_wrapper '?-' 'NEW'  < ./inputs/temp-test/895.inp.384.4 
echo ">>>>>>>>running test 2704"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/321.inp.143.1 
echo ">>>>>>>>running test 2705"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/322.inp.143.3 
echo ">>>>>>>>running test 2706"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/323.inp.143.4 
echo ">>>>>>>>running test 2707"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/504.inp.220.1 
echo ">>>>>>>>running test 2708"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/505.inp.220.2 
echo ">>>>>>>>running test 2709"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/506.inp.220.3 
echo ">>>>>>>>running test 2710"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/845.inp.363.1 
echo ">>>>>>>>running test 2711"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/846.inp.363.2 
echo ">>>>>>>>running test 2712"
./replace_wrapper '?-' 'a@nb@tc'  < ./inputs/temp-test/847.inp.363.3 
echo ">>>>>>>>running test 2713"
./replace_wrapper '?-*' '@%@&'  < ./inputs/temp-test/1691.inp.721.1 
echo ">>>>>>>>running test 2714"
./replace_wrapper '?-*' '@%@&'  < ./inputs/temp-test/1692.inp.721.2 
echo ">>>>>>>>running test 2715"
./replace_wrapper '?-**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2716"
./replace_wrapper '?-*?' 'NEW'  < ./inputs/temp-test/1701.inp.726.1 
echo ">>>>>>>>running test 2717"
./replace_wrapper '?-*?' 'NEW'  < ./inputs/temp-test/1702.inp.726.2 
echo ">>>>>>>>running test 2718"
./replace_wrapper '?-*?' 'NEW'  < ./inputs/temp-test/1703.inp.726.3 
echo ">>>>>>>>running test 2719"
./replace_wrapper '?-*?' 'NEW'  < ./inputs/temp-test/1704.inp.726.4 
echo ">>>>>>>>running test 2720"
./replace_wrapper '?--?-[^a-c]?@*?-[_-z]?-[^9-B]' ''  < ./inputs/temp-test/2292.inp.972.1 
echo ">>>>>>>>running test 2721"
./replace_wrapper '?--?-[^a-c]?@*?-[_-z]?-[^9-B]' ''  < ./inputs/temp-test/2293.inp.972.2 
echo ">>>>>>>>running test 2722"
./replace_wrapper '?--?-[^a-c]?@*?-[_-z]?-[^9-B]' ''  < ./inputs/temp-test/2294.inp.972.3 
echo ">>>>>>>>running test 2723"
./replace_wrapper '?--@**[^0-9]-*[-z]@n*$' '&'  < ./inputs/temp-test/1026.inp.441.6 
echo ">>>>>>>>running test 2724"
./replace_wrapper '?--@**[^0-9]-*[-z]@n*' '&'  < ./inputs/temp-test/1025.inp.441.1 
echo ">>>>>>>>running test 2725"
./replace_wrapper '?--[-- ' '@%&a'  < ./inputs/temp-test/2192.inp.929.1 
echo ">>>>>>>>running test 2726"
./replace_wrapper '?--[_-z][^a-c@n *' '&@n'  < ./inputs/temp-test/637.inp.275.1 
echo ">>>>>>>>running test 2727"
./replace_wrapper '?--[_-z][^a-c@n *' '&@n'  < ./inputs/temp-test/638.inp.275.2 
echo ">>>>>>>>running test 2728"
./replace_wrapper '?--[_-z][^a-c@n *' '@%&a'  < ./inputs/temp-test/637.inp.275.1 
echo ">>>>>>>>running test 2729"
./replace_wrapper '?--[_-z][^a-c@n *' '@%&a'  < ./inputs/temp-test/638.inp.275.2 
echo ">>>>>>>>running test 2730"
./replace_wrapper '?-?[9-B]-[@@][^a-c]- *--?^a-]@t-[_-z]' '@%&a'  < ./inputs/temp-test/2148.inp.910.1 
echo ">>>>>>>>running test 2731"
./replace_wrapper '?-?[9-B]-[@@][^a-c]- *--?^a-]@t-[_-z]' '@%&a'  < ./inputs/temp-test/2149.inp.910.2 
echo ">>>>>>>>running test 2732"
./replace_wrapper '?-?[9-B]-[@@][^a-c]- *--?^a-]@t-[_-z]' '@%&a'  < ./inputs/temp-test/2150.inp.910.3 
echo ">>>>>>>>running test 2733"
./replace_wrapper '?-@*[a-c]@[*[^a-c[^a--b][a-c' '@n'  < ./inputs/temp-test/276.inp.124.1 
echo ">>>>>>>>running test 2734"
./replace_wrapper '?-@*[a-c]@[*[^a-c[^a--b][a-c' '@n'  < ./inputs/temp-test/277.inp.124.2 
echo ">>>>>>>>running test 2735"
./replace_wrapper '?-[-z]-?-' '&'  < ./inputs/temp-test/485.inp.212.1 
echo ">>>>>>>>running test 2736"
./replace_wrapper '?-[-z]-?-' '&'  < ./inputs/temp-test/486.inp.212.3 
echo ">>>>>>>>running test 2737"
./replace_wrapper '?-[-z]-?-' '&'  < ./inputs/temp-test/487.inp.212.4 
echo ">>>>>>>>running test 2738"
./replace_wrapper '?-[0-9][^0-9]?' 'a@n'  < ./inputs/temp-test/1235.inp.530.1 
echo ">>>>>>>>running test 2739"
./replace_wrapper '?-[0-9][^0-9]?' 'a@n'  < ./inputs/temp-test/1236.inp.530.2 
echo ">>>>>>>>running test 2740"
./replace_wrapper '?-[9-B]@[' 'a&'  < ./inputs/temp-test/1299.inp.558.1 
echo ">>>>>>>>running test 2741"
./replace_wrapper '?-[9-B]@[' 'a&'  < ./inputs/temp-test/1300.inp.558.3 
echo ">>>>>>>>running test 2742"
./replace_wrapper '?-[^-z][0-9]' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 2743"
./replace_wrapper '?-[^-z][0-9]*$' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 2744"
./replace_wrapper '?-[^-z][0-9]*' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 2745"
./replace_wrapper '?-[^-z][][0-9]' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 2746"
./replace_wrapper '?-[^-z][^][0-9]' '&a@%'  < ./inputs/temp-test/224.inp.100.1 
echo ">>>>>>>>running test 2747"
./replace_wrapper '?-[^0-9]??--?[9-B]' '@%@&'  < ./inputs/temp-test/1769.inp.753.1 
echo ">>>>>>>>running test 2748"
./replace_wrapper '?-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^a-?' '@%&a'  < ./inputs/temp-test/142.inp.66.1 
echo ">>>>>>>>running test 2749"
./replace_wrapper '?-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^a-?' '@%&a'  < ./inputs/temp-test/143.inp.66.2 
echo ">>>>>>>>running test 2750"
./replace_wrapper '?-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^a-?' '@%&a'  < ./inputs/temp-test/144.inp.66.3 
echo ">>>>>>>>running test 2751"
./replace_wrapper '?-[a-][^9-B]?@**[^0-9][9-B][^9-B]' '@%&a'  < ./inputs/temp-test/998.inp.430.1 
echo ">>>>>>>>running test 2752"
./replace_wrapper '?-[a-][^9-B]?@**[^0-9][9-B][^9-B]' '@%&a'  < ./inputs/temp-test/999.inp.430.2 
echo ">>>>>>>>running test 2753"
./replace_wrapper '?-]-?[^0-9]A' 'NEW'  < ./inputs/temp-test/458.inp.201.1 
echo ">>>>>>>>running test 2754"
./replace_wrapper '?-]-?[^0-9]A' 'NEW'  < ./inputs/temp-test/459.inp.201.3 
echo ">>>>>>>>running test 2755"
./replace_wrapper '?-^a-c][^-z]a-c]?[a-' '&'  < ./inputs/temp-test/628.inp.271.1 
echo ">>>>>>>>running test 2756"
./replace_wrapper '?5' 'Q;G'  < ./inputs/input/ruin.1385 
echo ">>>>>>>>running test 2757"
./replace_wrapper '?9][^0-9][@t][^@][9-B]-[0-9][^0-9][@t0-9]@@]@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t[9-B]-[0-@][9-B]-[0-9][^0-9][@t9][^0-9@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t]*[@t@][9-B]-*[0-9][^0-9][@' '"\]({uYH3x5zs{.$s)G2Pzxji.o]- _Pzt'\''~6m#[}UH+'  < ./inputs/input/ruin.318 
echo ">>>>>>>>running test 2758"
./replace_wrapper '?? *' 'NEW'  < ./inputs/temp-test/1528.inp.655.1 
echo ">>>>>>>>running test 2759"
./replace_wrapper '?? *' 'NEW'  < ./inputs/temp-test/1529.inp.655.2 
echo ">>>>>>>>running test 2760"
./replace_wrapper '?? *' 'NEW'  < ./inputs/temp-test/1530.inp.655.3 
echo ">>>>>>>>running test 2761"
./replace_wrapper '??&' '9xoE\p_Un[?@!<f<10'\''NLF]{HC<5S)0ft3+1A]yP=~y-v/R.'\''64h`~~R4d(.nK`}fRB82&'  < ./inputs/input/ruin.1411 
echo ">>>>>>>>running test 2762"
./replace_wrapper '??' '&'  < ./inputs/temp-test/1461.inp.626.1 
echo ">>>>>>>>running test 2763"
./replace_wrapper '??' '&'  < ./inputs/temp-test/1462.inp.626.2 
echo ">>>>>>>>running test 2764"
./replace_wrapper '??' '0LcGrfGr r,X@m,;,+r/AlJ>Uv)\ |Cr_fk[JEoA=}sUma`8rt]'  < ./inputs/input/ruin.1130 
echo ">>>>>>>>running test 2765"
./replace_wrapper '??' 'kU.apBPAkew_"lFw!K;?J|IVb@XM3doSquoTX1J=[a&cJ'  < ./inputs/input/ruin.1607 
echo ">>>>>>>>running test 2766"
./replace_wrapper '??'\''@@*' '5'  < ./inputs/input/ruin.935 
echo ">>>>>>>>running test 2767"
./replace_wrapper '??*' 'kU.apBPAkew_"lFw!K;?J|IVb@XM3doSquoTX1J=[a&cJ'  < ./inputs/input/ruin.1607 
echo ">>>>>>>>running test 2768"
./replace_wrapper '??-?[^@n][a-]-@*[^a--b][0-9]-' '@%&a'  < ./inputs/temp-test/2248.inp.953.1 
echo ">>>>>>>>running test 2769"
./replace_wrapper '??[@n]-?[9-B]-^-]??[9-B]-*[^0-9]-' '@n'  < ./inputs/temp-test/1345.inp.578.1 
echo ">>>>>>>>running test 2770"
./replace_wrapper '??[@n]-?[9-B]-^-]??[9-B]-*[^0-9]-' '@n'  < ./inputs/temp-test/1346.inp.578.2 
echo ">>>>>>>>running test 2771"
./replace_wrapper '??^[^9-B]@*?@**' '@n'  < ./inputs/temp-test/249.inp.111.1 
echo ">>>>>>>>running test 2772"
./replace_wrapper '??^[^9-B]@*?@**' '@n'  < ./inputs/temp-test/250.inp.111.2 
echo ">>>>>>>>running test 2773"
./replace_wrapper '?@*'   < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 2774"
./replace_wrapper '?@*'   < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 2775"
./replace_wrapper '?@*' '@%&a'  < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 2776"
./replace_wrapper '?@*' '@%&a'  < ./inputs/temp-test/533.inp.231.2 
echo ">>>>>>>>running test 2777"
./replace_wrapper '?@*' 'NEW'  < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 2778"
./replace_wrapper '?@*' 'NEW'  < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 2779"
./replace_wrapper '?@*' 'b@t'  < ./inputs/temp-test/932.inp.402.1 
echo ">>>>>>>>running test 2780"
./replace_wrapper '?@*' 'b@t'  < ./inputs/temp-test/933.inp.402.2 
echo ">>>>>>>>running test 2781"
./replace_wrapper '?@*' 'b@t'  < ./inputs/temp-test/934.inp.402.3 
echo ">>>>>>>>running test 2782"
./replace_wrapper '?@**' ''  < ./inputs/temp-test/1465.inp.628.1 
echo ">>>>>>>>running test 2783"
./replace_wrapper '?@**' ''  < ./inputs/temp-test/1466.inp.628.4 
echo ">>>>>>>>running test 2784"
./replace_wrapper '?@**' 'a@nb@tc'  < ./inputs/temp-test/2301.inp.977.1 
echo ">>>>>>>>running test 2785"
./replace_wrapper '?@**@[*-[9-B]-' '&'  < ./inputs/temp-test/1984.inp.843.1 
echo ">>>>>>>>running test 2786"
./replace_wrapper '?@**@[*-[9-B]-' '&'  < ./inputs/temp-test/1985.inp.843.2 
echo ">>>>>>>>running test 2787"
./replace_wrapper '?@*?[-?-[^9-B]A*' 'a@nb@tc'  < ./inputs/temp-test/1609.inp.684.1 
echo ">>>>>>>>running test 2788"
./replace_wrapper '?@*[^0-9]^*' '&'  < ./inputs/temp-test/773.inp.332.1 
echo ">>>>>>>>running test 2789"
./replace_wrapper '?@*[a--b]^*-[^--$' 'NEW'  < ./inputs/temp-test/189.inp.85.8 
echo ">>>>>>>>running test 2790"
./replace_wrapper '?@*[a--b]^*-[^--' 'NEW'  < ./inputs/temp-test/187.inp.85.1 
echo ">>>>>>>>running test 2791"
./replace_wrapper '?@*[a--b]^*-[^--' 'NEW'  < ./inputs/temp-test/188.inp.85.2 
echo ">>>>>>>>running test 2792"
./replace_wrapper '?@=' 'f'  < ./inputs/input/ruin.31 
echo ">>>>>>>>running test 2793"
./replace_wrapper '?@@$' '&a@%'  < ./inputs/temp-test/2231.inp.945.8 
echo ">>>>>>>>running test 2794"
./replace_wrapper '?@@' '&a@%'  < ./inputs/temp-test/2228.inp.945.1 
echo ">>>>>>>>running test 2795"
./replace_wrapper '?@@' '&a@%'  < ./inputs/temp-test/2229.inp.945.3 
echo ">>>>>>>>running test 2796"
./replace_wrapper '?@@' '8&!J.D o'  < ./inputs/input/ruin.1290 
echo ">>>>>>>>running test 2797"
./replace_wrapper '?@@' 'G'  < ./inputs/input/ruin.1659 
echo ">>>>>>>>running test 2798"
./replace_wrapper '?@@' '[0fwc0yF</B^'  < ./inputs/input/ruin.1982 
echo ">>>>>>>>running test 2799"
./replace_wrapper '?@@' 'f>wlV.*t_>BC?n6sqXRSE}a/ttH,'  < ./inputs/input/ruin.1602 
echo ">>>>>>>>running test 2800"
./replace_wrapper '?@@' 'ot'\''N[U7FH f#8W$ekHhjvkc2}L>mY3u\f&B4*o.,t=ohIK`!{b9%+q*C\H~r!I:!RgLH 88'  < ./inputs/input/ruin.1106 
echo ">>>>>>>>running test 2801"
./replace_wrapper '?@@' 'zRixjQ`>-1lWM|#=R'  < ./inputs/input/ruin.58 
echo ">>>>>>>>running test 2802"
./replace_wrapper '?@@' '|Mi+'\''s OXxRu~W2bMVQrfx+GT$4>}5J5XNph:`xe! zY'  < ./inputs/input/ruin.275 
echo ">>>>>>>>running test 2803"
./replace_wrapper '?@@*' '&a@%'  < ./inputs/temp-test/1662.inp.709.1 
echo ">>>>>>>>running test 2804"
./replace_wrapper '?@@*' '&a@%'  < ./inputs/temp-test/1663.inp.709.3 
echo ">>>>>>>>running test 2805"
./replace_wrapper '?@@?' 'E'  < ./inputs/input/ruin.827 
echo ">>>>>>>>running test 2806"
./replace_wrapper '?@@?*' 'f>wlV.*t_>BC?n6sqXRSE}a/ttH,'  < ./inputs/input/ruin.1602 
echo ">>>>>>>>running test 2807"
./replace_wrapper '?@@Tb[^A-G]' '`'  < ./inputs/input/ruin.528 
echo ">>>>>>>>running test 2808"
./replace_wrapper '?@@Zg' 'oq0+3}K@*# t,Gf(;%tz>|LA!y:,~Of0'  < ./inputs/input/ruin.857 
echo ">>>>>>>>running test 2809"
./replace_wrapper '?@@[^9-B]@**-@*[^a-@t[^0-9]-^?' 'NEW'  < ./inputs/temp-test/1635.inp.696.1 
echo ">>>>>>>>running test 2810"
./replace_wrapper '?@[' '@%&a'  < ./inputs/temp-test/240.inp.107.1 
echo ">>>>>>>>running test 2811"
./replace_wrapper '?@[' '@%&a'  < ./inputs/temp-test/241.inp.107.3 
echo ">>>>>>>>running test 2812"
./replace_wrapper '?@[' 'a@n'  < ./inputs/temp-test/424.inp.187.1 
echo ">>>>>>>>running test 2813"
./replace_wrapper '?@[' 'a@n'  < ./inputs/temp-test/425.inp.187.2 
echo ">>>>>>>>running test 2814"
./replace_wrapper '?@[' 'a@n'  < ./inputs/temp-test/426.inp.187.3 
echo ">>>>>>>>running test 2815"
./replace_wrapper '?@[*' '&'  < ./inputs/temp-test/104.inp.47.1 
echo ">>>>>>>>running test 2816"
./replace_wrapper '?@[*' '&'  < ./inputs/temp-test/105.inp.47.3 
echo ">>>>>>>>running test 2817"
./replace_wrapper '?@[*' ''  < ./inputs/temp-test/1966.inp.835.1 
echo ">>>>>>>>running test 2818"
./replace_wrapper '?@[*' 'a&'  < ./inputs/temp-test/538.inp.233.1 
echo ">>>>>>>>running test 2819"
./replace_wrapper '?@[*' 'a&'  < ./inputs/temp-test/539.inp.233.3 
echo ">>>>>>>>running test 2820"
./replace_wrapper '?@[*?-]$' '@%&a'  < ./inputs/temp-test/353.inp.154.9 
echo ">>>>>>>>running test 2821"
./replace_wrapper '?@[*?-]$' '@%&a@'  < ./inputs/temp-test/353.inp.154.9 
echo ">>>>>>>>running test 2822"
./replace_wrapper '?@[*?-]' '@%&a'  < ./inputs/temp-test/351.inp.154.1 
echo ">>>>>>>>running test 2823"
./replace_wrapper '?@[*?-]' '@%&a'  < ./inputs/temp-test/352.inp.154.2 
echo ">>>>>>>>running test 2824"
./replace_wrapper '?@[*?-]' '@%&a@'  < ./inputs/temp-test/351.inp.154.1 
echo ">>>>>>>>running test 2825"
./replace_wrapper '?@[*?-]@' '@%&a'  < ./inputs/temp-test/352.inp.154.2 
echo ">>>>>>>>running test 2826"
./replace_wrapper '?@[*?@[*@*[^-' '@%&a'  < ./inputs/temp-test/1351.inp.580.1 
echo ">>>>>>>>running test 2827"
./replace_wrapper '?@[*?@[*@*[^-' '@%&a'  < ./inputs/temp-test/1352.inp.580.2 
echo ">>>>>>>>running test 2828"
./replace_wrapper '?@n' '|M&i+'\''s OXxRu~W2bMVQrfx+GT$4>}5J5XNph:`xe! zY'  < ./inputs/input/ruin.275 
echo ">>>>>>>>running test 2829"
./replace_wrapper '?@n-?--$' ''  < ./inputs/temp-test/33.inp.14.8 
echo ">>>>>>>>running test 2830"
./replace_wrapper '?@n-?--$' ''  < ./inputs/temp-test/34.inp.14.9 
echo ">>>>>>>>running test 2831"
./replace_wrapper '?@n-?--' ''  < ./inputs/temp-test/32.inp.14.1 
echo ">>>>>>>>running test 2832"
./replace_wrapper '?@t*$' 'b@t'  < ./inputs/temp-test/1006.inp.432.6 
echo ">>>>>>>>running test 2833"
./replace_wrapper '?@t*' 'b@t'  < ./inputs/temp-test/1003.inp.432.1 
echo ">>>>>>>>running test 2834"
./replace_wrapper '?@t*' 'b@t'  < ./inputs/temp-test/1004.inp.432.2 
echo ">>>>>>>>running test 2835"
./replace_wrapper '?@t*' 'b@t'  < ./inputs/temp-test/1005.inp.432.3 
echo ">>>>>>>>running test 2836"
./replace_wrapper '?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*?@t*' 'b@t'  < ./inputs/temp-test/1003.inp.432.1 
echo ">>>>>>>>running test 2837"
./replace_wrapper '?@t[^0-9]?[a-c]?$' '@n'  < ./inputs/temp-test/1056.inp.454.9 
echo ">>>>>>>>running test 2838"
./replace_wrapper '?@t[^0-9]?[a-c]?' '@n'  < ./inputs/temp-test/1054.inp.454.1 
echo ">>>>>>>>running test 2839"
./replace_wrapper '?@t[^0-9]?[a-c]?' '@n'  < ./inputs/temp-test/1055.inp.454.2 
echo ">>>>>>>>running test 2840"
./replace_wrapper '?A' 'NEW'  < ./inputs/temp-test/1546.inp.662.1 
echo ">>>>>>>>running test 2841"
./replace_wrapper '?A' 'NEW'  < ./inputs/temp-test/1547.inp.662.2 
echo ">>>>>>>>running test 2842"
./replace_wrapper '?A' 'NEW'  < ./inputs/temp-test/1548.inp.662.3 
echo ">>>>>>>>running test 2843"
./replace_wrapper '?A*' '&'  < ./inputs/temp-test/1687.inp.719.1 
echo ">>>>>>>>running test 2844"
./replace_wrapper '?A*' '&'  < ./inputs/temp-test/1688.inp.719.2 
echo ">>>>>>>>running test 2845"
./replace_wrapper '?A*?[^a-c?$' '&'  < ./inputs/temp-test/335.inp.147.9 
echo ">>>>>>>>running test 2846"
./replace_wrapper '?A*?[^a-c?' '&'  < ./inputs/temp-test/333.inp.147.1 
echo ">>>>>>>>running test 2847"
./replace_wrapper '?A*?[^a-c?' '&'  < ./inputs/temp-test/334.inp.147.3 
echo ">>>>>>>>running test 2848"
./replace_wrapper '?Ao?' '/'  < ./inputs/input/ruin.1208 
echo ">>>>>>>>running test 2849"
./replace_wrapper '?S' 'N[E*MfGK'  < ./inputs/input/ruin.1349 
echo ">>>>>>>>running test 2850"
./replace_wrapper '?SjGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~ljGU}XIi?]qLF"YtOv~~l[0-9]* *[a--b][^a-c][^a-' 'N[E*MfGK'  < ./inputs/input/ruin.1349 
echo ">>>>>>>>running test 2851"
./replace_wrapper '?U' 'k6'  < ./inputs/input/ruin.618 
echo ">>>>>>>>running test 2852"
./replace_wrapper '?Y' 't'  < ./inputs/input/ruin.1033 
echo ">>>>>>>>running test 2853"
./replace_wrapper '?Y' 't2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G'  < ./inputs/input/ruin.1033 
echo ">>>>>>>>running test 2854"
./replace_wrapper '?[-' 'a&'  < ./inputs/temp-test/783.inp.337.1 
echo ">>>>>>>>running test 2855"
./replace_wrapper '?[--?' '@%&a'  < ./inputs/temp-test/715.inp.309.1 
echo ">>>>>>>>running test 2856"
./replace_wrapper '?[--?' '@%&a'  < ./inputs/temp-test/716.inp.309.2 
echo ">>>>>>>>running test 2857"
./replace_wrapper '?[--?' '@%&a'  < ./inputs/temp-test/717.inp.309.3 
echo ">>>>>>>>running test 2858"
./replace_wrapper '?[-z]?' ''  < ./inputs/temp-test/813.inp.350.1 
echo ">>>>>>>>running test 2859"
./replace_wrapper '?[-z]?' ''  < ./inputs/temp-test/814.inp.350.2 
echo ">>>>>>>>running test 2860"
./replace_wrapper '?[-z]?-@*-[0-9]--' '@%@&'  < ./inputs/temp-test/2173.inp.919.1 
echo ">>>>>>>>running test 2861"
./replace_wrapper '?[0-9] *[^9-B]@*[^a-c]--[^0-9]' 'b@t'  < ./inputs/temp-test/828.inp.357.1 
echo ">>>>>>>>running test 2862"
./replace_wrapper '?[0-9] *[^9-B]@*[^a-c]--[^0-9]' 'b@t'  < ./inputs/temp-test/829.inp.357.2 
echo ">>>>>>>>running test 2863"
./replace_wrapper '?[0-9]' '&a@%'  < ./inputs/temp-test/2021.inp.858.1 
echo ">>>>>>>>running test 2864"
./replace_wrapper '?[0-9]' '&a@%'  < ./inputs/temp-test/2022.inp.858.2 
echo ">>>>>>>>running test 2865"
./replace_wrapper '?[0-9]' '&a@%'  < ./inputs/temp-test/2023.inp.858.3 
echo ">>>>>>>>running test 2866"
./replace_wrapper '?[0-9]' '@%&a'  < ./inputs/temp-test/287.inp.129.1 
echo ">>>>>>>>running test 2867"
./replace_wrapper '?[0-9]' 'NEW'  < ./inputs/temp-test/342.inp.150.1 
echo ">>>>>>>>running test 2868"
./replace_wrapper '?[0-9]' 'NEW'  < ./inputs/temp-test/343.inp.150.3 
echo ">>>>>>>>running test 2869"
./replace_wrapper '?[0-9]' 'NEW@'  < ./inputs/temp-test/343.inp.150.3 
echo ">>>>>>>>running test 2870"
./replace_wrapper '?[0-9]--*[9-B][a-c[^9-B]' '@%@&'  < ./inputs/temp-test/1812.inp.770.1 
echo ">>>>>>>>running test 2871"
./replace_wrapper '?[0-9]--*[9-B][a-c[^9-B]' '@%@&'  < ./inputs/temp-test/1813.inp.770.2 
echo ">>>>>>>>running test 2872"
./replace_wrapper '?[0-9]-[^a-?[a-]' '@n'  < ./inputs/temp-test/1302.inp.560.1 
echo ">>>>>>>>running test 2873"
./replace_wrapper '?[0-9]-[^a-?[a-]' '@n'  < ./inputs/temp-test/1303.inp.560.2 
echo ">>>>>>>>running test 2874"
./replace_wrapper '?[0-9]@' 'NEW'  < ./inputs/temp-test/342.inp.150.1 
echo ">>>>>>>>running test 2875"
./replace_wrapper '?[0-9]@t**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2876"
./replace_wrapper '?[0-9][9-B]-' 'a&'  < ./inputs/temp-test/1972.inp.838.1 
echo ">>>>>>>>running test 2877"
./replace_wrapper '?[0-9][9-B]-' 'a&'  < ./inputs/temp-test/1973.inp.838.2 
echo ">>>>>>>>running test 2878"
./replace_wrapper '?[0-9][^a-c]' '@t'  < ./inputs/temp-test/1983.inp.842.1 
echo ">>>>>>>>running test 2879"
./replace_wrapper '?[0-9][a--][^9-B][0-9] *??$' '@t'  < ./inputs/temp-test/1292.inp.554.6 
echo ">>>>>>>>running test 2880"
./replace_wrapper '?[0-9][a--][^9-B][0-9] *??' '@t'  < ./inputs/temp-test/1290.inp.554.1 
echo ">>>>>>>>running test 2881"
./replace_wrapper '?[0-9][a--][^9-B][0-9] *??' '@t'  < ./inputs/temp-test/1291.inp.554.3 
echo ">>>>>>>>running test 2882"
./replace_wrapper '?[0-9]e' op  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2883"
./replace_wrapper '?[0-9]e' op  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 2884"
./replace_wrapper '?[9-B] ' 'a&'  < ./inputs/temp-test/1959.inp.831.1 
echo ">>>>>>>>running test 2885"
./replace_wrapper '?[9-B]' '@%&a'  < ./inputs/temp-test/1256.inp.539.1 
echo ">>>>>>>>running test 2886"
./replace_wrapper '?[9-B]' '@%@&'  < ./inputs/temp-test/1693.inp.722.1 
echo ">>>>>>>>running test 2887"
./replace_wrapper '?[9-B]' '@n'  < ./inputs/temp-test/1999.inp.849.1 
echo ">>>>>>>>running test 2888"
./replace_wrapper '?[9-B]' 'a&'  < ./inputs/temp-test/271.inp.121.1 
echo ">>>>>>>>running test 2889"
./replace_wrapper '?[9-B]' 'b@t'  < ./inputs/temp-test/2290.inp.970.1 
echo ">>>>>>>>running test 2890"
./replace_wrapper '?[9-B][^a-c]$' '@t'  < ./inputs/temp-test/940.inp.403.6 
echo ">>>>>>>>running test 2891"
./replace_wrapper '?[9-B][^a-c]' '@t'  < ./inputs/temp-test/936.inp.403.1 
echo ">>>>>>>>running test 2892"
./replace_wrapper '?[9-B][^a-c]' '@t'  < ./inputs/temp-test/937.inp.403.2 
echo ">>>>>>>>running test 2893"
./replace_wrapper '?[9-B][^a-c]' '@t'  < ./inputs/temp-test/938.inp.403.3 
echo ">>>>>>>>running test 2894"
./replace_wrapper '?[9-B][a-c]?[9-B][^9-B]-^*?-' '@n'  < ./inputs/temp-test/1507.inp.646.1 
echo ">>>>>>>>running test 2895"
./replace_wrapper '?[9-B][a-c]?[9-B][^9-B]-^*?-' '@n'  < ./inputs/temp-test/1508.inp.646.3 
echo ">>>>>>>>running test 2896"
./replace_wrapper '?[9-B]^a-c]-[a-c]-[^0-9]- *?-^a-]$' 'NEW'  < ./inputs/temp-test/1020.inp.438.6 
echo ">>>>>>>>running test 2897"
./replace_wrapper '?[9-B]^a-c]-[a-c]-[^0-9]- *?-^a-]' 'NEW'  < ./inputs/temp-test/1017.inp.438.1 
echo ">>>>>>>>running test 2898"
./replace_wrapper '?[9-B]^a-c]-[a-c]-[^0-9]- *?-^a-]' 'NEW'  < ./inputs/temp-test/1018.inp.438.2 
echo ">>>>>>>>running test 2899"
./replace_wrapper '?[@@][^0-9][a-c]?-[^0-9]- [^9-B]' 'NEW'  < ./inputs/temp-test/1128.inp.485.1 
echo ">>>>>>>>running test 2900"
./replace_wrapper '?[@n]' 'b@t'  < ./inputs/temp-test/1661.inp.708.1 
echo ">>>>>>>>running test 2901"
./replace_wrapper '?[@t]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2902"
./replace_wrapper '?[] ' 'a@nb@tc'  < ./inputs/temp-test/217.inp.97.1 
echo ">>>>>>>>running test 2903"
./replace_wrapper '?[]@*' '@%&a'  < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 2904"
./replace_wrapper '?[][^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2905"
./replace_wrapper '?[][^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2906"
./replace_wrapper '?[^-$' '@t'  < ./inputs/temp-test/1771.inp.754.9 
echo ">>>>>>>>running test 2907"
./replace_wrapper '?[^-' '@t'  < ./inputs/temp-test/1770.inp.754.1 
echo ">>>>>>>>running test 2908"
./replace_wrapper '?[^--z]' ''  < ./inputs/temp-test/2157.inp.913.1 
echo ">>>>>>>>running test 2909"
./replace_wrapper '?[^--z]*$' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2910"
./replace_wrapper '?[^--z]*' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2911"
./replace_wrapper '?[^--z]c[^9-B]*$' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2912"
./replace_wrapper '?[^--z]c[^9-B]*' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2913"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c*?[9-B]c-'   < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2914"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c*?[9-B]c-'   < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2915"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2916"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2917"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c?*' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2918"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c?*' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2919"
./replace_wrapper '?[^--z]c[^9-B][^9-B]c?**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 2920"
./replace_wrapper '?[^-z][^--z]?-@[*' '&'  < ./inputs/temp-test/133.inp.62.1 
echo ">>>>>>>>running test 2921"
./replace_wrapper '?[^0-9>-A]' ')Ifp.i9B%j1,0T.zHwp'  < ./inputs/input/ruin.1007 
echo ">>>>>>>>running test 2922"
./replace_wrapper '?[^0-9]' ''  < ./inputs/temp-test/2208.inp.935.1 
echo ">>>>>>>>running test 2923"
./replace_wrapper '?[^0-9]' '@%@&'  < ./inputs/temp-test/1622.inp.690.1 
echo ">>>>>>>>running test 2924"
./replace_wrapper '?[^0-9]' '@%@&'  < ./inputs/temp-test/1623.inp.690.3 
echo ">>>>>>>>running test 2925"
./replace_wrapper '?[^0-9]' '@%@&'  < ./inputs/temp-test/1624.inp.690.4 
echo ">>>>>>>>running test 2926"
./replace_wrapper '?[^0-9]' 'J'  < ./inputs/input/ruin.1332 
echo ">>>>>>>>running test 2927"
./replace_wrapper '?[^0-9]' 'J?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe?Stj%,|9I{FxV*qi!{_(dn*K9`$wo[0-9]NwuJe'  < ./inputs/input/ruin.1332 
echo ">>>>>>>>running test 2928"
./replace_wrapper '?[^0-9]' 'b@t'  < ./inputs/temp-test/2276.inp.965.1 
echo ">>>>>>>>running test 2929"
./replace_wrapper '?[^0-9]' 'b@t'  < ./inputs/temp-test/2277.inp.965.2 
echo ">>>>>>>>running test 2930"
./replace_wrapper '?[^0-9]' 'b@t'  < ./inputs/temp-test/2278.inp.965.3 
echo ">>>>>>>>running test 2931"
./replace_wrapper '?[^0-9]-' '@%&a'  < ./inputs/temp-test/597.inp.257.1 
echo ">>>>>>>>running test 2932"
./replace_wrapper '?[^0-9]-' '@%&a'  < ./inputs/temp-test/598.inp.257.2 
echo ">>>>>>>>running test 2933"
./replace_wrapper '?[^0-9]-*' 'a@nb@tc'  < ./inputs/temp-test/806.inp.346.1 
echo ">>>>>>>>running test 2934"
./replace_wrapper '?[^0-9]?^-]-[^a-c]$' 'NEW'  < ./inputs/temp-test/586.inp.251.9 
echo ">>>>>>>>running test 2935"
./replace_wrapper '?[^0-9]?^-]-[^a-c]' 'NEW'  < ./inputs/temp-test/583.inp.251.1 
echo ">>>>>>>>running test 2936"
./replace_wrapper '?[^0-9]?^-]-[^a-c]' 'NEW'  < ./inputs/temp-test/584.inp.251.3 
echo ">>>>>>>>running test 2937"
./replace_wrapper '?[^0-9]?^-]-[^a-c]' 'NEW'  < ./inputs/temp-test/585.inp.251.4 
echo ">>>>>>>>running test 2938"
./replace_wrapper '?[^9-B]$' 'b@t'  < ./inputs/temp-test/173.inp.77.6 
echo ">>>>>>>>running test 2939"
./replace_wrapper '?[^9-B]%' ''  < ./inputs/temp-test/10.inp.5.1 
echo ">>>>>>>>running test 2940"
./replace_wrapper '?[^9-B]' '&a@%'  < ./inputs/temp-test/377.inp.164.1 
echo ">>>>>>>>running test 2941"
./replace_wrapper '?[^9-B]' '&a@%'  < ./inputs/temp-test/378.inp.164.2 
echo ">>>>>>>>running test 2942"
./replace_wrapper '?[^9-B]' ''  < ./inputs/temp-test/10.inp.5.1 
echo ">>>>>>>>running test 2943"
./replace_wrapper '?[^9-B]' ''  < ./inputs/temp-test/11.inp.5.2 
echo ">>>>>>>>running test 2944"
./replace_wrapper '?[^9-B]' 'a@n'  < ./inputs/temp-test/281.inp.126.1 
echo ">>>>>>>>running test 2945"
./replace_wrapper '?[^9-B]' 'a@n'  < ./inputs/temp-test/282.inp.126.2 
echo ">>>>>>>>running test 2946"
./replace_wrapper '?[^9-B]' 'a@n'  < ./inputs/temp-test/469.inp.205.1 
echo ">>>>>>>>running test 2947"
./replace_wrapper '?[^9-B]' 'a@n'  < ./inputs/temp-test/470.inp.205.2 
echo ">>>>>>>>running test 2948"
./replace_wrapper '?[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1862.inp.790.1 
echo ">>>>>>>>running test 2949"
./replace_wrapper '?[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1863.inp.790.3 
echo ">>>>>>>>running test 2950"
./replace_wrapper '?[^9-B]' 'b@t'  < ./inputs/temp-test/171.inp.77.1 
echo ">>>>>>>>running test 2951"
./replace_wrapper '?[^9-B]' 'b@t'  < ./inputs/temp-test/172.inp.77.3 
echo ">>>>>>>>running test 2952"
./replace_wrapper '?[^9-B]-[^0-9]-[9-B]' 'b@t'  < ./inputs/temp-test/267.inp.119.1 
echo ">>>>>>>>running test 2953"
./replace_wrapper '?[^9-B]-[^0-9]-[9-B]' 'b@t'  < ./inputs/temp-test/268.inp.119.2 
echo ">>>>>>>>running test 2954"
./replace_wrapper '?[^9-B]?@**[9-B]-' 'NEW'  < ./inputs/temp-test/86.inp.39.1 
echo ">>>>>>>>running test 2955"
./replace_wrapper '?[^9-B]?@**[9-B]-' 'NEW'  < ./inputs/temp-test/87.inp.39.2 
echo ">>>>>>>>running test 2956"
./replace_wrapper '?[^9-B][9-B][^9-B]' 'a&'  < ./inputs/temp-test/796.inp.343.1 
echo ">>>>>>>>running test 2957"
./replace_wrapper '?[^9-B][9-B][^9-B]' 'a&'  < ./inputs/temp-test/797.inp.343.2 
echo ">>>>>>>>running test 2958"
./replace_wrapper '?[^9-B][9-B][^9-B]' 'a&'  < ./inputs/temp-test/798.inp.343.3 
echo ">>>>>>>>running test 2959"
./replace_wrapper '?[^9-B][^9-B]A$' 'a@n'  < ./inputs/temp-test/1809.inp.768.6 
echo ">>>>>>>>running test 2960"
./replace_wrapper '?[^9-B][^9-B]A' 'a@n'  < ./inputs/temp-test/1805.inp.768.1 
echo ">>>>>>>>running test 2961"
./replace_wrapper '?[^9-B][^9-B]A' 'a@n'  < ./inputs/temp-test/1806.inp.768.2 
echo ">>>>>>>>running test 2962"
./replace_wrapper '?[^9-B][^9-B]A' 'a@n'  < ./inputs/temp-test/1807.inp.768.4 
echo ">>>>>>>>running test 2963"
./replace_wrapper '?[^9-B]a-c]--? ??-- *@[*?' 'a&'  < ./inputs/temp-test/1573.inp.672.1 
echo ">>>>>>>>running test 2964"
./replace_wrapper '?[^9-B]a-c]--? ??-- *@[*?' 'a&'  < ./inputs/temp-test/1574.inp.672.2 
echo ">>>>>>>>running test 2965"
./replace_wrapper '?[^9-B]a-c]--? ??-- *@[*?' 'a&'  < ./inputs/temp-test/1575.inp.672.3 
echo ">>>>>>>>running test 2966"
./replace_wrapper '?[^9-B]a-c]--? ??-- *@[*?' 'a&'  < ./inputs/temp-test/1576.inp.672.4 
echo ">>>>>>>>running test 2967"
./replace_wrapper '?[^@@]' ''  < ./inputs/temp-test/2155.inp.912.1 
echo ">>>>>>>>running test 2968"
./replace_wrapper '?[^@@]' ''  < ./inputs/temp-test/2156.inp.912.3 
echo ">>>>>>>>running test 2969"
./replace_wrapper '?[^@@][0-9]-$' '&'  < ./inputs/temp-test/1195.inp.513.6 
echo ">>>>>>>>running test 2970"
./replace_wrapper '?[^@@][0-9]-' '&'  < ./inputs/temp-test/1192.inp.513.1 
echo ">>>>>>>>running test 2971"
./replace_wrapper '?[^@@][0-9]-' '&'  < ./inputs/temp-test/1193.inp.513.2 
echo ">>>>>>>>running test 2972"
./replace_wrapper '?[^@@][0-9]-' '&'  < ./inputs/temp-test/1194.inp.513.3 
echo ">>>>>>>>running test 2973"
./replace_wrapper '?[^@@][^--z]c-[^0-9][9-B]??' 'a@n'  < ./inputs/temp-test/302.inp.136.1 
echo ">>>>>>>>running test 2974"
./replace_wrapper '?[^@@][^--z]c-[^0-9][9-B]??' 'a@n'  < ./inputs/temp-test/303.inp.136.2 
echo ">>>>>>>>running test 2975"
./replace_wrapper '?[^@@][^--z]c-[^0-9][9-B]??' 'a@n'  < ./inputs/temp-test/304.inp.136.3 
echo ">>>>>>>>running test 2976"
./replace_wrapper '?[^@n]' '@t'  < ./inputs/temp-test/290.inp.131.1 
echo ">>>>>>>>running test 2977"
./replace_wrapper '?[^@n]' '@t'  < ./inputs/temp-test/291.inp.131.2 
echo ">>>>>>>>running test 2978"
./replace_wrapper '?[^@n][^0-9]-@*@*?' 'a&'  < ./inputs/temp-test/269.inp.120.1 
echo ">>>>>>>>running test 2979"
./replace_wrapper '?[^@n][^0-9]-@*@*?' 'a&'  < ./inputs/temp-test/270.inp.120.4 
echo ">>>>>>>>running test 2980"
./replace_wrapper '?[^@n]^[@@][0-9]??-]' 'NEW'  < ./inputs/temp-test/1124.inp.484.1 
echo ">>>>>>>>running test 2981"
./replace_wrapper '?[^@n]^[@@][0-9]??-]' 'NEW'  < ./inputs/temp-test/1125.inp.484.2 
echo ">>>>>>>>running test 2982"
./replace_wrapper '?[^@n]^[@@][0-9]??-]' 'NEW'  < ./inputs/temp-test/1126.inp.484.3 
echo ">>>>>>>>running test 2983"
./replace_wrapper '?[^@t]' 'NEW'  < ./inputs/temp-test/1484.inp.637.1 
echo ">>>>>>>>running test 2984"
./replace_wrapper '?[^Z-a]^_`a]$' '=Wk.f/55+vDk9q)=M@c$J7g4#(A-`^-G!J'  < ./inputs/input/ruin.1940 
echo ">>>>>>>>running test 2985"
./replace_wrapper '?[^Z-a]^_`a]' 'll&TYr{O(v_3"lQIib-9o98U{Cs_a8 cM4lI^%0or5Eu!8QY[J~+#nh<A'  < ./inputs/input/ruin.213 
echo ">>>>>>>>running test 2986"
./replace_wrapper '?[^] ' 'a@nb@tc'  < ./inputs/temp-test/217.inp.97.1 
echo ">>>>>>>>running test 2987"
./replace_wrapper '?[^]@*' '@%&a'  < ./inputs/temp-test/532.inp.231.1 
echo ">>>>>>>>running test 2988"
./replace_wrapper '?[^][^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/530.inp.230.1 
echo ">>>>>>>>running test 2989"
./replace_wrapper '?[^][^--z]c[^9-B][^9-B]c*?[9-B]c-' '@t'  < ./inputs/temp-test/531.inp.230.4 
echo ">>>>>>>>running test 2990"
./replace_wrapper '?[^a--]' '@n'  < ./inputs/temp-test/128.inp.60.1 
echo ">>>>>>>>running test 2991"
./replace_wrapper '?[^a--]' '@n'  < ./inputs/temp-test/129.inp.60.2 
echo ">>>>>>>>running test 2992"
./replace_wrapper '?[^a--]' '@n'  < ./inputs/temp-test/130.inp.60.3 
echo ">>>>>>>>running test 2993"
./replace_wrapper '?[^a--]' 'b@t'  < ./inputs/temp-test/1991.inp.846.1 
echo ">>>>>>>>running test 2994"
./replace_wrapper '?[^a--]' 'b@t'  < ./inputs/temp-test/1992.inp.846.2 
echo ">>>>>>>>running test 2995"
./replace_wrapper '?[^a--]' 'b@t'  < ./inputs/temp-test/1993.inp.846.3 
echo ">>>>>>>>running test 2996"
./replace_wrapper '?[^a--b]' '@n'  < ./inputs/temp-test/1052.inp.453.1 
echo ">>>>>>>>running test 2997"
./replace_wrapper '?[^a--b]' '@n'  < ./inputs/temp-test/1053.inp.453.2 
echo ">>>>>>>>running test 2998"
./replace_wrapper '?[^a--b][0-9]A*[9-B]??[^9-B]?-' 'b@t'  < ./inputs/temp-test/1411.inp.606.1 
echo ">>>>>>>>running test 2999"
./replace_wrapper '?[^a--b][0-9]A*[9-B]??[^9-B]?-' 'b@t'  < ./inputs/temp-test/1412.inp.606.2 
echo ">>>>>>>>running test 3000"
./replace_wrapper '?[^a--b][0-9]A*[9-B]??[^9-B]?-' 'b@t'  < ./inputs/temp-test/1413.inp.606.3 
echo ">>>>>>>>running test 3001"
./replace_wrapper '?[^a-?--*[9-B]?[0-9]a-c]-*' 'a@nb@tc'  < ./inputs/temp-test/1070.inp.460.1 
echo ">>>>>>>>running test 3002"
./replace_wrapper '?[^a-c' '@%@&'  < ./inputs/temp-test/978.inp.421.1 
echo ">>>>>>>>running test 3003"
./replace_wrapper '?[^a-c' '@%@&'  < ./inputs/temp-test/979.inp.421.3 
echo ">>>>>>>>running test 3004"
./replace_wrapper '?[^a-c' '@%@&'  < ./inputs/temp-test/980.inp.421.4 
echo ">>>>>>>>running test 3005"
./replace_wrapper '?[^a-c]$' '@n'  < ./inputs/temp-test/1895.inp.803.6 
echo ">>>>>>>>running test 3006"
./replace_wrapper '?[^a-c]%??[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2343.inp.995.3 
echo ">>>>>>>>running test 3007"
./replace_wrapper '?[^a-c]' '&'  < ./inputs/temp-test/419.inp.185.1 
echo ">>>>>>>>running test 3008"
./replace_wrapper '?[^a-c]' '&'  < ./inputs/temp-test/420.inp.185.2 
echo ">>>>>>>>running test 3009"
./replace_wrapper '?[^a-c]' '&'  < ./inputs/temp-test/421.inp.185.3 
echo ">>>>>>>>running test 3010"
./replace_wrapper '?[^a-c]' '@n'  < ./inputs/temp-test/1893.inp.803.1 
echo ">>>>>>>>running test 3011"
./replace_wrapper '?[^a-c]' '@n'  < ./inputs/temp-test/1894.inp.803.2 
echo ">>>>>>>>running test 3012"
./replace_wrapper '?[^a-c]- *[9-B]?' '@%@&'  < ./inputs/temp-test/1849.inp.785.1 
echo ">>>>>>>>running test 3013"
./replace_wrapper '?[^a-c]- *[9-B]?' '@%@&'  < ./inputs/temp-test/1850.inp.785.2 
echo ">>>>>>>>running test 3014"
./replace_wrapper '?[^a-c]-^?-[a-c]-?c*?[^9-B]-?' 'NEW'  < ./inputs/temp-test/1585.inp.676.1 
echo ">>>>>>>>running test 3015"
./replace_wrapper '?[^a-c]-^?-[a-c]-?c*?[^9-B]-?' 'NEW'  < ./inputs/temp-test/1586.inp.676.2 
echo ">>>>>>>>running test 3016"
./replace_wrapper '?[^a-c]-^?-[a-c]-?c*?[^9-B]-?' 'NEW'  < ./inputs/temp-test/1587.inp.676.3 
echo ">>>>>>>>running test 3017"
./replace_wrapper '?[^a-c]?%?[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2341.inp.995.1 
echo ">>>>>>>>running test 3018"
./replace_wrapper '?[^a-c]?%?[^a-]?[9-B][^9-B][9-B]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3019"
./replace_wrapper '?[^a-c]??%[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2342.inp.995.2 
echo ">>>>>>>>running test 3020"
./replace_wrapper '?[^a-c]??%[^a-]?[9-B][^9-B][9-B]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3021"
./replace_wrapper '?[^a-c]??[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2341.inp.995.1 
echo ">>>>>>>>running test 3022"
./replace_wrapper '?[^a-c]??[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2342.inp.995.2 
echo ">>>>>>>>running test 3023"
./replace_wrapper '?[^a-c]??[^a-]?[9-B][^9-B][9-B]' ''  < ./inputs/temp-test/2343.inp.995.3 
echo ">>>>>>>>running test 3024"
./replace_wrapper '?[^a-c]@[*[^a-c]- *^a-c]^' 'a&'  < ./inputs/temp-test/899.inp.387.1 
echo ">>>>>>>>running test 3025"
./replace_wrapper '?[^a-c]@[*[^a-c]- *^a-c]^' 'a&'  < ./inputs/temp-test/900.inp.387.2 
echo ">>>>>>>>running test 3026"
./replace_wrapper '?[^a-c]@[*[^a-c]- *^a-c]^' 'a&'  < ./inputs/temp-test/901.inp.387.3 
echo ">>>>>>>>running test 3027"
./replace_wrapper '?[^a]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3028"
./replace_wrapper '?[^p&y=3[p&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIZYIgTBk0-9]' 'J'  < ./inputs/input/ruin.1332 
echo ">>>>>>>>running test 3029"
./replace_wrapper '?[a-' '&'  < ./inputs/temp-test/1751.inp.744.1 
echo ">>>>>>>>running test 3030"
./replace_wrapper '?[a-' '&'  < ./inputs/temp-test/1752.inp.744.2 
echo ">>>>>>>>running test 3031"
./replace_wrapper '?[a-' '&'  < ./inputs/temp-test/1753.inp.744.4 
echo ">>>>>>>>running test 3032"
./replace_wrapper '?[a--]' '@%@&'  < ./inputs/temp-test/1522.inp.652.1 
echo ">>>>>>>>running test 3033"
./replace_wrapper '?[a--]' '@%@&'  < ./inputs/temp-test/1523.inp.652.3 
echo ">>>>>>>>running test 3034"
./replace_wrapper '?[a--]?[9-B]?[0-9][^a-c]' ''  < ./inputs/temp-test/2018.inp.857.1 
echo ">>>>>>>>running test 3035"
./replace_wrapper '?[a--]?[9-B]?[0-9][^a-c]' ''  < ./inputs/temp-test/2019.inp.857.2 
echo ">>>>>>>>running test 3036"
./replace_wrapper '?[a--]?[9-B]?[0-9][^a-c]' ''  < ./inputs/temp-test/2020.inp.857.3 
echo ">>>>>>>>running test 3037"
./replace_wrapper '?[a--][0-9]--[9-B][-z]?' 'a@nb@tc'  < ./inputs/temp-test/2034.inp.863.1 
echo ">>>>>>>>running test 3038"
./replace_wrapper '?[a--][0-9]--[9-B][-z]?' 'a@nb@tc'  < ./inputs/temp-test/2035.inp.863.2 
echo ">>>>>>>>running test 3039"
./replace_wrapper '?[a--][0-9]--[9-B][-z]?' 'a@nb@tc'  < ./inputs/temp-test/2036.inp.863.3 
echo ">>>>>>>>running test 3040"
./replace_wrapper '?[a--b]@[*[0-9][^a-c]?@*[0-9][- *[^@@][-z][9-B]- *-[a-c]' 'NEW'  < ./inputs/temp-test/1741.inp.741.1 
echo ">>>>>>>>running test 3041"
./replace_wrapper '?[a--b]@[*[0-9][^a-c]?@*[0-9][- *[^@@][-z][9-B]- *-[a-c]' 'NEW'  < ./inputs/temp-test/1742.inp.741.3 
echo ">>>>>>>>running test 3042"
./replace_wrapper '?[a-]' '@t'  < ./inputs/temp-test/2162.inp.915.1 
echo ">>>>>>>>running test 3043"
./replace_wrapper '?[a-]' '@t'  < ./inputs/temp-test/2163.inp.915.2 
echo ">>>>>>>>running test 3044"
./replace_wrapper '?[a-]' '@t'  < ./inputs/temp-test/2164.inp.915.3 
echo ">>>>>>>>running test 3045"
./replace_wrapper '?[a-]@[*?--?^*-@t*-@@*' ''  < ./inputs/temp-test/871.inp.374.1 
echo ">>>>>>>>running test 3046"
./replace_wrapper '?[a-]@[*?--?^*-@t*-@@*' ''  < ./inputs/temp-test/872.inp.374.3 
echo ">>>>>>>>running test 3047"
./replace_wrapper '?[a-b]$**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3048"
./replace_wrapper '?[a-c' 'a@n'  < ./inputs/temp-test/769.inp.330.1 
echo ">>>>>>>>running test 3049"
./replace_wrapper '?[a-c-?' 'a@nb@tc'  < ./inputs/temp-test/2198.inp.932.1 
echo ">>>>>>>>running test 3050"
./replace_wrapper '?[a-c-?' 'a@nb@tc'  < ./inputs/temp-test/2199.inp.932.2 
echo ">>>>>>>>running test 3051"
./replace_wrapper '?[a-c-?' 'a@nb@tc'  < ./inputs/temp-test/2200.inp.932.3 
echo ">>>>>>>>running test 3052"
./replace_wrapper '?[a-c]$' '@%@&'  < ./inputs/temp-test/1776.inp.756.6 
echo ">>>>>>>>running test 3053"
./replace_wrapper '?[a-c]' '&a@%'  < ./inputs/temp-test/2166.inp.916.1 
echo ">>>>>>>>running test 3054"
./replace_wrapper '?[a-c]' '&a@%'  < ./inputs/temp-test/2167.inp.916.3 
echo ">>>>>>>>running test 3055"
./replace_wrapper '?[a-c]' '@%@&'  < ./inputs/temp-test/1774.inp.756.1 
echo ">>>>>>>>running test 3056"
./replace_wrapper '?[a-c]' '@%@&'  < ./inputs/temp-test/1775.inp.756.3 
echo ">>>>>>>>running test 3057"
./replace_wrapper '?[a-c]' 'a@n'  < ./inputs/temp-test/1401.inp.601.1 
echo ">>>>>>>>running test 3058"
./replace_wrapper '?[a-c]' 'a@n'  < ./inputs/temp-test/1402.inp.601.3 
echo ">>>>>>>>running test 3059"
./replace_wrapper '?[a-c]' 'b@t'  < ./inputs/temp-test/1374.inp.590.1 
echo ">>>>>>>>running test 3060"
./replace_wrapper '?[a-c]' 'b@t'  < ./inputs/temp-test/1375.inp.590.2 
echo ">>>>>>>>running test 3061"
./replace_wrapper '?[a-c]' 'b@t'  < ./inputs/temp-test/1376.inp.590.4 
echo ">>>>>>>>running test 3062"
./replace_wrapper '?[a-c]@**[a-c]^-]-[-' '@n'  < ./inputs/temp-test/2049.inp.869.1 
echo ">>>>>>>>running test 3063"
./replace_wrapper '?[a-c]@**[a-c]^-]-[-' '@n'  < ./inputs/temp-test/2050.inp.869.2 
echo ">>>>>>>>running test 3064"
./replace_wrapper '?[a-c]@**[a-c]^-]-[-' '@n'  < ./inputs/temp-test/2051.inp.869.3 
echo ">>>>>>>>running test 3065"
./replace_wrapper '?[a-c][^9-B][@n]?[^0-9]@[*' '@%@&'  < ./inputs/temp-test/879.inp.377.1 
echo ">>>>>>>>running test 3066"
./replace_wrapper '?[a-c][^9-B][@n]?[^0-9]@[*' '@%@&'  < ./inputs/temp-test/880.inp.377.2 
echo ">>>>>>>>running test 3067"
./replace_wrapper '?[z-}]' '|90(kN$NAi!EBr,N`fb z$>^0N9vz*r~*nQ'  < ./inputs/input/ruin.1948 
echo ">>>>>>>>running test 3068"
./replace_wrapper '?\ Ynh[' 'q'  < ./inputs/input/ruin.380 
echo ">>>>>>>>running test 3069"
./replace_wrapper '?\' ')NC*%tKb|GGjQi3YBgB"]ME3u<5gkf_ge*1>^@V,l4LjQ#t.Idoo@p<2,j9<*'\''&k}rabG\jnS |:Zd*Nx>3#/"zuTn$+QR\d'\'''  < ./inputs/input/ruin.714 
echo ">>>>>>>>running test 3070"
./replace_wrapper '?\;kn_j.:`F#' 'q'  < ./inputs/input/ruin.973 
echo ">>>>>>>>running test 3071"
./replace_wrapper '?\A0b' 'Z'  < ./inputs/input/ruin.1555 
echo ">>>>>>>>running test 3072"
./replace_wrapper '?\T<:#@@' '2'  < ./inputs/input/ruin.302 
echo ">>>>>>>>running test 3073"
./replace_wrapper '?\U\c-' '+Ts~{n:nQv'\''-zYVa/KpCq27"=/_jA{fR<aHFO%"c-1"'  < ./inputs/input/ruin.867 
echo ">>>>>>>>running test 3074"
./replace_wrapper '?\XK' 'vvy4-prHL@5G04oa\C[&1t2|kzQ2XdVNlgG{X.WlqnnQa(i^da!4HS<qTr5\I&feu*B '  < ./inputs/input/ruin.1016 
echo ">>>>>>>>running test 3075"
./replace_wrapper '?\Y+So' 'w'  < ./inputs/input/ruin.518 
echo ">>>>>>>>running test 3076"
./replace_wrapper '?\z"tEL.. ;9now' 'z'  < ./inputs/input/ruin.429 
echo ">>>>>>>>running test 3077"
./replace_wrapper '?][^0-9][@t[9-B]-[0-@][9-B]-[0-9][^0-9][@t9][^0-9@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t]*[@t@][9-B]-*[0-9][^0-9][@][^0-9][@t[9-B]-[0-@][9-B]-[0-9][^0-9][@t9][^0-9@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t]*[@t@][9-B]-*[0-9][^0-9][@' 'r'  < ./inputs/input/ruin.319 
echo ">>>>>>>>running test 3078"
./replace_wrapper '?]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,*5rY[0-9]*' 'C'  < ./inputs/input/ruin.1343 
echo ">>>>>>>>running test 3079"
./replace_wrapper '?^' '&'  < ./inputs/temp-test/576.inp.248.1 
echo ">>>>>>>>running test 3080"
./replace_wrapper '?^' '&'  < ./inputs/temp-test/577.inp.248.2 
echo ">>>>>>>>running test 3081"
./replace_wrapper '?^' ''  < ./inputs/temp-test/1886.inp.800.1 
echo ">>>>>>>>running test 3082"
./replace_wrapper '?^' ''  < ./inputs/temp-test/1887.inp.800.2 
echo ">>>>>>>>running test 3083"
./replace_wrapper '?^' '@%&a'  < ./inputs/temp-test/511.inp.223.1 
echo ">>>>>>>>running test 3084"
./replace_wrapper '?^' '@%&a'  < ./inputs/temp-test/512.inp.223.3 
echo ">>>>>>>>running test 3085"
./replace_wrapper '?^' 'NEW'  < ./inputs/temp-test/413.inp.182.1 
echo ">>>>>>>>running test 3086"
./replace_wrapper '?^' 'NEW'  < ./inputs/temp-test/414.inp.182.4 
echo ">>>>>>>>running test 3087"
./replace_wrapper '?^'  < ./inputs/temp-test/511.inp.223.1 
echo ">>>>>>>>running test 3088"
./replace_wrapper '?^*' '&a@%'  < ./inputs/temp-test/974.inp.420.1 
echo ">>>>>>>>running test 3089"
./replace_wrapper '?^*' '&a@%'  < ./inputs/temp-test/975.inp.420.2 
echo ">>>>>>>>running test 3090"
./replace_wrapper '?^*' '&a@%'  < ./inputs/temp-test/976.inp.420.4 
echo ">>>>>>>>running test 3091"
./replace_wrapper '?^*' 'NEW'  < ./inputs/temp-test/159.inp.72.1 
echo ">>>>>>>>running test 3092"
./replace_wrapper '?^*' 'NEW'  < ./inputs/temp-test/160.inp.72.2 
echo ">>>>>>>>running test 3093"
./replace_wrapper '?^*' 'NEW'  < ./inputs/temp-test/161.inp.72.3 
echo ">>>>>>>>running test 3094"
./replace_wrapper '?^*' 'a@n'  < ./inputs/temp-test/1240.inp.533.1 
echo ">>>>>>>>running test 3095"
./replace_wrapper '?^*' 'a@n'  < ./inputs/temp-test/1241.inp.533.2 
echo ">>>>>>>>running test 3096"
./replace_wrapper '?^*' 'a@nb@tc'  < ./inputs/temp-test/1718.inp.732.1 
echo ">>>>>>>>running test 3097"
./replace_wrapper '?^*' 'a@nb@tc'  < ./inputs/temp-test/1719.inp.732.2 
echo ">>>>>>>>running test 3098"
./replace_wrapper '?^*' 'a@nb@tc'  < ./inputs/temp-test/1720.inp.732.3 
echo ">>>>>>>>running test 3099"
./replace_wrapper '?^*-?-[a-c]' '&a@%'  < ./inputs/temp-test/909.inp.392.1 
echo ">>>>>>>>running test 3100"
./replace_wrapper '?^*-?-[a-c]' '&a@%'  < ./inputs/temp-test/910.inp.392.3 
echo ">>>>>>>>running test 3101"
./replace_wrapper '?^-] @**^*' '@%&a'  < ./inputs/temp-test/1319.inp.566.1 
echo ">>>>>>>>running test 3102"
./replace_wrapper '?^-] @**^*' '@%&a'  < ./inputs/temp-test/1320.inp.566.3 
echo ">>>>>>>>running test 3103"
./replace_wrapper '?^-]' 'a@nb@tc'  < ./inputs/temp-test/916.inp.395.1 
echo ">>>>>>>>running test 3104"
./replace_wrapper '?^-][0-9][^9-B][a--]-[9-B][^-^*' 'a&'  < ./inputs/temp-test/1257.inp.540.1 
echo ">>>>>>>>running test 3105"
./replace_wrapper '?^-][0-9][^9-B][a--]-[9-B][^-^*' 'a&'  < ./inputs/temp-test/1258.inp.540.3 
echo ">>>>>>>>running test 3106"
./replace_wrapper '?^?' 'a@n'  < ./inputs/temp-test/106.inp.48.1 
echo ">>>>>>>>running test 3107"
./replace_wrapper '?^?' 'a@n'  < ./inputs/temp-test/107.inp.48.3 
echo ">>>>>>>>running test 3108"
./replace_wrapper '?^?*' '&'  < ./inputs/temp-test/576.inp.248.1 
echo ">>>>>>>>running test 3109"
./replace_wrapper '?^[]' '@%&a'  < ./inputs/temp-test/511.inp.223.1 
echo ">>>>>>>>running test 3110"
./replace_wrapper '?^[]' '@%&a'  < ./inputs/temp-test/512.inp.223.3 
echo ">>>>>>>>running test 3111"
./replace_wrapper '?^[^]' '@%&a'  < ./inputs/temp-test/511.inp.223.1 
echo ">>>>>>>>running test 3112"
./replace_wrapper '?^[^]' '@%&a'  < ./inputs/temp-test/512.inp.223.3 
echo ">>>>>>>>running test 3113"
./replace_wrapper '?^[^]**' 'a'   < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3114"
./replace_wrapper '?^a-]' '@n'  < ./inputs/temp-test/244.inp.109.1 
echo ">>>>>>>>running test 3115"
./replace_wrapper '?^a-]' '@n'  < ./inputs/temp-test/245.inp.109.2 
echo ">>>>>>>>running test 3116"
./replace_wrapper '?^a-]@[*-[9-B]?$' 'a@n'  < ./inputs/temp-test/740.inp.317.8 
echo ">>>>>>>>running test 3117"
./replace_wrapper '?^a-]@[*-[9-B]?' 'a@n'  < ./inputs/temp-test/738.inp.317.1 
echo ">>>>>>>>running test 3118"
./replace_wrapper '?^a-]@[*-[9-B]?' 'a@n'  < ./inputs/temp-test/739.inp.317.2 
echo ">>>>>>>>running test 3119"
./replace_wrapper '?^a-c][0-9][^a-c][^9-B]-' '&a@%'  < ./inputs/temp-test/488.inp.213.1 
echo ">>>>>>>>running test 3120"
./replace_wrapper '?^a-c][0-9][^a-c][^9-B]-@' '&a@%'  < ./inputs/temp-test/488.inp.213.1 
echo ">>>>>>>>running test 3121"
./replace_wrapper '?^a-c][0-9][^a-c][^9-B]-@***' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3122"
./replace_wrapper '?a-]' 'a&'  < ./inputs/temp-test/1343.inp.577.1 
echo ">>>>>>>>running test 3123"
./replace_wrapper '?a-]' 'a&'  < ./inputs/temp-test/1344.inp.577.2 
echo ">>>>>>>>running test 3124"
./replace_wrapper '?a-c]' '@%&a'  < ./inputs/temp-test/115.inp.52.1 
echo ">>>>>>>>running test 3125"
./replace_wrapper '?c' 'hQ'  < ./inputs/input/ruin.1939 
echo ">>>>>>>>running test 3126"
./replace_wrapper '?c*' '@n'  < ./inputs/temp-test/349.inp.153.1 
echo ">>>>>>>>running test 3127"
./replace_wrapper '?c*@' '@n'  < ./inputs/temp-test/349.inp.153.1 
echo ">>>>>>>>running test 3128"
./replace_wrapper '?c?%-' '&'  < ./inputs/temp-test/2337.inp.992.1 
echo ">>>>>>>>running test 3129"
./replace_wrapper '?c?-' '&'  < ./inputs/temp-test/2337.inp.992.1 
echo ">>>>>>>>running test 3130"
./replace_wrapper '?c?[-z]??[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/1330.inp.571.1 
echo ">>>>>>>>running test 3131"
./replace_wrapper '?c?[-z]??[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/1331.inp.571.2 
echo ">>>>>>>>running test 3132"
./replace_wrapper '?c?[-z]??[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/1332.inp.571.3 
echo ">>>>>>>>running test 3133"
./replace_wrapper '?d' 'y1[qD'  < ./inputs/input/ruin.1594 
echo ">>>>>>>>running test 3134"
./replace_wrapper '?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]t]*[@t@][9-B]-*[0-9]][?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]ddB]@t]*[@t@][9-B]' '5_edflj&5h8_DCEi.gTlx*L#a)htiLD2@W$74Vc.L'  < ./inputs/input/ruin.325 
echo ">>>>>>>>running test 3135"
./replace_wrapper '?n' 'C'  < ./inputs/input/ruin.1670 
echo ">>>>>>>>running test 3136"
./replace_wrapper '?p&y=3[ZYIgNLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1[0-9]A]TBk?[^0-9]*-*?* *[a' '8l;V'  < ./inputs/input/ruin.1337 
echo ">>>>>>>>running test 3137"
./replace_wrapper '?p&y=3[ZYp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIIgTBk[^9-B]-*?* *[a--' '$'  < ./inputs/input/ruin.1336 
echo ">>>>>>>>running test 3138"
./replace_wrapper '?p&y=3[Z][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9*]-[^9-B][a-c]?[^0-9]-*[^9-B][a-cYIgTBk' '~'  < ./inputs/input/ruin.1339 
echo ">>>>>>>>running test 3139"
./replace_wrapper '?p&y=3[Zp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIYIgTBk' '>b})}d%:+~EdJc2\! ug7;'  < ./inputs/input/ruin.1335 
echo ">>>>>>>>running test 3140"
./replace_wrapper '?s@t?' '9}(kMj8,~K9.I'  < ./inputs/input/ruin.855 
echo ">>>>>>>>running test 3141"
./replace_wrapper '?{?' '=El&\Ww]-4826L?@ )'\''W!>$'\'';W3DDU& vB%QGt;TIdL-& %kzJ($j5'  < ./inputs/input/ruin.1567 
echo ">>>>>>>>running test 3142"
./replace_wrapper '@ ' 'LYzt2J[^!8*s3wkF(7kj={f1KdN'  < ./inputs/input/ruin.1626 
echo ">>>>>>>>running test 3143"
./replace_wrapper '@ ' 'Y'  < ./inputs/input/ruin.1318 
echo ">>>>>>>>running test 3144"
./replace_wrapper '@ ' 'Z'  < ./inputs/input/ruin.1152 
echo ">>>>>>>>running test 3145"
./replace_wrapper '@!' 'A'  < ./inputs/input/ruin.1546 
echo ">>>>>>>>running test 3146"
./replace_wrapper '@"' '~Ar:2C'  < ./inputs/input/ruin.908 
echo ">>>>>>>>running test 3147"
./replace_wrapper '@"?#' 'J*wVzsbPX&iw, tX4$'  < ./inputs/input/ruin.1957 
echo ">>>>>>>>running test 3148"
./replace_wrapper '@#' '@n67@n67@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 3149"
./replace_wrapper '@#' 'u-Yif5t-<fI/[&xp!_(>P}(pE'\''6KlTvB#W&0U.D#C0!\hR=[t,_-|{AnRT5kzG]#g}5-|1%u@)^v6\^125_]0%a~J*jd,'  < ./inputs/input/ruin.1544 
echo ">>>>>>>>running test 3150"
./replace_wrapper '@#' 'uQx4*M<}~q7\)}|N)OE]v'  < ./inputs/input/ruin.1095 
echo ">>>>>>>>running test 3151"
./replace_wrapper '@#^' '>*ed'  < ./inputs/input/ruin.1380 
echo ">>>>>>>>running test 3152"
./replace_wrapper '@%[0-9]' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3153"
./replace_wrapper '@' 'yy'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 3154"
./replace_wrapper '@(@n' 'FJ%]J<C\vi'\''nOf*@"$tH7Z ^H{tf7'\''VpPME8 V'  < ./inputs/input/ruin.1376 
echo ">>>>>>>>running test 3155"
./replace_wrapper '@)' '81OA|~%qx8_p(~,NR#K(T@)'  < ./inputs/input/ruin.564 
echo ">>>>>>>>running test 3156"
./replace_wrapper '@)' 'VbA/Ln,%rHuw=~e/MCfA_C=`B/=]2"'\''&]{Gz/-'  < ./inputs/input/ruin.222 
echo ">>>>>>>>running test 3157"
./replace_wrapper '@*$'   < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3158"
./replace_wrapper '@*$' '@%@&'  < ./inputs/temp-test/1883.inp.798.8 
echo ">>>>>>>>running test 3159"
./replace_wrapper '@*' '&'  < ./inputs/temp-test/1333.inp.572.1 
echo ">>>>>>>>running test 3160"
./replace_wrapper '@*' '&'  < ./inputs/temp-test/1334.inp.572.3 
echo ">>>>>>>>running test 3161"
./replace_wrapper '@*' '@%@&'  < ./inputs/temp-test/1882.inp.798.1 
echo ">>>>>>>>running test 3162"
./replace_wrapper '@*' 'a@nb@tc'  < ./inputs/temp-test/427.inp.188.1 
echo ">>>>>>>>running test 3163"
./replace_wrapper '@*' 'a@nb@tc'  < ./inputs/temp-test/428.inp.188.3 
echo ">>>>>>>>running test 3164"
./replace_wrapper '@**$' 'a@n'  < ./inputs/temp-test/818.inp.352.6 
echo ">>>>>>>>running test 3165"
./replace_wrapper '@**' '&'  < ./inputs/temp-test/2146.inp.909.1 
echo ">>>>>>>>running test 3166"
./replace_wrapper '@**' '&'  < ./inputs/temp-test/2147.inp.909.2 
echo ">>>>>>>>running test 3167"
./replace_wrapper '@**' '@%&a'  < ./inputs/temp-test/1109.inp.477.1 
echo ">>>>>>>>running test 3168"
./replace_wrapper '@**' '@%&a'  < ./inputs/temp-test/1110.inp.477.2 
echo ">>>>>>>>running test 3169"
./replace_wrapper '@**' 'a&'  < ./inputs/temp-test/1338.inp.575.1 
echo ">>>>>>>>running test 3170"
./replace_wrapper '@**' 'a&'  < ./inputs/temp-test/1339.inp.575.3 
echo ">>>>>>>>running test 3171"
./replace_wrapper '@**' 'a@n'  < ./inputs/temp-test/817.inp.352.1 
echo ">>>>>>>>running test 3172"
./replace_wrapper '@**-' '&a@%'  < ./inputs/temp-test/134.inp.63.1 
echo ">>>>>>>>running test 3173"
./replace_wrapper '@**-' '&a@%'  < ./inputs/temp-test/135.inp.63.3 
echo ">>>>>>>>running test 3174"
./replace_wrapper '@**-' '@t'  < ./inputs/temp-test/1490.inp.639.1 
echo ">>>>>>>>running test 3175"
./replace_wrapper '@**-' '@t'  < ./inputs/temp-test/1491.inp.639.2 
echo ">>>>>>>>running test 3176"
./replace_wrapper '@**-' '@t'  < ./inputs/temp-test/1860.inp.789.1 
echo ">>>>>>>>running test 3177"
./replace_wrapper '@**-' '@t'  < ./inputs/temp-test/1861.inp.789.3 
echo ">>>>>>>>running test 3178"
./replace_wrapper '@**--[0-9]?a-c][^-' '&'  < ./inputs/temp-test/278.inp.125.1 
echo ">>>>>>>>running test 3179"
./replace_wrapper '@**--[0-9]?a-c][^-' '&'  < ./inputs/temp-test/279.inp.125.2 
echo ">>>>>>>>running test 3180"
./replace_wrapper '@**?' '&a@%'  < ./inputs/temp-test/2046.inp.868.1 
echo ">>>>>>>>running test 3181"
./replace_wrapper '@**?' '&a@%'  < ./inputs/temp-test/2047.inp.868.2 
echo ">>>>>>>>running test 3182"
./replace_wrapper '@**?' '&a@%'  < ./inputs/temp-test/2048.inp.868.3 
echo ">>>>>>>>running test 3183"
./replace_wrapper '@**?' ''  < ./inputs/temp-test/929.inp.401.1 
echo ">>>>>>>>running test 3184"
./replace_wrapper '@**?' ''  < ./inputs/temp-test/930.inp.401.2 
echo ">>>>>>>>running test 3185"
./replace_wrapper '@**?' ''  < ./inputs/temp-test/931.inp.401.3 
echo ">>>>>>>>running test 3186"
./replace_wrapper '@**?' 'a&'  < ./inputs/temp-test/2037.inp.864.1 
echo ">>>>>>>>running test 3187"
./replace_wrapper '@**?' 'a&'  < ./inputs/temp-test/2038.inp.864.2 
echo ">>>>>>>>running test 3188"
./replace_wrapper '@**?' 'a&'  < ./inputs/temp-test/2039.inp.864.3 
echo ">>>>>>>>running test 3189"
./replace_wrapper '@**?' 'a@n'  < ./inputs/temp-test/867.inp.373.1 
echo ">>>>>>>>running test 3190"
./replace_wrapper '@**?' 'a@n'  < ./inputs/temp-test/868.inp.373.2 
echo ">>>>>>>>running test 3191"
./replace_wrapper '@**?' 'a@n'  < ./inputs/temp-test/869.inp.373.3 
echo ">>>>>>>>running test 3192"
./replace_wrapper '@**?' 'a@n'  < ./inputs/temp-test/870.inp.373.4 
echo ">>>>>>>>running test 3193"
./replace_wrapper '@**?' 'b@t'  < ./inputs/temp-test/2179.inp.922.1 
echo ">>>>>>>>running test 3194"
./replace_wrapper '@**?' 'b@t'  < ./inputs/temp-test/2180.inp.922.2 
echo ">>>>>>>>running test 3195"
./replace_wrapper '@**?' 'b@t'  < ./inputs/temp-test/2181.inp.922.3 
echo ">>>>>>>>running test 3196"
./replace_wrapper '@**[^0-9][9-B]?' '&a@%'  < ./inputs/temp-test/1270.inp.545.1 
echo ">>>>>>>>running test 3197"
./replace_wrapper '@**[^9-B]$' '@t'  < ./inputs/temp-test/1946.inp.826.6 
echo ">>>>>>>>running test 3198"
./replace_wrapper '@**[^9-B]' '@t'  < ./inputs/temp-test/1944.inp.826.1 
echo ">>>>>>>>running test 3199"
./replace_wrapper '@**[^9-B]' '@t'  < ./inputs/temp-test/1945.inp.826.2 
echo ">>>>>>>>running test 3200"
./replace_wrapper '@**[^a-]-*-[-?@** *- ?$' 'a@nb@tc'  < ./inputs/temp-test/2071.inp.877.6 
echo ">>>>>>>>running test 3201"
./replace_wrapper '@**[^a-]-*-[-?@** *- ?' 'a@nb@tc'  < ./inputs/temp-test/2068.inp.877.1 
echo ">>>>>>>>running test 3202"
./replace_wrapper '@**[^a-]-*-[-?@** *- ?' 'a@nb@tc'  < ./inputs/temp-test/2069.inp.877.2 
echo ">>>>>>>>running test 3203"
./replace_wrapper '@**[^a-]-*-[-?@** *- ?' 'a@nb@tc'  < ./inputs/temp-test/2070.inp.877.3 
echo ">>>>>>>>running test 3204"
./replace_wrapper '@**a-c][^@t]-??a-c]?-$' '@%&a'  < ./inputs/temp-test/1565.inp.668.6 
echo ">>>>>>>>running test 3205"
./replace_wrapper '@**a-c][^@t]-??a-c]?-' '@%&a'  < ./inputs/temp-test/1562.inp.668.1 
echo ">>>>>>>>running test 3206"
./replace_wrapper '@**a-c][^@t]-??a-c]?-' '@%&a'  < ./inputs/temp-test/1563.inp.668.2 
echo ">>>>>>>>running test 3207"
./replace_wrapper '@**a-c][^@t]-??a-c]?-' '@%&a'  < ./inputs/temp-test/1564.inp.668.3 
echo ">>>>>>>>running test 3208"
./replace_wrapper '@*-' '&'  < ./inputs/temp-test/225.inp.101.1 
echo ">>>>>>>>running test 3209"
./replace_wrapper '@*-' '&'  < ./inputs/temp-test/226.inp.101.2 
echo ">>>>>>>>running test 3210"
./replace_wrapper '@*-' '&'  < ./inputs/temp-test/227.inp.101.3 
echo ">>>>>>>>running test 3211"
./replace_wrapper '@*-' '@n'  < ./inputs/temp-test/1596.inp.679.1 
echo ">>>>>>>>running test 3212"
./replace_wrapper '@*-' '@n'  < ./inputs/temp-test/1597.inp.679.3 
echo ">>>>>>>>running test 3213"
./replace_wrapper '@*-?[^a-c-[0-9][0-9]@[?[a-?[-' '@%&a'  < ./inputs/temp-test/432.inp.190.1 
echo ">>>>>>>>running test 3214"
./replace_wrapper '@*-?[^a-c-[0-9][0-9]@[?[a-?[-' '@%&a'  < ./inputs/temp-test/433.inp.190.2 
echo ">>>>>>>>running test 3215"
./replace_wrapper '@*-[^0-9]-@[[^a-c] ' 'NEW'  < ./inputs/temp-test/1486.inp.638.1 
echo ">>>>>>>>running test 3216"
./replace_wrapper '@*-[^0-9]-@[[^a-c] ' 'NEW'  < ./inputs/temp-test/1487.inp.638.2 
echo ">>>>>>>>running test 3217"
./replace_wrapper '@*-[^0-9]-@[[^a-c] ' 'NEW'  < ./inputs/temp-test/1488.inp.638.3 
echo ">>>>>>>>running test 3218"
./replace_wrapper '@*?'   < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3219"
./replace_wrapper '@*?' '&@n'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3220"
./replace_wrapper '@*?' '@%&a'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3221"
./replace_wrapper '@*?'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3222"
./replace_wrapper '@*?[]' '@%&a'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3223"
./replace_wrapper '@*?[^]' '@%&a'  < ./inputs/temp-test/198.inp.89.1 
echo ">>>>>>>>running test 3224"
./replace_wrapper '@*[0-9]??-^*^??@[*' ''  < ./inputs/temp-test/63.inp.27.1 
echo ">>>>>>>>running test 3225"
./replace_wrapper '@*[^0-9]' '&'  < ./inputs/temp-test/1935.inp.823.1 
echo ">>>>>>>>running test 3226"
./replace_wrapper '@*[^0-9]' '&'  < ./inputs/temp-test/1936.inp.823.3 
echo ">>>>>>>>running test 3227"
./replace_wrapper '@*[^0-9]' '@%&a'  < ./inputs/temp-test/888.inp.382.1 
echo ">>>>>>>>running test 3228"
./replace_wrapper '@*[^0-9]' '@%&a'  < ./inputs/temp-test/889.inp.382.2 
echo ">>>>>>>>running test 3229"
./replace_wrapper '@*[^a-c]?- ^a-c]' '&a@%'  < ./inputs/temp-test/2122.inp.900.1 
echo ">>>>>>>>running test 3230"
./replace_wrapper '@*[^a-c]?- ^a-c]' '&a@%'  < ./inputs/temp-test/2123.inp.900.2 
echo ">>>>>>>>running test 3231"
./replace_wrapper '@*[^a-c]?- ^a-c]' '&a@%'  < ./inputs/temp-test/2124.inp.900.3 
echo ">>>>>>>>running test 3232"
./replace_wrapper '@*^a-]' '@n'  < ./inputs/temp-test/2243.inp.951.1 
echo ">>>>>>>>running test 3233"
./replace_wrapper '@+' 'd;'  < ./inputs/input/ruin.1976 
echo ">>>>>>>>running test 3234"
./replace_wrapper '@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}[^0-9]'\''*' 'j'  < ./inputs/input/ruin.1346 
echo ">>>>>>>>running test 3235"
./replace_wrapper '@-' '-'  < ./inputs/input/ruin.1578 
echo ">>>>>>>>running test 3236"
./replace_wrapper '@-' 'R'  < ./inputs/input/ruin.1456 
echo ">>>>>>>>running test 3237"
./replace_wrapper '@-' 'h'  < ./inputs/input/ruin.161 
echo ">>>>>>>>running test 3238"
./replace_wrapper '@/' 'T@cm!x`moJfN/%|*mK7oWn#ZE%z'  < ./inputs/input/ruin.1491 
echo ">>>>>>>>running test 3239"
./replace_wrapper '@3[^Z-a]^_`a]' '_y'  < ./inputs/input/ruin.1748 
echo ">>>>>>>>running test 3240"
./replace_wrapper '@5' '4Q'  < ./inputs/input/ruin.80 
echo ">>>>>>>>running test 3241"
./replace_wrapper '@5' 'V'  < ./inputs/input/ruin.125 
echo ">>>>>>>>running test 3242"
./replace_wrapper '@6' 'K'  < ./inputs/input/ruin.1323 
echo ">>>>>>>>running test 3243"
./replace_wrapper '@6' 'Y~83>~^O_'  < ./inputs/input/ruin.1747 
echo ">>>>>>>>running test 3244"
./replace_wrapper '@8'\''Z' '2xl#kq'  < ./inputs/input/ruin.1419 
echo ">>>>>>>>running test 3245"
./replace_wrapper '@;$' '+W}](~9#6;Go0J- XybH&<\0E$9'  < ./inputs/input/ruin.8 
echo ">>>>>>>>running test 3246"
./replace_wrapper '@;' 'p8-lf,m\V=UixymxlH&eP|nwsDhhN(Hcv4 CV$Gmbi'  < ./inputs/input/ruin.1087 
echo ">>>>>>>>running test 3247"
./replace_wrapper '@=' '`'  < ./inputs/input/ruin.45 
echo ">>>>>>>>running test 3248"
./replace_wrapper '@=*' ':\>jX/&//[~9HI.'\''XsWI!6Hav8e`?^Ut6D;zZpJ*\KB2X5*AcRB}pcAc2>EMpaM,=Ad>a$t>2J{6`5VDe{DRw:Lg>\U]wKK/6Y<q%A8mn]@'  < ./inputs/input/ruin.1174 
echo ">>>>>>>>running test 3249"
./replace_wrapper '@>' 's'  < ./inputs/input/ruin.489 
echo ">>>>>>>>running test 3250"
./replace_wrapper '@@$' '$GBp}{JWTz=SgS`X@>='  < ./inputs/input/ruin.1905 
echo ">>>>>>>>running test 3251"
./replace_wrapper '@@$' '>v}~0g-swC7?z'  < ./inputs/input/ruin.716 
echo ">>>>>>>>running test 3252"
./replace_wrapper '@@$' 'D'  < ./inputs/input/ruin.1943 
echo ">>>>>>>>running test 3253"
./replace_wrapper '@@$' 'O) !V9ey{hoM\gUNi|0JP@&Jj?5|^C9Se2{-V5'  < ./inputs/input/ruin.562 
echo ">>>>>>>>running test 3254"
./replace_wrapper '@@$' 'PBR#i29%`I}+1Y|@Wa.H@G)Vm<-Y\smAI'  < ./inputs/input/ruin.514 
echo ">>>>>>>>running test 3255"
./replace_wrapper '@@$' 'Wm'  < ./inputs/input/ruin.1684 
echo ">>>>>>>>running test 3256"
./replace_wrapper '@@$' '['  < ./inputs/input/ruin.1282 
echo ">>>>>>>>running test 3257"
./replace_wrapper '@@$' ']Jd2(Pk"IOH.'  < ./inputs/input/ruin.1214 
echo ">>>>>>>>running test 3258"
./replace_wrapper '@@$' '`'  < ./inputs/input/ruin.20 
echo ">>>>>>>>running test 3259"
./replace_wrapper '@@$' 'f'  < ./inputs/input/ruin.436 
echo ">>>>>>>>running test 3260"
./replace_wrapper '@@$' 'pe&:zop_%'  < ./inputs/input/ruin.176 
echo ">>>>>>>>running test 3261"
./replace_wrapper '@@$' 'q'  < ./inputs/input/ruin.573 
echo ">>>>>>>>running test 3262"
./replace_wrapper '@@'   < ./inputs/input/ruin.1155 
echo ">>>>>>>>running test 3263"
./replace_wrapper '@@'   < ./inputs/input/ruin.1267 
echo ">>>>>>>>running test 3264"
./replace_wrapper '@@' ' '  < ./inputs/input/ruin.1636 
echo ">>>>>>>>running test 3265"
./replace_wrapper '@@' ' '  < ./inputs/input/ruin.686 
echo ">>>>>>>>running test 3266"
./replace_wrapper '@@' ' /'  < ./inputs/input/ruin.1716 
echo ">>>>>>>>running test 3267"
./replace_wrapper '@@' ' F]~M\ Wz]`M0)y8H?fc7Phqi}@,5rYP"hqRx 1etW9vEs|~'\'' d~'  < ./inputs/input/ruin.150 
echo ">>>>>>>>running test 3268"
./replace_wrapper '@@' ' Hq8<5u8KNy,8KNy,h0_sbVxG=nOfh0_sbVxG=nO8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOffj@{,j17KHl}%a1`PZ!Ur5'\'''  < ./inputs/input/ruin.1038 
echo ">>>>>>>>running test 3269"
./replace_wrapper '@@' ' Hq8<5u8KNy,h0_sbVxG=nOfj@{,j17KHl}%a1`PZ!Ur5'\'''  < ./inputs/input/ruin.1038 
echo ">>>>>>>>running test 3270"
./replace_wrapper '@@' ' eA[pOJ,7}LP=PljrA&m['  < ./inputs/input/ruin.1694 
echo ">>>>>>>>running test 3271"
./replace_wrapper '@@' ' ql3hT_RR%Lv0q{gNA7dFL!iUJk>g$ ~-0ON!BAyv'  < ./inputs/input/ruin.1806 
echo ">>>>>>>>running test 3272"
./replace_wrapper '@@' ' vCcJyA'\''Kn0%'  < ./inputs/input/ruin.409 
echo ">>>>>>>>running test 3273"
./replace_wrapper '@@' '!'  < ./inputs/input/ruin.793 
echo ">>>>>>>>running test 3274"
./replace_wrapper '@@' '!dX:TvVOl,/?nB/ .p(8CF07J&%csQb,NtUE)AX"4&&=Kk"Fc4'  < ./inputs/input/ruin.196 
echo ">>>>>>>>running test 3275"
./replace_wrapper '@@' '!t1D*'\''"z%6'  < ./inputs/input/ruin.1711 
echo ">>>>>>>>running test 3276"
./replace_wrapper '@@' '"%Xq:5!?SA^^.)RRV1-^^t;_'  < ./inputs/input/ruin.606 
echo ">>>>>>>>running test 3277"
./replace_wrapper '@@' '")sV\0['  < ./inputs/input/ruin.482 
echo ">>>>>>>>running test 3278"
./replace_wrapper '@@' '"3<U{'  < ./inputs/input/ruin.41 
echo ">>>>>>>>running test 3279"
./replace_wrapper '@@' '"sk}D$r4U?mR|,'  < ./inputs/input/ruin.542 
echo ">>>>>>>>running test 3280"
./replace_wrapper '@@' '#'  < ./inputs/input/ruin.1116 
echo ">>>>>>>>running test 3281"
./replace_wrapper '@@' '#'  < ./inputs/input/ruin.1615 
echo ">>>>>>>>running test 3282"
./replace_wrapper '@@' '#'  < ./inputs/input/ruin.577 
echo ">>>>>>>>running test 3283"
./replace_wrapper '@@' '$'  < ./inputs/input/ruin.120 
echo ">>>>>>>>running test 3284"
./replace_wrapper '@@' '$'  < ./inputs/input/ruin.188 
echo ">>>>>>>>running test 3285"
./replace_wrapper '@@' '$'\'''  < ./inputs/input/ruin.390 
echo ">>>>>>>>running test 3286"
./replace_wrapper '@@' '%'  < ./inputs/input/ruin.1413 
echo ">>>>>>>>running test 3287"
./replace_wrapper '@@' '%'  < ./inputs/input/ruin.149 
echo ">>>>>>>>running test 3288"
./replace_wrapper '@@' '& +b2m'  < ./inputs/input/ruin.687 
echo ">>>>>>>>running test 3289"
./replace_wrapper '@@' '&'  < ./inputs/input/ruin.1513 
echo ">>>>>>>>running test 3290"
./replace_wrapper '@@' '&'  < ./inputs/input/ruin.370 
echo ">>>>>>>>running test 3291"
./replace_wrapper '@@' '&'  < ./inputs/input/ruin.846 
echo ">>>>>>>>running test 3292"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.139 
echo ">>>>>>>>running test 3293"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.162 
echo ">>>>>>>>running test 3294"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.164 
echo ">>>>>>>>running test 3295"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.1854 
echo ">>>>>>>>running test 3296"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.1900 
echo ">>>>>>>>running test 3297"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.1916 
echo ">>>>>>>>running test 3298"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.438 
echo ">>>>>>>>running test 3299"
./replace_wrapper '@@' ''  < ./inputs/input/ruin.464 
echo ">>>>>>>>running test 3300"
./replace_wrapper '@@' ''\''5.dxDo+'  < ./inputs/input/ruin.1515 
echo ">>>>>>>>running test 3301"
./replace_wrapper '@@' ''\''8>j9I}4)QUOhBL" 5dZjR4'  < ./inputs/input/ruin.1585 
echo ">>>>>>>>running test 3302"
./replace_wrapper '@@' ''\''rtrI}1h*1@x316=8F1Wi(\8ug'  < ./inputs/input/ruin.875 
echo ">>>>>>>>running test 3303"
./replace_wrapper '@@' '('  < ./inputs/input/ruin.1048 
echo ">>>>>>>>running test 3304"
./replace_wrapper '@@' '('  < ./inputs/input/ruin.1560 
echo ">>>>>>>>running test 3305"
./replace_wrapper '@@' '('  < ./inputs/input/ruin.676 
echo ">>>>>>>>running test 3306"
./replace_wrapper '@@' '(o?j~tj7Bh6Rwj`\Vz+SK5cd"fP'  < ./inputs/input/ruin.1892 
echo ">>>>>>>>running test 3307"
./replace_wrapper '@@' ')'  < ./inputs/input/ruin.1547 
echo ">>>>>>>>running test 3308"
./replace_wrapper '@@' ')R6,%8x[%~*u|X\vt&wTaRd|20Ev'\''P'  < ./inputs/input/ruin.33 
echo ">>>>>>>>running test 3309"
./replace_wrapper '@@' '*'  < ./inputs/input/ruin.1525 
echo ">>>>>>>>running test 3310"
./replace_wrapper '@@' '*osp7hY,{a9W&a^b_80b]=AP]j+Sj />k""Ur|HMFY{=7/cW7!37`X'  < ./inputs/input/ruin.599 
echo ">>>>>>>>running test 3311"
./replace_wrapper '@@' '*pv%'  < ./inputs/input/ruin.634 
echo ">>>>>>>>running test 3312"
./replace_wrapper '@@' '*q61|R0fcYH+ZzxA_ '  < ./inputs/input/ruin.797 
echo ">>>>>>>>running test 3313"
./replace_wrapper '@@' '*w`tU@YLlA}c4u,btKqp(!'\''u)e%pb~'  < ./inputs/input/ruin.312 
echo ">>>>>>>>running test 3314"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 3315"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.1665 
echo ">>>>>>>>running test 3316"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.180 
echo ">>>>>>>>running test 3317"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.2000 
echo ">>>>>>>>running test 3318"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.708 
echo ">>>>>>>>running test 3319"
./replace_wrapper '@@' '+'  < ./inputs/input/ruin.933 
echo ">>>>>>>>running test 3320"
./replace_wrapper '@@' '+'\''gpw--(=s T&WJK!a)Ca94'  < ./inputs/input/ruin.832 
echo ">>>>>>>>running test 3321"
./replace_wrapper '@@' '+B1j@-aUKh^'  < ./inputs/input/ruin.1102 
echo ">>>>>>>>running test 3322"
./replace_wrapper '@@' '+C=@tD|x.1Gwcu'  < ./inputs/input/ruin.360 
echo ">>>>>>>>running test 3323"
./replace_wrapper '@@' '+L$0nAwTE,?8>=\.)j_?W<"`s<9N LC(tnc|!$gDsG9!<da2D_e#5ehh]mDd_vE9pSi7V!ie^EqeMzAQ[F;'  < ./inputs/input/ruin.1067 
echo ">>>>>>>>running test 3324"
./replace_wrapper '@@' '+[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@[a-c@t*[a-c]^*[^0-9]-[a-c]^*[^0-9]@'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 3325"
./replace_wrapper '@@' '+_he-e]Z\99 4c7!{)aQf:\!'  < ./inputs/input/ruin.1008 
echo ">>>>>>>>running test 3326"
./replace_wrapper '@@' '+tY&c/wyzfFpv'  < ./inputs/input/ruin.343 
echo ">>>>>>>>running test 3327"
./replace_wrapper '@@' ','  < ./inputs/input/ruin.1574 
echo ">>>>>>>>running test 3328"
./replace_wrapper '@@' ',o-'\'' G$8%4u=+op(<['  < ./inputs/input/ruin.238 
echo ">>>>>>>>running test 3329"
./replace_wrapper '@@' '-'  < ./inputs/input/ruin.1101 
echo ">>>>>>>>running test 3330"
./replace_wrapper '@@' '-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-[]aA-GZ-a]*^_('  < ./inputs/input/ruin.1048 
echo ">>>>>>>>running test 3331"
./replace_wrapper '@@' '-}$NG|)ta623`tp&UwIx;Nak[]yQ!LHIP4;%Br1]=J\|%RpVqN*U=98`5'  < ./inputs/input/ruin.1924 
echo ">>>>>>>>running test 3332"
./replace_wrapper '@@' '.'  < ./inputs/input/ruin.631 
echo ">>>>>>>>running test 3333"
./replace_wrapper '@@' '/&!616<!d/}yp"oTD6&j9\Pw8nT\Jsnh[\i>s9/vn.+'\''t'  < ./inputs/input/ruin.11 
echo ">>>>>>>>running test 3334"
./replace_wrapper '@@' '/'  < ./inputs/input/ruin.1022 
echo ">>>>>>>>running test 3335"
./replace_wrapper '@@' '/'  < ./inputs/input/ruin.129 
echo ">>>>>>>>running test 3336"
./replace_wrapper '@@' '/'  < ./inputs/input/ruin.1848 
echo ">>>>>>>>running test 3337"
./replace_wrapper '@@' '/'  < ./inputs/input/ruin.495 
echo ">>>>>>>>running test 3338"
./replace_wrapper '@@' '/6sEWY)qxH!HD%1KqvrFR2$HF_f>{4ZN]'  < ./inputs/input/ruin.121 
echo ">>>>>>>>running test 3339"
./replace_wrapper '@@' '0'  < ./inputs/input/ruin.896 
echo ">>>>>>>>running test 3340"
./replace_wrapper '@@' '07mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpe'  < ./inputs/input/ruin.1061 
echo ">>>>>>>>running test 3341"
./replace_wrapper '@@' '0e'  < ./inputs/input/ruin.1061 
echo ">>>>>>>>running test 3342"
./replace_wrapper '@@' '1"%JX$^ku2<sUsCU+vj&[ q?Nv.wFgwq9!'  < ./inputs/input/ruin.1496 
echo ">>>>>>>>running test 3343"
./replace_wrapper '@@' '1('  < ./inputs/input/ruin.1009 
echo ">>>>>>>>running test 3344"
./replace_wrapper '@@' '1;b*?wOue:=LeChp|Xl[5oGNummHY5C>'  < ./inputs/input/ruin.678 
echo ">>>>>>>>running test 3345"
./replace_wrapper '@@' '1WL1U;05H?Td|ovtm:_+>u63FAZ^pz3d=9iQnoS[&T_T=T5:Ii'  < ./inputs/input/ruin.1921 
echo ">>>>>>>>running test 3346"
./replace_wrapper '@@' '2'  < ./inputs/input/ruin.1209 
echo ">>>>>>>>running test 3347"
./replace_wrapper '@@' '2'  < ./inputs/input/ruin.148 
echo ">>>>>>>>running test 3348"
./replace_wrapper '@@' '2'  < ./inputs/input/ruin.1650 
echo ">>>>>>>>running test 3349"
./replace_wrapper '@@' '2'  < ./inputs/input/ruin.764 
echo ">>>>>>>>running test 3350"
./replace_wrapper '@@' '2'  < ./inputs/input/ruin.773 
echo ">>>>>>>>running test 3351"
./replace_wrapper '@@' '3'  < ./inputs/input/ruin.587 
echo ">>>>>>>>running test 3352"
./replace_wrapper '@@' '3BLytQ69ILh[Q=v@'  < ./inputs/input/ruin.608 
echo ">>>>>>>>running test 3353"
./replace_wrapper '@@' '4'  < ./inputs/input/ruin.1992 
echo ">>>>>>>>running test 3354"
./replace_wrapper '@@' '4'  < ./inputs/input/ruin.64 
echo ">>>>>>>>running test 3355"
./replace_wrapper '@@' '4V_O%];L'  < ./inputs/input/ruin.523 
echo ">>>>>>>>running test 3356"
./replace_wrapper '@@' '5'  < ./inputs/input/ruin.1068 
echo ">>>>>>>>running test 3357"
./replace_wrapper '@@' '5'  < ./inputs/input/ruin.1712 
echo ">>>>>>>>running test 3358"
./replace_wrapper '@@' '5=}m(n~eqHssWTa{"Y?>ZsqxtOGQnjdh_gEY}xsZzV0jtKXn_&qG2I:~w2OXxrgMB>l8d^$ E-|'  < ./inputs/input/ruin.1981 
echo ">>>>>>>>running test 3359"
./replace_wrapper '@@' '6'  < ./inputs/input/ruin.1523 
echo ">>>>>>>>running test 3360"
./replace_wrapper '@@' '6'  < ./inputs/input/ruin.1891 
echo ">>>>>>>>running test 3361"
./replace_wrapper '@@' '6'  < ./inputs/input/ruin.1922 
echo ">>>>>>>>running test 3362"
./replace_wrapper '@@' '7'  < ./inputs/input/ruin.1303 
echo ">>>>>>>>running test 3363"
./replace_wrapper '@@' '7'  < ./inputs/input/ruin.1846 
echo ">>>>>>>>running test 3364"
./replace_wrapper '@@' '78ewmsa'\''3F~3]X`TmS?XC2'\'''  < ./inputs/input/ruin.85 
echo ">>>>>>>>running test 3365"
./replace_wrapper '@@' '7Pv(oq)0t^dvrHkh,e|)8!AK(<=AjeG3l^_'  < ./inputs/input/ruin.893 
echo ">>>>>>>>running test 3366"
./replace_wrapper '@@' '7p'  < ./inputs/input/ruin.53 
echo ">>>>>>>>running test 3367"
./replace_wrapper '@@' '7{%&v{Y:ay!~;a)T8SiF6*,5Z=Kud\M{E+8CT9GxONmm'  < ./inputs/input/ruin.1667 
echo ">>>>>>>>running test 3368"
./replace_wrapper '@@' '7{ek8P_#i5~XKh[kyMY[AhDzY/R2'  < ./inputs/input/ruin.1394 
echo ">>>>>>>>running test 3369"
./replace_wrapper '@@' '8'  < ./inputs/input/ruin.1695 
echo ">>>>>>>>running test 3370"
./replace_wrapper '@@' '8'  < ./inputs/input/ruin.1901 
echo ">>>>>>>>running test 3371"
./replace_wrapper '@@' '8Kn0{lOL:63C(`zF>U{e=G$53y'  < ./inputs/input/ruin.851 
echo ">>>>>>>>running test 3372"
./replace_wrapper '@@' '9'  < ./inputs/input/ruin.1542 
echo ">>>>>>>>running test 3373"
./replace_wrapper '@@' '9'  < ./inputs/input/ruin.186 
echo ">>>>>>>>running test 3374"
./replace_wrapper '@@' '9E{rn2?m(T@]A=ZX+qguf}Om/HMp3,'  < ./inputs/input/ruin.1959 
echo ">>>>>>>>running test 3375"
./replace_wrapper '@@' '9fzx91%af \'\''jgI$V|BL(X sN@?F8AXgoas/%p'  < ./inputs/input/ruin.1543 
echo ">>>>>>>>running test 3376"
./replace_wrapper '@@' ':'  < ./inputs/input/ruin.1049 
echo ">>>>>>>>running test 3377"
./replace_wrapper '@@' ':'  < ./inputs/input/ruin.1917 
echo ">>>>>>>>running test 3378"
./replace_wrapper '@@' ':'  < ./inputs/input/ruin.430 
echo ">>>>>>>>running test 3379"
./replace_wrapper '@@' ':-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ*-a]^_-aA-GZ-a]^_-aA-GZ-a]^_'  < ./inputs/input/ruin.1049 
echo ">>>>>>>>running test 3380"
./replace_wrapper '@@' ':AXq~ z+rj0BX0dT}k58H6_%'  < ./inputs/input/ruin.1438 
echo ">>>>>>>>running test 3381"
./replace_wrapper '@@' ';'  < ./inputs/input/ruin.1155 
echo ">>>>>>>>running test 3382"
./replace_wrapper '@@' ';'  < ./inputs/input/ruin.177 
echo ">>>>>>>>running test 3383"
./replace_wrapper '@@' ';'  < ./inputs/input/ruin.427 
echo ">>>>>>>>running test 3384"
./replace_wrapper '@@' ';.St7,*,FY'\''e2 #PQt_JAdEVyBorNLKtG4,nKOUCw{Tr/J2d]Omr-PWjk+'  < ./inputs/input/ruin.98 
echo ">>>>>>>>running test 3385"
./replace_wrapper '@@' ';cnGb$sku_0Cwd6'  < ./inputs/input/ruin.341 
echo ">>>>>>>>running test 3386"
./replace_wrapper '@@' ';pJ<?F=Dxa?\754QF'  < ./inputs/input/ruin.1756 
echo ">>>>>>>>running test 3387"
./replace_wrapper '@@' '<'  < ./inputs/input/ruin.1005 
echo ">>>>>>>>running test 3388"
./replace_wrapper '@@' '<'  < ./inputs/input/ruin.1316 
echo ">>>>>>>>running test 3389"
./replace_wrapper '@@' '<'  < ./inputs/input/ruin.1461 
echo ">>>>>>>>running test 3390"
./replace_wrapper '@@' '<'  < ./inputs/input/ruin.1545 
echo ">>>>>>>>running test 3391"
./replace_wrapper '@@' '<'  < ./inputs/input/ruin.239 
echo ">>>>>>>>running test 3392"
./replace_wrapper '@@' '<<s'\''ykL-eK+T'  < ./inputs/input/ruin.1771 
echo ">>>>>>>>running test 3393"
./replace_wrapper '@@' '<T'  < ./inputs/input/ruin.1455 
echo ">>>>>>>>running test 3394"
./replace_wrapper '@@' '<aeDJVcc:%wK*e9vLi71Y'  < ./inputs/input/ruin.1781 
echo ">>>>>>>>running test 3395"
./replace_wrapper '@@' '<c!'  < ./inputs/input/ruin.1179 
echo ">>>>>>>>running test 3396"
./replace_wrapper '@@' '<kl(cA m(Y`(5*I,G:CY+*n+)%En[Gl<:18Y9j$*V`$NJ}$;'  < ./inputs/input/ruin.1149 
echo ">>>>>>>>running test 3397"
./replace_wrapper '@@' '<u2<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs]r/0cjs'\''`'  < ./inputs/input/ruin.1047 
echo ">>>>>>>>running test 3398"
./replace_wrapper '@@' '<u2]r/0cjs'\''`'  < ./inputs/input/ruin.1047 
echo ">>>>>>>>running test 3399"
./replace_wrapper '@@' '='  < ./inputs/input/ruin.1882 
echo ">>>>>>>>running test 3400"
./replace_wrapper '@@' '='  < ./inputs/input/ruin.252 
echo ">>>>>>>>running test 3401"
./replace_wrapper '@@' '='  < ./inputs/input/ruin.664 
echo ">>>>>>>>running test 3402"
./replace_wrapper '@@' '=0b?deU>R%+|'  < ./inputs/input/ruin.192 
echo ">>>>>>>>running test 3403"
./replace_wrapper '@@' '>'  < ./inputs/input/ruin.1304 
echo ">>>>>>>>running test 3404"
./replace_wrapper '@@' '>TdQN{'  < ./inputs/input/ruin.362 
echo ">>>>>>>>running test 3405"
./replace_wrapper '@@' '>f'  < ./inputs/input/ruin.892 
echo ">>>>>>>>running test 3406"
./replace_wrapper '@@' '?'  < ./inputs/input/ruin.1127 
echo ">>>>>>>>running test 3407"
./replace_wrapper '@@' '?'  < ./inputs/input/ruin.649 
echo ">>>>>>>>running test 3408"
./replace_wrapper '@@' '?+'  < ./inputs/input/ruin.1397 
echo ">>>>>>>>running test 3409"
./replace_wrapper '@@' '@%5i%WdPe=U{3rY>R'\''EL$Mdy:Qrxi_{?'  < ./inputs/input/ruin.1739 
echo ">>>>>>>>running test 3410"
./replace_wrapper '@@' '@'  < ./inputs/input/ruin.175 
echo ">>>>>>>>running test 3411"
./replace_wrapper '@@' '@?JRm_9'  < ./inputs/input/ruin.550 
echo ">>>>>>>>running test 3412"
./replace_wrapper '@@' '@`CUC~C,?o:8E|f?3unMs?t#2b'  < ./inputs/input/ruin.870 
echo ">>>>>>>>running test 3413"
./replace_wrapper '@@' 'A$coJ-5Zw<>TQ[kxxEuNHcPly\'  < ./inputs/input/ruin.1858 
echo ">>>>>>>>running test 3414"
./replace_wrapper '@@' 'Azy);2Sc&A?(cD~7xuuFC`L7'  < ./inputs/input/ruin.1139 
echo ">>>>>>>>running test 3415"
./replace_wrapper '@@' 'B'  < ./inputs/input/ruin.1368 
echo ">>>>>>>>running test 3416"
./replace_wrapper '@@' 'B'  < ./inputs/input/ruin.1439 
echo ">>>>>>>>running test 3417"
./replace_wrapper '@@' 'B<'  < ./inputs/input/ruin.1363 
echo ">>>>>>>>running test 3418"
./replace_wrapper '@@' 'BBWIUEb}'  < ./inputs/input/ruin.1655 
echo ">>>>>>>>running test 3419"
./replace_wrapper '@@' 'Bn[E#7FzkrT]aFS#Q+f 10GtF?_'  < ./inputs/input/ruin.97 
echo ">>>>>>>>running test 3420"
./replace_wrapper '@@' 'B|n]$]<1fqRl]Hg!'  < ./inputs/input/ruin.915 
echo ">>>>>>>>running test 3421"
./replace_wrapper '@@' 'C7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mps2S11T]8KHwx~kv1uQJ*#%bdM,!Lt5'  < ./inputs/input/ruin.1062 
echo ">>>>>>>>running test 3422"
./replace_wrapper '@@' 'C^S+RY)_\a|PHKS5n~SFU?b'  < ./inputs/input/ruin.1714 
echo ">>>>>>>>running test 3423"
./replace_wrapper '@@' 'Cq_c#\FHg\Kr?>3*!m/A*_3}{7j1U3TsP)_smq|%~P-OCQ9`6-MO<k4"SN'\''n80N4Y> q^ZY{W5_7'  < ./inputs/input/ruin.1435 
echo ">>>>>>>>running test 3424"
./replace_wrapper '@@' 'Cs2S11T]8KHwx~kv1uQJ*#%bdM,!Lt5'  < ./inputs/input/ruin.1062 
echo ">>>>>>>>running test 3425"
./replace_wrapper '@@' 'D'  < ./inputs/input/ruin.1690 
echo ">>>>>>>>running test 3426"
./replace_wrapper '@@' 'D'  < ./inputs/input/ruin.246 
echo ">>>>>>>>running test 3427"
./replace_wrapper '@@' 'DXrcj(\#39@'  < ./inputs/input/ruin.215 
echo ">>>>>>>>running test 3428"
./replace_wrapper '@@' 'E!*gXlM6RC\lG'  < ./inputs/input/ruin.34 
echo ">>>>>>>>running test 3429"
./replace_wrapper '@@' 'E9p\6X[t<jnR3{*3PQSno!);('  < ./inputs/input/ruin.1256 
echo ">>>>>>>>running test 3430"
./replace_wrapper '@@' 'ELw~`C@PQ)'  < ./inputs/input/ruin.1722 
echo ">>>>>>>>running test 3431"
./replace_wrapper '@@' 'EjK?X#{Ur>oN|wXPT$BQRg:T$~BH;PLmx ?08~{Ig0Ze7`.|(kzu3o_s/"5"5\k1ylh)q;!<1>w$C1qd'  < ./inputs/input/ruin.265 
echo ">>>>>>>>running test 3432"
./replace_wrapper '@@' 'Etz|'  < ./inputs/input/ruin.667 
echo ">>>>>>>>running test 3433"
./replace_wrapper '@@' 'F'  < ./inputs/input/ruin.802 
echo ">>>>>>>>running test 3434"
./replace_wrapper '@@' 'G'  < ./inputs/input/ruin.397 
echo ">>>>>>>>running test 3435"
./replace_wrapper '@@' 'G_'  < ./inputs/input/ruin.1779 
echo ">>>>>>>>running test 3436"
./replace_wrapper '@@' 'G`$$:VB%$M[$ErHos~U]`5+'  < ./inputs/input/ruin.379 
echo ">>>>>>>>running test 3437"
./replace_wrapper '@@' 'H&'  < ./inputs/input/ruin.1074 
echo ">>>>>>>>running test 3438"
./replace_wrapper '@@' 'H4uOP@dgu<-LyyKn+[L@'  < ./inputs/input/ruin.682 
echo ">>>>>>>>running test 3439"
./replace_wrapper '@@' 'HI;TdGuR1D8'  < ./inputs/input/ruin.1935 
echo ">>>>>>>>running test 3440"
./replace_wrapper '@@' 'HP;~lm[ DxA!90Db}UH/ZEruRC'  < ./inputs/input/ruin.1487 
echo ">>>>>>>>running test 3441"
./replace_wrapper '@@' 'Hb'  < ./inputs/input/ruin.273 
echo ">>>>>>>>running test 3442"
./replace_wrapper '@@' 'I'  < ./inputs/input/ruin.1306 
echo ">>>>>>>>running test 3443"
./replace_wrapper '@@' 'I\/As)Z}7*%*i>17(z_L'  < ./inputs/input/ruin.559 
echo ">>>>>>>>running test 3444"
./replace_wrapper '@@' 'In9JjnCwGVggl=k&wnK}7ke)zG>.>[Bvgi;4W'  < ./inputs/input/ruin.249 
echo ">>>>>>>>running test 3445"
./replace_wrapper '@@' 'J'  < ./inputs/input/ruin.117 
echo ">>>>>>>>running test 3446"
./replace_wrapper '@@' 'K7+%7`\*l.EL,'  < ./inputs/input/ruin.1657 
echo ">>>>>>>>running test 3447"
./replace_wrapper '@@' 'KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@e'  < ./inputs/input/ruin.1036 
echo ">>>>>>>>running test 3448"
./replace_wrapper '@@' 'L$0Ky;c.R1F>Tw"W:^'  < ./inputs/input/ruin.225 
echo ">>>>>>>>running test 3449"
./replace_wrapper '@@' 'L'  < ./inputs/input/ruin.1203 
echo ">>>>>>>>running test 3450"
./replace_wrapper '@@' 'L'  < ./inputs/input/ruin.689 
echo ">>>>>>>>running test 3451"
./replace_wrapper '@@' 'L'  < ./inputs/input/ruin.720 
echo ">>>>>>>>running test 3452"
./replace_wrapper '@@' 'LFmqS#J=6aq\=6iN(T_?#?RzO y5ZA2'\''zX%~4b!nf$}Nmg'\'''  < ./inputs/input/ruin.207 
echo ">>>>>>>>running test 3453"
./replace_wrapper '@@' 'LTkhRoY X0O>]PcG'  < ./inputs/input/ruin.950 
echo ">>>>>>>>running test 3454"
./replace_wrapper '@@' 'Lt2GEbuGo,qE01mO6yS"\V'  < ./inputs/input/ruin.1700 
echo ">>>>>>>>running test 3455"
./replace_wrapper '@@' 'N!'  < ./inputs/input/ruin.546 
echo ">>>>>>>>running test 3456"
./replace_wrapper '@@' 'N'  < ./inputs/input/ruin.137 
echo ">>>>>>>>running test 3457"
./replace_wrapper '@@' 'N'  < ./inputs/input/ruin.737 
echo ">>>>>>>>running test 3458"
./replace_wrapper '@@' 'NGN4ij?opj(>9`>.1rUs0vJ{7?'  < ./inputs/input/ruin.1575 
echo ">>>>>>>>running test 3459"
./replace_wrapper '@@' 'NGyC?;*O3Y+25aQIdV'  < ./inputs/input/ruin.909 
echo ">>>>>>>>running test 3460"
./replace_wrapper '@@' 'NaZ'  < ./inputs/input/ruin.1588 
echo ">>>>>>>>running test 3461"
./replace_wrapper '@@' 'O8(CoPrxFq+.ZM|WW+0YtwT[\iP85^ ('  < ./inputs/input/ruin.975 
echo ">>>>>>>>running test 3462"
./replace_wrapper '@@' 'OE<W=ZndLYQd%p}lN|>'  < ./inputs/input/ruin.1796 
echo ">>>>>>>>running test 3463"
./replace_wrapper '@@' 'Of?,N@rdX*]]Px\#0)K[1C'  < ./inputs/input/ruin.1793 
echo ">>>>>>>>running test 3464"
./replace_wrapper '@@' 'P"zPgA08HQ_'\''1"'\''3_WC+.cmt3Rh^:'  < ./inputs/input/ruin.1408 
echo ">>>>>>>>running test 3465"
./replace_wrapper '@@' 'P'  < ./inputs/input/ruin.1745 
echo ">>>>>>>>running test 3466"
./replace_wrapper '@@' 'P:g"14" j0^]'\'':DK70 \o4AP}[z~>lxPCCM9m*\BwO%d!'  < ./inputs/input/ruin.1559 
echo ">>>>>>>>running test 3467"
./replace_wrapper '@@' 'P`G\'  < ./inputs/input/ruin.917 
echo ">>>>>>>>running test 3468"
./replace_wrapper '@@' 'Po[uSP.I_y!>nh:I7T"u$=>:mwq+5Q-(%'  < ./inputs/input/ruin.958 
echo ">>>>>>>>running test 3469"
./replace_wrapper '@@' 'Q0GMm0#K!hHA~y! iDG`*sh0I@'  < ./inputs/input/ruin.547 
echo ">>>>>>>>running test 3470"
./replace_wrapper '@@' 'QZ}nu?<N_m}]**y62k2AXk9'  < ./inputs/input/ruin.1286 
echo ">>>>>>>>running test 3471"
./replace_wrapper '@@' 'R-Q;*rnq'  < ./inputs/input/ruin.805 
echo ">>>>>>>>running test 3472"
./replace_wrapper '@@' 'Rz!7iD,x8DBW^[[bVr+@ZMKp+m"4.Rh?;:t>.={ZY~m'  < ./inputs/input/ruin.331 
echo ">>>>>>>>running test 3473"
./replace_wrapper '@@' 'S1G=SPJxh*Gd}R$vSwz{HEo.N'  < ./inputs/input/ruin.1190 
echo ">>>>>>>>running test 3474"
./replace_wrapper '@@' 'Sqn}f'  < ./inputs/input/ruin.1947 
echo ">>>>>>>>running test 3475"
./replace_wrapper '@@' 'T'  < ./inputs/input/ruin.1330 
echo ">>>>>>>>running test 3476"
./replace_wrapper '@@' 'T?^S|}'\''!\>bF'\''5T'  < ./inputs/input/ruin.1250 
echo ">>>>>>>>running test 3477"
./replace_wrapper '@@' 'TLE8-~GaWCbc;@/F@l`'  < ./inputs/input/ruin.1896 
echo ">>>>>>>>running test 3478"
./replace_wrapper '@@' 'TQ$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLQ$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Wk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?Q$$7 E(2%8Q"fiw^tLWk2\)>Wg( 6h8z$?[*[0-9]*@0-9](*'  < ./inputs/input/ruin.1330 
echo ">>>>>>>>running test 3479"
./replace_wrapper '@@' 'TbjIYx|Qb}}TKt5QS<'  < ./inputs/input/ruin.1187 
echo ">>>>>>>>running test 3480"
./replace_wrapper '@@' 'U'  < ./inputs/input/ruin.1742 
echo ">>>>>>>>running test 3481"
./replace_wrapper '@@' 'U'  < ./inputs/input/ruin.652 
echo ">>>>>>>>running test 3482"
./replace_wrapper '@@' 'UYO1pYxIn73gID*+`{/f6 /NAhY;g+G#-QVuqKSuP2}FO!q'  < ./inputs/input/ruin.669 
echo ">>>>>>>>running test 3483"
./replace_wrapper '@@' 'V'  < ./inputs/input/ruin.778 
echo ">>>>>>>>running test 3484"
./replace_wrapper '@@' 'V8X['  < ./inputs/input/ruin.721 
echo ">>>>>>>>running test 3485"
./replace_wrapper '@@' 'V\-oNf0a>?5'  < ./inputs/input/ruin.1291 
echo ">>>>>>>>running test 3486"
./replace_wrapper '@@' 'W'  < ./inputs/input/ruin.1384 
echo ">>>>>>>>running test 3487"
./replace_wrapper '@@' 'W'  < ./inputs/input/ruin.925 
echo ">>>>>>>>running test 3488"
./replace_wrapper '@@' 'W*B'\''=WR-U}+3n UE1`uj#w3nOzt,'  < ./inputs/input/ruin.941 
echo ">>>>>>>>running test 3489"
./replace_wrapper '@@' 'WJfW@~bR70@TPOC>W^rlP4YMsOx}sZH)<N"whTH\!JP'  < ./inputs/input/ruin.1681 
echo ">>>>>>>>running test 3490"
./replace_wrapper '@@' 'X5,D~^}Uezv[(n?i4@udSpRjK)2)hOy!D9DM{ROIR>6:p.9k`w@|'  < ./inputs/input/ruin.1549 
echo ">>>>>>>>running test 3491"
./replace_wrapper '@@' 'Xz'  < ./inputs/input/ruin.1863 
echo ">>>>>>>>running test 3492"
./replace_wrapper '@@' 'Y'  < ./inputs/input/ruin.1211 
echo ">>>>>>>>running test 3493"
./replace_wrapper '@@' 'YCoe'  < ./inputs/input/ruin.1246 
echo ">>>>>>>>running test 3494"
./replace_wrapper '@@' 'YRBzjkTk&^o]x&mr;k'  < ./inputs/input/ruin.126 
echo ">>>>>>>>running test 3495"
./replace_wrapper '@@' 'Y~3WQ^TDf.W]8c@LJ`*H2xp]e8-106jkG3TMg+;,1I;3-'  < ./inputs/input/ruin.1583 
echo ">>>>>>>>running test 3496"
./replace_wrapper '@@' 'Z'  < ./inputs/input/ruin.732 
echo ">>>>>>>>running test 3497"
./replace_wrapper '@@' '['\''o[}k")5^ZB0Q`x/^Di>;o%m2R@$B'  < ./inputs/input/ruin.37 
echo ">>>>>>>>running test 3498"
./replace_wrapper '@@' '[5K_$J[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!Ur[8o>B'\''+shEe>eT4x )#X}](v'\''=1Gx2W&!UrsD[0-9]*[a-b]'  < ./inputs/input/ruin.1329 
echo ">>>>>>>>running test 3499"
./replace_wrapper '@@' '[5K_$JsD'  < ./inputs/input/ruin.1329 
echo ">>>>>>>>running test 3500"
./replace_wrapper '@@' '[jJ3"kdXY?.O _q-kqD7^;wzC{m@'  < ./inputs/input/ruin.352 
echo ">>>>>>>>running test 3501"
./replace_wrapper '@@' '\"8rH'  < ./inputs/input/ruin.483 
echo ">>>>>>>>running test 3502"
./replace_wrapper '@@' '\Qch=P"+VUY>@V35oj['  < ./inputs/input/ruin.1447 
echo ">>>>>>>>running test 3503"
./replace_wrapper '@@' '\xc'  < ./inputs/input/ruin.86 
echo ">>>>>>>>running test 3504"
./replace_wrapper '@@' ']'  < ./inputs/input/ruin.1597 
echo ">>>>>>>>running test 3505"
./replace_wrapper '@@' ']A;Z'  < ./inputs/input/ruin.916 
echo ">>>>>>>>running test 3506"
./replace_wrapper '@@' '^'  < ./inputs/input/ruin.1150 
echo ">>>>>>>>running test 3507"
./replace_wrapper '@@' '^'  < ./inputs/input/ruin.1710 
echo ">>>>>>>>running test 3508"
./replace_wrapper '@@' '_'  < ./inputs/input/ruin.442 
echo ">>>>>>>>running test 3509"
./replace_wrapper '@@' '_'  < ./inputs/input/ruin.964 
echo ">>>>>>>>running test 3510"
./replace_wrapper '@@' '_)yu\4xy*BO>-TK${EHB'  < ./inputs/input/ruin.728 
echo ">>>>>>>>running test 3511"
./replace_wrapper '@@' '_AtlH$9q>kcWc*%x:UL}T5bDIP~oV&p,uD-r'\''RKFZ~<nkYi}'  < ./inputs/input/ruin.621 
echo ">>>>>>>>running test 3512"
./replace_wrapper '@@' '_Y}LC6.Z_G:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JGbw.3gyV:Q0er!>'  < ./inputs/input/ruin.1041 
echo ">>>>>>>>running test 3513"
./replace_wrapper '@@' '_Y}LC6.Z_Gbw.3gyV:Q0er!>'  < ./inputs/input/ruin.1041 
echo ">>>>>>>>running test 3514"
./replace_wrapper '@@' '__v[0r+_odTj'\''e>-[`,Qc9/rT'  < ./inputs/input/ruin.989 
echo ">>>>>>>>running test 3515"
./replace_wrapper '@@' '`'  < ./inputs/input/ruin.1213 
echo ">>>>>>>>running test 3516"
./replace_wrapper '@@' '`'  < ./inputs/input/ruin.1963 
echo ">>>>>>>>running test 3517"
./replace_wrapper '@@' '`'  < ./inputs/input/ruin.850 
echo ">>>>>>>>running test 3518"
./replace_wrapper '@@' '`'  < ./inputs/input/ruin.992 
echo ">>>>>>>>running test 3519"
./replace_wrapper '@@' 'a'  < ./inputs/input/ruin.1215 
echo ">>>>>>>>running test 3520"
./replace_wrapper '@@' 'a'  < ./inputs/input/ruin.1259 
echo ">>>>>>>>running test 3521"
./replace_wrapper '@@' 'a'  < ./inputs/input/ruin.84 
echo ">>>>>>>>running test 3522"
./replace_wrapper '@@' 'a0v,-tcE^\x'  < ./inputs/input/ruin.1761 
echo ">>>>>>>>running test 3523"
./replace_wrapper '@@' 'b'  < ./inputs/input/ruin.1078 
echo ">>>>>>>>running test 3524"
./replace_wrapper '@@' 'c'  < ./inputs/input/ruin.235 
echo ">>>>>>>>running test 3525"
./replace_wrapper '@@' 'c^C0V'  < ./inputs/input/ruin.771 
echo ">>>>>>>>running test 3526"
./replace_wrapper '@@' 'dR1!L@k(&/ZgsZs,*d\'  < ./inputs/input/ruin.367 
echo ">>>>>>>>running test 3527"
./replace_wrapper '@@' 'e!gTC@po-K"lq@{;#4Pt:in1 p.!+` ]dLa5'  < ./inputs/input/ruin.297 
echo ">>>>>>>>running test 3528"
./replace_wrapper '@@' 'e'  < ./inputs/input/ruin.1036 
echo ">>>>>>>>running test 3529"
./replace_wrapper '@@' 'e'  < ./inputs/input/ruin.323 
echo ">>>>>>>>running test 3530"
./replace_wrapper '@@' 'e;o1qYfx@'  < ./inputs/input/ruin.661 
echo ">>>>>>>>running test 3531"
./replace_wrapper '@@' 'eT@aR6@4AoERO"scF)a"dqsE)GaEU$d~$U<<zIU>P>V,&'  < ./inputs/input/ruin.1183 
echo ">>>>>>>>running test 3532"
./replace_wrapper '@@' 'e^O;EJ5?6DU!Sw"B%ah'\''m*lY_`a'  < ./inputs/input/ruin.1598 
echo ">>>>>>>>running test 3533"
./replace_wrapper '@@' 'ej5i-U/6Q5@m>TzI{D/Y`Z#2'  < ./inputs/input/ruin.52 
echo ">>>>>>>>running test 3534"
./replace_wrapper '@@' 'f'  < ./inputs/input/ruin.1000 
echo ">>>>>>>>running test 3535"
./replace_wrapper '@@' 'f'  < ./inputs/input/ruin.789 
echo ">>>>>>>>running test 3536"
./replace_wrapper '@@' 'f+PSsiDSRQ/*(D(Bq:LX?JXpsZ A1JT]-^Y!wA%ms'  < ./inputs/input/ruin.848 
echo ">>>>>>>>running test 3537"
./replace_wrapper '@@' 'f?P&IzJ":,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8CcZ'  < ./inputs/input/ruin.82 
echo ">>>>>>>>running test 3538"
./replace_wrapper '@@' 'f?P&IzJ":,V00zS8|LFd{fgr(z@L5ZE{\?7<iFeAt8CcZ'  < ./inputs/input/ruin.82 
echo ">>>>>>>>running test 3539"
./replace_wrapper '@@' 'fO$hc9Vunm^fRBx+3N{{!urM]pAS@xFpr'\'''\''Bs7{E6dX`JP-d'  < ./inputs/input/ruin.1147 
echo ">>>>>>>>running test 3540"
./replace_wrapper '@@' 'fQ`{IB:H3a=WSdme}w6|h!vb$*%!K;Y* R-b3=Mi1glBYW>x]t<h'  < ./inputs/input/ruin.1792 
echo ">>>>>>>>running test 3541"
./replace_wrapper '@@' 'g'  < ./inputs/input/ruin.1773 
echo ">>>>>>>>running test 3542"
./replace_wrapper '@@' 'g9`YM,ozyUxQqpQAHH/sK++]'  < ./inputs/input/ruin.205 
echo ">>>>>>>>running test 3543"
./replace_wrapper '@@' 'gM4Iz9`JS5`'\''ZhDPT'  < ./inputs/input/ruin.1151 
echo ">>>>>>>>running test 3544"
./replace_wrapper '@@' 'gV8;%IAhxp(4]=AqH&'\''feFXY&8>^:%j,(\'  < ./inputs/input/ruin.1311 
echo ">>>>>>>>running test 3545"
./replace_wrapper '@@' 'h'  < ./inputs/input/ruin.1129 
echo ">>>>>>>>running test 3546"
./replace_wrapper '@@' 'h'  < ./inputs/input/ruin.1223 
echo ">>>>>>>>running test 3547"
./replace_wrapper '@@' 'hAh7G[Wy'  < ./inputs/input/ruin.807 
echo ">>>>>>>>running test 3548"
./replace_wrapper '@@' 'i'  < ./inputs/input/ruin.509 
echo ">>>>>>>>running test 3549"
./replace_wrapper '@@' 'i3&YEy?NDqT |ye3E+7WmBD#X-J4KI'  < ./inputs/input/ruin.422 
echo ">>>>>>>>running test 3550"
./replace_wrapper '@@' 'j'  < ./inputs/input/ruin.1276 
echo ">>>>>>>>running test 3551"
./replace_wrapper '@@' 'j'  < ./inputs/input/ruin.1719 
echo ">>>>>>>>running test 3552"
./replace_wrapper '@@' 'j'  < ./inputs/input/ruin.424 
echo ">>>>>>>>running test 3553"
./replace_wrapper '@@' 'j'  < ./inputs/input/ruin.904 
echo ">>>>>>>>running test 3554"
./replace_wrapper '@@' 'j'  < ./inputs/input/ruin.996 
echo ">>>>>>>>running test 3555"
./replace_wrapper '@@' 'j'\''lp`]]b|XBOU+;%Z&7~pp;7VFA83x(zkK{%9."'  < ./inputs/input/ruin.1218 
echo ">>>>>>>>running test 3556"
./replace_wrapper '@@' 'j6A?tQQCI+w[(+e0(\M2l'  < ./inputs/input/ruin.1530 
echo ">>>>>>>>running test 3557"
./replace_wrapper '@@' 'j?'  < ./inputs/input/ruin.1855 
echo ">>>>>>>>running test 3558"
./replace_wrapper '@@' 'jjlqOhlK})+YNyJREVn`'  < ./inputs/input/ruin.1483 
echo ">>>>>>>>running test 3559"
./replace_wrapper '@@' 'k'  < ./inputs/input/ruin.1772 
echo ">>>>>>>>running test 3560"
./replace_wrapper '@@' 'k'  < ./inputs/input/ruin.68 
echo ">>>>>>>>running test 3561"
./replace_wrapper '@@' 'k8lIP/^lq^1Y+fyL*]:A/&$>QU&rMLju9)gZJn7t0L'  < ./inputs/input/ruin.852 
echo ">>>>>>>>running test 3562"
./replace_wrapper '@@' 'k90v&+GhOb?3^)t8w^5eB 8n+w|c,}dnl|/9zv:amXVHU<2LtF/'  < ./inputs/input/ruin.1673 
echo ">>>>>>>>running test 3563"
./replace_wrapper '@@' 'k`px>G$3CtAt8QtV'\''95t'  < ./inputs/input/ruin.1568 
echo ">>>>>>>>running test 3564"
./replace_wrapper '@@' 'kj{>|jBXaQi+U6Z,?.Z2zf!z,54K};>F^h1W &6!-jfKY=;7dzK5&Jd;`@%"a_5E'  < ./inputs/input/ruin.492 
echo ">>>>>>>>running test 3565"
./replace_wrapper '@@' 'l'  < ./inputs/input/ruin.1148 
echo ">>>>>>>>running test 3566"
./replace_wrapper '@@' 'l'  < ./inputs/input/ruin.1421 
echo ">>>>>>>>running test 3567"
./replace_wrapper '@@' 'lZ'  < ./inputs/input/ruin.383 
echo ">>>>>>>>running test 3568"
./replace_wrapper '@@' 'm'  < ./inputs/input/ruin.1181 
echo ">>>>>>>>running test 3569"
./replace_wrapper '@@' 'm'  < ./inputs/input/ruin.1738 
echo ">>>>>>>>running test 3570"
./replace_wrapper '@@' 'mmca'\''y]fF 5 '  < ./inputs/input/ruin.200 
echo ">>>>>>>>running test 3571"
./replace_wrapper '@@' 'n'  < ./inputs/input/ruin.795 
echo ">>>>>>>>running test 3572"
./replace_wrapper '@@' 'nZQNac5[{EJpLJrR>H7DDaGqvR'  < ./inputs/input/ruin.912 
echo ">>>>>>>>running test 3573"
./replace_wrapper '@@' 'nj*'  < ./inputs/input/ruin.565 
echo ">>>>>>>>running test 3574"
./replace_wrapper '@@' 'o'  < ./inputs/input/ruin.1479 
echo ">>>>>>>>running test 3575"
./replace_wrapper '@@' 'p<'  < ./inputs/input/ruin.1510 
echo ">>>>>>>>running test 3576"
./replace_wrapper '@@' 'pJAr(P$X'  < ./inputs/input/ruin.1426 
echo ">>>>>>>>running test 3577"
./replace_wrapper '@@' 'pTk>mo0}9UV`\akAM'  < ./inputs/input/ruin.488 
echo ">>>>>>>>running test 3578"
./replace_wrapper '@@' 'pUDenGaV4uuTBp'  < ./inputs/input/ruin.707 
echo ">>>>>>>>running test 3579"
./replace_wrapper '@@' 'q'  < ./inputs/input/ruin.322 
echo ">>>>>>>>running test 3580"
./replace_wrapper '@@' 'q'  < ./inputs/input/ruin.610 
echo ">>>>>>>>running test 3581"
./replace_wrapper '@@' 'q'  < ./inputs/input/ruin.650 
echo ">>>>>>>>running test 3582"
./replace_wrapper '@@' 'r'  < ./inputs/input/ruin.1985 
echo ">>>>>>>>running test 3583"
./replace_wrapper '@@' 'r'  < ./inputs/input/ruin.602 
echo ">>>>>>>>running test 3584"
./replace_wrapper '@@' 'r'  < ./inputs/input/ruin.938 
echo ">>>>>>>>running test 3585"
./replace_wrapper '@@' 'r(e <\Q$X[8Qn-^g9\yaGf=`ipV'  < ./inputs/input/ruin.1514 
echo ">>>>>>>>running test 3586"
./replace_wrapper '@@' 'rf[8:ZbgT%q{\_J^E@u3)IuxENZ~"v'  < ./inputs/input/ruin.1584 
echo ">>>>>>>>running test 3587"
./replace_wrapper '@@' 'rnQ0W'  < ./inputs/input/ruin.1766 
echo ">>>>>>>>running test 3588"
./replace_wrapper '@@' 's'  < ./inputs/input/ruin.157 
echo ">>>>>>>>running test 3589"
./replace_wrapper '@@' 's'  < ./inputs/input/ruin.1875 
echo ">>>>>>>>running test 3590"
./replace_wrapper '@@' 's+jsq+sqp33oy|>sXt&.w<(EJ[$_J'  < ./inputs/input/ruin.579 
echo ">>>>>>>>running test 3591"
./replace_wrapper '@@' 'sF1w_ggvWylg>yMc]h,D)_+_$r4m\$Vh '  < ./inputs/input/ruin.55 
echo ">>>>>>>>running test 3592"
./replace_wrapper '@@' 't+b%Ev`=tGgLKIdrp'  < ./inputs/input/ruin.1596 
echo ">>>>>>>>running test 3593"
./replace_wrapper '@@' 'tW'  < ./inputs/input/ruin.1247 
echo ">>>>>>>>running test 3594"
./replace_wrapper '@@' 'u]KpAv6)cN.l7mY\p?:,SP|'  < ./inputs/input/ruin.1053 
echo ">>>>>>>>running test 3595"
./replace_wrapper '@@' 'v'  < ./inputs/input/ruin.1046 
echo ">>>>>>>>running test 3596"
./replace_wrapper '@@' 'v'  < ./inputs/input/ruin.1674 
echo ">>>>>>>>running test 3597"
./replace_wrapper '@@' 'v'  < ./inputs/input/ruin.254 
echo ">>>>>>>>running test 3598"
./replace_wrapper '@@' 'v;b=dV4;]ygerT'  < ./inputs/input/ruin.818 
echo ">>>>>>>>running test 3599"
./replace_wrapper '@@' 'v<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs'  < ./inputs/input/ruin.1046 
echo ">>>>>>>>running test 3600"
./replace_wrapper '@@' 'vDAI-/lT.qya'  < ./inputs/input/ruin.359 
echo ">>>>>>>>running test 3601"
./replace_wrapper '@@' 'vZ`=_1/f&:WSB'\''.)vc&tN%d}Vf2%=]b>s/rYKaS]"F0l(W~#Ps#9FZYYdaNVl.wdL.'  < ./inputs/input/ruin.1267 
echo ">>>>>>>>running test 3602"
./replace_wrapper '@@' 'wr'  < ./inputs/input/ruin.1340 
echo ">>>>>>>>running test 3603"
./replace_wrapper '@@' 'x'  < ./inputs/input/ruin.1315 
echo ">>>>>>>>running test 3604"
./replace_wrapper '@@' 'x-4pr$|OeG~}/59%x9n9muL1?V>i)'  < ./inputs/input/ruin.1656 
echo ">>>>>>>>running test 3605"
./replace_wrapper '@@' 'xN(q} B`^qJME0vUM3iTnc\w\'  < ./inputs/input/ruin.593 
echo ">>>>>>>>running test 3606"
./replace_wrapper '@@' 'y'  < ./inputs/input/ruin.1059 
echo ">>>>>>>>running test 3607"
./replace_wrapper '@@' 'y'\''O;wCB`/IC#tko'\''ztR%D)S}WK}htv'\''CdX[k69[r'  < ./inputs/input/ruin.1754 
echo ">>>>>>>>running test 3608"
./replace_wrapper '@@' 'y7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp'  < ./inputs/input/ruin.1059 
echo ">>>>>>>>running test 3609"
./replace_wrapper '@@' 'z'  < ./inputs/input/ruin.62 
echo ">>>>>>>>running test 3610"
./replace_wrapper '@@' '{/ cC;3\[1Xjlmdn*[4(hG8'  < ./inputs/input/ruin.1881 
echo ">>>>>>>>running test 3611"
./replace_wrapper '@@' '{h[2n=I&4%W9N^8K.k1(0n)Pus1!i|hF&S&%_X61v<D8!JQGc)U1>Q05\&=r v8'  < ./inputs/input/ruin.1378 
echo ">>>>>>>>running test 3612"
./replace_wrapper '@@' '|'  < ./inputs/input/ruin.315 
echo ">>>>>>>>running test 3613"
./replace_wrapper '@@' '|9d|RN?*4< I:m63#['  < ./inputs/input/ruin.883 
echo ">>>>>>>>running test 3614"
./replace_wrapper '@@' '|=}'  < ./inputs/input/ruin.353 
echo ">>>>>>>>running test 3615"
./replace_wrapper '@@' '|lf=?(vz<r0o_RA10&UVxvVk`*VTC%}VlIEoG7] '  < ./inputs/input/ruin.1953 
echo ">>>>>>>>running test 3616"
./replace_wrapper '@@' '}&5EvYBv%T2.bCUUMp7hd>P/EBX&~26D?2z|YJ)Ql ERswc'  < ./inputs/input/ruin.1741 
echo ">>>>>>>>running test 3617"
./replace_wrapper '@@' '}t'  < ./inputs/input/ruin.578 
echo ">>>>>>>>running test 3618"
./replace_wrapper '@@'\''93QTn'   < ./inputs/input/ruin.1264 
echo ">>>>>>>>running test 3619"
./replace_wrapper '@@'\''93QTn' 'O*9 p]M4:=D71<S{~2V6mPa'  < ./inputs/input/ruin.1264 
echo ">>>>>>>>running test 3620"
./replace_wrapper '@@'\''@n' 'mF%'  < ./inputs/input/ruin.1541 
echo ">>>>>>>>running test 3621"
./replace_wrapper '@@'\''B9z^p-f]Eq/' 'SH{S$QV0"e<bz-[(*Z9Q'  < ./inputs/input/ruin.635 
echo ">>>>>>>>running test 3622"
./replace_wrapper '@@'\''B9z^p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9Q' 'SH{S$QV0"e<b[0-9]--*[^a-c][0-9]--*[^a-c][0-9]--*[^a-c][0-9]--*[^a-c]z-[(*Z9Q'  < ./inputs/input/ruin.635 
echo ">>>>>>>>running test 3623"
./replace_wrapper '@@'\''F$S9yt4Q=q' 'Nkto_//y?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe"'  < ./inputs/input/ruin.1997 
echo ">>>>>>>>running test 3624"
./replace_wrapper '@@'\''F$S9yt4Q=q*$' 'Nkto_//y?Stj%,|9I{FxV*qi!{_(dn*K9`$woNwuJe"'  < ./inputs/input/ruin.1997 
echo ">>>>>>>>running test 3625"
./replace_wrapper '@@'\''Z(T[TC' '<'  < ./inputs/input/ruin.1079 
echo ">>>>>>>>running test 3626"
./replace_wrapper '@@'\''_h' 'C'  < ./inputs/input/ruin.1379 
echo ">>>>>>>>running test 3627"
./replace_wrapper '@@'\''j?' 'l'  < ./inputs/input/ruin.307 
echo ">>>>>>>>running test 3628"
./replace_wrapper '@@)' '6wTwyN~#+^?38P>|WqutbRgK3V[{^{qDMM*E*6PJw?A<oo?&udbM.8/9{3H@;uQ-okq.3o#U+wFAV'  < ./inputs/input/ruin.158 
echo ">>>>>>>>running test 3629"
./replace_wrapper '@@*$' '#'  < ./inputs/input/ruin.1116 
echo ">>>>>>>>running test 3630"
./replace_wrapper '@@*$' '+'  < ./inputs/input/ruin.2000 
echo ">>>>>>>>running test 3631"
./replace_wrapper '@@*$' '4'  < ./inputs/input/ruin.1992 
echo ">>>>>>>>running test 3632"
./replace_wrapper '@@*$' 'E9p\6X[t<jnR3{*3PQSno!);('  < ./inputs/input/ruin.1256 
echo ">>>>>>>>running test 3633"
./replace_wrapper '@@*$' 'T/'  < ./inputs/input/ruin.1109 
echo ">>>>>>>>running test 3634"
./replace_wrapper '@@*$' 'T?^S|}'\''!\>bF'\''5T'  < ./inputs/input/ruin.1250 
echo ">>>>>>>>running test 3635"
./replace_wrapper '@@*$' 'YCoe'  < ./inputs/input/ruin.1246 
echo ">>>>>>>>running test 3636"
./replace_wrapper '@@*$' 'tW'  < ./inputs/input/ruin.1247 
echo ">>>>>>>>running test 3637"
./replace_wrapper '@@*' ''  < ./inputs/input/ruin.1132 
echo ">>>>>>>>running test 3638"
./replace_wrapper '@@*' ';Jq'  < ./inputs/input/ruin.1645 
echo ">>>>>>>>running test 3639"
./replace_wrapper '@@*' '>(jLZz>>Lg~n<xr62=%!LO#hy}{eo>9D_'  < ./inputs/input/ruin.800 
echo ">>>>>>>>running test 3640"
./replace_wrapper '@@*' '}7Qy)}SI'\''nw#bVsE+<-OwA.8oYuwKHLNr4bFf'  < ./inputs/input/ruin.1621 
echo ">>>>>>>>running test 3641"
./replace_wrapper '@@*'\'',^P&Sh6@@' '(&S8w;8MY'  < ./inputs/input/ruin.1119 
echo ">>>>>>>>running test 3642"
./replace_wrapper '@@*'\'*$',^P&Sh6@@' '(&S8w;8MY'  < ./inputs/input/ruin.1119 
echo ">>>>>>>>running test 3643"
./replace_wrapper '@@**' '9Jwr6Whlet5:nulL=82){._jluPvUdHD}&'  < ./inputs/input/ruin.333 
echo ">>>>>>>>running test 3644"
./replace_wrapper '@@**' 'DR'\''R'\''$x@7uS2EbR[H/q4ml^<1S(?&U_L~_m#^MaWM;'  < ./inputs/input/ruin.981 
echo ">>>>>>>>running test 3645"
./replace_wrapper '@@*?' 'a&'  < ./inputs/temp-test/437.inp.192.1 
echo ">>>>>>>>running test 3646"
./replace_wrapper '@@*?' 'a&'  < ./inputs/temp-test/438.inp.192.3 
echo ">>>>>>>>running test 3647"
./replace_wrapper '@@*?' 'cAcJGn".:*uPb165}4{qxaW\2**HeQ^HrbNvka bpOeC/DmG)u\8bwF'  < ./inputs/input/ruin.560 
echo ">>>>>>>>running test 3648"
./replace_wrapper '@@*@n' 'H&b'  < ./inputs/input/ruin.273 
echo ">>>>>>>>running test 3649"
./replace_wrapper '@@*[0-9]' '&'  < ./inputs/temp-test/623.inp.269.1 
echo ">>>>>>>>running test 3650"
./replace_wrapper '@@*[0-9]' '&'  < ./inputs/temp-test/624.inp.269.2 
echo ">>>>>>>>running test 3651"
./replace_wrapper '@@*[0-9]' '&'  < ./inputs/temp-test/625.inp.269.3 
echo ">>>>>>>>running test 3652"
./replace_wrapper '@@*[0-9]?--??' 'a&'  < ./inputs/temp-test/1505.inp.645.1 
echo ">>>>>>>>running test 3653"
./replace_wrapper '@@*[0-9]?--??' 'a&'  < ./inputs/temp-test/1506.inp.645.4 
echo ">>>>>>>>running test 3654"
./replace_wrapper '@@*[9-B]?[^0-9][a-?$' 'a@n'  < ./inputs/temp-test/2207.inp.934.6 
echo ">>>>>>>>running test 3655"
./replace_wrapper '@@*[9-B]?[^0-9][a-?' 'a@n'  < ./inputs/temp-test/2205.inp.934.1 
echo ">>>>>>>>running test 3656"
./replace_wrapper '@@*[9-B]?[^0-9][a-?' 'a@n'  < ./inputs/temp-test/2206.inp.934.2 
echo ">>>>>>>>running test 3657"
./replace_wrapper '@@*[^9-B] *-c*[-$' '&a@%'  < ./inputs/temp-test/1496.inp.641.6 
echo ">>>>>>>>running test 3658"
./replace_wrapper '@@*[^9-B] *-c*[-' '&a@%'  < ./inputs/temp-test/1494.inp.641.1 
echo ">>>>>>>>running test 3659"
./replace_wrapper '@@*[^9-B] *-c*[-' '&a@%'  < ./inputs/temp-test/1495.inp.641.2 
echo ">>>>>>>>running test 3660"
./replace_wrapper '@@*[^a-]?-^*' '&'  < ./inputs/temp-test/2283.inp.967.1 
echo ">>>>>>>>running test 3661"
./replace_wrapper '@@*[^a-]?-^*' '&'  < ./inputs/temp-test/2284.inp.967.3 
echo ">>>>>>>>running test 3662"
./replace_wrapper '@@*[^a-]?-^*' '&'  < ./inputs/temp-test/2285.inp.967.4 
echo ">>>>>>>>running test 3663"
./replace_wrapper '@@*[^j]' '2'  < ./inputs/input/ruin.544 
echo ">>>>>>>>running test 3664"
./replace_wrapper '@@-$' 'a@nb@tc'  < ./inputs/temp-test/1160.inp.499.9 
echo ">>>>>>>>running test 3665"
./replace_wrapper '@@-' '&a@%'  < ./inputs/temp-test/412.inp.181.1 
echo ">>>>>>>>running test 3666"
./replace_wrapper '@@-' '@%&a'  < ./inputs/temp-test/455.inp.199.1 
echo ">>>>>>>>running test 3667"
./replace_wrapper '@@-' '@%&a'  < ./inputs/temp-test/456.inp.199.3 
echo ">>>>>>>>running test 3668"
./replace_wrapper '@@-' '@{Pu@]R]'  < ./inputs/input/ruin.790 
echo ">>>>>>>>running test 3669"
./replace_wrapper '@@-' 'a@nb@tc'  < ./inputs/temp-test/1158.inp.499.1 
echo ">>>>>>>>running test 3670"
./replace_wrapper '@@-' 'a@nb@tc'  < ./inputs/temp-test/1159.inp.499.2 
echo ">>>>>>>>running test 3671"
./replace_wrapper '@@-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*-[^9-B][^0-9]?*' 'wr'  < ./inputs/input/ruin.1340 
echo ">>>>>>>>running test 3672"
./replace_wrapper '@@4['\'']\~s' 'T'  < ./inputs/input/ruin.537 
echo ">>>>>>>>running test 3673"
./replace_wrapper '@@:@@' '{a)^[TRRKd]?/7S% SUK1Pu^#_}^E#IZW`i1e>[YZ:Mr~G'  < ./inputs/input/ruin.446 
echo ">>>>>>>>running test 3674"
./replace_wrapper '@@?$' 'T/'  < ./inputs/input/ruin.1109 
echo ">>>>>>>>running test 3675"
./replace_wrapper '@@?' ')V@/g0LQ"#siS2K8F0=m'  < ./inputs/input/ruin.113 
echo ">>>>>>>>running test 3676"
./replace_wrapper '@@?' '0&,p^#I}6fi.kmr6K)xdK(M'\''7Iz}z:3QIG0mEil6xX{(5CsNr(r'  < ./inputs/input/ruin.527 
echo ">>>>>>>>running test 3677"
./replace_wrapper '@@?' '6`*o-'  < ./inputs/input/ruin.1387 
echo ">>>>>>>>running test 3678"
./replace_wrapper '@@?' '7'  < ./inputs/input/ruin.498 
echo ">>>>>>>>running test 3679"
./replace_wrapper '@@?' '<0,s xFuv2Dp'  < ./inputs/input/ruin.1810 
echo ">>>>>>>>running test 3680"
./replace_wrapper '@@?' 'WL+gd/H[UWU$h}N[i;#5Qc)X+oU8&I)M-b/F9J! '\''"'\''C'  < ./inputs/input/ruin.914 
echo ">>>>>>>>running test 3681"
./replace_wrapper '@@?' 'gUGalF#O'  < ./inputs/input/ruin.963 
echo ">>>>>>>>running test 3682"
./replace_wrapper '@@?' 'xZ@G7` /`/o))1@@NO? k5&m<#YcQg)OGD<ORel>4MD'  < ./inputs/input/ruin.569 
echo ">>>>>>>>running test 3683"
./replace_wrapper '@@?*' '#'  < ./inputs/input/ruin.1615 
echo ">>>>>>>>running test 3684"
./replace_wrapper '@@?*' 'I'  < ./inputs/input/ruin.1485 
echo ">>>>>>>>running test 3685"
./replace_wrapper '@@?*' ']'  < ./inputs/input/ruin.1597 
echo ">>>>>>>>running test 3686"
./replace_wrapper '@@?*' 'e^O;EJ5?6DU!Sw"B%ah'\''m*lY_`a'  < ./inputs/input/ruin.1598 
echo ">>>>>>>>running test 3687"
./replace_wrapper '@@?*' 't+b%Ev`=tGgLKIdrp'  < ./inputs/input/ruin.1596 
echo ">>>>>>>>running test 3688"
./replace_wrapper '@@?*' '}7Qy)}SI'\''nw#bVsE+<-OwA.8oYuwKHLNr4bFf'  < ./inputs/input/ruin.1621 
echo ">>>>>>>>running test 3689"
./replace_wrapper '@@?A$' 'K'  < ./inputs/input/ruin.1609 
echo ">>>>>>>>running test 3690"
./replace_wrapper '@@?A$?*' 'K'  < ./inputs/input/ruin.1609 
echo ">>>>>>>>running test 3691"
./replace_wrapper '@@?[^c-a$]' 't'  < ./inputs/input/ruin.416 
echo ">>>>>>>>running test 3692"
./replace_wrapper '@@?w$' '7'  < ./inputs/input/ruin.314 
echo ">>>>>>>>running test 3693"
./replace_wrapper '@@@!' '5]y50ks{!u}xF93w}f[;WP4&Q4[=4'  < ./inputs/input/ruin.73 
echo ">>>>>>>>running test 3694"
./replace_wrapper '@@@/@@[0-9]' 'o'  < ./inputs/input/ruin.284 
echo ">>>>>>>>running test 3695"
./replace_wrapper '@@@2*' 'NU'  < ./inputs/input/ruin.567 
echo ">>>>>>>>running test 3696"
./replace_wrapper '@@@@$' '+'  < ./inputs/input/ruin.786 
echo ">>>>>>>>running test 3697"
./replace_wrapper '@@@@$' 'IvJL"!Kh[JX'\''_wS|r+Z(:B7<xtHS@p38c|cC#}/j#FpjA>;BuZf09%h1jMyFu'  < ./inputs/input/ruin.1928 
echo ">>>>>>>>running test 3698"
./replace_wrapper '@@@@' '!+f(~L|L^Uc6wf5)pmPAJjC6yX}^=`D&MGl@W'  < ./inputs/input/ruin.1920 
echo ">>>>>>>>running test 3699"
./replace_wrapper '@@@@' '='  < ./inputs/input/ruin.910 
echo ">>>>>>>>running test 3700"
./replace_wrapper '@@@@' 'F*)H: O}u'  < ./inputs/input/ruin.1092 
echo ">>>>>>>>running test 3701"
./replace_wrapper '@@@@' 'L'  < ./inputs/input/ruin.389 
echo ">>>>>>>>running test 3702"
./replace_wrapper '@@@@' 'L'  < ./inputs/input/ruin.407 
echo ">>>>>>>>running test 3703"
./replace_wrapper '@@@@' 'T'  < ./inputs/input/ruin.181 
echo ">>>>>>>>running test 3704"
./replace_wrapper '@@@@' 'T'  < ./inputs/input/ruin.885 
echo ">>>>>>>>running test 3705"
./replace_wrapper '@@@@' '[V]s~wXx-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^-[^a-c][0-9]@[[0-9]*[^0-9]*-[^a-c]@n*^[^M3af'  < ./inputs/input/ruin.1342 
echo ">>>>>>>>running test 3706"
./replace_wrapper '@@@@' '[V]s~wXxM3af'  < ./inputs/input/ruin.1342 
echo ">>>>>>>>running test 3707"
./replace_wrapper '@@@@' ']~;WpJ>rM%DNS/`+N@R\=W'\''7q((@!7pb&v"'  < ./inputs/input/ruin.184 
echo ">>>>>>>>running test 3708"
./replace_wrapper '@@@@' 'iQh&l$RTw@>}2m/i}Jua'\''w_1'\''z1`b&Q9cU'  < ./inputs/input/ruin.351 
echo ">>>>>>>>running test 3709"
./replace_wrapper '@@@@' '|J/3~Opz]2uqtMS\~E'  < ./inputs/input/ruin.803 
echo ">>>>>>>>running test 3710"
./replace_wrapper '@@@@?' 'w2OuzZ7S6'  < ./inputs/input/ruin.929 
echo ">>>>>>>>running test 3711"
./replace_wrapper '@@@@S' 'BZvBw]7~=NB4MK@b'  < ./inputs/input/ruin.1143 
echo ">>>>>>>>running test 3712"
./replace_wrapper '@@@@\G$H.|M' 'y&'  < ./inputs/input/ruin.672 
echo ">>>>>>>>running test 3713"
./replace_wrapper '@@@`' '3"'  < ./inputs/input/ruin.1824 
echo ">>>>>>>>running test 3714"
./replace_wrapper '@@@n' '60&<9:5*f8GULK>.:&6r]A'  < ./inputs/input/ruin.1321 
echo ">>>>>>>>running test 3715"
./replace_wrapper '@@@n' ';&.St7,*,FY'\''e2 #PQt_JAdEVyBorNLKtG4,nKOUCw{Tr/J2d]Omr-PWjk+'  < ./inputs/input/ruin.98 
echo ">>>>>>>>running test 3716"
./replace_wrapper '@@F' 'f[6_8'  < ./inputs/input/ruin.1138 
echo ">>>>>>>>running test 3717"
./replace_wrapper '@@J*' '('  < ./inputs/input/ruin.1467 
echo ">>>>>>>>running test 3718"
./replace_wrapper '@@[0-9]*o[0-9]' '$'  < ./inputs/input/ruin.566 
echo ">>>>>>>>running test 3719"
./replace_wrapper '@@[>-A]' '%o9j&*k~kjfdI'  < ./inputs/input/ruin.1080 
echo ">>>>>>>>running test 3720"
./replace_wrapper '@@[A-G]$' 'O'  < ./inputs/input/ruin.614 
echo ">>>>>>>>running test 3721"
./replace_wrapper '@@[A-Gz-}<]' 'I'  < ./inputs/input/ruin.609 
echo ">>>>>>>>running test 3722"
./replace_wrapper '@@[^--z]' 'NEW'  < ./inputs/temp-test/2125.inp.901.1 
echo ">>>>>>>>running test 3723"
./replace_wrapper '@@[^--z]' 'NEW'  < ./inputs/temp-test/2126.inp.901.3 
echo ">>>>>>>>running test 3724"
./replace_wrapper '@@[^--z]' 'NEW'  < ./inputs/temp-test/2127.inp.901.4 
echo ">>>>>>>>running test 3725"
./replace_wrapper '@@[^0-9]' '@n'  < ./inputs/temp-test/1087.inp.468.1 
echo ">>>>>>>>running test 3726"
./replace_wrapper '@@[^0-9]' '@n'  < ./inputs/temp-test/1088.inp.468.3 
echo ">>>>>>>>running test 3727"
./replace_wrapper '@@[^A-Gn0-9]' 'A)T537M`;~`g'  < ./inputs/input/ruin.1519 
echo ">>>>>>>>running test 3728"
./replace_wrapper '@@[^l]' 'c'  < ./inputs/input/ruin.1453 
echo ">>>>>>>>running test 3729"
./replace_wrapper '@@[a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9]' 'e'  < ./inputs/input/ruin.323 
echo ">>>>>>>>running test 3730"
./replace_wrapper '@@[a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c*[0-9][a-c]-?-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*[0-9]' 'q'  < ./inputs/input/ruin.322 
echo ">>>>>>>>running test 3731"
./replace_wrapper '@@[z-}]'   < ./inputs/input/ruin.1263 
echo ">>>>>>>>running test 3732"
./replace_wrapper '@@[z-}]' '/s_ziY.ZkrBEgFC4_(F^|T`jH`t@hJl,j=#7sJ}'  < ./inputs/input/ruin.1263 
echo ">>>>>>>>running test 3733"
./replace_wrapper '@@\)' '4I'  < ./inputs/input/ruin.1063 
echo ">>>>>>>>running test 3734"
./replace_wrapper '@@\)' '7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mpAv6)cN.l7mp4I'  < ./inputs/input/ruin.1063 
echo ">>>>>>>>running test 3735"
./replace_wrapper '@@\EO' 'KH-J?'\''`M!B=/fD`}s=H@.K]'  < ./inputs/input/ruin.346 
echo ">>>>>>>>running test 3736"
./replace_wrapper '@@]' 'ueNxiCI$-'  < ./inputs/input/ruin.1687 
echo ">>>>>>>>running test 3737"
./replace_wrapper '@@^a-c]' '@%@&'  < ./inputs/temp-test/185.inp.83.1 
echo ">>>>>>>>running test 3738"
./replace_wrapper '@@`' 'm'  < ./inputs/input/ruin.734 
echo ">>>>>>>>running test 3739"
./replace_wrapper '@@o'\''D@z@@?' 'D*Cx2,Ha$<h|]}{:Vf C/To4Vds0QNM+LTtC%Q1{""W'  < ./inputs/input/ruin.437 
echo ">>>>>>>>running test 3740"
./replace_wrapper '@@p&y=3[ZNLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{HC<5S)0ft3+1A]NLF]{H*[0-9]*C<5S)0ft3+1A]YIgTBk-*?* *[a' '+'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 3741"
./replace_wrapper '@@p&y=3[ZYIgp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYIp&y=3[ZYITBk' 'T'  < ./inputs/input/ruin.1330 
echo ">>>>>>>>running test 3742"
./replace_wrapper '@@s' '3'  < ./inputs/input/ruin.605 
echo ">>>>>>>>running test 3743"
./replace_wrapper '@A$' 'Vm3P(j&"*S[r19i9]}TqvX%/B[p^JXe_'  < ./inputs/input/ruin.66 
echo ">>>>>>>>running test 3744"
./replace_wrapper '@C' 'z'  < ./inputs/input/ruin.1125 
echo ">>>>>>>>running test 3745"
./replace_wrapper '@D' '.'  < ./inputs/input/ruin.1169 
echo ">>>>>>>>running test 3746"
./replace_wrapper '@E' 'PLvh0lN%L2%?&GW#2VGQ>D,<~.4l,[<Z;xbv|!y'  < ./inputs/input/ruin.245 
echo ">>>>>>>>running test 3747"
./replace_wrapper '@J' 'K'  < ./inputs/input/ruin.465 
echo ">>>>>>>>running test 3748"
./replace_wrapper '@J' 'rTRJy`3lY]0ky'  < ./inputs/input/ruin.1895 
echo ">>>>>>>>running test 3749"
./replace_wrapper '@P' 'XUd+.8r\'  < ./inputs/input/ruin.1606 
echo ">>>>>>>>running test 3750"
./replace_wrapper '@P?*' 'XUd+.8r\'  < ./inputs/input/ruin.1606 
echo ">>>>>>>>running test 3751"
./replace_wrapper '@R' '^'  < ./inputs/input/ruin.208 
echo ">>>>>>>>running test 3752"
./replace_wrapper '@T' '}'  < ./inputs/input/ruin.1233 
echo ">>>>>>>>running test 3753"
./replace_wrapper '@X' 'j'  < ./inputs/input/ruin.972 
echo ">>>>>>>>running test 3754"
./replace_wrapper '@Y' 'n"F;S+\) buv"j('  < ./inputs/input/ruin.1908 
echo ">>>>>>>>running test 3755"
./replace_wrapper '@Y' 'uY.rul7yx-pu2#3MGnr'\'''  < ./inputs/input/ruin.889 
echo ">>>>>>>>running test 3756"
./replace_wrapper '@Z' 'q'  < ./inputs/input/ruin.1194 
echo ">>>>>>>>running test 3757"
./replace_wrapper '@[' '@%@&'  < ./inputs/temp-test/2286.inp.968.1 
echo ">>>>>>>>running test 3758"
./replace_wrapper '@[' '@%@&'  < ./inputs/temp-test/2287.inp.968.3 
echo ">>>>>>>>running test 3759"
./replace_wrapper '@[' '@t'  < ./inputs/temp-test/1463.inp.627.1 
echo ">>>>>>>>running test 3760"
./replace_wrapper '@[' '@t'  < ./inputs/temp-test/1464.inp.627.2 
echo ">>>>>>>>running test 3761"
./replace_wrapper '@[' 'a@nb@tc'  < ./inputs/temp-test/1095.inp.472.1 
echo ">>>>>>>>running test 3762"
./replace_wrapper '@[' 'a@nb@tc'  < ./inputs/temp-test/1096.inp.472.2 
echo ">>>>>>>>running test 3763"
./replace_wrapper '@[' 'a@nb@tc'  < ./inputs/temp-test/1097.inp.472.3 
echo ">>>>>>>>running test 3764"
./replace_wrapper '@[*' ''  < ./inputs/temp-test/2203.inp.933.1 
echo ">>>>>>>>running test 3765"
./replace_wrapper '@[*' ''  < ./inputs/temp-test/2204.inp.933.3 
echo ">>>>>>>>running test 3766"
./replace_wrapper '@[*' 'NEW'  < ./inputs/temp-test/673.inp.293.1 
echo ">>>>>>>>running test 3767"
./replace_wrapper '@[*' 'NEW'  < ./inputs/temp-test/674.inp.293.2 
echo ">>>>>>>>running test 3768"
./replace_wrapper '@[*' 'NEW'  < ./inputs/temp-test/675.inp.293.3 
echo ">>>>>>>>running test 3769"
./replace_wrapper '@[*-$%' ''  < ./inputs/temp-test/2331.inp.988.6 
echo ">>>>>>>>running test 3770"
./replace_wrapper '@[*-$' ''  < ./inputs/temp-test/2331.inp.988.6 
echo ">>>>>>>>running test 3771"
./replace_wrapper '@[*-%' ''  < ./inputs/temp-test/2330.inp.988.4 
echo ">>>>>>>>running test 3772"
./replace_wrapper '@[*-' ''  < ./inputs/temp-test/2327.inp.988.1 
echo ">>>>>>>>running test 3773"
./replace_wrapper '@[*-' ''  < ./inputs/temp-test/2328.inp.988.2 
echo ">>>>>>>>running test 3774"
./replace_wrapper '@[*-' ''  < ./inputs/temp-test/2329.inp.988.3 
echo ">>>>>>>>running test 3775"
./replace_wrapper '@[*-' ''  < ./inputs/temp-test/2330.inp.988.4 
echo ">>>>>>>>running test 3776"
./replace_wrapper '@[*-?[a-c$'   < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 3777"
./replace_wrapper '@[*-?[a-c$' 'a@nb@tc'  < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 3778"
./replace_wrapper '@[*-?[a-c'   < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 3779"
./replace_wrapper '@[*-?[a-c'   < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 3780"
./replace_wrapper '@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 3781"
./replace_wrapper '@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 3782"
./replace_wrapper '@[*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 3783"
./replace_wrapper '@[*?' 'a@n'  < ./inputs/temp-test/2189.inp.927.1 
echo ">>>>>>>>running test 3784"
./replace_wrapper '@[*?' 'a@n'  < ./inputs/temp-test/2190.inp.927.2 
echo ">>>>>>>>running test 3785"
./replace_wrapper '@[*[0-9]' ''  < ./inputs/temp-test/2132.inp.903.1 
echo ">>>>>>>>running test 3786"
./replace_wrapper '@[*[0-9]' ''  < ./inputs/temp-test/2133.inp.903.2 
echo ">>>>>>>>running test 3787"
./replace_wrapper '@[*[0-9]' ''  < ./inputs/temp-test/2134.inp.903.3 
echo ">>>>>>>>running test 3788"
./replace_wrapper '@[*[9-B]' '&'  < ./inputs/temp-test/491.inp.215.1 
echo ">>>>>>>>running test 3789"
./replace_wrapper '@[*[9-B]?-[a-c]?@**[9-B][-z][^9-B]@@' '@%@&'  < ./inputs/temp-test/471.inp.206.1 
echo ">>>>>>>>running test 3790"
./replace_wrapper '@[*[9-B]?-[a-c]?@**[9-B][-z][^9-B]@@' '@%@&'  < ./inputs/temp-test/472.inp.206.2 
echo ">>>>>>>>running test 3791"
./replace_wrapper '@[*[9-B]?-[a-c]?@**[9-B][-z][^9-B]@@' '@%@&'  < ./inputs/temp-test/473.inp.206.3 
echo ">>>>>>>>running test 3792"
./replace_wrapper '@[*[9-B]@' '&@'  < ./inputs/temp-test/491.inp.215.1 
echo ">>>>>>>>running test 3793"
./replace_wrapper '@[*[9-B][0-9]?' '&'  < ./inputs/temp-test/1358.inp.583.1 
echo ">>>>>>>>running test 3794"
./replace_wrapper '@[*[9-B][0-9]?' '&'  < ./inputs/temp-test/1359.inp.583.2 
echo ">>>>>>>>running test 3795"
./replace_wrapper '@[*[9-B][0-9]?' '&'  < ./inputs/temp-test/1360.inp.583.4 
echo ">>>>>>>>running test 3796"
./replace_wrapper '@[*[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/2113.inp.896.1 
echo ">>>>>>>>running test 3797"
./replace_wrapper '@[*[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/2114.inp.896.2 
echo ">>>>>>>>running test 3798"
./replace_wrapper '@[*[^9-B][^a-c?' 'NEW'  < ./inputs/temp-test/474.inp.207.1 
echo ">>>>>>>>running test 3799"
./replace_wrapper '@[*[^9-B][^a-c?' 'NEW'  < ./inputs/temp-test/475.inp.207.2 
echo ">>>>>>>>running test 3800"
./replace_wrapper '@[*[a-]' '@%@&'  < ./inputs/temp-test/1600.inp.681.1 
echo ">>>>>>>>running test 3801"
./replace_wrapper '@[*[a-]' '@%@&'  < ./inputs/temp-test/1601.inp.681.2 
echo ">>>>>>>>running test 3802"
./replace_wrapper '@[*[a-]' '@%@&'  < ./inputs/temp-test/1602.inp.681.3 
echo ">>>>>>>>running test 3803"
./replace_wrapper '@[*[a-c]' 'NEW'  < ./inputs/temp-test/1370.inp.588.1 
echo ">>>>>>>>running test 3804"
./replace_wrapper '@[*[a-c]' 'NEW'  < ./inputs/temp-test/1371.inp.588.2 
echo ">>>>>>>>running test 3805"
./replace_wrapper '@[?[^9-B]-[a-[^0-9][9-B]?' '@t'  < ./inputs/temp-test/1762.inp.750.1 
echo ">>>>>>>>running test 3806"
./replace_wrapper '@[?[^9-B]-[a-[^0-9][9-B]?' '@t'  < ./inputs/temp-test/1763.inp.750.2 
echo ">>>>>>>>running test 3807"
./replace_wrapper '@[?[^a-c]?[^0-9]-[^9-B][a-c]' '@%@&'  < ./inputs/temp-test/1356.inp.582.1 
echo ">>>>>>>>running test 3808"
./replace_wrapper '@[?[^a-c]?[^0-9]-[^9-B][a-c]' '@%@&'  < ./inputs/temp-test/1357.inp.582.3 
echo ">>>>>>>>running test 3809"
./replace_wrapper '@[A*[9-B]^[0-9]$' '@%&a'  < ./inputs/temp-test/1513.inp.647.6 
echo ">>>>>>>>running test 3810"
./replace_wrapper '@[A*[9-B]^[0-9]' '@%&a'  < ./inputs/temp-test/1509.inp.647.1 
echo ">>>>>>>>running test 3811"
./replace_wrapper '@[A*[9-B]^[0-9]' '@%&a'  < ./inputs/temp-test/1510.inp.647.2 
echo ">>>>>>>>running test 3812"
./replace_wrapper '@[A*[9-B]^[0-9]' '@%&a'  < ./inputs/temp-test/1511.inp.647.3 
echo ">>>>>>>>running test 3813"
./replace_wrapper '@[A*[9-B]^[0-9]' '@%&a'  < ./inputs/temp-test/1512.inp.647.4 
echo ">>>>>>>>running test 3814"
./replace_wrapper '@[[0-9]' '&'  < ./inputs/temp-test/1180.inp.509.1 
echo ">>>>>>>>running test 3815"
./replace_wrapper '@[[0-9]' '&'  < ./inputs/temp-test/1181.inp.509.2 
echo ">>>>>>>>running test 3816"
./replace_wrapper '@[[0-9]' '&'  < ./inputs/temp-test/1182.inp.509.3 
echo ">>>>>>>>running test 3817"
./replace_wrapper '@[[0-9]' ''  < ./inputs/temp-test/2225.inp.944.1 
echo ">>>>>>>>running test 3818"
./replace_wrapper '@[[0-9]' ''  < ./inputs/temp-test/2226.inp.944.2 
echo ">>>>>>>>running test 3819"
./replace_wrapper '@[[0-9]' ''  < ./inputs/temp-test/2227.inp.944.3 
echo ">>>>>>>>running test 3820"
./replace_wrapper '@[[0-9]' 'NEW'  < ./inputs/temp-test/720.inp.311.1 
echo ">>>>>>>>running test 3821"
./replace_wrapper '@[[0-9]' 'NEW'  < ./inputs/temp-test/721.inp.311.2 
echo ">>>>>>>>running test 3822"
./replace_wrapper '@[[9-B]-' '@%&a'  < ./inputs/temp-test/1021.inp.439.1 
echo ">>>>>>>>running test 3823"
./replace_wrapper '@[[9-B]-' '@%&a'  < ./inputs/temp-test/1022.inp.439.2 
echo ">>>>>>>>running test 3824"
./replace_wrapper '@[[9-B]^[^9-B]' 'NEW'  < ./inputs/temp-test/812.inp.349.1 
echo ">>>>>>>>running test 3825"
./replace_wrapper '@[[^0-9]' '@%&a'  < ./inputs/temp-test/947.inp.408.1 
echo ">>>>>>>>running test 3826"
./replace_wrapper '@[[^0-9]' '@%&a'  < ./inputs/temp-test/948.inp.408.3 
echo ">>>>>>>>running test 3827"
./replace_wrapper '@[[^0-9]*' 'a@nb@tc'  < ./inputs/temp-test/131.inp.61.1 
echo ">>>>>>>>running test 3828"
./replace_wrapper '@[[^0-9]*' 'a@nb@tc'  < ./inputs/temp-test/132.inp.61.4 
echo ">>>>>>>>running test 3829"
./replace_wrapper '@[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]' '[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]a&'  < ./inputs/temp-test/2266.inp.961.1 
echo ">>>>>>>>running test 3830"
./replace_wrapper '@[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]' 'a&'  < ./inputs/temp-test/2266.inp.961.1 
echo ">>>>>>>>running test 3831"
./replace_wrapper '@[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]' 'a&'  < ./inputs/temp-test/2267.inp.961.2 
echo ">>>>>>>>running test 3832"
./replace_wrapper '@[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]' 'a&'  < ./inputs/temp-test/2268.inp.961.4 
echo ">>>>>>>>running test 3833"
./replace_wrapper '@[[^a-c]' 'a@n'  < ./inputs/temp-test/771.inp.331.1 
echo ">>>>>>>>running test 3834"
./replace_wrapper '@[[^a-c]' 'a@n'  < ./inputs/temp-test/772.inp.331.2 
echo ">>>>>>>>running test 3835"
./replace_wrapper '@[[a-c]-*-' '&a@%'  < ./inputs/temp-test/2323.inp.986.1 
echo ">>>>>>>>running test 3836"
./replace_wrapper '@[[a-c]-*-' '&a@%'  < ./inputs/temp-test/2324.inp.986.2 
echo ">>>>>>>>running test 3837"
./replace_wrapper '@[][*-?[a-c$' 'a@nb@tc'  < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 3838"
./replace_wrapper '@[][*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 3839"
./replace_wrapper '@[][*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 3840"
./replace_wrapper '@[][*-?[a-c[]' 'a@nb@tc'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 3841"
./replace_wrapper '@[^][*-?[a-c$' 'a@nb@tc'  < ./inputs/temp-test/210.inp.93.8 
echo ">>>>>>>>running test 3842"
./replace_wrapper '@[^][*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/208.inp.93.2 
echo ">>>>>>>>running test 3843"
./replace_wrapper '@[^][*-?[a-c' 'a@nb@tc'  < ./inputs/temp-test/209.inp.93.3 
echo ">>>>>>>>running test 3844"
./replace_wrapper '@[^][*-?[a-c[^]' 'a@nb@tc'  < ./inputs/temp-test/207.inp.93.1 
echo ">>>>>>>>running test 3845"
./replace_wrapper '@\' 'g-]cUd4^Cl)"wkYz'  < ./inputs/input/ruin.1638 
echo ">>>>>>>>running test 3846"
./replace_wrapper '@]' '($;X"X$F-uMG+`"5<X"'  < ./inputs/input/ruin.1430 
echo ">>>>>>>>running test 3847"
./replace_wrapper '@^?(@}' 'f'  < ./inputs/input/ruin.1680 
echo ">>>>>>>>running test 3848"
./replace_wrapper '@`' 'pQH;uJ,{RTf,E`X>gP;MGaei$HG}'  < ./inputs/input/ruin.945 
echo ">>>>>>>>running test 3849"
./replace_wrapper '@a' 'mZ1ng>k-x4voh3._i>_;0G|/C$'  < ./inputs/input/ruin.365 
echo ">>>>>>>>running test 3850"
./replace_wrapper '@a\|?' '?YH_'\''.XVn$Je"$z5vh%5F`nJNn|ft'  < ./inputs/input/ruin.575 
echo ">>>>>>>>running test 3851"
./replace_wrapper '@ddN@n' 'fg~4&[LmRA3o6:cW<[RU@3H*M;Z:.;y'\'',gC?= VPAFmAF'\'':1)z3<<'  < ./inputs/input/ruin.377 
echo ">>>>>>>>running test 3852"
./replace_wrapper '@e' 'O'  < ./inputs/input/ruin.12 
echo ">>>>>>>>running test 3853"
./replace_wrapper '@g' 'w|'  < ./inputs/input/ruin.1201 
echo ">>>>>>>>running test 3854"
./replace_wrapper '@h' 'w0Yj|`l`AYgv{KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@KNy,h0_sbVxG=nOfj@M<#KAouk'  < ./inputs/input/ruin.1035 
echo ">>>>>>>>running test 3855"
./replace_wrapper '@h' 'w0Yj|`l`AYgv{M<#KAouk'  < ./inputs/input/ruin.1035 
echo ">>>>>>>>running test 3856"
./replace_wrapper '@i' 'j'  < ./inputs/input/ruin.1668 
echo ">>>>>>>>running test 3857"
./replace_wrapper '@l' 'A)y'  < ./inputs/input/ruin.1820 
echo ">>>>>>>>running test 3858"
./replace_wrapper '@l' 'PSP`1vR+aC$I8'\''9UeO_Y'\''_nJ<FtcIi}. ,av4,XPyZ7BT#(B9{S=c--i.'  < ./inputs/input/ruin.1105 
echo ">>>>>>>>running test 3859"
./replace_wrapper '@l' 'RhZj~cW}'  < ./inputs/input/ruin.1478 
echo ">>>>>>>>running test 3860"
./replace_wrapper '@l*$' 'PSP`1vR+aC$I8'\''9UeO_Y'\''_nJ<FtcIi}. ,av4,XPyZ7BT#(B9{S=c--i.'  < ./inputs/input/ruin.1105 
echo ">>>>>>>>running test 3861"
./replace_wrapper '@m[^z-}]' 'Iz'  < ./inputs/input/ruin.1474 
echo ">>>>>>>>running test 3862"
./replace_wrapper '@n$' '$'  < ./inputs/input/ruin.1678 
echo ">>>>>>>>running test 3863"
./replace_wrapper '@n$' '&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 3864"
./replace_wrapper '@n$' '-[&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 3865"
./replace_wrapper '@n$' 'G4`w-b'  < ./inputs/input/ruin.1929 
echo ">>>>>>>>running test 3866"
./replace_wrapper '@n'   < ./inputs/input/ruin.1157 
echo ">>>>>>>>running test 3867"
./replace_wrapper '@n'   < ./inputs/input/ruin.1268 
echo ">>>>>>>>running test 3868"
./replace_wrapper '@n' '!'  < ./inputs/input/ruin.145 
echo ">>>>>>>>running test 3869"
./replace_wrapper '@n' '"'  < ./inputs/input/ruin.954 
echo ">>>>>>>>running test 3870"
./replace_wrapper '@n' '$!9jSkl)bEK'\''coE)Yz)\'\''9Qk(>mPE'  < ./inputs/input/ruin.1441 
echo ">>>>>>>>running test 3871"
./replace_wrapper '@n' '%:gPY.>,2#'  < ./inputs/input/ruin.1275 
echo ">>>>>>>>running test 3872"
./replace_wrapper '@n' '& '  < ./inputs/input/ruin.1192 
echo ">>>>>>>>running test 3873"
./replace_wrapper '@n' '&"w4yF;^%V{=[g" GQ!^)U'\''6G+5J[ejzJ=>IXG>MUU*;c:LUh'\''sz` ;i)-cxBKFwk%b`+L'  < ./inputs/input/ruin.1189 
echo ">>>>>>>>running test 3874"
./replace_wrapper '@n' '&#8|G=x$)8Bi3&]|}0Ei%$sGmY={x{8WXO(B='  < ./inputs/input/ruin.1197 
echo ">>>>>>>>running test 3875"
./replace_wrapper '@n' '&'  < ./inputs/temp-test/1025.inp.441.1 
echo ">>>>>>>>running test 3876"
./replace_wrapper '@n' '&'  < ./inputs/temp-test/329.inp.146.1 
echo ">>>>>>>>running test 3877"
./replace_wrapper '@n' '&'  < ./inputs/temp-test/332.inp.146.4 
echo ">>>>>>>>running test 3878"
./replace_wrapper '@n' '&(Qk '  < ./inputs/input/ruin.1205 
echo ">>>>>>>>running test 3879"
./replace_wrapper '@n' '&*'  < ./inputs/input/ruin.1360 
echo ">>>>>>>>running test 3880"
./replace_wrapper '@n' '&.St7,*,FY'\''e2 #PQt_JAdEVyBorNLKtG4,nKOUCw{Tr/J2d]Omr-PWjk+'  < ./inputs/input/ruin.98 
echo ">>>>>>>>running test 3881"
./replace_wrapper '@n' '&/=VXw>%)rWz0.ROqC>THDqQ^Hr+jB~x]S(cp}#'  < ./inputs/input/ruin.1204 
echo ">>>>>>>>running test 3882"
./replace_wrapper '@n' '&16|L'  < ./inputs/input/ruin.270 
echo ">>>>>>>>running test 3883"
./replace_wrapper '@n' '&4'  < ./inputs/input/ruin.281 
echo ">>>>>>>>running test 3884"
./replace_wrapper '@n' '&5.'  < ./inputs/input/ruin.1186 
echo ">>>>>>>>running test 3885"
./replace_wrapper '@n' '&5D$6:)'\''!!WaohoC<DMt/ns5zA:0vzT p?PADhjzrF.e*NbJLCd;0Sr/.Ja+?2sn-MP+uf6)IZet;aI!3=TH7?$d_6t)!l=Wfh37`[%\<5'  < ./inputs/input/ruin.1200 
echo ">>>>>>>>running test 3886"
./replace_wrapper '@n' '&6'  < ./inputs/input/ruin.284 
echo ">>>>>>>>running test 3887"
./replace_wrapper '@n' '&7KOgdHVS~e*RbgQ>M{]|d'  < ./inputs/input/ruin.1195 
echo ">>>>>>>>running test 3888"
./replace_wrapper '@n' '&8sdW9T'  < ./inputs/input/ruin.1065 
echo ">>>>>>>>running test 3889"
./replace_wrapper '@n' '&:an"OMpY#Ei1WdZ>`'  < ./inputs/input/ruin.1277 
echo ">>>>>>>>running test 3890"
./replace_wrapper '@n' '&<9:5*f8GULK>.:&6r]A'  < ./inputs/input/ruin.1321 
echo ">>>>>>>>running test 3891"
./replace_wrapper '@n' '&<N#2/*K)n'  < ./inputs/input/ruin.1182 
echo ">>>>>>>>running test 3892"
./replace_wrapper '@n' '&<N#N4zMu+/?$@,"oa`nt=1CL!g3y*(k((w!.4aPc>wSP2w2'  < ./inputs/input/ruin.487 
echo ">>>>>>>>running test 3893"
./replace_wrapper '@n' '&<c!'  < ./inputs/input/ruin.1179 
echo ">>>>>>>>running test 3894"
./replace_wrapper '@n' '&=:zD+0/]VKClfA;8d-(~bTN"m'  < ./inputs/input/ruin.1086 
echo ">>>>>>>>running test 3895"
./replace_wrapper '@n' '&?[0-9]'  < ./inputs/input/ruin.1377 
echo ">>>>>>>>running test 3896"
./replace_wrapper '@n' '&@@'  < ./inputs/input/ruin.1352 
echo ">>>>>>>>running test 3897"
./replace_wrapper '@n' '&@n'  < ./inputs/input/ruin.1340 
echo ">>>>>>>>running test 3898"
./replace_wrapper '@n' '&@n@n'  < ./inputs/input/ruin.1364 
echo ">>>>>>>>running test 3899"
./replace_wrapper '@n' '&@t'  < ./inputs/input/ruin.13 
echo ">>>>>>>>running test 3900"
./replace_wrapper '@n' '&@t@t'  < ./inputs/input/ruin.1376 
echo ">>>>>>>>running test 3901"
./replace_wrapper '@n' '&@t@t'  < ./inputs/input/ruin.617 
echo ">>>>>>>>running test 3902"
./replace_wrapper '@n' '&@t@t@t'  < ./inputs/input/ruin.460 
echo ">>>>>>>>running test 3903"
./replace_wrapper '@n' '&A'  < ./inputs/input/ruin.293 
echo ">>>>>>>>running test 3904"
./replace_wrapper '@n' '&D'  < ./inputs/input/ruin.1199 
echo ">>>>>>>>running test 3905"
./replace_wrapper '@n' '&E'  < ./inputs/input/ruin.1184 
echo ">>>>>>>>running test 3906"
./replace_wrapper '@n' '&L'  < ./inputs/input/ruin.1203 
echo ">>>>>>>>running test 3907"
./replace_wrapper '@n' '&L'  < ./inputs/input/ruin.274 
echo ">>>>>>>>running test 3908"
./replace_wrapper '@n' '&M'  < ./inputs/input/ruin.1185 
echo ">>>>>>>>running test 3909"
./replace_wrapper '@n' '&U'  < ./inputs/input/ruin.1193 
echo ">>>>>>>>running test 3910"
./replace_wrapper '@n' '&XW&%JwE}YEQ"vBljIYg}l'  < ./inputs/input/ruin.494 
echo ">>>>>>>>running test 3911"
./replace_wrapper '@n' '&[0-9]'  < ./inputs/input/ruin.1221 
echo ">>>>>>>>running test 3912"
./replace_wrapper '@n' '&[0-9]'  < ./inputs/input/ruin.138 
echo ">>>>>>>>running test 3913"
./replace_wrapper '@n' '&[LmRA3o6:cW<[RU@3H*M;Z:.;y'\'',gC?= VPAFmAF'\'':1)z3<<'  < ./inputs/input/ruin.377 
echo ">>>>>>>>running test 3914"
./replace_wrapper '@n' '&\/Jo n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 3915"
./replace_wrapper '@n' '&_W$'  < ./inputs/input/ruin.1198 
echo ">>>>>>>>running test 3916"
./replace_wrapper '@n' '&`'  < ./inputs/input/ruin.1158 
echo ">>>>>>>>running test 3917"
./replace_wrapper '@n' '&`'  < ./inputs/input/ruin.278 
echo ">>>>>>>>running test 3918"
./replace_wrapper '@n' '&a@%'  < ./inputs/temp-test/1498.inp.642.1 
echo ">>>>>>>>running test 3919"
./replace_wrapper '@n' '&a@%'  < ./inputs/temp-test/1499.inp.642.2 
echo ">>>>>>>>running test 3920"
./replace_wrapper '@n' '&b'  < ./inputs/input/ruin.273 
echo ">>>>>>>>running test 3921"
./replace_wrapper '@n' '&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 3922"
./replace_wrapper '@n' '&e'  < ./inputs/input/ruin.280 
echo ">>>>>>>>running test 3923"
./replace_wrapper '@n' '&f$BLCD}tiigf@3'  < ./inputs/input/ruin.553 
echo ">>>>>>>>running test 3924"
./replace_wrapper '@n' '&h'  < ./inputs/input/ruin.288 
echo ">>>>>>>>running test 3925"
./replace_wrapper '@n' '&i+'\''s OXxRu~W2bMVQrfx+GT$4>}5J5XNph:`xe! zY'  < ./inputs/input/ruin.275 
echo ">>>>>>>>running test 3926"
./replace_wrapper '@n' '&lk'  < ./inputs/input/ruin.277 
echo ">>>>>>>>running test 3927"
./replace_wrapper '@n' '&o n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 3928"
./replace_wrapper '@n' '&p'  < ./inputs/input/ruin.276 
echo ">>>>>>>>running test 3929"
./replace_wrapper '@n' '&q'  < ./inputs/input/ruin.1194 
echo ">>>>>>>>running test 3930"
./replace_wrapper '@n' '&q'  < ./inputs/input/ruin.539 
echo ">>>>>>>>running test 3931"
./replace_wrapper '@n' '&u>`Y~4'\''!d;?[6eMR*)X+D>xU%AUWv8y$.jdQ@jBn='\''(J8f,KIL4L'  < ./inputs/input/ruin.285 
echo ">>>>>>>>running test 3932"
./replace_wrapper '@n' '&u@@LZ'  < ./inputs/input/ruin.1188 
echo ">>>>>>>>running test 3933"
./replace_wrapper '@n' '&w|'  < ./inputs/input/ruin.1201 
echo ">>>>>>>>running test 3934"
./replace_wrapper '@n' '&xUW$3UOKEX2a@El#=-t[^R%"'  < ./inputs/input/ruin.290 
echo ">>>>>>>>running test 3935"
./replace_wrapper '@n' '&y#k-llLWk'  < ./inputs/input/ruin.279 
echo ">>>>>>>>running test 3936"
./replace_wrapper '@n' ''  < ./inputs/input/ruin.269 
echo ">>>>>>>>running test 3937"
./replace_wrapper '@n' ''  < ./inputs/input/ruin.831 
echo ">>>>>>>>running test 3938"
./replace_wrapper '@n' ''\''Y8_V~GP,no<Nwn1&d2*Mi^j4.Fx*Fb&sC#;9okUMY`</KdUj2(MQo'  < ./inputs/input/ruin.376 
echo ">>>>>>>>running test 3939"
./replace_wrapper '@n' '( $V0B&16|L'  < ./inputs/input/ruin.270 
echo ">>>>>>>>running test 3940"
./replace_wrapper '@n' '('  < ./inputs/input/ruin.1970 
echo ">>>>>>>>running test 3941"
./replace_wrapper '@n' ')clYn/q$'  < ./inputs/input/ruin.1688 
echo ">>>>>>>>running test 3942"
./replace_wrapper '@n' '*U&:an"OMpY#Ei1WdZ>`'  < ./inputs/input/ruin.1277 
echo ">>>>>>>>running test 3943"
./replace_wrapper '@n' '-[&b0:'  < ./inputs/input/ruin.1020 
echo ">>>>>>>>running test 3944"
./replace_wrapper '@n' '.'  < ./inputs/input/ruin.1999 
echo ">>>>>>>>running test 3945"
./replace_wrapper '@n' '.^&u>`Y~4'\''!d;?[6eMR*)X+D>xU%AUWv8y$.jdQ@jBn='\''(J8f,KIL4L'  < ./inputs/input/ruin.285 
echo ">>>>>>>>running test 3946"
./replace_wrapper '@n' '/&q'  < ./inputs/input/ruin.539 
echo ">>>>>>>>running test 3947"
./replace_wrapper '@n' '0'  < ./inputs/input/ruin.779 
echo ">>>>>>>>running test 3948"
./replace_wrapper '@n' '1gF=&n$u]g/C}w8N6'  < ./inputs/input/ruin.1207 
echo ">>>>>>>>running test 3949"
./replace_wrapper '@n' '1no9B60hA0-+uTMrfp/uzB4.|#*H+7q3Qy@/YT"b2b5['  < ./inputs/input/ruin.1268 
echo ">>>>>>>>running test 3950"
./replace_wrapper '@n' '2BEj`7d>hbD&m?T;b)0;'  < ./inputs/input/ruin.1803 
echo ">>>>>>>>running test 3951"
./replace_wrapper '@n' '2k|h=&-kA{I^m)l>oO{G'  < ./inputs/input/ruin.1029 
echo ">>>>>>>>running test 3952"
./replace_wrapper '@n' '2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G'  < ./inputs/input/ruin.1029 
echo ">>>>>>>>running test 3953"
./replace_wrapper '@n' '3&4'  < ./inputs/input/ruin.281 
echo ">>>>>>>>running test 3954"
./replace_wrapper '@n' '373Vm*EWixkNRI/J1'  < ./inputs/input/ruin.1270 
echo ">>>>>>>>running test 3955"
./replace_wrapper '@n' '4 '  < ./inputs/input/ruin.251 
echo ">>>>>>>>running test 3956"
./replace_wrapper '@n' '60&<9:5*f8GULK>.:&6r]A'  < ./inputs/input/ruin.1321 
echo ">>>>>>>>running test 3957"
./replace_wrapper '@n' '7KOgdHVS~e*RbgQ>M{]|d'  < ./inputs/input/ruin.1195 
echo ">>>>>>>>running test 3958"
./replace_wrapper '@n' '8,%wu%Hm=zS'  < ./inputs/input/ruin.1070 
echo ">>>>>>>>running test 3959"
./replace_wrapper '@n' '9&@t@t'  < ./inputs/input/ruin.617 
echo ">>>>>>>>running test 3960"
./replace_wrapper '@n' '98l&xUW$3UOKEX2a@El#=-t[^R%"'  < ./inputs/input/ruin.290 
echo ">>>>>>>>running test 3961"
./replace_wrapper '@n' ':'  < ./inputs/input/ruin.1828 
echo ">>>>>>>>running test 3962"
./replace_wrapper '@n' ':(4lCfr['  < ./inputs/input/ruin.1012 
echo ">>>>>>>>running test 3963"
./replace_wrapper '@n' ';&.St7,*,FY'\''e2 #PQt_JAdEVyBorNLKtG4,nKOUCw{Tr/J2d]Omr-PWjk+'  < ./inputs/input/ruin.98 
echo ">>>>>>>>running test 3964"
./replace_wrapper '@n' ';S&=:zD+0/]VKClfA;8d-(~bTN"m'  < ./inputs/input/ruin.1086 
echo ">>>>>>>>running test 3965"
./replace_wrapper '@n' ';S=:zD+0/]VKClfA;8d-(~bTN"m'  < ./inputs/input/ruin.1086 
echo ">>>>>>>>running test 3966"
./replace_wrapper '@n' ';g&.}:{js8R^#VPXDq2$?H7JEik*Lg_}N\ I(T"'  < ./inputs/input/ruin.1180 
echo ">>>>>>>>running test 3967"
./replace_wrapper '@n' '<'  < ./inputs/input/ruin.902 
echo ">>>>>>>>running test 3968"
./replace_wrapper '@n' '<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjs<u2]r/0cjsO'  < ./inputs/input/ruin.1045 
echo ">>>>>>>>running test 3969"
./replace_wrapper '@n' '=&lk'  < ./inputs/input/ruin.277 
echo ">>>>>>>>running test 3970"
./replace_wrapper '@n' '?&<N#N4zMu+/?$@,"oa`nt=1CL!g3y*(k((w!.4aPc>wSP2w2'  < ./inputs/input/ruin.487 
echo ">>>>>>>>running test 3971"
./replace_wrapper '@n' '?<N#N4zMu+/?$@,"oa`nt=1CL!g3y*(k((w!.4aPc>wSP2w2'  < ./inputs/input/ruin.487 
echo ">>>>>>>>running test 3972"
./replace_wrapper '@n' '@$Gd4I<bvLOk~I[u6ZJBh.'  < ./inputs/input/ruin.1637 
echo ">>>>>>>>running test 3973"
./replace_wrapper '@n' '@nS&1GvSwz{HEo.N'  < ./inputs/input/ruin.1190 
echo ">>>>>>>>running test 3974"
./replace_wrapper '@n' '@t@t&k*Lg_}N\ I(T"'  < ./inputs/input/ruin.1180 
echo ">>>>>>>>running test 3975"
./replace_wrapper '@n' '@{3y4ujD#rXanr\k6Ue_wmnt@Z#,%+({h'  < ./inputs/input/ruin.1014 
echo ">>>>>>>>running test 3976"
./replace_wrapper '@n' 'BVm'  < ./inputs/input/ruin.1894 
echo ">>>>>>>>running test 3977"
./replace_wrapper '@n' 'D&'  < ./inputs/input/ruin.1196 
echo ">>>>>>>>running test 3978"
./replace_wrapper '@n' 'E&'  < ./inputs/input/ruin.1184 
echo ">>>>>>>>running test 3979"
./replace_wrapper '@n' 'F'  < ./inputs/input/ruin.1157 
echo ">>>>>>>>running test 3980"
./replace_wrapper '@n' 'F]"8`#tLmW1FGw`iK4QO;MuiQ4{%R:h2`^Ndy W4p?5Yd9N%7tp~'  < ./inputs/input/ruin.154 
echo ">>>>>>>>running test 3981"
./replace_wrapper '@n' 'H&'  < ./inputs/input/ruin.1206 
echo ">>>>>>>>running test 3982"
./replace_wrapper '@n' 'H&@t@t@t'  < ./inputs/input/ruin.460 
echo ">>>>>>>>running test 3983"
./replace_wrapper '@n' 'H&b'  < ./inputs/input/ruin.273 
echo ">>>>>>>>running test 3984"
./replace_wrapper '@n' 'KO#|1)uX@Dy>+3j`g)D_SM "=l!3{n2g<y'  < ./inputs/input/ruin.612 
echo ">>>>>>>>running test 3985"
./replace_wrapper '@n' 'L=&XW&%JwE}YEQ"vBljIYg}l'  < ./inputs/input/ruin.494 
echo ">>>>>>>>running test 3986"
./replace_wrapper '@n' 'LK@d-'\'':KkM_v8WWuE!S'  < ./inputs/input/ruin.51 
echo ">>>>>>>>running test 3987"
./replace_wrapper '@n' 'M&'  < ./inputs/input/ruin.1185 
echo ">>>>>>>>running test 3988"
./replace_wrapper '@n' 'M'  < ./inputs/input/ruin.613 
echo ">>>>>>>>running test 3989"
./replace_wrapper '@n' 'N&A'  < ./inputs/input/ruin.293 
echo ">>>>>>>>running test 3990"
./replace_wrapper '@n' 'O'  < ./inputs/input/ruin.1045 
echo ">>>>>>>>running test 3991"
./replace_wrapper '@n' 'P&p'  < ./inputs/input/ruin.276 
echo ">>>>>>>>running test 3992"
./replace_wrapper '@n' 'P'  < ./inputs/input/ruin.276 
echo ">>>>>>>>running test 3993"
./replace_wrapper '@n' 'R9@ g]NIAErVbSSr=~G~@`ju?Q~]HAWjufdNY6.k}s'  < ./inputs/input/ruin.823 
echo ">>>>>>>>running test 3994"
./replace_wrapper '@n' 'S&1G=SPJxh*Gd}R$vSwz{HEo.N'  < ./inputs/input/ruin.1190 
echo ">>>>>>>>running test 3995"
./replace_wrapper '@n' 'S1G=&SPJxh*Gd}R$vSwz{HEo.N'  < ./inputs/input/ruin.1190 
echo ">>>>>>>>running test 3996"
./replace_wrapper '@n' 'TbjIYx|Q&}}TKt5QS<'  < ./inputs/input/ruin.1187 
echo ">>>>>>>>running test 3997"
./replace_wrapper '@n' 'TbjIYx|Qb}}&TKt5QS<'  < ./inputs/input/ruin.1187 
echo ">>>>>>>>running test 3998"
./replace_wrapper '@n' 'U&'  < ./inputs/input/ruin.1193 
echo ">>>>>>>>running test 3999"
./replace_wrapper '@n' 'VmO1MS/z/7-!)sG#\ Pl|1`0$B*e'  < ./inputs/input/ruin.337 
echo ">>>>>>>>running test 4000"
./replace_wrapper '@n' 'X'  < ./inputs/input/ruin.321 
echo ">>>>>>>>running test 4001"
./replace_wrapper '@n' 'Yb`=<aVf_kx\zxE!_^(2{XTG#'  < ./inputs/input/ruin.256 
echo ">>>>>>>>running test 4002"
./replace_wrapper '@n' '[0-9]&&[a-z]'  < ./inputs/input/ruin.144 
echo ">>>>>>>>running test 4003"
./replace_wrapper '@n' '[0-9]&[a-z]'  < ./inputs/input/ruin.144 
echo ">>>>>>>>running test 4004"
./replace_wrapper '@n' '[0-9]@t@n@@TbjIYx|Q&}}TKt5QS<'  < ./inputs/input/ruin.1187 
echo ">>>>>>>>running test 4005"
./replace_wrapper '@n' '[^2-9]!&{HEo.N'  < ./inputs/input/ruin.1190 
echo ">>>>>>>>running test 4006"
./replace_wrapper '@n' '\/J&o n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 4007"
./replace_wrapper '@n' '\/Jo n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]&'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 4008"
./replace_wrapper '@n' '^K'  < ./inputs/input/ruin.1774 
echo ">>>>>>>>running test 4009"
./replace_wrapper '@n' '`&`'  < ./inputs/input/ruin.278 
echo ">>>>>>>>running test 4010"
./replace_wrapper '@n' 'a&'  < ./inputs/temp-test/329.inp.146.1 
echo ">>>>>>>>running test 4011"
./replace_wrapper '@n' 'a&'  < ./inputs/temp-test/332.inp.146.4 
echo ">>>>>>>>running test 4012"
./replace_wrapper '@n' 'a&L'  < ./inputs/input/ruin.274 
echo ">>>>>>>>running test 4013"
./replace_wrapper '@n' 'a&`'  < ./inputs/input/ruin.1158 
echo ">>>>>>>>running test 4014"
./replace_wrapper '@n' 'a&y#k-llLWk'  < ./inputs/input/ruin.279 
echo ">>>>>>>>running test 4015"
./replace_wrapper '@n' 'a'  < ./inputs/input/ruin.210 
echo ">>>>>>>>running test 4016"
./replace_wrapper '@n' 'cfP M%;7}!g8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf8KNy,h0_sbVxG=nOf^yda^u5]__z&`%FlMJ7'  < ./inputs/input/ruin.1039 
echo ">>>>>>>>running test 4017"
./replace_wrapper '@n' 'cfP M%;7}!g^yda^u5]__z&`%FlMJ7'  < ./inputs/input/ruin.1039 
echo ">>>>>>>>running test 4018"
./replace_wrapper '@n' 'd & '\''Ts/gEB(0=$(}A.AVje3x'  < ./inputs/input/ruin.1202 
echo ">>>>>>>>running test 4019"
./replace_wrapper '@n' 'd'  < ./inputs/input/ruin.326 
echo ">>>>>>>>running test 4020"
./replace_wrapper '@n' 'eT@aR6@4AoERO"scF)a"dqsE)GaEU$d~$U<<zIU>P>V,&'  < ./inputs/input/ruin.1183 
echo ">>>>>>>>running test 4021"
./replace_wrapper '@n' 'fg~4&[LmRA3o6:cW<[RU@3H*M;Z:.;y'\'',gC?= VPAFmAF'\'':1)z3<<'  < ./inputs/input/ruin.377 
echo ">>>>>>>>running test 4022"
./replace_wrapper '@n' 'g&h'  < ./inputs/input/ruin.288 
echo ">>>>>>>>running test 4023"
./replace_wrapper '@n' 'gt3%!lio[y2P9x'  < ./inputs/input/ruin.806 
echo ">>>>>>>>running test 4024"
./replace_wrapper '@n' 'h&[0-9]'  < ./inputs/input/ruin.1221 
echo ">>>>>>>>running test 4025"
./replace_wrapper '@n' 'h'  < ./inputs/input/ruin.826 
echo ">>>>>>>>running test 4026"
./replace_wrapper '@n' 'i&'  < ./inputs/input/ruin.1178 
echo ">>>>>>>>running test 4027"
./replace_wrapper '@n' 'i&@@[^6-9]'  < ./inputs/input/ruin.1178 
echo ">>>>>>>>running test 4028"
./replace_wrapper '@n' 'k#\pku:-g*G [0-9]@t@@;iMw3]&'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 4029"
./replace_wrapper '@n' 'k&e'  < ./inputs/input/ruin.280 
echo ">>>>>>>>running test 4030"
./replace_wrapper '@n' 'lQ]IzWyseh>aL@l}lF'  < ./inputs/input/ruin.230 
echo ">>>>>>>>running test 4031"
./replace_wrapper '@n' 'm&'  < ./inputs/input/ruin.1181 
echo ">>>>>>>>running test 4032"
./replace_wrapper '@n' 'm'  < ./inputs/input/ruin.1026 
echo ">>>>>>>>running test 4033"
./replace_wrapper '@n' 'meEqXG~#(1!P1'  < ./inputs/input/ruin.726 
echo ">>>>>>>>running test 4034"
./replace_wrapper '@n' 'n&f$BLCD}tiigf@3'  < ./inputs/input/ruin.553 
echo ">>>>>>>>running test 4035"
./replace_wrapper '@n' 'o&6'  < ./inputs/input/ruin.284 
echo ">>>>>>>>running test 4036"
./replace_wrapper '@n' 'q&'  < ./inputs/input/ruin.1194 
echo ">>>>>>>>running test 4037"
./replace_wrapper '@n' 'q*@n&+ovX g    [0-98]'  < ./inputs/input/ruin.144 
echo ">>>>>>>>running test 4038"
./replace_wrapper '@n' 'q*PRdtw$&+ovX guAeILM7M'  < ./inputs/input/ruin.144 
echo ">>>>>>>>running test 4039"
./replace_wrapper '@n' 'r5'  < ./inputs/input/ruin.1177 
echo ">>>>>>>>running test 4040"
./replace_wrapper '@n' 'tqyi460w^}~C$R<'  < ./inputs/input/ruin.943 
echo ">>>>>>>>running test 4041"
./replace_wrapper '@n' 'u>{%9; ?S3&u@@LZ'  < ./inputs/input/ruin.1188 
echo ">>>>>>>>running test 4042"
./replace_wrapper '@n' 'vwGsq%:a<(5`c[h6 W;I[sk;'\''2{+~!jW/n'  < ./inputs/input/ruin.1372 
echo ">>>>>>>>running test 4043"
./replace_wrapper '@n' 'w'  < ./inputs/input/ruin.7 
echo ">>>>>>>>running test 4044"
./replace_wrapper '@n' 'y$Z1<[1_6wHLcYZnEoC/JY$%O0tKDCdx>(9"'  < ./inputs/input/ruin.710 
echo ">>>>>>>>running test 4045"
./replace_wrapper '@n' 'y&8sdW9T'  < ./inputs/input/ruin.1065 
echo ">>>>>>>>running test 4046"
./replace_wrapper '@n' '{G8'  < ./inputs/input/ruin.32 
echo ">>>>>>>>running test 4047"
./replace_wrapper '@n' '|M&i+'\''s OXxRu~W2bMVQrfx+GT$4>}5J5XNph:`xe! zY'  < ./inputs/input/ruin.275 
echo ">>>>>>>>running test 4048"
./replace_wrapper '@n'\''[^z-}]' '='  < ./inputs/input/ruin.277 
echo ">>>>>>>>running test 4049"
./replace_wrapper '@n*$' '.'  < ./inputs/input/ruin.1999 
echo ">>>>>>>>running test 4050"
./replace_wrapper '@n*$' 'R,35{f9=L?~on%ox#y{V'  < ./inputs/input/ruin.1511 
echo ">>>>>>>>running test 4051"
./replace_wrapper '@n*' 'B(=9uHKrS'  < ./inputs/input/ruin.106 
echo ">>>>>>>>running test 4052"
./replace_wrapper '@n*' 'a@nb@tc'  < ./inputs/temp-test/747.inp.320.1 
echo ">>>>>>>>running test 4053"
./replace_wrapper '@n**' 'GbrNP(q!N'  < ./inputs/input/ruin.27 
echo ">>>>>>>>running test 4054"
./replace_wrapper '@n*-@*@@*[a-c[0-9][^a-][^9-B]--[^--z]' 'a@n'  < ./inputs/temp-test/2220.inp.941.1 
echo ">>>>>>>>running test 4055"
./replace_wrapper '@n*-@*@@*[a-c[0-9][^a-][^9-B]--[^--z]' 'a@n'  < ./inputs/temp-test/2221.inp.941.2 
echo ">>>>>>>>running test 4056"
./replace_wrapper '@n*-@*@@*[a-c[0-9][^a-][^9-B]--[^--z]' 'a@n'  < ./inputs/temp-test/2222.inp.941.3 
echo ">>>>>>>>running test 4057"
./replace_wrapper '@n*[0-9]' '&a@%'  < ./inputs/temp-test/2211.inp.937.1 
echo ">>>>>>>>running test 4058"
./replace_wrapper '@n*[0-9]' '&a@%'  < ./inputs/temp-test/2212.inp.937.2 
echo ">>>>>>>>running test 4059"
./replace_wrapper '@n*[^0-9]?--[^a--@*' '@t'  < ./inputs/temp-test/1062.inp.457.1 
echo ">>>>>>>>running test 4060"
./replace_wrapper '@n*[^0-9]?--[^a--@*' '@t'  < ./inputs/temp-test/1063.inp.457.2 
echo ">>>>>>>>running test 4061"
./replace_wrapper '@n*[^0-9]?--[^a--@*' '@t'  < ./inputs/temp-test/1064.inp.457.3 
echo ">>>>>>>>running test 4062"
./replace_wrapper '@n*[^a-c]$' 'b@t'  < ./inputs/temp-test/1921.inp.816.9 
echo ">>>>>>>>running test 4063"
./replace_wrapper '@n*[^a-c]' 'b@t'  < ./inputs/temp-test/1920.inp.816.1 
echo ">>>>>>>>running test 4064"
./replace_wrapper '@n?' 'NEW'  < ./inputs/temp-test/614.inp.265.1 
echo ">>>>>>>>running test 4065"
./replace_wrapper '@n?' 'NEW'  < ./inputs/temp-test/615.inp.265.3 
echo ">>>>>>>>running test 4066"
./replace_wrapper '@n?' 'NEW'  < ./inputs/temp-test/616.inp.265.4 
echo ">>>>>>>>running test 4067"
./replace_wrapper '@n?' '_'  < ./inputs/input/ruin.991 
echo ">>>>>>>>running test 4068"
./replace_wrapper '@n?' 'a@n'  < ./inputs/temp-test/2259.inp.958.1 
echo ">>>>>>>>running test 4069"
./replace_wrapper '@n?' 'a@n'  < ./inputs/temp-test/2260.inp.958.2 
echo ">>>>>>>>running test 4070"
./replace_wrapper '@n?' 'a@n'  < ./inputs/temp-test/2261.inp.958.3 
echo ">>>>>>>>running test 4071"
./replace_wrapper '@n?' 'yy'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4072"
./replace_wrapper '@n@@$' ''\'''  < ./inputs/input/ruin.1374 
echo ">>>>>>>>running test 4073"
./replace_wrapper '@n@@' '_/vHv[\~S6P)'  < ./inputs/input/ruin.1354 
echo ">>>>>>>>running test 4074"
./replace_wrapper '@n@@;@@' '60<9:5*f8GULK>.:&6r]A'  < ./inputs/input/ruin.1321 
echo ">>>>>>>>running test 4075"
./replace_wrapper '@n@@?' '09xj8*p{[Tk=E|P~H.Ge{Py<Z'  < ./inputs/input/ruin.35 
echo ">>>>>>>>running test 4076"
./replace_wrapper '@nPhqi}@,5rY]~M\ Wz]`M0)y8H?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]t]*[@t@][9-B]-*[0-9]][?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0' 'd'  < ./inputs/input/ruin.326 
echo ">>>>>>>>running test 4077"
./replace_wrapper '@n[>-AH]' 'x'  < ./inputs/input/ruin.1019 
echo ">>>>>>>>running test 4078"
./replace_wrapper '@n[^c-a]' ')V|'  < ./inputs/input/ruin.445 
echo ">>>>>>>>running test 4079"
./replace_wrapper '@n[a-c]' 'a@nb@tc'  < ./inputs/temp-test/954.inp.411.1 
echo ">>>>>>>>running test 4080"
./replace_wrapper '@n[a-c]' 'a@nb@tc'  < ./inputs/temp-test/955.inp.411.3 
echo ">>>>>>>>running test 4081"
./replace_wrapper '@n[a-z][0-9]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4082"
./replace_wrapper '@n[c-a]' 'H)R{PA:4}IkCZ\9NA$V@if]b]lcL*](B]-#S'  < ./inputs/input/ruin.94 
echo ">>>>>>>>running test 4083"
./replace_wrapper '@n][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9]' 'X'  < ./inputs/input/ruin.321 
echo ">>>>>>>>running test 4084"
./replace_wrapper '@o' ''  < ./inputs/input/ruin.928 
echo ">>>>>>>>running test 4085"
./replace_wrapper '@p' 'l)I#$SnVq^6"2XS{#Gu`w'  < ./inputs/input/ruin.1512 
echo ">>>>>>>>running test 4086"
./replace_wrapper '@r@@' 'n<Hq8Z%6sxa'  < ./inputs/input/ruin.959 
echo ">>>>>>>>running test 4087"
./replace_wrapper '@t$' ')Y Tr\&_%MYI-Hvz!p];s'  < ./inputs/input/ruin.1764 
echo ">>>>>>>>running test 4088"
./replace_wrapper '@t$' '@%@&'  < ./inputs/temp-test/682.inp.296.9 
echo ">>>>>>>>running test 4089"
./replace_wrapper '@t$' 'VQ7UIU&=z]J 3BvzQd+'\''%P\]iuS{Q)nzE'  < ./inputs/input/ruin.1 
echo ">>>>>>>>running test 4090"
./replace_wrapper '@t' ' {'  < ./inputs/input/ruin.1418 
echo ">>>>>>>>running test 4091"
./replace_wrapper '@t' '"Q'  < ./inputs/input/ruin.110 
echo ">>>>>>>>running test 4092"
./replace_wrapper '@t' '$ybvgd HC9i)raWA*pH8#5auxQ\y'\''+Gxa3qV|vWk'  < ./inputs/input/ruin.822 
echo ">>>>>>>>running test 4093"
./replace_wrapper '@t' ''  < ./inputs/input/ruin.968 
echo ">>>>>>>>running test 4094"
./replace_wrapper '@t' ''  < ./inputs/temp-test/266.inp.118.1 
echo ">>>>>>>>running test 4095"
./replace_wrapper '@t' ''\'''  < ./inputs/input/ruin.874 
echo ">>>>>>>>running test 4096"
./replace_wrapper '@t' '.'  < ./inputs/input/ruin.1244 
echo ">>>>>>>>running test 4097"
./replace_wrapper '@t' '/q'  < ./inputs/input/ruin.539 
echo ">>>>>>>>running test 4098"
./replace_wrapper '@t' '0'  < ./inputs/input/ruin.1465 
echo ">>>>>>>>running test 4099"
./replace_wrapper '@t' '0S-'  < ./inputs/input/ruin.1103 
echo ">>>>>>>>running test 4100"
./replace_wrapper '@t' '4_'  < ./inputs/input/ruin.70 
echo ">>>>>>>>running test 4101"
./replace_wrapper '@t' '@%@&'  < ./inputs/temp-test/681.inp.296.1 
echo ">>>>>>>>running test 4102"
./replace_wrapper '@t' 'J'  < ./inputs/input/ruin.93 
echo ">>>>>>>>running test 4103"
./replace_wrapper '@t' 'W&1c:QJf($UO~?u(`y H..L/?~3(*qLpVqz0I$\;u='  < ./inputs/input/ruin.895 
echo ">>>>>>>>running test 4104"
./replace_wrapper '@t' 'YJ$cMOTGZkYU_qL"&a `#c;9Hlainkh$H|%pPBg)No ~wdIY>*09OY-Xw=sD]6FI'  < ./inputs/input/ruin.919 
echo ">>>>>>>>running test 4105"
./replace_wrapper '@t' '['  < ./inputs/input/ruin.570 
echo ">>>>>>>>running test 4106"
./replace_wrapper '@t' '\dsn|a; |+['  < ./inputs/input/ruin.1564 
echo ">>>>>>>>running test 4107"
./replace_wrapper '@t' 'a'  < ./inputs/input/ruin.1230 
echo ">>>>>>>>running test 4108"
./replace_wrapper '@t' 'awRjE|M*3XDH%k!OG%su\7'\''h:r@xuKZ%'  < ./inputs/input/ruin.1400 
echo ">>>>>>>>running test 4109"
./replace_wrapper '@t' 't'  < ./inputs/input/ruin.942 
echo ">>>>>>>>running test 4110"
./replace_wrapper '@t' 'xDC'  < ./inputs/input/ruin.156 
echo ">>>>>>>>running test 4111"
./replace_wrapper '@t' '}'  < ./inputs/input/ruin.937 
echo ">>>>>>>>running test 4112"
./replace_wrapper '@t'\''lm@GD@@' 'Y>qrcPjB9#V'  < ./inputs/input/ruin.1682 
echo ">>>>>>>>running test 4113"
./replace_wrapper '@t*$' '.'  < ./inputs/input/ruin.1244 
echo ">>>>>>>>running test 4114"
./replace_wrapper '@t*- *?[^a--]-c*?$' '&'  < ./inputs/temp-test/1730.inp.735.8 
echo ">>>>>>>>running test 4115"
./replace_wrapper '@t*- *?[^a--]-c*?' '&'  < ./inputs/temp-test/1727.inp.735.1 
echo ">>>>>>>>running test 4116"
./replace_wrapper '@t*- *?[^a--]-c*?' '&'  < ./inputs/temp-test/1728.inp.735.2 
echo ">>>>>>>>running test 4117"
./replace_wrapper '@t*- *?[^a--]-c*?' '&'  < ./inputs/temp-test/1729.inp.735.3 
echo ">>>>>>>>running test 4118"
./replace_wrapper '@t*-@[*-*-' '&a@%'  < ./inputs/temp-test/1633.inp.695.1 
echo ">>>>>>>>running test 4119"
./replace_wrapper '@t*-@[*-*-' '&a@%'  < ./inputs/temp-test/1634.inp.695.3 
echo ">>>>>>>>running test 4120"
./replace_wrapper '@t*?' '@%&a'  < ./inputs/temp-test/1170.inp.504.1 
echo ">>>>>>>>running test 4121"
./replace_wrapper '@t*?' '@%&a'  < ./inputs/temp-test/1171.inp.504.2 
echo ">>>>>>>>running test 4122"
./replace_wrapper '@t*?' 'a@nb@tc'  < ./inputs/temp-test/121.inp.57.1 
echo ">>>>>>>>running test 4123"
./replace_wrapper '@t*?' 'a@nb@tc'  < ./inputs/temp-test/122.inp.57.2 
echo ">>>>>>>>running test 4124"
./replace_wrapper '@t*?' 'a@nb@tc'  < ./inputs/temp-test/123.inp.57.3 
echo ">>>>>>>>running test 4125"
./replace_wrapper '@t*[^--z][^0-9]?[^a-c]-' '&'  < ./inputs/temp-test/2223.inp.942.1 
echo ">>>>>>>>running test 4126"
./replace_wrapper '@t?' 'yy'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4127"
./replace_wrapper '@t@n' '/&q'  < ./inputs/input/ruin.539 
echo ">>>>>>>>running test 4128"
./replace_wrapper '@t@n**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4129"
./replace_wrapper '@t@t**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4130"
./replace_wrapper '@t[^0-9]' '8:,4]/)V7{X`&WCS"*eV#CiLR?Ey@wNa&*]Cm=?qNu/|~.wD'  < ./inputs/input/ruin.668 
echo ">>>>>>>>running test 4131"
./replace_wrapper '@t[_-z][^9-B]--@**?-' 'a@nb@tc'  < ./inputs/temp-test/702.inp.304.1 
echo ">>>>>>>>running test 4132"
./replace_wrapper '@t[_-z][^9-B]--@**?-' 'a@nb@tc'  < ./inputs/temp-test/703.inp.304.2 
echo ">>>>>>>>running test 4133"
./replace_wrapper '@t[a-z]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4134"
./replace_wrapper '@ta[0-9]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4135"
./replace_wrapper '@v' '['  < ./inputs/input/ruin.660 
echo ">>>>>>>>running test 4136"
./replace_wrapper '@v' 'uQhw$/lp,W6|T.kU[ali/|!:*<'\'''\''fd*qm0L}CmT^_<F@A5_P]'\''%P$nTZ'  < ./inputs/input/ruin.1131 
echo ">>>>>>>>running test 4137"
./replace_wrapper '@wT\W[tlZ@@' 'F'  < ./inputs/input/ruin.1811 
echo ">>>>>>>>running test 4138"
./replace_wrapper '@x' 'E2[HVM]HQd4'\''S'  < ./inputs/input/ruin.940 
echo ">>>>>>>>running test 4139"
./replace_wrapper '@z' '&DA%CzwMgf6f9r4:>q"borRtcvj@,P$7J Iatw|%n<DK-a,n'  < ./inputs/input/ruin.876 
echo ">>>>>>>>running test 4140"
./replace_wrapper '@z' '/'  < ./inputs/input/ruin.491 
echo ">>>>>>>>running test 4141"
./replace_wrapper '@|' ''\'''  < ./inputs/input/ruin.1305 
echo ">>>>>>>>running test 4142"
./replace_wrapper '@|' 'E)m'  < ./inputs/input/ruin.1373 
echo ">>>>>>>>running test 4143"
./replace_wrapper '@|' 'n'  < ./inputs/input/ruin.1691 
echo ">>>>>>>>running test 4144"
./replace_wrapper 'A' '9'  < ./inputs/input/ruin.214 
echo ">>>>>>>>running test 4145"
./replace_wrapper 'A' 'KT=b'  < ./inputs/input/ruin.655 
echo ">>>>>>>>running test 4146"
./replace_wrapper 'A' 'U~4'  < ./inputs/input/ruin.1451 
echo ">>>>>>>>running test 4147"
./replace_wrapper 'A*[9-B]' 'a&'  < ./inputs/temp-test/1415.inp.607.1 
echo ">>>>>>>>running test 4148"
./replace_wrapper 'A*[9-B]' 'a&'  < ./inputs/temp-test/1416.inp.607.3 
echo ">>>>>>>>running test 4149"
./replace_wrapper 'A*[^0-9]*' '@%@&'  < ./inputs/temp-test/35.inp.15.1 
echo ">>>>>>>>running test 4150"
./replace_wrapper 'A-' 'a@n'  < ./inputs/temp-test/1435.inp.616.1 
echo ">>>>>>>>running test 4151"
./replace_wrapper 'A-' 'a@n'  < ./inputs/temp-test/1436.inp.616.2 
echo ">>>>>>>>running test 4152"
./replace_wrapper 'A-' 'a@nb@tc'  < ./inputs/temp-test/981.inp.422.1 
echo ">>>>>>>>running test 4153"
./replace_wrapper 'A-' 'a@nb@tc'  < ./inputs/temp-test/982.inp.422.2 
echo ">>>>>>>>running test 4154"
./replace_wrapper 'A?' 'NEW'  < ./inputs/temp-test/1092.inp.471.1 
echo ">>>>>>>>running test 4155"
./replace_wrapper 'A?' 'NEW'  < ./inputs/temp-test/1093.inp.471.2 
echo ">>>>>>>>running test 4156"
./replace_wrapper 'A?' 'NEW'  < ./inputs/temp-test/1094.inp.471.4 
echo ">>>>>>>>running test 4157"
./replace_wrapper 'A?' 'n|G:]y;Zm{7<\G:]y;Zm{7<\33O~h_J33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_Jp'  < ./inputs/input/ruin.1043 
echo ">>>>>>>>running test 4158"
./replace_wrapper 'A?' 'n|p'  < ./inputs/input/ruin.1043 
echo ">>>>>>>>running test 4159"
./replace_wrapper 'A[0-9]?@**[a-c][^0-9]' '@%&a'  < ./inputs/temp-test/669.inp.292.1 
echo ">>>>>>>>running test 4160"
./replace_wrapper 'A[0-9]?@**[a-c][^0-9]' '@%&a'  < ./inputs/temp-test/670.inp.292.2 
echo ">>>>>>>>running test 4161"
./replace_wrapper 'A[0-9]?@**[a-c][^0-9]' '@%&a'  < ./inputs/temp-test/671.inp.292.3 
echo ">>>>>>>>running test 4162"
./replace_wrapper 'A[9-B]@*[9-B]---*-[_-z]-[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/985.inp.425.1 
echo ">>>>>>>>running test 4163"
./replace_wrapper 'A[9-B]@*[9-B]---*-[_-z]-[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/986.inp.425.2 
echo ">>>>>>>>running test 4164"
./replace_wrapper 'A[9-B]@*[9-B]---*-[_-z]-[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/987.inp.425.3 
echo ">>>>>>>>running test 4165"
./replace_wrapper 'A[9-B]@*[9-B]---*-[_-z]-[^0-9]' 'a@nb@tc'  < ./inputs/temp-test/988.inp.425.4 
echo ">>>>>>>>running test 4166"
./replace_wrapper 'A[^0-9]' '&'  < ./inputs/temp-test/443.inp.194.1 
echo ">>>>>>>>running test 4167"
./replace_wrapper 'A[^0-9]' '&'  < ./inputs/temp-test/444.inp.194.2 
echo ">>>>>>>>running test 4168"
./replace_wrapper 'A[^a-c[0-9]@[*' '&a@%'  < ./inputs/temp-test/589.inp.253.1 
echo ">>>>>>>>running test 4169"
./replace_wrapper 'A[^a-c[0-9]@[*' '&a@%'  < ./inputs/temp-test/590.inp.253.2 
echo ">>>>>>>>running test 4170"
./replace_wrapper 'A[^a-c[0-9]@[*' '&a@%'  < ./inputs/temp-test/591.inp.253.3 
echo ">>>>>>>>running test 4171"
./replace_wrapper 'A[a-c]' '&'  < ./inputs/temp-test/787.inp.339.1 
echo ">>>>>>>>running test 4172"
./replace_wrapper 'A[a-c]' '&'  < ./inputs/temp-test/788.inp.339.2 
echo ">>>>>>>>running test 4173"
./replace_wrapper 'AyxAyxg=po%]]@lhZe,xFP.{F:@m}I)|?,WAyxg=po%]]@lhZe,xFP.{F:@m}I)|?,WAyxg=po%]]@lhZe,xFP.{F:@m}I)|?,Wg=po%]]@lhZe,xFP.{F:@m}I)|?,W-[^0-9]*' 'a'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 4174"
./replace_wrapper 'B' 'Jp=p0sA?1'  < ./inputs/input/ruin.189 
echo ">>>>>>>>running test 4175"
./replace_wrapper 'B*' 'LOBA3nKpK'  < ./inputs/input/ruin.1540 
echo ">>>>>>>>running test 4176"
./replace_wrapper 'B@n' 'L/'  < ./inputs/input/ruin.1402 
echo ">>>>>>>>running test 4177"
./replace_wrapper 'C' '*KzXwIk7N2H\tMB0cSIU)2'  < ./inputs/input/ruin.261 
echo ">>>>>>>>running test 4178"
./replace_wrapper 'C' '/;ou%4-Wm7YQOcwuoq~qeI4u{J-'  < ./inputs/input/ruin.1794 
echo ">>>>>>>>running test 4179"
./replace_wrapper 'C' 'A@,)aS'  < ./inputs/input/ruin.255 
echo ">>>>>>>>running test 4180"
./replace_wrapper 'C' 'yel.mN.aMcN'  < ./inputs/input/ruin.141 
echo ">>>>>>>>running test 4181"
./replace_wrapper 'C' '|'  < ./inputs/input/ruin.263 
echo ">>>>>>>>running test 4182"
./replace_wrapper 'C*' '\'  < ./inputs/input/ruin.1504 
echo ">>>>>>>>running test 4183"
./replace_wrapper 'D' '%0,*G^75(j/ZwU5liE,jWQ((cq::$.B SGUhf% uN'  < ./inputs/input/ruin.1654 
echo ">>>>>>>>running test 4184"
./replace_wrapper 'D' '4'  < ./inputs/input/ruin.1266 
echo ">>>>>>>>running test 4185"
./replace_wrapper 'D' 'EI3"JSr"Wv1YW:m,fR@cfETz#.'\'''\'')fO#'  < ./inputs/input/ruin.717 
echo ">>>>>>>>running test 4186"
./replace_wrapper 'D' 'W"Kax!`^75zx?2@p4;(PY(a+_a)5rq*!x\i]-?+2Z"^b7b*0*ucQ}Pb )zRL24-Rc iB'  < ./inputs/input/ruin.920 
echo ">>>>>>>>running test 4187"
./replace_wrapper 'D'  < ./inputs/input/ruin.1266 
echo ">>>>>>>>running test 4188"
./replace_wrapper 'D*@@*' '~'  < ./inputs/input/ruin.1524 
echo ">>>>>>>>running test 4189"
./replace_wrapper 'D?' 'EI3"JSr"Wv1YW:m,fR@cfETz#.'\'''\'')fO#'  < ./inputs/input/ruin.717 
echo ">>>>>>>>running test 4190"
./replace_wrapper 'E@n' '0'  < ./inputs/input/ruin.313 
echo ">>>>>>>>running test 4191"
./replace_wrapper 'EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*EW-?-c*[0-9][a-c]-?A-?-c*[0-9][a-c]-?A-?-c*' 'l[*U(0T7mn'  < ./inputs/input/ruin.1352 
echo ">>>>>>>>running test 4192"
./replace_wrapper 'EW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c[0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-cEW-?-c0-9][a-c]-?A-?-c[0-9][a-c]-?A-?-c[0-9]*' 'l[*U(0T7mn'  < ./inputs/input/ruin.1352 
echo ">>>>>>>>running test 4193"
./replace_wrapper 'EW-[0-9][^0-9][@t][^@][9-B]-[0-9][^0-9][@t0-9]@@]@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t[9-B]-[0-@][9-B]-[0-9][^0-9][@t9][^0-9@][9-B]-[0-9][^0-9][@t@][9-B]-[0-9][^0-9][@t]*[@t@][9-B]-*[0-9][^0-9][@t' ''  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 4194"
./replace_wrapper 'F' 'O'  < ./inputs/input/ruin.1425 
echo ">>>>>>>>running test 4195"
./replace_wrapper 'F' 'WX<&l^t0+KUz-hc#38V(a+S5F w|V~[]SX-XF-1fiksa['  < ./inputs/input/ruin.620 
echo ">>>>>>>>running test 4196"
./replace_wrapper 'F' 'b'  < ./inputs/input/ruin.1271 
echo ">>>>>>>>running test 4197"
./replace_wrapper 'F*$' '[SnK:ScY3|gj)p9qF'  < ./inputs/input/ruin.1107 
echo ">>>>>>>>running test 4198"
./replace_wrapper 'G' '4N9'  < ./inputs/input/ruin.656 
echo ">>>>>>>>running test 4199"
./replace_wrapper 'G' '@TG<!e"F'  < ./inputs/input/ruin.814 
echo ">>>>>>>>running test 4200"
./replace_wrapper 'H' 'j-8m$"la'  < ./inputs/input/ruin.272 
echo ">>>>>>>>running test 4201"
./replace_wrapper 'H8WstZ' 'B'  < ./inputs/input/ruin.808 
echo ">>>>>>>>running test 4202"
./replace_wrapper 'K' 'C'  < ./inputs/input/ruin.1006 
echo ">>>>>>>>running test 4203"
./replace_wrapper 'K' '~yV0-:222<W/.gu!m4(Uzh;q{+F?H13VV=3'  < ./inputs/input/ruin.262 
echo ">>>>>>>>running test 4204"
./replace_wrapper 'L' '3'  < ./inputs/input/ruin.1662 
echo ">>>>>>>>running test 4205"
./replace_wrapper 'L' '\'  < ./inputs/input/ruin.54 
echo ">>>>>>>>running test 4206"
./replace_wrapper 'L' '|}HL'  < ./inputs/input/ruin.1345 
echo ">>>>>>>>running test 4207"
./replace_wrapper 'L]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY[0-9]*' '|}HL'  < ./inputs/input/ruin.1345 
echo ">>>>>>>>running test 4208"
./replace_wrapper 'M' 'Cj"P[Am~9?yD6$!CL]i35p`"R"/.6A*Y6b8#y)#}^"'  < ./inputs/input/ruin.467 
echo ">>>>>>>>running test 4209"
./replace_wrapper 'M' 'D'  < ./inputs/input/ruin.1199 
echo ">>>>>>>>running test 4210"
./replace_wrapper 'M' 'kE]3,iYi}HxHv$4g_4Un8pHk&TFT([dkb^2'  < ./inputs/input/ruin.840 
echo ">>>>>>>>running test 4211"
./replace_wrapper 'M' 'sizo5Mt^V>)QHSUlI}Zgpr(C.59OiQ;R>StQx95)ab]'  < ./inputs/input/ruin.193 
echo ">>>>>>>>running test 4212"
./replace_wrapper 'M' 'tx'\''%~x55x9M '  < ./inputs/input/ruin.1763 
echo ">>>>>>>>running test 4213"
./replace_wrapper 'N' '6Ws|xIfoO~JSwkEPBr8s/VE '  < ./inputs/input/ruin.1112 
echo ">>>>>>>>running test 4214"
./replace_wrapper 'N' '=$(4a6[U'  < ./inputs/input/ruin.423 
echo ">>>>>>>>running test 4215"
./replace_wrapper 'N' '`d+gs"uyr#OV+nf@.:.%V.?GP'  < ./inputs/input/ruin.1991 
echo ">>>>>>>>running test 4216"
./replace_wrapper 'N*$' '6Ws|xIfoO~JSwkEPBr8s/VE '  < ./inputs/input/ruin.1112 
echo ">>>>>>>>running test 4217"
./replace_wrapper 'N*$' '`d+gs"uyr#OV+nf@.:.%V.?GP'  < ./inputs/input/ruin.1991 
echo ">>>>>>>>running test 4218"
./replace_wrapper 'NEWNEW-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0[^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 4219"
./replace_wrapper 'NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW-[^0-9][0-9]A@@*' 'NEW'  < ./inputs/temp-test/1584.inp.675.1 
echo ">>>>>>>>running test 4220"
./replace_wrapper 'NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW-[^0-9][0-9]A@@*[^0-9][9-B]@@[^a-c]--[0-9][9-B][^a-]' 'NEW'  < ./inputs/temp-test/1584.inp.675.1 
echo ">>>>>>>>running test 4221"
./replace_wrapper 'NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW-[a-b]@A*' 'NEW'  < ./inputs/temp-test/1584.inp.675.1 
echo ">>>>>>>>running test 4222"
./replace_wrapper 'O' 'y'  < ./inputs/input/ruin.1367 
echo ">>>>>>>>running test 4223"
./replace_wrapper 'O' 'yxk&IcrOvB79'  < ./inputs/input/ruin.1324 
echo ">>>>>>>>running test 4224"
./replace_wrapper 'P' '#uy6z!;7!5}BP}j(]y|jFd!P8'  < ./inputs/input/ruin.530 
echo ">>>>>>>>running test 4225"
./replace_wrapper 'P' ')9'\''8k3|Ny$1(){7:uAh@|7_0P==NHS+k*aGI.Ii)Jo'  < ./inputs/input/ruin.1260 
echo ">>>>>>>>running test 4226"
./replace_wrapper 'P' '8dnIaK~FIW<<Q;Z7/e'  < ./inputs/input/ruin.709 
echo ">>>>>>>>running test 4227"
./replace_wrapper 'P' 'C%^&1c)TylhX%4~p?xve1crIe>QYS'  < ./inputs/input/ruin.1819 
echo ">>>>>>>>running test 4228"
./replace_wrapper 'P' 'H'  < ./inputs/input/ruin.1444 
echo ">>>>>>>>running test 4229"
./replace_wrapper 'Q' '['  < ./inputs/input/ruin.1505 
echo ">>>>>>>>running test 4230"
./replace_wrapper 'Q' 'a3ZF0Vxb'\''Lv@Ok8KPvf'  < ./inputs/input/ruin.699 
echo ">>>>>>>>running test 4231"
./replace_wrapper 'Q' 'wNqDw*g-Fd<<T<2_s<p7'  < ./inputs/input/ruin.535 
echo ">>>>>>>>running test 4232"
./replace_wrapper 'Q'\''A%ON,r[^Q]' ''  < ./inputs/input/ruin.1604 
echo ">>>>>>>>running test 4233"
./replace_wrapper 'Q?*'\''A%ON,r[^Q]' ''  < ./inputs/input/ruin.1604 
echo ">>>>>>>>running test 4234"
./replace_wrapper 'R' ' wMNQ]FT4jT:<n~RM@!U'  < ./inputs/input/ruin.540 
echo ">>>>>>>>running test 4235"
./replace_wrapper 'R' '.UxpVIk4j5.x#~A_?tJgxk(iJog'  < ./inputs/input/ruin.1469 
echo ">>>>>>>>running test 4236"
./replace_wrapper 'R' ';'  < ./inputs/input/ruin.1925 
echo ">>>>>>>>running test 4237"
./replace_wrapper 'R' '=IM'  < ./inputs/input/ruin.30 
echo ">>>>>>>>running test 4238"
./replace_wrapper 'S$' ',;38fvdrW+/RE#MD&O/^AZjdQz2X4GAE'  < ./inputs/input/ruin.102 
echo ">>>>>>>>running test 4239"
./replace_wrapper 'S' ')B.>,{|a%= :,/e]SAZV~B;$SmeJsO^(vS.D?5N%tI4~'  < ./inputs/input/ruin.1646 
echo ">>>>>>>>running test 4240"
./replace_wrapper 'S' '*q2"V]-tl5iK"z^gn'  < ./inputs/input/ruin.1004 
echo ">>>>>>>>running test 4241"
./replace_wrapper 'S' 'Mu4y5Jmglv#)'  < ./inputs/input/ruin.768 
echo ">>>>>>>>running test 4242"
./replace_wrapper 'S' 'b8SsJNUimj[N?#ok`'  < ./inputs/input/ruin.1021 
echo ">>>>>>>>running test 4243"
./replace_wrapper 'T' '*O'  < ./inputs/input/ruin.1603 
echo ">>>>>>>>running test 4244"
./replace_wrapper 'T?*' '*O'  < ./inputs/input/ruin.1603 
echo ">>>>>>>>running test 4245"
./replace_wrapper 'T@@' '.b'  < ./inputs/input/ruin.361 
echo ">>>>>>>>running test 4246"
./replace_wrapper 'T@@' 'n'  < ./inputs/input/ruin.854 
echo ">>>>>>>>running test 4247"
./replace_wrapper 'U' ''  < ./inputs/input/ruin.1571 
echo ">>>>>>>>running test 4248"
./replace_wrapper 'U' 'J'  < ./inputs/input/ruin.99 
echo ">>>>>>>>running test 4249"
./replace_wrapper 'U' 'f'  < ./inputs/input/ruin.798 
echo ">>>>>>>>running test 4250"
./replace_wrapper 'V' '#'  < ./inputs/input/ruin.1851 
echo ">>>>>>>>running test 4251"
./replace_wrapper 'V' '>'\''q'  < ./inputs/input/ruin.1273 
echo ">>>>>>>>running test 4252"
./replace_wrapper 'V' 'o'  < ./inputs/input/ruin.107 
echo ">>>>>>>>running test 4253"
./replace_wrapper 'V' 'x'  < ./inputs/input/ruin.863 
echo ">>>>>>>>running test 4254"
./replace_wrapper 'W$' '7'  < ./inputs/input/ruin.1302 
echo ">>>>>>>>running test 4255"
./replace_wrapper 'W' '4'  < ./inputs/input/ruin.1931 
echo ">>>>>>>>running test 4256"
./replace_wrapper 'W' 'W='  < ./inputs/input/ruin.999 
echo ">>>>>>>>running test 4257"
./replace_wrapper 'W' 'cCeuNv}}<pw83QZL=[v%D!jP]z[`?=f9b?1A'  < ./inputs/input/ruin.24 
echo ">>>>>>>>running test 4258"
./replace_wrapper 'W' 'es'  < ./inputs/input/ruin.712 
echo ">>>>>>>>running test 4259"
./replace_wrapper 'WF@@' 'r'  < ./inputs/input/ruin.1450 
echo ">>>>>>>>running test 4260"
./replace_wrapper 'X' '"'  < ./inputs/input/ruin.1765 
echo ">>>>>>>>running test 4261"
./replace_wrapper 'X' '6?@UBgSAstKhS|SHH*nQ#bN4t}}E6X%KVg9Q.21Hl7[ot[r`rE %IheDivd`\b7dfg^'\''^Ysr=zRchgkQLx{aoU@`'  < ./inputs/input/ruin.431 
echo ">>>>>>>>running test 4262"
./replace_wrapper 'X' '}'  < ./inputs/input/ruin.1753 
echo ">>>>>>>>running test 4263"
./replace_wrapper 'X[>-A]\Mb%-N@@*' '4'  < ./inputs/input/ruin.1808 
echo ">>>>>>>>running test 4264"
./replace_wrapper 'X[A-G]' '_'  < ./inputs/input/ruin.604 
echo ">>>>>>>>running test 4265"
./replace_wrapper 'Y$' '$]'  < ./inputs/input/ruin.691 
echo ">>>>>>>>running test 4266"
./replace_wrapper 'Y' ''  < ./inputs/input/ruin.1988 
echo ">>>>>>>>running test 4267"
./replace_wrapper 'Y' ')}&>hBN)HZF_obPasG*I4tso.>?+2Vcp'  < ./inputs/input/ruin.1405 
echo ">>>>>>>>running test 4268"
./replace_wrapper 'Y' 'pW0qy>=,KL"X@t<=mT(@/+]>BxhOE&FMUU'  < ./inputs/input/ruin.1481 
echo ">>>>>>>>running test 4269"
./replace_wrapper 'YN[^)0-9]' '<KVDSFwGr=)<pMBhEhiwPgVy@F'  < ./inputs/input/ruin.1495 
echo ">>>>>>>>running test 4270"
./replace_wrapper 'Z' '!'  < ./inputs/input/ruin.1085 
echo ">>>>>>>>running test 4271"
./replace_wrapper 'Z' 'QHJV7!Ty3gBtmt_(NOk;73R>j*\Hq.B?RLmD$3y]%ay(M! '  < ./inputs/input/ruin.1154 
echo ">>>>>>>>running test 4272"
./replace_wrapper 'Z' 'k$HcHD(tVs}`VS'  < ./inputs/input/ruin.1141 
echo ">>>>>>>>running test 4273"
./replace_wrapper 'Z' 'k'  < ./inputs/input/ruin.1936 
echo ">>>>>>>>running test 4274"
./replace_wrapper 'Z'  < ./inputs/input/ruin.1154 
echo ">>>>>>>>running test 4275"
./replace_wrapper '[ ]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4276"
./replace_wrapper '[!]*\@@' 'X'\'',id`ucU?Bhj!aeGJ~qW=F*9LTRouw#I-quWg}}wkR8Cwfff{{JGSTC2v7(*^3wSqSn{{\Jx9r8a'  < ./inputs/input/ruin.130 
echo ">>>>>>>>running test 4277"
./replace_wrapper '[%a-c[9-B]c*^-[0-9]-^*?@[-[^a-c]?' 'b@t'  < ./inputs/temp-test/2345.inp.996.2 
echo ">>>>>>>>running test 4278"
./replace_wrapper '[)]' 'o'  < ./inputs/input/ruin.1965 
echo ">>>>>>>>running test 4279"
./replace_wrapper '[*]' 'k0x@zTL"t{3F#Ha7~@k+:!hc]OtZ~i}h?rr}'  < ./inputs/input/ruin.596 
echo ">>>>>>>>running test 4280"
./replace_wrapper '[-?' '@n'  < ./inputs/temp-test/81.inp.36.1 
echo ">>>>>>>>running test 4281"
./replace_wrapper '[-?' '@n'  < ./inputs/temp-test/82.inp.36.3 
echo ">>>>>>>>running test 4282"
./replace_wrapper '[-?-]?-?^-][0-9][_-z]?' 'NEW'  < ./inputs/temp-test/959.inp.413.1 
echo ">>>>>>>>running test 4283"
./replace_wrapper '[-?-]?-?^-][0-9][_-z]?' 'NEW'  < ./inputs/temp-test/960.inp.413.3 
echo ">>>>>>>>running test 4284"
./replace_wrapper '[-^?[9-B][^a-][9-B]-[-??--@t' 'a&'  < ./inputs/temp-test/403.inp.176.1 
echo ">>>>>>>>running test 4285"
./replace_wrapper '[-z]?' 'a&'  < ./inputs/temp-test/652.inp.283.1 
echo ">>>>>>>>running test 4286"
./replace_wrapper '[-z][^--z]' 'a&'  < ./inputs/temp-test/1089.inp.469.1 
echo ">>>>>>>>running test 4287"
./replace_wrapper '[-z][^--z]' 'a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&a&'  < ./inputs/temp-test/1089.inp.469.1 
echo ">>>>>>>>running test 4288"
./replace_wrapper '[-z][^0-9]' '@%&a'  < ./inputs/temp-test/1901.inp.806.1 
echo ">>>>>>>>running test 4289"
./replace_wrapper '[-z][^0-9]' '@%&a'  < ./inputs/temp-test/1902.inp.806.2 
echo ">>>>>>>>running test 4290"
./replace_wrapper '[-z][^9-B]?--[^9-B]-[^9-B][^9-B]-?@[' '@n'  < ./inputs/temp-test/2095.inp.888.1 
echo ">>>>>>>>running test 4291"
./replace_wrapper '[0-9@[@%^2]*?' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4292"
./replace_wrapper '[0-9@[^2]*' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4293"
./replace_wrapper '[0-9A-G]' '$g!HB8cbI<,U1Q7<r%tEEDC['\''N?'  < ./inputs/input/ruin.1516 
echo ">>>>>>>>running test 4294"
./replace_wrapper '[0-9Z-a]^_`a]' 'a'  < ./inputs/input/ruin.713 
echo ">>>>>>>>running test 4295"
./replace_wrapper '[0-9] *?@[*[0-9]?' '&'  < ./inputs/temp-test/1647.inp.702.1 
echo ">>>>>>>>running test 4296"
./replace_wrapper '[0-9] [^@@]?A??[^@n]@@' '@%&a'  < ./inputs/temp-test/1621.inp.689.1 
echo ">>>>>>>>running test 4297"
./replace_wrapper '[0-9]%?' '@t'  < ./inputs/temp-test/2339.inp.994.1 
echo ">>>>>>>>running test 4298"
./replace_wrapper '[0-9]%?' '@t'  < ./inputs/temp-test/2340.inp.994.3 
echo ">>>>>>>>running test 4299"
./replace_wrapper '[0-9]' '&@n'  < ./inputs/temp-test/698.inp.302.1 
echo ">>>>>>>>running test 4300"
./replace_wrapper '[0-9]' '&@n'  < ./inputs/temp-test/699.inp.302.3 
echo ">>>>>>>>running test 4301"
./replace_wrapper '[0-9]' '&a@%'  < ./inputs/temp-test/592.inp.254.1 
echo ">>>>>>>>running test 4302"
./replace_wrapper '[0-9]' '&a@%'  < ./inputs/temp-test/593.inp.254.2 
echo ">>>>>>>>running test 4303"
./replace_wrapper '[0-9]' '9'  < ./inputs/input/ruin.617 
echo ">>>>>>>>running test 4304"
./replace_wrapper '[0-9]' '@%&a'  < ./inputs/temp-test/1478.inp.634.1 
echo ">>>>>>>>running test 4305"
./replace_wrapper '[0-9]' '@%&a'  < ./inputs/temp-test/1479.inp.634.2 
echo ">>>>>>>>running test 4306"
./replace_wrapper '[0-9]' '@%@&'  < ./inputs/temp-test/1065.inp.458.1 
echo ">>>>>>>>running test 4307"
./replace_wrapper '[0-9]' '@%@&'  < ./inputs/temp-test/1066.inp.458.2 
echo ">>>>>>>>running test 4308"
./replace_wrapper '[0-9]' '@%@&'  < ./inputs/temp-test/1067.inp.458.3 
echo ">>>>>>>>running test 4309"
./replace_wrapper '[0-9]' '@'  < ./inputs/input/ruin.1254 
echo ">>>>>>>>running test 4310"
./replace_wrapper '[0-9]' '@9ad|W{5Opa?mnxf=Jhe>u5Dh\*W:.1Q*tSCyX79o5v;D91S\@,R:mmfL'  < ./inputs/input/ruin.267 
echo ">>>>>>>>running test 4311"
./replace_wrapper '[0-9]' '@t'  < ./inputs/temp-test/2302.inp.978.1 
echo ">>>>>>>>running test 4312"
./replace_wrapper '[0-9]' '@t'  < ./inputs/temp-test/2303.inp.978.2 
echo ">>>>>>>>running test 4313"
./replace_wrapper '[0-9]' 'D'  < ./inputs/input/ruin.1443 
echo ">>>>>>>>running test 4314"
./replace_wrapper '[0-9]' 'G'  < ./inputs/input/ruin.57 
echo ">>>>>>>>running test 4315"
./replace_wrapper '[0-9]' 'L3n1<EN|F8u?><i{'  < ./inputs/input/ruin.891 
echo ">>>>>>>>running test 4316"
./replace_wrapper '[0-9]' 'NEW'  < ./inputs/temp-test/849.inp.365.1 
echo ">>>>>>>>running test 4317"
./replace_wrapper '[0-9]' 'NEW'  < ./inputs/temp-test/850.inp.365.2 
echo ">>>>>>>>running test 4318"
./replace_wrapper '[0-9]' 'SryF'  < ./inputs/input/ruin.1576 
echo ">>>>>>>>running test 4319"
./replace_wrapper '[0-9]' 'TeqP2iu]R?wiH?0?xlG9pCy?y9'  < ./inputs/input/ruin.1392 
echo ">>>>>>>>running test 4320"
./replace_wrapper '[0-9]' 'V9U,`[95h_,<BuOOS)?:@yaM3"l5/vWQv242)yJ],?_[&49@y>|;ahg7Hd:wja'  < ./inputs/input/ruin.1499 
echo ">>>>>>>>running test 4321"
./replace_wrapper '[0-9]' 'X'  < ./inputs/input/ruin.1759 
echo ">>>>>>>>running test 4322"
./replace_wrapper '[0-9]' '[[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B][[^9-B][_-z]c^a-]^*-?[^0-9]-[^9-B]a&'  < ./inputs/temp-test/2266.inp.961.1 
echo ">>>>>>>>running test 4323"
./replace_wrapper '[0-9]' '`+/Xl'  < ./inputs/input/ruin.303 
echo ">>>>>>>>running test 4324"
./replace_wrapper '[0-9]' 'a@nb@tc'  < ./inputs/temp-test/1348.inp.579.1 
echo ">>>>>>>>running test 4325"
./replace_wrapper '[0-9]' 'a@nb@tc'  < ./inputs/temp-test/1349.inp.579.2 
echo ">>>>>>>>running test 4326"
./replace_wrapper '[0-9]' 'a@nb@tc'  < ./inputs/temp-test/1350.inp.579.3 
echo ">>>>>>>>running test 4327"
./replace_wrapper '[0-9]' 'aM9n8"47mFoC> PGpU!,U'  < ./inputs/input/ruin.1294 
echo ">>>>>>>>running test 4328"
./replace_wrapper '[0-9]*$' '@'  < ./inputs/input/ruin.1254 
echo ">>>>>>>>running test 4329"
./replace_wrapper '[0-9]*' '&@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 4330"
./replace_wrapper '[0-9]*' ''  < ./inputs/temp-test/157.inp.71.1 
echo ">>>>>>>>running test 4331"
./replace_wrapper '[0-9]*' ''  < ./inputs/temp-test/158.inp.71.2 
echo ">>>>>>>>running test 4332"
./replace_wrapper '[0-9]-' '&'  < ./inputs/temp-test/145.inp.67.1 
echo ">>>>>>>>running test 4333"
./replace_wrapper '[0-9]-' '&'  < ./inputs/temp-test/146.inp.67.2 
echo ">>>>>>>>running test 4334"
./replace_wrapper '[0-9]-' ''  < ./inputs/temp-test/118.inp.55.1 
echo ">>>>>>>>running test 4335"
./replace_wrapper '[0-9]-' '@%@&'  < ./inputs/temp-test/1166.inp.502.1 
echo ">>>>>>>>running test 4336"
./replace_wrapper '[0-9]-' '@%@&'  < ./inputs/temp-test/1167.inp.502.3 
echo ">>>>>>>>running test 4337"
./replace_wrapper '[0-9]-' 'a@n'  < ./inputs/temp-test/1619.inp.688.1 
echo ">>>>>>>>running test 4338"
./replace_wrapper '[0-9]-' 'a@n'  < ./inputs/temp-test/1620.inp.688.3 
echo ">>>>>>>>running test 4339"
./replace_wrapper '[0-9]-' 'a@nb@tc'  < ./inputs/temp-test/1029.inp.443.1 
echo ">>>>>>>>running test 4340"
./replace_wrapper '[0-9]-' 'a@nb@tc'  < ./inputs/temp-test/1030.inp.443.2 
echo ">>>>>>>>running test 4341"
./replace_wrapper '[0-9]-' 'a@nb@tc'  < ./inputs/temp-test/1031.inp.443.3 
echo ">>>>>>>>running test 4342"
./replace_wrapper '[0-9]-' 'a@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tca@nb@tc'  < ./inputs/temp-test/1029.inp.443.1 
echo ">>>>>>>>running test 4343"
./replace_wrapper '[0-9]--*[^a-c]' '&a@%'  < ./inputs/temp-test/152.inp.69.1 
echo ">>>>>>>>running test 4344"
./replace_wrapper '[0-9]--*[^a-c]' '&a@%'  < ./inputs/temp-test/153.inp.69.2 
echo ">>>>>>>>running test 4345"
./replace_wrapper '[0-9]--*[^a-c]' '&a@%'  < ./inputs/temp-test/154.inp.69.3 
echo ">>>>>>>>running test 4346"
./replace_wrapper '[0-9]-?-?[a-c][^9-B]@[*-' '&'  < ./inputs/temp-test/409.inp.179.1 
echo ">>>>>>>>running test 4347"
./replace_wrapper '[0-9]-[9-B]?-[9-B]^-]?' 'NEW'  < ./inputs/temp-test/1669.inp.712.1 
echo ">>>>>>>>running test 4348"
./replace_wrapper '[0-9]-[9-B]?-[9-B]^-]?' 'NEW'  < ./inputs/temp-test/1670.inp.712.2 
echo ">>>>>>>>running test 4349"
./replace_wrapper '[0-9]-[9-B]?-[9-B]^-]?' 'NEW'  < ./inputs/temp-test/1671.inp.712.4 
echo ">>>>>>>>running test 4350"
./replace_wrapper '[0-9]?' '&'  < ./inputs/temp-test/1865.inp.792.1 
echo ">>>>>>>>running test 4351"
./replace_wrapper '[0-9]?' '&'  < ./inputs/temp-test/1866.inp.792.2 
echo ">>>>>>>>running test 4352"
./replace_wrapper '[0-9]?' '&'  < ./inputs/temp-test/1867.inp.792.3 
echo ">>>>>>>>running test 4353"
./replace_wrapper '[0-9]?' '&a@%'  < ./inputs/temp-test/752.inp.323.1 
echo ">>>>>>>>running test 4354"
./replace_wrapper '[0-9]?' '&a@%'  < ./inputs/temp-test/753.inp.323.2 
echo ">>>>>>>>running test 4355"
./replace_wrapper '[0-9]?' '&a@%'  < ./inputs/temp-test/754.inp.323.3 
echo ">>>>>>>>running test 4356"
./replace_wrapper '[0-9]?' '@%@&'  < ./inputs/temp-test/698.inp.302.1 
echo ">>>>>>>>running test 4357"
./replace_wrapper '[0-9]?' '@%@&'  < ./inputs/temp-test/699.inp.302.3 
echo ">>>>>>>>running test 4358"
./replace_wrapper '[0-9]?' '@t'  < ./inputs/temp-test/1046.inp.451.1 
echo ">>>>>>>>running test 4359"
./replace_wrapper '[0-9]?' '@t'  < ./inputs/temp-test/1047.inp.451.2 
echo ">>>>>>>>running test 4360"
./replace_wrapper '[0-9]?' '@t'  < ./inputs/temp-test/2339.inp.994.1 
echo ">>>>>>>>running test 4361"
./replace_wrapper '[0-9]?' '@t'  < ./inputs/temp-test/2340.inp.994.3 
echo ">>>>>>>>running test 4362"
./replace_wrapper '[0-9]?' 'NEW'  < ./inputs/temp-test/919.inp.397.1 
echo ">>>>>>>>running test 4363"
./replace_wrapper '[0-9]?' 'NEW'  < ./inputs/temp-test/920.inp.397.3 
echo ">>>>>>>>running test 4364"
./replace_wrapper '[0-9]?' 'NEW'  < ./inputs/temp-test/921.inp.397.4 
echo ">>>>>>>>running test 4365"
./replace_wrapper '[0-9]?' 'a&'  < ./inputs/temp-test/2040.inp.865.1 
echo ">>>>>>>>running test 4366"
./replace_wrapper '[0-9]?' 'a@nb@tc'  < ./inputs/temp-test/1365.inp.586.1 
echo ">>>>>>>>running test 4367"
./replace_wrapper '[0-9]?' 'a@nb@tc'  < ./inputs/temp-test/1366.inp.586.2 
echo ">>>>>>>>running test 4368"
./replace_wrapper '[0-9]?-[a-]@[*' '@%&a'  < ./inputs/temp-test/1231.inp.528.1 
echo ">>>>>>>>running test 4369"
./replace_wrapper '[0-9]?-[a-]@[*' '@%&a'  < ./inputs/temp-test/1232.inp.528.2 
echo ">>>>>>>>running test 4370"
./replace_wrapper '[0-9]??@@-[a--]-' '@%&a'  < ./inputs/temp-test/1532.inp.656.1 
echo ">>>>>>>>running test 4371"
./replace_wrapper '[0-9]??@@-[a--]-' '@%&a'  < ./inputs/temp-test/1533.inp.656.2 
echo ">>>>>>>>running test 4372"
./replace_wrapper '[0-9]??@@-[a--]-' '@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a@%&a'  < ./inputs/temp-test/1532.inp.656.1 
echo ">>>>>>>>running test 4373"
./replace_wrapper '[0-9]?[^0-9]@[-[9-B]-[^0-9]-[^9-B]' ''  < ./inputs/temp-test/983.inp.423.1 
echo ">>>>>>>>running test 4374"
./replace_wrapper '[0-9]?^[^0-9]?-[^0-9]c[^a--]-[0-9][^9-B]@n[^0-9][9-B]?' '@n'  < ./inputs/temp-test/1629.inp.693.1 
echo ">>>>>>>>running test 4375"
./replace_wrapper '[0-9]@$' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4376"
./replace_wrapper '[0-9]@*' '&'  < ./inputs/temp-test/1114.inp.479.1 
echo ">>>>>>>>running test 4377"
./replace_wrapper '[0-9]@*' '&'  < ./inputs/temp-test/1115.inp.479.3 
echo ">>>>>>>>running test 4378"
./replace_wrapper '[0-9]@*' '&'  < ./inputs/temp-test/1116.inp.479.4 
echo ">>>>>>>>running test 4379"
./replace_wrapper '[0-9]@*' '&'  < ./inputs/temp-test/1296.inp.556.1 
echo ">>>>>>>>running test 4380"
./replace_wrapper '[0-9]@*' 'a@n'  < ./inputs/temp-test/298.inp.134.1 
echo ">>>>>>>>running test 4381"
./replace_wrapper '[0-9]@*' 'a@n'  < ./inputs/temp-test/299.inp.134.2 
echo ">>>>>>>>running test 4382"
./replace_wrapper '[0-9]@*' 'a@n'  < ./inputs/temp-test/300.inp.134.3 
echo ">>>>>>>>running test 4383"
./replace_wrapper '[0-9]@*^-]$' '@n'  < ./inputs/temp-test/1474.inp.632.8 
echo ">>>>>>>>running test 4384"
./replace_wrapper '[0-9]@*^-]' '@n'  < ./inputs/temp-test/1473.inp.632.1 
echo ">>>>>>>>running test 4385"
./replace_wrapper '[0-9]@@' '@%&a'  < ./inputs/temp-test/1694.inp.723.1 
echo ">>>>>>>>running test 4386"
./replace_wrapper '[0-9]@@' '@%&a'  < ./inputs/temp-test/1695.inp.723.2 
echo ">>>>>>>>running test 4387"
./replace_wrapper '[0-9]@[*' '@n'  < ./inputs/temp-test/843.inp.362.1 
echo ">>>>>>>>running test 4388"
./replace_wrapper '[0-9]@n' '9&@t@t'  < ./inputs/input/ruin.617 
echo ">>>>>>>>running test 4389"
./replace_wrapper '[0-9]@n' 'k&e'  < ./inputs/input/ruin.280 
echo ">>>>>>>>running test 4390"
./replace_wrapper '[0-9]@n' 'o&6'  < ./inputs/input/ruin.284 
echo ">>>>>>>>running test 4391"
./replace_wrapper '[0-9]A*@n?-?^*-' ''  < ./inputs/temp-test/1947.inp.827.1 
echo ">>>>>>>>running test 4392"
./replace_wrapper '[0-9]A*@n?-?^*-' ''  < ./inputs/temp-test/1948.inp.827.2 
echo ">>>>>>>>running test 4393"
./replace_wrapper '[0-9]A*@n?-?^*-' ''  < ./inputs/temp-test/1949.inp.827.3 
echo ">>>>>>>>running test 4394"
./replace_wrapper '[0-9]A*@n?-?^*-' ''  < ./inputs/temp-test/1950.inp.827.4 
echo ">>>>>>>>running test 4395"
./replace_wrapper '[0-9][^-' '@%@&'  < ./inputs/temp-test/324.inp.144.1 
echo ">>>>>>>>running test 4396"
./replace_wrapper '[0-9][^-' '@%@&'  < ./inputs/temp-test/325.inp.144.2 
echo ">>>>>>>>running test 4397"
./replace_wrapper '[0-9][^0-9]' '&'  < ./inputs/temp-test/564.inp.243.1 
echo ">>>>>>>>running test 4398"
./replace_wrapper '[0-9][^0-9]' '&'  < ./inputs/temp-test/565.inp.243.3 
echo ">>>>>>>>running test 4399"
./replace_wrapper '[0-9][^0-9]-[^-' 'a@nb@tc'  < ./inputs/temp-test/1636.inp.697.1 
echo ">>>>>>>>running test 4400"
./replace_wrapper '[0-9][^0-9]-[^-' 'a@nb@tc'  < ./inputs/temp-test/1637.inp.697.3 
echo ">>>>>>>>running test 4401"
./replace_wrapper '[0-9][^9-B]' 'NEW'  < ./inputs/temp-test/1552.inp.664.1 
echo ">>>>>>>>running test 4402"
./replace_wrapper '[0-9][^9-B]?A*?[a-c]?[0-9][^9-B]-' ''  < ./inputs/temp-test/928.inp.400.1 
echo ">>>>>>>>running test 4403"
./replace_wrapper '[0-9][^9-B][@t][^a-c]' '@%&a'  < ./inputs/temp-test/1038.inp.447.1 
echo ">>>>>>>>running test 4404"
./replace_wrapper '[0-9][^9-B][@t][^a-c]' '@%&a'  < ./inputs/temp-test/1039.inp.447.3 
echo ">>>>>>>>running test 4405"
./replace_wrapper '[0-9]^-?-^*' '&a@%'  < ./inputs/temp-test/1313.inp.564.1 
echo ">>>>>>>>running test 4406"
./replace_wrapper '[0-9]^-?-^*' '&a@%'  < ./inputs/temp-test/1314.inp.564.2 
echo ">>>>>>>>running test 4407"
./replace_wrapper '[0-9]^-?-^*' '&a@%'  < ./inputs/temp-test/1315.inp.564.3 
echo ">>>>>>>>running test 4408"
./replace_wrapper '[0-9]^-?-^*' '&a@%'  < ./inputs/temp-test/1316.inp.564.4 
echo ">>>>>>>>running test 4409"
./replace_wrapper '[0-9]c*@*[a-c]-[0-9][^0-9]@*' 'b@t'  < ./inputs/temp-test/791.inp.341.1 
echo ">>>>>>>>running test 4410"
./replace_wrapper '[0-9]c*@*[a-c]-[0-9][^0-9]@*' 'b@t'  < ./inputs/temp-test/792.inp.341.2 
echo ">>>>>>>>running test 4411"
./replace_wrapper '[0-9]c*@*[a-c]-[0-9][^0-9]@*' 'b@t'  < ./inputs/temp-test/793.inp.341.3 
echo ">>>>>>>>running test 4412"
./replace_wrapper '[0-9^4]*' 5  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4413"
./replace_wrapper '[0-9c-a]' 'vm&LgryRJI2?C95<5\^'  < ./inputs/input/ruin.490 
echo ">>>>>>>>running test 4414"
./replace_wrapper '[0-9z-}>-A]\@@?' '4'  < ./inputs/input/ruin.813 
echo ">>>>>>>>running test 4415"
./replace_wrapper '[0-9z-}]' 'WOMZMg'  < ./inputs/input/ruin.1746 
echo ">>>>>>>>running test 4416"
./replace_wrapper '[1-' 'yy'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4417"
./replace_wrapper '[1-9]%' '@t67@t67@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 4418"
./replace_wrapper '[1-9]@t**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4419"
./replace_wrapper '[1-9][1-9]' 6666666  < ./inputs/moni/f5.inp 
echo ">>>>>>>>running test 4420"
./replace_wrapper '[1-@n]' '@-1'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4421"
./replace_wrapper '[1]' '5D$6:)'\''!!WaohoC<DMt/ns5zA:0vzT p?PADhjzrF.e*NbJLCd;0Sr/.Ja+?2sn-MP+uf6)IZet;aI!3=TH7?$d_6t)!l=Wfh37`[%\<5'  < ./inputs/input/ruin.1200 
echo ">>>>>>>>running test 4422"
./replace_wrapper '[5]' 'D9c@\|.|ljJv/2]Sw+F<JU5{,Y`;B'  < ./inputs/input/ruin.295 
echo ">>>>>>>>running test 4423"
./replace_wrapper '[7-9]ab**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4424"
./replace_wrapper '[7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]7KOgdHVS~e*RbgQ>M{]^0-9]?[a-c] [^0-9]?[a-c]-[a--b]?^a-c]' '&'   < ./inputs/temp-test/1268.inp.544.1 
echo ">>>>>>>>running test 4425"
./replace_wrapper '[9-B] *-[^9-B]---*' 'NEW'  < ./inputs/temp-test/457.inp.200.1 
echo ">>>>>>>>running test 4426"
./replace_wrapper '[9-B]$' '&'  < ./inputs/temp-test/2306.inp.979.6 
echo ">>>>>>>>running test 4427"
./replace_wrapper '[9-B]$' '&'  < ./inputs/temp-test/2308.inp.979.8 
echo ">>>>>>>>running test 4428"
./replace_wrapper '[9-B]$' 'NEW'  < ./inputs/temp-test/1804.inp.767.8 
echo ">>>>>>>>running test 4429"
./replace_wrapper '[9-B]%-' 'a@nb@tc'  < ./inputs/temp-test/2334.inp.990.1 
echo ">>>>>>>>running test 4430"
./replace_wrapper '[9-B]%-' 'a@nb@tc'  < ./inputs/temp-test/2335.inp.990.3 
echo ">>>>>>>>running test 4431"
./replace_wrapper '[9-B]%?' '@t'  < ./inputs/temp-test/2338.inp.993.1 
echo ">>>>>>>>running test 4432"
./replace_wrapper '[9-B]%A-?[^a--]?' '&'  < ./inputs/temp-test/2356.inp.1000.1 
echo ">>>>>>>>running test 4433"
./replace_wrapper '[9-B]%[^a--b][^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/27.inp.12.1 
echo ">>>>>>>>running test 4434"
./replace_wrapper '[9-B]' '&'  < ./inputs/temp-test/2304.inp.979.1 
echo ">>>>>>>>running test 4435"
./replace_wrapper '[9-B]' '&'  < ./inputs/temp-test/2305.inp.979.2 
echo ">>>>>>>>running test 4436"
./replace_wrapper '[9-B]' 'NEW'  < ./inputs/temp-test/1803.inp.767.1 
echo ">>>>>>>>running test 4437"
./replace_wrapper '[9-B]' 'NEW'  < ./inputs/temp-test/2216.inp.939.1 
echo ">>>>>>>>running test 4438"
./replace_wrapper '[9-B]' 'NEW'  < ./inputs/temp-test/2217.inp.939.3 
echo ">>>>>>>>running test 4439"
./replace_wrapper '[9-B]' 'NEW'  < ./inputs/temp-test/2218.inp.939.4 
echo ">>>>>>>>running test 4440"
./replace_wrapper '[9-B]' 'a&'  < ./inputs/temp-test/2104.inp.892.1 
echo ">>>>>>>>running test 4441"
./replace_wrapper '[9-B]' 'a&'  < ./inputs/temp-test/2105.inp.892.3 
echo ">>>>>>>>running test 4442"
./replace_wrapper '[9-B]' 'a@nb@tc'  < ./inputs/temp-test/1220.inp.524.1 
echo ">>>>>>>>running test 4443"
./replace_wrapper '[9-B]' 'b@t'  < ./inputs/temp-test/949.inp.409.1 
echo ">>>>>>>>running test 4444"
./replace_wrapper '[9-B]' 'b@t'  < ./inputs/temp-test/950.inp.409.2 
echo ">>>>>>>>running test 4445"
./replace_wrapper '[9-B]* ' '&a@%'  < ./inputs/temp-test/30.inp.13.1 
echo ">>>>>>>>running test 4446"
./replace_wrapper '[9-B]* ' '&a@%'  < ./inputs/temp-test/31.inp.13.3 
echo ">>>>>>>>running test 4447"
./replace_wrapper '[9-B]- *-^a-] *' 'NEW'  < ./inputs/temp-test/848.inp.364.1 
echo ">>>>>>>>running test 4448"
./replace_wrapper '[9-B]-' '&'  < ./inputs/temp-test/1903.inp.807.1 
echo ">>>>>>>>running test 4449"
./replace_wrapper '[9-B]-' '&'  < ./inputs/temp-test/1904.inp.807.3 
echo ">>>>>>>>running test 4450"
./replace_wrapper '[9-B]-' ''  < ./inputs/temp-test/1924.inp.818.1 
echo ">>>>>>>>running test 4451"
./replace_wrapper '[9-B]-' ''  < ./inputs/temp-test/1925.inp.818.2 
echo ">>>>>>>>running test 4452"
./replace_wrapper '[9-B]-' ''  < ./inputs/temp-test/732.inp.315.1 
echo ">>>>>>>>running test 4453"
./replace_wrapper '[9-B]-' ''  < ./inputs/temp-test/733.inp.315.3 
echo ">>>>>>>>running test 4454"
./replace_wrapper '[9-B]-' '@%&a'  < ./inputs/temp-test/1150.inp.495.1 
echo ">>>>>>>>running test 4455"
./replace_wrapper '[9-B]-' '@%&a'  < ./inputs/temp-test/1151.inp.495.3 
echo ">>>>>>>>running test 4456"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1233.inp.529.1 
echo ">>>>>>>>running test 4457"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1234.inp.529.3 
echo ">>>>>>>>running test 4458"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1418.inp.609.1 
echo ">>>>>>>>running test 4459"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1419.inp.609.2 
echo ">>>>>>>>running test 4460"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1452.inp.623.1 
echo ">>>>>>>>running test 4461"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1453.inp.623.2 
echo ">>>>>>>>running test 4462"
./replace_wrapper '[9-B]-' 'NEW'  < ./inputs/temp-test/1454.inp.623.3 
echo ">>>>>>>>running test 4463"
./replace_wrapper '[9-B]-' 'a&'  < ./inputs/temp-test/283.inp.127.1 
echo ">>>>>>>>running test 4464"
./replace_wrapper '[9-B]-' 'a&'  < ./inputs/temp-test/284.inp.127.2 
echo ">>>>>>>>running test 4465"
./replace_wrapper '[9-B]-' 'a&'  < ./inputs/temp-test/285.inp.127.3 
echo ">>>>>>>>running test 4466"
./replace_wrapper '[9-B]-' 'a@nb@tc'  < ./inputs/temp-test/2334.inp.990.1 
echo ">>>>>>>>running test 4467"
./replace_wrapper '[9-B]-' 'a@nb@tc'  < ./inputs/temp-test/2335.inp.990.3 
echo ">>>>>>>>running test 4468"
./replace_wrapper '[9-B]-' 'b@t'  < ./inputs/temp-test/1734.inp.738.1 
echo ">>>>>>>>running test 4469"
./replace_wrapper '[9-B]-' 'b@t'  < ./inputs/temp-test/1735.inp.738.2 
echo ">>>>>>>>running test 4470"
./replace_wrapper '[9-B]-' 'b@t'  < ./inputs/temp-test/1736.inp.738.3 
echo ">>>>>>>>running test 4471"
./replace_wrapper '[9-B]-*@[*? *$' '&a@%'  < ./inputs/temp-test/1199.inp.514.8 
echo ">>>>>>>>running test 4472"
./replace_wrapper '[9-B]-*@[*? *' '&a@%'  < ./inputs/temp-test/1196.inp.514.1 
echo ">>>>>>>>running test 4473"
./replace_wrapper '[9-B]-*@[*? *' '&a@%'  < ./inputs/temp-test/1197.inp.514.2 
echo ">>>>>>>>running test 4474"
./replace_wrapper '[9-B]-*@[*? *' '&a@%'  < ./inputs/temp-test/1198.inp.514.3 
echo ">>>>>>>>running test 4475"
./replace_wrapper '[9-B]-*[^0-9]?' '&'  < ./inputs/temp-test/1997.inp.848.1 
echo ">>>>>>>>running test 4476"
./replace_wrapper '[9-B]-*[^0-9]?' '&'  < ./inputs/temp-test/1998.inp.848.4 
echo ">>>>>>>>running test 4477"
./replace_wrapper '[9-B]--?[^-z]-[0-9][^a-c]$' 'b@t'  < ./inputs/temp-test/2085.inp.883.6 
echo ">>>>>>>>running test 4478"
./replace_wrapper '[9-B]--?[^-z]-[0-9][^a-c]$' 'b@t'  < ./inputs/temp-test/2086.inp.883.8 
echo ">>>>>>>>running test 4479"
./replace_wrapper '[9-B]--?[^-z]-[0-9][^a-c]' 'b@t'  < ./inputs/temp-test/2083.inp.883.1 
echo ">>>>>>>>running test 4480"
./replace_wrapper '[9-B]--?[^-z]-[0-9][^a-c]' 'b@t'  < ./inputs/temp-test/2084.inp.883.2 
echo ">>>>>>>>running test 4481"
./replace_wrapper '[9-B]-?-' 'a@nb@tc'  < ./inputs/temp-test/445.inp.195.1 
echo ">>>>>>>>running test 4482"
./replace_wrapper '[9-B]-?-' 'a@nb@tc'  < ./inputs/temp-test/446.inp.195.2 
echo ">>>>>>>>running test 4483"
./replace_wrapper '[9-B]-??[0-9]@t?[^a-c]?' 'a&'  < ./inputs/temp-test/2325.inp.987.1 
echo ">>>>>>>>running test 4484"
./replace_wrapper '[9-B]-??[0-9]@t?[^a-c]?' 'a&'  < ./inputs/temp-test/2326.inp.987.2 
echo ">>>>>>>>running test 4485"
./replace_wrapper '[9-B]-A[^0-9]-@*' '@%@&'  < ./inputs/temp-test/1673.inp.713.1 
echo ">>>>>>>>running test 4486"
./replace_wrapper '[9-B]-[-z]?[@t]?[^a-c]' 'a&'  < ./inputs/temp-test/2017.inp.856.1 
echo ">>>>>>>>running test 4487"
./replace_wrapper '[9-B]?' '&a@%'  < ./inputs/temp-test/2044.inp.867.1 
echo ">>>>>>>>running test 4488"
./replace_wrapper '[9-B]?' '@%&a'  < ./inputs/temp-test/1801.inp.766.1 
echo ">>>>>>>>running test 4489"
./replace_wrapper '[9-B]?' '@%&a'  < ./inputs/temp-test/1802.inp.766.3 
echo ">>>>>>>>running test 4490"
./replace_wrapper '[9-B]?' '@%&a'  < ./inputs/temp-test/799.inp.344.1 
echo ">>>>>>>>running test 4491"
./replace_wrapper '[9-B]?' '@%&a'  < ./inputs/temp-test/800.inp.344.3 
echo ">>>>>>>>running test 4492"
./replace_wrapper '[9-B]?' '@%@&'  < ./inputs/temp-test/1625.inp.691.1 
echo ">>>>>>>>running test 4493"
./replace_wrapper '[9-B]?' '@%@&'  < ./inputs/temp-test/1626.inp.691.2 
echo ">>>>>>>>running test 4494"
./replace_wrapper '[9-B]?' '@%@&'  < ./inputs/temp-test/1627.inp.691.3 
echo ">>>>>>>>running test 4495"
./replace_wrapper '[9-B]?' '@t'  < ./inputs/temp-test/2338.inp.993.1 
echo ">>>>>>>>running test 4496"
./replace_wrapper '[9-B]?' 'NEW'  < ./inputs/temp-test/1689.inp.720.1 
echo ">>>>>>>>running test 4497"
./replace_wrapper '[9-B]?' 'NEW'  < ./inputs/temp-test/1690.inp.720.2 
echo ">>>>>>>>running test 4498"
./replace_wrapper '[9-B]?-@[*[^9-B]-@tc*a-]' '@n'  < ./inputs/temp-test/1534.inp.657.1 
echo ">>>>>>>>running test 4499"
./replace_wrapper '[9-B]?-@[*[^9-B]-@tc*a-]' '@n'  < ./inputs/temp-test/1535.inp.657.2 
echo ">>>>>>>>running test 4500"
./replace_wrapper '[9-B]??^?^-]' '@t'  < ./inputs/temp-test/84.inp.38.1 
echo ">>>>>>>>running test 4501"
./replace_wrapper '[9-B]??^?^-]' '@t'  < ./inputs/temp-test/85.inp.38.3 
echo ">>>>>>>>running test 4502"
./replace_wrapper '[9-B]@*' '&'  < ./inputs/temp-test/540.inp.234.1 
echo ">>>>>>>>running test 4503"
./replace_wrapper '[9-B]@*' '&'  < ./inputs/temp-test/541.inp.234.2 
echo ">>>>>>>>running test 4504"
./replace_wrapper '[9-B]@**?^@@-' '@%&a'  < ./inputs/temp-test/904.inp.389.1 
echo ">>>>>>>>running test 4505"
./replace_wrapper '[9-B]@**?^@@-' '@%&a'  < ./inputs/temp-test/905.inp.389.3 
echo ">>>>>>>>running test 4506"
./replace_wrapper '[9-B]@@' 'a&'  < ./inputs/temp-test/119.inp.56.1 
echo ">>>>>>>>running test 4507"
./replace_wrapper '[9-B]@@' 'a&'  < ./inputs/temp-test/120.inp.56.3 
echo ">>>>>>>>running test 4508"
./replace_wrapper '[9-B]@[?[9-B]-[@n][^a-c[0-9]?@@*[0-9]' '&'  < ./inputs/temp-test/1524.inp.653.1 
echo ">>>>>>>>running test 4509"
./replace_wrapper '[9-B]@[?[9-B]-[@n][^a-c[0-9]?@@*[0-9]' '&'  < ./inputs/temp-test/1525.inp.653.2 
echo ">>>>>>>>running test 4510"
./replace_wrapper '[9-B]@[c*-??-' '@%&a'  < ./inputs/temp-test/1007.inp.433.1 
echo ">>>>>>>>running test 4511"
./replace_wrapper '[9-B]@[c*-??-' '@%&a'  < ./inputs/temp-test/1008.inp.433.3 
echo ">>>>>>>>running test 4512"
./replace_wrapper '[9-B]A-%?[^a--]?' '&'  < ./inputs/temp-test/2357.inp.1000.2 
echo ">>>>>>>>running test 4513"
./replace_wrapper '[9-B]A-?%[^a--]?' '&'  < ./inputs/temp-test/2358.inp.1000.3 
echo ">>>>>>>>running test 4514"
./replace_wrapper '[9-B]A-?[^a--]?' '&'  < ./inputs/temp-test/2356.inp.1000.1 
echo ">>>>>>>>running test 4515"
./replace_wrapper '[9-B]A-?[^a--]?' '&'  < ./inputs/temp-test/2357.inp.1000.2 
echo ">>>>>>>>running test 4516"
./replace_wrapper '[9-B]A-?[^a--]?' '&'  < ./inputs/temp-test/2358.inp.1000.3 
echo ">>>>>>>>running test 4517"
./replace_wrapper '[9-B][9-B]?[^a-c]a-c]' '&'  < ./inputs/temp-test/2232.inp.946.1 
echo ">>>>>>>>running test 4518"
./replace_wrapper '[9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B][9-B]' 'b@t'  < ./inputs/temp-test/949.inp.409.1 
echo ">>>>>>>>running test 4519"
./replace_wrapper '[9-B][^-' 'a&'  < ./inputs/temp-test/2224.inp.943.1 
echo ">>>>>>>>running test 4520"
./replace_wrapper '[9-B][^0-9]' '@%&a'  < ./inputs/temp-test/794.inp.342.1 
echo ">>>>>>>>running test 4521"
./replace_wrapper '[9-B][^0-9]' '@%&a'  < ./inputs/temp-test/795.inp.342.3 
echo ">>>>>>>>running test 4522"
./replace_wrapper '[9-B][^0-9]??[9-B]^*-[^a-c]' ''  < ./inputs/temp-test/594.inp.255.1 
echo ">>>>>>>>running test 4523"
./replace_wrapper '[9-B][^0-9]@[?[a-c[^0-9][_-z]-?@[' 'b@t'  < ./inputs/temp-test/700.inp.303.1 
echo ">>>>>>>>running test 4524"
./replace_wrapper '[9-B][^0-9]@[?[a-c[^0-9][_-z]-?@[' 'b@t'  < ./inputs/temp-test/701.inp.303.2 
echo ">>>>>>>>running test 4525"
./replace_wrapper '[9-B][^9-B]@t*?' '@t'  < ./inputs/temp-test/1301.inp.559.1 
echo ">>>>>>>>running test 4526"
./replace_wrapper '[9-B][^9-B][0-9]' '&@n'  < ./inputs/temp-test/643.inp.278.1 
echo ">>>>>>>>running test 4527"
./replace_wrapper '[9-B][^9-B][0-9]' '&@n[a-z]'  < ./inputs/temp-test/643.inp.278.1 
echo ">>>>>>>>running test 4528"
./replace_wrapper '[9-B][^9-B][0-9]' '@n'  < ./inputs/temp-test/643.inp.278.1 
echo ">>>>>>>>running test 4529"
./replace_wrapper '[9-B][^a--]' 'a@nb@tc'  < ./inputs/temp-test/1353.inp.581.1 
echo ">>>>>>>>running test 4530"
./replace_wrapper '[9-B][^a--]' 'a@nb@tc'  < ./inputs/temp-test/1354.inp.581.3 
echo ">>>>>>>>running test 4531"
./replace_wrapper '[9-B][^a--][^@n]-' '@%@&'  < ./inputs/temp-test/2144.inp.908.1 
echo ">>>>>>>>running test 4532"
./replace_wrapper '[9-B][^a--][^@n]-' '@%@&'  < ./inputs/temp-test/2145.inp.908.2 
echo ">>>>>>>>running test 4533"
./replace_wrapper '[9-B][^a--b]%[^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/28.inp.12.3 
echo ">>>>>>>>running test 4534"
./replace_wrapper '[9-B][^a--b]%[^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/29.inp.12.4 
echo ">>>>>>>>running test 4535"
./replace_wrapper '[9-B][^a--b][^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/27.inp.12.1 
echo ">>>>>>>>running test 4536"
./replace_wrapper '[9-B][^a--b][^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/28.inp.12.3 
echo ">>>>>>>>running test 4537"
./replace_wrapper '[9-B][^a--b][^9-B]@**[9-B]-' '&a@%'  < ./inputs/temp-test/29.inp.12.4 
echo ">>>>>>>>running test 4538"
./replace_wrapper '[9-B][^a-c]' '@%&a'  < ./inputs/temp-test/917.inp.396.1 
echo ">>>>>>>>running test 4539"
./replace_wrapper '[9-B][^a-c]' '@%&a'  < ./inputs/temp-test/918.inp.396.3 
echo ">>>>>>>>running test 4540"
./replace_wrapper '[9-B][^a-c]' '@%@&'  < ./inputs/temp-test/2089.inp.885.1 
echo ">>>>>>>>running test 4541"
./replace_wrapper '[9-B][^a-c]' '@%@&'  < ./inputs/temp-test/2090.inp.885.2 
echo ">>>>>>>>running test 4542"
./replace_wrapper '[9-B][^a-c]' '@t'  < ./inputs/temp-test/390.inp.170.1 
echo ">>>>>>>>running test 4543"
./replace_wrapper '[9-B][^a-c]?*' '@t'  < ./inputs/temp-test/390.inp.170.1 
echo ">>>>>>>>running test 4544"
./replace_wrapper '[9-B]^$' 'NEW'  < ./inputs/temp-test/757.inp.324.6 
echo ">>>>>>>>running test 4545"
./replace_wrapper '[9-B]^' 'NEW'  < ./inputs/temp-test/755.inp.324.1 
echo ">>>>>>>>running test 4546"
./replace_wrapper '[9-B]^' 'NEW'  < ./inputs/temp-test/756.inp.324.2 
echo ">>>>>>>>running test 4547"
./replace_wrapper '[9-B]c$' 'a@n'  < ./inputs/temp-test/495.inp.216.6 
echo ">>>>>>>>running test 4548"
./replace_wrapper '[9-B]c' 'a@n'  < ./inputs/temp-test/493.inp.216.1 
echo ">>>>>>>>running test 4549"
./replace_wrapper '[9-B]c' 'a@n'  < ./inputs/temp-test/494.inp.216.3 
echo ">>>>>>>>running test 4550"
./replace_wrapper '[9-B]c*$' '@%@&'  < ./inputs/temp-test/1715.inp.730.6 
echo ">>>>>>>>running test 4551"
./replace_wrapper '[9-B]c*' '@%@&'  < ./inputs/temp-test/1712.inp.730.1 
echo ">>>>>>>>running test 4552"
./replace_wrapper '[9-B]c*' '@%@&'  < ./inputs/temp-test/1713.inp.730.2 
echo ">>>>>>>>running test 4553"
./replace_wrapper '[9-B]c*' '@%@&'  < ./inputs/temp-test/1714.inp.730.3 
echo ">>>>>>>>running test 4554"
./replace_wrapper '[9-B]c*' 'NEW'  < ./inputs/temp-test/2112.inp.895.1 
echo ">>>>>>>>running test 4555"
./replace_wrapper '[9-B]c*?@[*-? ' '&'  < ./inputs/temp-test/434.inp.191.1 
echo ">>>>>>>>running test 4556"
./replace_wrapper '[9-B]c*?@[*-? ' '&'  < ./inputs/temp-test/435.inp.191.2 
echo ">>>>>>>>running test 4557"
./replace_wrapper '[9-B]c@' 'a@n'  < ./inputs/temp-test/493.inp.216.1 
echo ">>>>>>>>running test 4558"
./replace_wrapper '[9-B]c@***' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4559"
./replace_wrapper '[<]' 'v'  < ./inputs/input/ruin.799 
echo ">>>>>>>>running test 4560"
./replace_wrapper '[=]@n' 'u>{%9; ?S3&u@@LZ'  < ./inputs/input/ruin.1188 
echo ">>>>>>>>running test 4561"
./replace_wrapper '[>-A$>-A>-A]' 'BWOG;nsT|&v:1JbQ*sS{n)s'  < ./inputs/input/ruin.1782 
echo ">>>>>>>>running test 4562"
./replace_wrapper '[>-A0-9]$' 'O'  < ./inputs/input/ruin.750 
echo ">>>>>>>>running test 4563"
./replace_wrapper '[>-A>-A>-A<z-}c-a]@@' '(1FO34>$"?Wo1x\X'  < ./inputs/input/ruin.1642 
echo ">>>>>>>>running test 4564"
./replace_wrapper '[>-AA-G0-90-9z-}]' 'CH3_XX}'  < ./inputs/input/ruin.956 
echo ">>>>>>>>running test 4565"
./replace_wrapper '[>-AA-G]' 'S'  < ./inputs/input/ruin.309 
echo ">>>>>>>>running test 4566"
./replace_wrapper '[>-AA-G]' 'h+7%G2u6AJQk>L1WQsotq_n,vo'  < ./inputs/input/ruin.695 
echo ">>>>>>>>running test 4567"
./replace_wrapper '[>-A]$' '!'  < ./inputs/input/ruin.151 
echo ">>>>>>>>running test 4568"
./replace_wrapper '[>-A]' '&y#k-llLWk'  < ./inputs/input/ruin.279 
echo ">>>>>>>>running test 4569"
./replace_wrapper '[>-A]' 'V'  < ./inputs/input/ruin.1531 
echo ">>>>>>>>running test 4570"
./replace_wrapper '[>-A]' 'V'  < ./inputs/input/ruin.1829 
echo ">>>>>>>>running test 4571"
./replace_wrapper '[>-A]' 'Z}rl'  < ./inputs/input/ruin.1762 
echo ">>>>>>>>running test 4572"
./replace_wrapper '[>-A]' '^'  < ./inputs/input/ruin.685 
echo ">>>>>>>>running test 4573"
./replace_wrapper '[>-A]' 'l'  < ./inputs/input/ruin.1117 
echo ">>>>>>>>running test 4574"
./replace_wrapper '[>-A]' 'r'  < ./inputs/input/ruin.194 
echo ">>>>>>>>running test 4575"
./replace_wrapper '[>-A]' '|u,~, P+@h3f-q{-m^'  < ./inputs/input/ruin.455 
echo ">>>>>>>>running test 4576"
./replace_wrapper '[>-A]'\''gdh' '0(,(PKL.GW[Vb;PK[Ko(/'  < ./inputs/input/ruin.1628 
echo ">>>>>>>>running test 4577"
./replace_wrapper '[>-A]'\''o-]' '98lxUW$3UOKEX2a@El#=-t[^R%"'  < ./inputs/input/ruin.290 
echo ">>>>>>>>running test 4578"
./replace_wrapper '[>-A]'\''o-]@n' '98l&xUW$3UOKEX2a@El#=-t[^R%"'  < ./inputs/input/ruin.290 
echo ">>>>>>>>running test 4579"
./replace_wrapper '[>-A]*$' 'l'  < ./inputs/input/ruin.1117 
echo ">>>>>>>>running test 4580"
./replace_wrapper '[>-A]@n' 'a&y#k-llLWk'  < ./inputs/input/ruin.279 
echo ">>>>>>>>running test 4581"
./replace_wrapper '[>-A][>-A]' '1!{5i'\''s.:7mc9esJG16_BM+B-K'  < ./inputs/input/ruin.820 
echo ">>>>>>>>running test 4582"
./replace_wrapper '[>-Az-}]' '%}8@>aTrygnRh-u lvO3z#S['  < ./inputs/input/ruin.921 
echo ">>>>>>>>running test 4583"
./replace_wrapper '[>-Az-}]' '<~{gj:'  < ./inputs/input/ruin.603 
echo ">>>>>>>>running test 4584"
./replace_wrapper '[>-Az-}]' '=C8YI{._KxMa0~n=|EB1|'  < ./inputs/input/ruin.1042 
echo ">>>>>>>>running test 4585"
./replace_wrapper '[>-Az-}]' '=G:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JG:]y;Zm{7<\33O~h_JC8YI{._KxMa0~n=|EB1|'  < ./inputs/input/ruin.1042 
echo ">>>>>>>>running test 4586"
./replace_wrapper '[>-Az-}]*' '%}8@>aTrygnRh-u lvO3z#S['  < ./inputs/input/ruin.921 
echo ">>>>>>>>running test 4587"
./replace_wrapper '[@@]?@*[^@n]?' 'a@nb@tc'  < ./inputs/temp-test/1075.inp.463.1 
echo ">>>>>>>>running test 4588"
./replace_wrapper '[@t ]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4589"
./replace_wrapper '[@t]' 'a@n'  < ./inputs/temp-test/235.inp.105.1 
echo ">>>>>>>>running test 4590"
./replace_wrapper '[@t]' 'a@n'  < ./inputs/temp-test/236.inp.105.2 
echo ">>>>>>>>running test 4591"
./replace_wrapper '[@t]' 'a@n'  < ./inputs/temp-test/237.inp.105.3 
echo ">>>>>>>>running test 4592"
./replace_wrapper '[@t]- [^0-9][^a-^?@n?' 'a&'  < ./inputs/temp-test/2250.inp.954.1 
echo ">>>>>>>>running test 4593"
./replace_wrapper '[@t]- [^0-9][^a-^?@n?' 'a&'  < ./inputs/temp-test/2251.inp.954.2 
echo ">>>>>>>>running test 4594"
./replace_wrapper '[@t]-[^9-B]--^*-?' 'a@n'  < ./inputs/temp-test/2082.inp.882.1 
echo ">>>>>>>>running test 4595"
./replace_wrapper '[@t]-^-' 'NEW'  < ./inputs/temp-test/683.inp.297.1 
echo ">>>>>>>>running test 4596"
./replace_wrapper '[@t]-^-' 'NEW'  < ./inputs/temp-test/684.inp.297.2 
echo ">>>>>>>>running test 4597"
./replace_wrapper '[@t]?' '&a@%'  < ./inputs/temp-test/882.inp.379.1 
echo ">>>>>>>>running test 4598"
./replace_wrapper '[@t]@*?[^-[9-B]-' 'b@t'  < ./inputs/temp-test/1731.inp.736.1 
echo ">>>>>>>>running test 4599"
./replace_wrapper '[@t][^0-9]' 'NEW'  < ./inputs/temp-test/1942.inp.825.1 
echo ">>>>>>>>running test 4600"
./replace_wrapper '[@t][^0-9]' 'NEW'  < ./inputs/temp-test/1943.inp.825.3 
echo ">>>>>>>>running test 4601"
./replace_wrapper '[A-G0-9c-a]' '0$'  < ./inputs/input/ruin.965 
echo ">>>>>>>>running test 4602"
./replace_wrapper '[A-G>-A0-9Z-a]^_`a-z-}z-}]$' 'evC g}bq'\''@;cuD;hR8`'  < ./inputs/input/ruin.1630 
echo ">>>>>>>>running test 4603"
./replace_wrapper '[A-G>-AZ-a]^_`a-z-}z-}-Z-aZ[]^_`a][A-G>-AZ-a]^_`a-z-}z-}-Z-aZ[]^_`a]:' 'A'  < ./inputs/input/ruin.298 
echo ">>>>>>>>running test 4604"
./replace_wrapper '[A-GZ-a]^_`a-Z-aZ[]^_`a]' '{M'  < ./inputs/input/ruin.864 
echo ">>>>>>>>running test 4605"
./replace_wrapper '[A-GZ-a]^_`a-z-}z-}->-A>-A-A-GABCDEFGy]' '9'  < ./inputs/input/ruin.327 
echo ">>>>>>>>running test 4606"
./replace_wrapper '[A-GZ-a]^_`a-z-}z-}->-A>-A-A-GABCDEFGy]B]ddB]@t]*[@t@][9-B]' '9'  < ./inputs/input/ruin.327 
echo ">>>>>>>>running test 4607"
./replace_wrapper '[A-GZ-a]^_`a]' 'ZuL'  < ./inputs/input/ruin.1986 
echo ">>>>>>>>running test 4608"
./replace_wrapper '[A-G]' '0YCrgUE!LL6G_5f<m,Jkg0xpW'  < ./inputs/input/ruin.777 
echo ">>>>>>>>running test 4609"
./replace_wrapper '[A-G]' '4'  < ./inputs/input/ruin.450 
echo ">>>>>>>>running test 4610"
./replace_wrapper '[A-G]' '6]^!oZ.:nm/o7[-L95B&K9V&3'  < ./inputs/input/ruin.694 
echo ">>>>>>>>running test 4611"
./replace_wrapper '[A-G]' ':MJ8*qY`8'\''vLKqNaKaK&HJQKlK)>A'  < ./inputs/input/ruin.657 
echo ">>>>>>>>running test 4612"
./replace_wrapper '[A-G]' 'E:H\y;lNQZu08<\]<'  < ./inputs/input/ruin.388 
echo ">>>>>>>>running test 4613"
./replace_wrapper '[A-G]' 'N'  < ./inputs/input/ruin.647 
echo ">>>>>>>>running test 4614"
./replace_wrapper '[A-G]' 'OmS[X@@s5c_'  < ./inputs/input/ruin.674 
echo ">>>>>>>>running test 4615"
./replace_wrapper '[A-G]' '_'  < ./inputs/input/ruin.632 
echo ">>>>>>>>running test 4616"
./replace_wrapper '[A-G]' 'ho]3#Ftwk3<O@P'  < ./inputs/input/ruin.1570 
echo ">>>>>>>>running test 4617"
./replace_wrapper '[A-G]' 'o'  < ./inputs/input/ruin.292 
echo ">>>>>>>>running test 4618"
./replace_wrapper '[A-G]*' 'CD?Kn2vz[1x#3A{vny,"]_gwInrWC<[9\(}S$J/>[V]^gj;jI2'  < ./inputs/input/ruin.1669 
echo ">>>>>>>>running test 4619"
./replace_wrapper '[A-G]?' 'x'  < ./inputs/input/ruin.1538 
echo ">>>>>>>>running test 4620"
./replace_wrapper '[A-G]@8' '`FtUy"ZE>GnU;'\''YIDS'\''X9"iFzSRIUUE%er[]kgNc}vQ@yAP>Uv$LK'\''l{hQxb'\''z|'  < ./inputs/input/ruin.1506 
echo ">>>>>>>>running test 4621"
./replace_wrapper '[A-G]@@' 'ZSfeyi|K>"6x;;rR<78XU=W{QrkUiM^S5tp<*{,9`9'  < ./inputs/input/ruin.329 
echo ">>>>>>>>running test 4622"
./replace_wrapper '[A-G]@@9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9]][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]-*[0-9][@t]*[@t@][9-B]' 'ZSfeyi|K>"6x;;rR<78XU=W{QrkUiM^S5tp<*{,9`9'  < ./inputs/input/ruin.329 
echo ">>>>>>>>running test 4623"
./replace_wrapper '[A-G]@n' 'o&;kasdlfkj'  < ./inputs/input/ruin.292 
echo ">>>>>>>>running test 4624"
./replace_wrapper '[A-Gk0-90-9z-}z-}]' '2'  < ./inputs/input/ruin.147 
echo ">>>>>>>>running test 4625"
./replace_wrapper '[A-Gz-}]' '[8='  < ./inputs/input/ruin.1073 
echo ">>>>>>>>running test 4626"
./replace_wrapper '[A-z]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4627"
./replace_wrapper '[EZ-a]^_`a]?' 'B6'  < ./inputs/input/ruin.1344 
echo ">>>>>>>>running test 4628"
./replace_wrapper '[EZ-a]^_`a]?' 'Btemp-test/229.inp.1temp-test/229.inp.1temp-test/229.inp.1temp-test/229.inp.1temp-test/229.inp.1*?@t*[^0-9][0-9]*?@t*[^0-9][0-9]*?@t*[^0-9][0-9]*?@t*[^0-9][0-9]6*?@t*[^0-9][0-9]'  < ./inputs/input/ruin.1344 
echo ">>>>>>>>running test 4629"
./replace_wrapper '[EZ-a]^_`a]?[^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c][^a-c]*?--*?* *[a--b][^a-c]' 'B6'  < ./inputs/input/ruin.1344 
echo ">>>>>>>>running test 4630"
./replace_wrapper '[H]@@' 'Cvj;!/7QaWXcBn_:K4~nT[ &j/4fJh'  < ./inputs/input/ruin.1517 
echo ">>>>>>>>running test 4631"
./replace_wrapper '[J-P]@n' '`&`'  < ./inputs/input/ruin.278 
echo ">>>>>>>>running test 4632"
./replace_wrapper '[M]' ''  < ./inputs/input/ruin.456 
echo ">>>>>>>>running test 4633"
./replace_wrapper '[O>-A]' 'v'  < ./inputs/input/ruin.508 
echo ">>>>>>>>running test 4634"
./replace_wrapper '[T]' 'SaWpU='  < ./inputs/input/ruin.1721 
echo ">>>>>>>>running test 4635"
./replace_wrapper '[W]' ':'  < ./inputs/input/ruin.1717 
echo ">>>>>>>>running test 4636"
./replace_wrapper '[W]<' '1'  < ./inputs/input/ruin.300 
echo ">>>>>>>>running test 4637"
./replace_wrapper '[Y-a]^_' '&aaaaaaaaaaaaaaaaaaa&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4638"
./replace_wrapper '[Z-a]' '&aNfc%bv4h]P(;lr%%=i&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4639"
./replace_wrapper '[Z-a]^_' '&aNfc%bv4h]P(;lr%%=i&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4640"
./replace_wrapper '[Z-a]^_' '&doesthecharactermat&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4641"
./replace_wrapper '[Z-a]^_`a->-A>-A-0-90123456789-z-}z-}?-Z-aZ[]^_`aO->-A>-A-0-90123456789]' 'Vgq"#'\''/=PA@'  < ./inputs/input/ruin.369 
echo ">>>>>>>>running test 4642"
./replace_wrapper '[Z-a]^_`a-A-GABCDEFG-c-ac-a]' 'Eu!'  < ./inputs/input/ruin.218 
echo ">>>>>>>>running test 4643"
./replace_wrapper '[Z-a]^_`a-A-GABCDEFG]' '!'  < ./inputs/input/ruin.1844 
echo ">>>>>>>>running test 4644"
./replace_wrapper '[Z-a]^_`a-Z-aZ[]^_`a-A-GABCDEFG-z-}z-}-0-90123456789]' '`3d11q~?6`O91g=3eoBIC5qim`g8BS\|!}xE?01/),55cn*"[Oq_(Pr{liHN~G)'  < ./inputs/input/ruin.1146 
echo ">>>>>>>>running test 4645"
./replace_wrapper '[Z-a]^_`a-Z-aZ[]^_`a-z-}z-}-c-ac-a-c-ac-a]' '7:'  < ./inputs/input/ruin.1123 
echo ">>>>>>>>running test 4646"
./replace_wrapper '[Z-a]^_`a-c-ac-a]' '&aNfc%bv4h]P(;lr%%=i&'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4647"
./replace_wrapper '[Z-a]^_`a-c-ac-a]' '&aNfc%bv4h]P(;lr%%=i&+M7yZz'\''-}}{nQhj^V}:KKyM_j)'  < ./inputs/input/ruin.506 
echo ">>>>>>>>running test 4648"
./replace_wrapper '[Z-a]^_`a0-Z-aZ[]^_`a-A-GABCDEFG-0-90123456789-c-ac-a-z-}z-}-Z-aZ[]^_`a-Z-aZ[]^_`a-Z-aZ[]^_`a]' 'ix)<}kUWz8gj>OS7mesntcvv<ov '\''N{PJ+]l??jco'  < ./inputs/input/ruin.1350 
echo ">>>>>>>>running test 4649"
./replace_wrapper '[Z-a]^_`a0-Z-aZ[]^_`a-A-]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rY]~M\ Wz]`M0)y8H?fc7Phqi}@,5rYGABCDEFG-0-90123456789-c-ac-a-z-}z-}-Z-aZ[]^_`a-Z-aZ[]^_`a-Z-aZ[]^_`a] *[a--b][^a-c][^a--*?* *[a' 'ix)<}kUWz8gj>OS7mesntcvv<ov '\''N{PJ+]l??jco'  < ./inputs/input/ruin.1350 
echo ">>>>>>>>running test 4650"
./replace_wrapper '[Z-a]^_`aLT6]' 'S%Rm9'  < ./inputs/input/ruin.1423 
echo ">>>>>>>>running test 4651"
./replace_wrapper '[Z-a]^_`a]$' '<N#25jF0##%:+[kG}Yl0M'\''U\(&UQKc$V &/*K)n'  < ./inputs/input/ruin.1182 
echo ">>>>>>>>running test 4652"
./replace_wrapper '[Z-a]^_`a]' '#0F67ERJA=Hu9-H,>NK'  < ./inputs/input/ruin.1913 
echo ">>>>>>>>running test 4653"
./replace_wrapper '[Z-a]^_`a]' '(=?$W( CnR{$4.C~2N2!G>A8s&)n|{uPg;\eT'  < ./inputs/input/ruin.627 
echo ">>>>>>>>running test 4654"
./replace_wrapper '[Z-a]^_`a]' '+|>xCvy_Drp.ISXFXg'\''n`'  < ./inputs/input/ruin.1724 
echo ">>>>>>>>running test 4655"
./replace_wrapper '[Z-a]^_`a]' '9'  < ./inputs/input/ruin.1243 
echo ">>>>>>>>running test 4656"
./replace_wrapper '[Z-a]^_`a]' ':-dY=*uE-5KsKFXferbm `[CS;i4I$<41p45>~2nqF}*+Y.QBq'  < ./inputs/input/ruin.701 
echo ">>>>>>>>running test 4657"
./replace_wrapper '[Z-a]^_`a]' 'F'  < ./inputs/input/ruin.1906 
echo ">>>>>>>>running test 4658"
./replace_wrapper '[Z-a]^_`a]' 'JY2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{G2k|h=&-kA{I^m)l>oO{GXAlF<%'  < ./inputs/input/ruin.1032 
echo ">>>>>>>>running test 4659"
./replace_wrapper '[Z-a]^_`a]' 'JYXAlF<%'  < ./inputs/input/ruin.1032 
echo ">>>>>>>>running test 4660"
./replace_wrapper '[Z-a]^_`a]' 'L#\yx[]iZObU!WRS'  < ./inputs/input/ruin.1941 
echo ">>>>>>>>running test 4661"
./replace_wrapper '[Z-a]^_`a]' 'NgW3k~nFJWW0d%"'  < ./inputs/input/ruin.1110 
echo ">>>>>>>>running test 4662"
./replace_wrapper '[Z-a]^_`a]' 'UvR'  < ./inputs/input/ruin.979 
echo ">>>>>>>>running test 4663"
./replace_wrapper '[Z-a]^_`a]' '\/Jo n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 4664"
./replace_wrapper '[Z-a]^_`a]' 'l'  < ./inputs/input/ruin.61 
echo ">>>>>>>>running test 4665"
./replace_wrapper '[Z-a]^_`a]*$' '9'  < ./inputs/input/ruin.1243 
echo ">>>>>>>>running test 4666"
./replace_wrapper '[Z-a]^_`a]*' '3'  < ./inputs/input/ruin.281 
echo ">>>>>>>>running test 4667"
./replace_wrapper '[Z-a]^_`a]*' 'B"StB'  < ./inputs/input/ruin.231 
echo ">>>>>>>>running test 4668"
./replace_wrapper '[Z-a]^_`a]*@n' '3&4'  < ./inputs/input/ruin.281 
echo ">>>>>>>>running test 4669"
./replace_wrapper '[Z-a]^_`a]@n' '\/J&o n3Hj!!XA\!!Z;'\''k#\pku:-g*G ;iMw3]'  < ./inputs/input/ruin.1191 
echo ">>>>>>>>running test 4670"
./replace_wrapper '[Z-a]^_`a][Z-a]^_`a]$' 'm'  < ./inputs/input/ruin.1879 
echo ">>>>>>>>running test 4671"
./replace_wrapper '[Z-a]^_`a][Z-a]^_`a]@n#' 'R'  < ./inputs/input/ruin.417 
echo ">>>>>>>>running test 4672"
./replace_wrapper '[[]c' 'Sn{zDvs@tuu'  < ./inputs/input/ruin.1433 
echo ">>>>>>>>running test 4673"
./replace_wrapper '[]%?@*' 'NEW'  < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 4674"
./replace_wrapper '[]%@*?' '@%&a'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 4675"
./replace_wrapper '[]*' 'c'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4676"
./replace_wrapper '[]- ' '&'  < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 4677"
./replace_wrapper '[]-*[^0-9]' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 4678"
./replace_wrapper '[]?@*' 'NEW'  < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 4679"
./replace_wrapper '[]?@*' 'NEW'  < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 4680"
./replace_wrapper '[][^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4681"
./replace_wrapper '[][^9-B]@[' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 4682"
./replace_wrapper '[][^9-B][9-B]' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 4683"
./replace_wrapper '[][^a-c][9-B]' '@%&a'  < ./inputs/temp-test/223.inp.99.3 
echo ">>>>>>>>running test 4684"
./replace_wrapper '[][a-c?$' 'a&'  < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 4685"
./replace_wrapper '[][a-c?' 'a&'  < ./inputs/temp-test/516.inp.225.1 
echo ">>>>>>>>running test 4686"
./replace_wrapper '[][a-c?' 'a&'  < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 4687"
./replace_wrapper '[][a-c?' 'a&'  < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 4688"
./replace_wrapper '[][a-c?' 'a&'  < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 4689"
./replace_wrapper '[^!>-A]*' 'QdoJH\dI\~"(oA~yU11n~l'  < ./inputs/input/ruin.1697 
echo ">>>>>>>>running test 4690"
./replace_wrapper '[^&Z-a]^_`a-A-GABCDEFG]' '('\''5Z}NQGMdc/,=*#hydyO{Ga&=U<s+*G9cE}St6@wRb%L&s^*N0%U<cmItT-A|y.VJka@+1D]*&H#Avoj:kg6eHS(Ax|_N$.^U|h>^-9c0J'  < ./inputs/input/ruin.1969 
echo ">>>>>>>>running test 4691"
./replace_wrapper '[^- *$' '&a@%'  < ./inputs/temp-test/1616.inp.686.8 
echo ">>>>>>>>running test 4692"
./replace_wrapper '[^- *' '&a@%'  < ./inputs/temp-test/1614.inp.686.1 
echo ">>>>>>>>running test 4693"
./replace_wrapper '[^- *' '&a@%'  < ./inputs/temp-test/1615.inp.686.3 
echo ">>>>>>>>running test 4694"
./replace_wrapper '[^--$' '@n'  < ./inputs/temp-test/1594.inp.678.8 
echo ">>>>>>>>running test 4695"
./replace_wrapper '[^--$' '@n'  < ./inputs/temp-test/1595.inp.678.9 
echo ">>>>>>>>running test 4696"
./replace_wrapper '[^--' '&a@%'  < ./inputs/temp-test/66.inp.29.1 
echo ">>>>>>>>running test 4697"
./replace_wrapper '[^--' '&a@%'  < ./inputs/temp-test/67.inp.29.2 
echo ">>>>>>>>running test 4698"
./replace_wrapper '[^--' '&a@%'  < ./inputs/temp-test/68.inp.29.3 
echo ">>>>>>>>running test 4699"
./replace_wrapper '[^--' '@%&a'  < ./inputs/temp-test/1443.inp.619.1 
echo ">>>>>>>>running test 4700"
./replace_wrapper '[^--' '@%&a'  < ./inputs/temp-test/1444.inp.619.2 
echo ">>>>>>>>running test 4701"
./replace_wrapper '[^--' '@%&a'  < ./inputs/temp-test/1445.inp.619.3 
echo ">>>>>>>>running test 4702"
./replace_wrapper '[^--' '@n'  < ./inputs/temp-test/1591.inp.678.1 
echo ">>>>>>>>running test 4703"
./replace_wrapper '[^--' '@n'  < ./inputs/temp-test/1592.inp.678.3 
echo ">>>>>>>>running test 4704"
./replace_wrapper '[^--' '@n'  < ./inputs/temp-test/1593.inp.678.4 
echo ">>>>>>>>running test 4705"
./replace_wrapper '[^--z]%[9-B]' '@n'  < ./inputs/temp-test/19.inp.9.1 
echo ">>>>>>>>running test 4706"
./replace_wrapper '[^--z]%[9-B]' '@n'  < ./inputs/temp-test/20.inp.9.2 
echo ">>>>>>>>running test 4707"
./replace_wrapper '[^--z]%[9-B]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4708"
./replace_wrapper '[^--z]A*??[_-z]' 'a&'  < ./inputs/temp-test/963.inp.415.1 
echo ">>>>>>>>running test 4709"
./replace_wrapper '[^--z]A*??[_-z]' 'a&'  < ./inputs/temp-test/964.inp.415.2 
echo ">>>>>>>>running test 4710"
./replace_wrapper '[^--z][9-B]$%' '@n'  < ./inputs/temp-test/22.inp.9.6 
echo ">>>>>>>>running test 4711"
./replace_wrapper '[^--z][9-B]$' '@n'  < ./inputs/temp-test/22.inp.9.6 
echo ">>>>>>>>running test 4712"
./replace_wrapper '[^--z][9-B]%' '@n'  < ./inputs/temp-test/21.inp.9.3 
echo ">>>>>>>>running test 4713"
./replace_wrapper '[^--z][9-B]' '@n'  < ./inputs/temp-test/19.inp.9.1 
echo ">>>>>>>>running test 4714"
./replace_wrapper '[^--z][9-B]' '@n'  < ./inputs/temp-test/20.inp.9.2 
echo ">>>>>>>>running test 4715"
./replace_wrapper '[^--z][9-B]' '@n'  < ./inputs/temp-test/21.inp.9.3 
echo ">>>>>>>>running test 4716"
./replace_wrapper '[^-?' 'NEW'  < ./inputs/temp-test/1328.inp.570.1 
echo ">>>>>>>>running test 4717"
./replace_wrapper '[^-?' 'NEW'  < ./inputs/temp-test/1329.inp.570.2 
echo ">>>>>>>>running test 4718"
./replace_wrapper '[^-c*$' '@%&a'  < ./inputs/temp-test/1440.inp.617.6 
echo ">>>>>>>>running test 4719"
./replace_wrapper '[^-c*' '@%&a'  < ./inputs/temp-test/1437.inp.617.1 
echo ">>>>>>>>running test 4720"
./replace_wrapper '[^-c*' '@%&a'  < ./inputs/temp-test/1438.inp.617.2 
echo ">>>>>>>>running test 4721"
./replace_wrapper '[^-c*' '@%&a'  < ./inputs/temp-test/1439.inp.617.3 
echo ">>>>>>>>running test 4722"
./replace_wrapper '[^-z] ' 'NEW'  < ./inputs/temp-test/246.inp.110.1 
echo ">>>>>>>>running test 4723"
./replace_wrapper '[^-z] ' 'NEW'  < ./inputs/temp-test/247.inp.110.3 
echo ">>>>>>>>running test 4724"
./replace_wrapper '[^-z]-$' '&a@%'  < ./inputs/temp-test/197.inp.88.6 
echo ">>>>>>>>running test 4725"
./replace_wrapper '[^-z]-' '&a@%'  < ./inputs/temp-test/195.inp.88.1 
echo ">>>>>>>>running test 4726"
./replace_wrapper '[^-z]-' '&a@%'  < ./inputs/temp-test/196.inp.88.2 
echo ">>>>>>>>running test 4727"
./replace_wrapper '[^-z]-*? ' 'NEW'  < ./inputs/temp-test/906.inp.390.1 
echo ">>>>>>>>running test 4728"
./replace_wrapper '[^-z]?' 'a@n'  < ./inputs/temp-test/1243.inp.534.1 
echo ">>>>>>>>running test 4729"
./replace_wrapper '[^-z]?' 'a@n'  < ./inputs/temp-test/1244.inp.534.2 
echo ">>>>>>>>running test 4730"
./replace_wrapper '[^-z]?' 'a@n'  < ./inputs/temp-test/1245.inp.534.3 
echo ">>>>>>>>running test 4731"
./replace_wrapper '[^-z]?' 'a@n'  < ./inputs/temp-test/1246.inp.534.4 
echo ">>>>>>>>running test 4732"
./replace_wrapper '[^-z]?*' '&a@%'  < ./inputs/temp-test/195.inp.88.1 
echo ">>>>>>>>running test 4733"
./replace_wrapper '[^-z][0-9][^0-9]-[^9-B]A[a-c]-' 'NEW'  < ./inputs/temp-test/1814.inp.771.1 
echo ">>>>>>>>running test 4734"
./replace_wrapper '[^-z][0-9][^0-9]-[^9-B]A[a-c]-' 'NEW'  < ./inputs/temp-test/1815.inp.771.3 
echo ">>>>>>>>running test 4735"
./replace_wrapper '[^-z][@t]' ''  < ./inputs/temp-test/288.inp.130.1 
echo ">>>>>>>>running test 4736"
./replace_wrapper '[^-z][@t]' ''  < ./inputs/temp-test/289.inp.130.2 
echo ">>>>>>>>running test 4737"
./replace_wrapper '[^-z][a-c]' '&a@%'  < ./inputs/temp-test/1205.inp.517.1 
echo ">>>>>>>>running test 4738"
./replace_wrapper '[^-z][a-c]' '&a@%'  < ./inputs/temp-test/1206.inp.517.2 
echo ">>>>>>>>running test 4739"
./replace_wrapper '[^0-8]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4740"
./replace_wrapper '[^0-90-9u]' 'f'  < ./inputs/input/ruin.548 
echo ">>>>>>>>running test 4741"
./replace_wrapper '[^0-9;]$' '>'  < ./inputs/input/ruin.332 
echo ">>>>>>>>running test 4742"
./replace_wrapper '[^0-9Z-a]^_`a]' '4bd);DUiRc/4$MeR6|.'\''`S+S5?Svq*-:$3a%be-Mfw:wUM~'  < ./inputs/input/ruin.212 
echo ">>>>>>>>running test 4743"
./replace_wrapper '[^0-9Z-a]^_`a]' 'U'  < ./inputs/input/ruin.1193 
echo ">>>>>>>>running test 4744"
./replace_wrapper '[^0-9] ' '&'  < ./inputs/temp-test/542.inp.235.1 
echo ">>>>>>>>running test 4745"
./replace_wrapper '[^0-9] ' '&'  < ./inputs/temp-test/543.inp.235.2 
echo ">>>>>>>>running test 4746"
./replace_wrapper '[^0-9] [^9-B]--[0-9]??[a-c]?-' ''  < ./inputs/temp-test/566.inp.244.1 
echo ">>>>>>>>running test 4747"
./replace_wrapper '[^0-9] [^9-B]--[0-9]??[a-c]?-' ''  < ./inputs/temp-test/567.inp.244.2 
echo ">>>>>>>>running test 4748"
./replace_wrapper '[^0-9]$' '!ds4gkawP:i7J_3'\''>/n_R,P&3 M-8.V_Q:_"}~S<>|@o`/W(*k+9(jm043S9!G6]'\''z$~\Z]z[Q'  < ./inputs/input/ruin.1388 
echo ">>>>>>>>running test 4749"
./replace_wrapper '[^0-9]$' '5{>@K4{U'\'')}ombe;=z'  < ./inputs/input/ruin.382 
echo ">>>>>>>>running test 4750"
./replace_wrapper '[^0-9]$' '@%&a'  < ./inputs/temp-test/93.inp.41.6 
echo ">>>>>>>>running test 4751"
./replace_wrapper '[^0-9]$' 'Lj*D?G)%2iN-C+ARIR6:>9'\''YDdLk^UF%}+pBG'  < ./inputs/input/ruin.986 
echo ">>>>>>>>running test 4752"
./replace_wrapper '[^0-9]%' '&a@%'  < ./inputs/temp-test/2336.inp.991.1 
echo ">>>>>>>>running test 4753"
./replace_wrapper '[^0-9]%' '@t'  < ./inputs/temp-test/23.inp.10.1 
echo ">>>>>>>>running test 4754"
./replace_wrapper '[^0-9]' '%:ZqYa+)t&(X[6Q3?\Xa0eh-a'  < ./inputs/input/ruin.960 
echo ">>>>>>>>running test 4755"
./replace_wrapper '[^0-9]' '%GA1aneafjT*EQumxjb-hg\}lz$~TPz$Ac'  < ./inputs/input/ruin.77 
echo ">>>>>>>>running test 4756"
./replace_wrapper '[^0-9]' '&'  < ./inputs/temp-test/664.inp.289.1 
echo ">>>>>>>>running test 4757"
./replace_wrapper '[^0-9]' '&@n'  < ./inputs/temp-test/629.inp.272.1 
echo ">>>>>>>>running test 4758"
./replace_wrapper '[^0-9]' '&@n'  < ./inputs/temp-test/630.inp.272.3 
echo ">>>>>>>>running test 4759"
./replace_wrapper '[^0-9]' '&@n'  < ./inputs/temp-test/688.inp.299.1 
echo ">>>>>>>>running test 4760"
./replace_wrapper '[^0-9]' '&@n'  < ./inputs/temp-test/689.inp.299.3 
echo ">>>>>>>>running test 4761"
./replace_wrapper '[^0-9]' '&@n@ttt'  < ./inputs/temp-test/688.inp.299.1 
echo ">>>>>>>>running test 4762"
./replace_wrapper '[^0-9]' '&a@%'  < ./inputs/temp-test/2336.inp.991.1 
echo ">>>>>>>>running test 4763"
./replace_wrapper '[^0-9]' '*DyU/0]4LcsUAUsl4RUKt@z?h4?u1M'  < ./inputs/input/ruin.679 
echo ">>>>>>>>running test 4764"
./replace_wrapper '[^0-9]' '4'  < ./inputs/input/ruin.877 
echo ">>>>>>>>running test 4765"
./replace_wrapper '[^0-9]' '@%&a'  < ./inputs/temp-test/91.inp.41.1 
echo ">>>>>>>>running test 4766"
./replace_wrapper '[^0-9]' '@%&a'  < ./inputs/temp-test/92.inp.41.2 
echo ">>>>>>>>running test 4767"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/1239.inp.532.1 
echo ">>>>>>>>running test 4768"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/2002.inp.851.1 
echo ">>>>>>>>running test 4769"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/2003.inp.851.2 
echo ">>>>>>>>running test 4770"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/2004.inp.851.3 
echo ">>>>>>>>running test 4771"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/2273.inp.963.1 
echo ">>>>>>>>running test 4772"
./replace_wrapper '[^0-9]' '@%@&'  < ./inputs/temp-test/2274.inp.963.3 
echo ">>>>>>>>running test 4773"
./replace_wrapper '[^0-9]' '@t'  < ./inputs/temp-test/23.inp.10.1 
echo ">>>>>>>>running test 4774"
./replace_wrapper '[^0-9]' 'KE>/]y#k0F!l)'  < ./inputs/input/ruin.444 
echo ">>>>>>>>running test 4775"
./replace_wrapper '[^0-9]' 'NEW'  < ./inputs/temp-test/2176.inp.921.1 
echo ">>>>>>>>running test 4776"
./replace_wrapper '[^0-9]' 'NEW'  < ./inputs/temp-test/2177.inp.921.2 
echo ">>>>>>>>running test 4777"
./replace_wrapper '[^0-9]' 'NEW'  < ./inputs/temp-test/2178.inp.921.3 
echo ">>>>>>>>running test 4778"
./replace_wrapper '[^0-9]' 'NEW'  < ./inputs/temp-test/660.inp.287.1 
echo ">>>>>>>>running test 4779"
./replace_wrapper '[^0-9]' 'NEW'  < ./inputs/temp-test/661.inp.287.3 
echo ">>>>>>>>running test 4780"
./replace_wrapper '[^0-9]' 'Y'  < ./inputs/input/ruin.160 
echo ">>>>>>>>running test 4781"
./replace_wrapper '[^0-9]' ']yO+C;|.#Ft_-n=^zs$NJA['  < ./inputs/input/ruin.1228 
echo ">>>>>>>>running test 4782"
./replace_wrapper '[^0-9]' 'b@t'  < ./inputs/temp-test/1186.inp.511.1 
echo ">>>>>>>>running test 4783"
./replace_wrapper '[^0-9]' 'd4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?P'  < ./inputs/input/ruin.195 
echo ">>>>>>>>running test 4784"
./replace_wrapper '[^0-9]' 'd4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?d4<!_ait4(;qppZ;+yY=io19UK]0,*~YBq?P'  < ./inputs/input/ruin.195 
echo ">>>>>>>>running test 4785"
./replace_wrapper '[^0-9]' 'h'  < ./inputs/input/ruin.1903 
echo ">>>>>>>>running test 4786"
./replace_wrapper '[^0-9]' 'q"'  < ./inputs/input/ruin.633 
echo ">>>>>>>>running test 4787"
./replace_wrapper '[^0-9]' '{'  < ./inputs/input/ruin.829 
echo ">>>>>>>>running test 4788"
./replace_wrapper '[^0-9]'\''' 'j'  < ./inputs/input/ruin.1346 
echo ">>>>>>>>running test 4789"
./replace_wrapper '[^0-9]'\''C|d<FQ' 'g99=H#ja[PxJokg/F\'  < ./inputs/input/ruin.1492 
echo ">>>>>>>>running test 4790"
./replace_wrapper '[^0-9]'\''V:W1pP' ':'  < ./inputs/input/ruin.662 
echo ">>>>>>>>running test 4791"
./replace_wrapper '[^0-9]'\''\2/L2y'\''@@*@@@=' ' +i`RYFz`5V/  W2?Y{N.1JW{5U"'\'''\''PH/yvFzwT=OI'  < ./inputs/input/ruin.1238 
echo ">>>>>>>>running test 4792"
./replace_wrapper '[^0-9]'\''\2/L2y'\''@@*@@@=*$' ' +i`RYFz`5V/  W2?Y{N.1JW{5U"'\'''\''PH/yvFzwT=OI'  < ./inputs/input/ruin.1238 
echo ">>>>>>>>running test 4793"
./replace_wrapper '[^0-9]-$' '@%@&'  < ./inputs/temp-test/968.inp.417.8 
echo ">>>>>>>>running test 4794"
./replace_wrapper '[^0-9]-' '@%&a'  < ./inputs/temp-test/1568.inp.670.1 
echo ">>>>>>>>running test 4795"
./replace_wrapper '[^0-9]-' '@%&a'  < ./inputs/temp-test/1569.inp.670.2 
echo ">>>>>>>>running test 4796"
./replace_wrapper '[^0-9]-' '@%&a'  < ./inputs/temp-test/1697.inp.724.1 
echo ">>>>>>>>running test 4797"
./replace_wrapper '[^0-9]-' '@%&a'  < ./inputs/temp-test/1698.inp.724.3 
echo ">>>>>>>>running test 4798"
./replace_wrapper '[^0-9]-' '@%&a'  < ./inputs/temp-test/1699.inp.724.4 
echo ">>>>>>>>running test 4799"
./replace_wrapper '[^0-9]-' '@%@&'  < ./inputs/temp-test/967.inp.417.1 
echo ">>>>>>>>running test 4800"
./replace_wrapper '[^0-9]-' 'NEW'  < ./inputs/temp-test/1589.inp.677.1 
echo ">>>>>>>>running test 4801"
./replace_wrapper '[^0-9]-' 'NEW'  < ./inputs/temp-test/1590.inp.677.2 
echo ">>>>>>>>running test 4802"
./replace_wrapper '[^0-9]-' 'a&'  < ./inputs/temp-test/1136.inp.489.1 
echo ">>>>>>>>running test 4803"
./replace_wrapper '[^0-9]-' 'a&'  < ./inputs/temp-test/1137.inp.489.2 
echo ">>>>>>>>running test 4804"
./replace_wrapper '[^0-9]-' 'a&'  < ./inputs/temp-test/1138.inp.489.3 
echo ">>>>>>>>running test 4805"
./replace_wrapper '[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/2091.inp.886.1 
echo ">>>>>>>>running test 4806"
./replace_wrapper '[^0-9]-' 'a@nb@tc'  < ./inputs/temp-test/2092.inp.886.2 
echo ">>>>>>>>running test 4807"
./replace_wrapper '[^0-9]-*' '&'  < ./inputs/temp-test/1014.inp.436.1 
echo ">>>>>>>>running test 4808"
./replace_wrapper '[^0-9]-*' '&'  < ./inputs/temp-test/1015.inp.436.2 
echo ">>>>>>>>running test 4809"
./replace_wrapper '[^0-9]--?@*-[9-B]@[' '@n'  < ./inputs/temp-test/1906.inp.809.1 
echo ">>>>>>>>running test 4810"
./replace_wrapper '[^0-9]--?@*-[9-B]@[' '@n'  < ./inputs/temp-test/1907.inp.809.2 
echo ">>>>>>>>running test 4811"
./replace_wrapper '[^0-9]-?' '&a@%'  < ./inputs/temp-test/2257.inp.957.1 
echo ">>>>>>>>running test 4812"
./replace_wrapper '[^0-9]-?' '&a@%'  < ./inputs/temp-test/2258.inp.957.3 
echo ">>>>>>>>running test 4813"
./replace_wrapper '[^0-9]-?[9-B]*$' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4814"
./replace_wrapper '[^0-9]-?[9-B]*' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4815"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]*$' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4816"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]*' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4817"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]?'   < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4818"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]?'   < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4819"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4820"
./replace_wrapper '[^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4821"
./replace_wrapper '[^0-9]-?[][9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4822"
./replace_wrapper '[^0-9]-?[^][9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4823"
./replace_wrapper '[^0-9]-^-]??[9-B]?' '@t'  < ./inputs/temp-test/2321.inp.985.1 
echo ">>>>>>>>running test 4824"
./replace_wrapper '[^0-9]-^-]??[9-B]?' '@t'  < ./inputs/temp-test/2322.inp.985.3 
echo ">>>>>>>>running test 4825"
./replace_wrapper '[^0-9]?' '@%@&'  < ./inputs/temp-test/941.inp.404.1 
echo ">>>>>>>>running test 4826"
./replace_wrapper '[^0-9]?*' '@t'  < ./inputs/temp-test/525.inp.228.1 
echo ">>>>>>>>running test 4827"
./replace_wrapper '[^0-9]?*' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 4828"
./replace_wrapper '[^0-9]?-?[^a--b]'   < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4829"
./replace_wrapper '[^0-9]?-?[^a--b]' '&@n'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4830"
./replace_wrapper '[^0-9]?-?[^a--b]' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4831"
./replace_wrapper '[^0-9]?-?[^a--b]'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4832"
./replace_wrapper '[^0-9]?-?[^a--b]*$' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4833"
./replace_wrapper '[^0-9]?-?[^a--b]*$'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4834"
./replace_wrapper '[^0-9]?-?[^a--b]*' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4835"
./replace_wrapper '[^0-9]?-?[^a--b]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4836"
./replace_wrapper '[^0-9]?[^@@]a-]?A' ''  < ./inputs/temp-test/1432.inp.615.1 
echo ">>>>>>>>running test 4837"
./replace_wrapper '[^0-9]?[^@@]a-]?A' ''  < ./inputs/temp-test/1433.inp.615.2 
echo ">>>>>>>>running test 4838"
./replace_wrapper '[^0-9]?[^@@]a-]?A' ''  < ./inputs/temp-test/1434.inp.615.4 
echo ">>>>>>>>running test 4839"
./replace_wrapper '[^0-9]?[a-c] [^0-9]?[a-c]-[a--b]?^a-c]$' '&'  < ./inputs/temp-test/1269.inp.544.6 
echo ">>>>>>>>running test 4840"
./replace_wrapper '[^0-9]?[a-c] [^0-9]?[a-c]-[a--b]?^a-c]' '&'  < ./inputs/temp-test/1268.inp.544.1 
echo ">>>>>>>>running test 4841"
./replace_wrapper '[^0-9]?^[a-c]?[^a--?A*[^9-B]$' '@t'  < ./inputs/temp-test/1551.inp.663.9 
echo ">>>>>>>>running test 4842"
./replace_wrapper '[^0-9]?^[a-c]?[^a--?A*[^9-B]' '@t'  < ./inputs/temp-test/1549.inp.663.1 
echo ">>>>>>>>running test 4843"
./replace_wrapper '[^0-9]?^[a-c]?[^a--?A*[^9-B]' '@t'  < ./inputs/temp-test/1550.inp.663.2 
echo ">>>>>>>>running test 4844"
./replace_wrapper '[^0-9]@@' ''  < ./inputs/input/ruin.36 
echo ">>>>>>>>running test 4845"
./replace_wrapper '[^0-9]@@' 'b@t'  < ./inputs/temp-test/679.inp.295.1 
echo ">>>>>>>>running test 4846"
./replace_wrapper '[^0-9]@@' 'b@t'  < ./inputs/temp-test/680.inp.295.3 
echo ">>>>>>>>running test 4847"
./replace_wrapper '[^0-9]@[' '@%&a'  < ./inputs/temp-test/688.inp.299.1 
echo ">>>>>>>>running test 4848"
./replace_wrapper '[^0-9]@[' '@%&a'  < ./inputs/temp-test/689.inp.299.3 
echo ">>>>>>>>running test 4849"
./replace_wrapper '[^0-9]@[*' ''  < ./inputs/temp-test/1178.inp.508.1 
echo ">>>>>>>>running test 4850"
./replace_wrapper '[^0-9]@[*' ''  < ./inputs/temp-test/1179.inp.508.2 
echo ">>>>>>>>running test 4851"
./replace_wrapper '[^0-9]@[*' 'a&'  < ./inputs/temp-test/1821.inp.774.1 
echo ">>>>>>>>running test 4852"
./replace_wrapper '[^0-9]@[*- ?[^a-][9-B]- ' 'NEW'  < ./inputs/temp-test/58.inp.25.1 
echo ">>>>>>>>running test 4853"
./replace_wrapper '[^0-9]@[*- ?[^a-][9-B]- ' 'NEW'  < ./inputs/temp-test/59.inp.25.2 
echo ">>>>>>>>running test 4854"
./replace_wrapper '[^0-9]@[*- ?[^a-][9-B]- ' 'NEW'  < ./inputs/temp-test/60.inp.25.3 
echo ">>>>>>>>running test 4855"
./replace_wrapper '[^0-9]@n' '&a@%'  < ./inputs/temp-test/1498.inp.642.1 
echo ">>>>>>>>running test 4856"
./replace_wrapper '[^0-9]@n' '&a@%'  < ./inputs/temp-test/1499.inp.642.2 
echo ">>>>>>>>running test 4857"
./replace_wrapper '[^0-9]@t*$' '&a@%'  < ./inputs/temp-test/462.inp.202.9 
echo ">>>>>>>>running test 4858"
./replace_wrapper '[^0-9]@t*' '&a@%'  < ./inputs/temp-test/460.inp.202.1 
echo ">>>>>>>>running test 4859"
./replace_wrapper '[^0-9]A?' '@n'  < ./inputs/temp-test/1833.inp.780.1 
echo ">>>>>>>>running test 4860"
./replace_wrapper '[^0-9]A?' '@n'  < ./inputs/temp-test/1834.inp.780.2 
echo ">>>>>>>>running test 4861"
./replace_wrapper '[^0-9][0-9]$' 'a&'  < ./inputs/temp-test/1379.inp.591.9 
echo ">>>>>>>>running test 4862"
./replace_wrapper '[^0-9][0-9]' '&a@%'  < ./inputs/temp-test/621.inp.268.1 
echo ">>>>>>>>running test 4863"
./replace_wrapper '[^0-9][0-9]' '&a@%'  < ./inputs/temp-test/622.inp.268.3 
echo ">>>>>>>>running test 4864"
./replace_wrapper '[^0-9][0-9]' 'a&'  < ./inputs/temp-test/1377.inp.591.1 
echo ">>>>>>>>running test 4865"
./replace_wrapper '[^0-9][0-9]' 'a&'  < ./inputs/temp-test/1378.inp.591.4 
echo ">>>>>>>>running test 4866"
./replace_wrapper '[^0-9][0-9]' 'a@n'  < ./inputs/temp-test/2233.inp.947.1 
echo ">>>>>>>>running test 4867"
./replace_wrapper '[^0-9][0-9]' 'a@n'  < ./inputs/temp-test/2234.inp.947.2 
echo ">>>>>>>>running test 4868"
./replace_wrapper '[^0-9][0-9]' 'a@n'  < ./inputs/temp-test/2235.inp.947.4 
echo ">>>>>>>>running test 4869"
./replace_wrapper '[^0-9][9-B]' '&'  < ./inputs/temp-test/1106.inp.476.1 
echo ">>>>>>>>running test 4870"
./replace_wrapper '[^0-9][9-B]' '&'  < ./inputs/temp-test/1107.inp.476.2 
echo ">>>>>>>>running test 4871"
./replace_wrapper '[^0-9][9-B]' '&'  < ./inputs/temp-test/1108.inp.476.3 
echo ">>>>>>>>running test 4872"
./replace_wrapper '[^0-9][9-B]' '&a@%'  < ./inputs/temp-test/1172.inp.505.1 
echo ">>>>>>>>running test 4873"
./replace_wrapper '[^0-9][9-B]' '&a@%'  < ./inputs/temp-test/1173.inp.505.2 
echo ">>>>>>>>running test 4874"
./replace_wrapper '[^0-9][9-B]' '&a@%'  < ./inputs/temp-test/1174.inp.505.3 
echo ">>>>>>>>running test 4875"
./replace_wrapper '[^0-9][9-B]' ''  < ./inputs/temp-test/1175.inp.506.1 
echo ">>>>>>>>running test 4876"
./replace_wrapper '[^0-9][9-B]' ''  < ./inputs/temp-test/1176.inp.506.3 
echo ">>>>>>>>running test 4877"
./replace_wrapper '[^0-9][9-B]*' '@%&a'  < ./inputs/temp-test/139.inp.65.1 
echo ">>>>>>>>running test 4878"
./replace_wrapper '[^0-9][9-B]*' '@%&a'  < ./inputs/temp-test/140.inp.65.2 
echo ">>>>>>>>running test 4879"
./replace_wrapper '[^0-9][9-B]*' '@%&a'  < ./inputs/temp-test/141.inp.65.3 
echo ">>>>>>>>running test 4880"
./replace_wrapper '[^0-9][9-B]?' '&a@%'  < ./inputs/temp-test/1146.inp.493.1 
echo ">>>>>>>>running test 4881"
./replace_wrapper '[^0-9][9-B]?' '&a@%'  < ./inputs/temp-test/1147.inp.493.2 
echo ">>>>>>>>running test 4882"
./replace_wrapper '[^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B][^0-9][9-B]' '&a@%'  < ./inputs/temp-test/1172.inp.505.1 
echo ">>>>>>>>running test 4883"
./replace_wrapper '[^0-9][]?-?[^a--b]' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4884"
./replace_wrapper '[^0-9][^0-9]@n@@@@' '9oW5!fFgN1 7tZf>k'  < ./inputs/input/ruin.927 
echo ">>>>>>>>running test 4885"
./replace_wrapper '[^0-9][^0-9][^9-B]' '@n'  < ./inputs/temp-test/1952.inp.829.1 
echo ">>>>>>>>running test 4886"
./replace_wrapper '[^0-9][^0-9][^9-B]' '@n'  < ./inputs/temp-test/1953.inp.829.2 
echo ">>>>>>>>running test 4887"
./replace_wrapper '[^0-9][^0-9][^9-B]' '@n'  < ./inputs/temp-test/1954.inp.829.3 
echo ">>>>>>>>running test 4888"
./replace_wrapper '[^0-9][^]?-?[^a--b]' '&a@%'  < ./inputs/temp-test/206.inp.92.1 
echo ">>>>>>>>running test 4889"
./replace_wrapper '[^0-9][a--]' '&@n'  < ./inputs/temp-test/696.inp.301.2 
echo ">>>>>>>>running test 4890"
./replace_wrapper '[^0-9][a--]' '&@n'  < ./inputs/temp-test/697.inp.301.4 
echo ">>>>>>>>running test 4891"
./replace_wrapper '[^0-9][a--]' '&@n@tandsome'  < ./inputs/temp-test/697.inp.301.4 
echo ">>>>>>>>running test 4892"
./replace_wrapper '[^0-9][a--]' '&@nmoretext'  < ./inputs/temp-test/696.inp.301.2 
echo ">>>>>>>>running test 4893"
./replace_wrapper '[^0-9][a--]- ' '&@n'  < ./inputs/temp-test/695.inp.301.1 
echo ">>>>>>>>running test 4894"
./replace_wrapper '[^0-9][a--]- *[^@t]-?' '@t'  < ./inputs/temp-test/695.inp.301.1 
echo ">>>>>>>>running test 4895"
./replace_wrapper '[^0-9][a--]- *[^@t]-?' '@t'  < ./inputs/temp-test/696.inp.301.2 
echo ">>>>>>>>running test 4896"
./replace_wrapper '[^0-9][a--]- *[^@t]-?' '@t'  < ./inputs/temp-test/697.inp.301.4 
echo ">>>>>>>>running test 4897"
./replace_wrapper '[^0-9][a--][^9-B][^-z]' 'a@nb@tc'  < ./inputs/temp-test/2254.inp.956.1 
echo ">>>>>>>>running test 4898"
./replace_wrapper '[^0-9][a--][^9-B][^-z]' 'a@nb@tc'  < ./inputs/temp-test/2255.inp.956.2 
echo ">>>>>>>>running test 4899"
./replace_wrapper '[^0-9][a-]' ''  < ./inputs/temp-test/147.inp.68.1 
echo ">>>>>>>>running test 4900"
./replace_wrapper '[^0-9][a-]' ''  < ./inputs/temp-test/148.inp.68.2 
echo ">>>>>>>>running test 4901"
./replace_wrapper '[^0-9][a-]' ''  < ./inputs/temp-test/149.inp.68.3 
echo ">>>>>>>>running test 4902"
./replace_wrapper '[^0-9][a-]' ''  < ./inputs/temp-test/150.inp.68.4 
echo ">>>>>>>>running test 4903"
./replace_wrapper '[^0-9][a-c?--[^0-9][^9-B]?' '@n'  < ./inputs/temp-test/1396.inp.599.1 
echo ">>>>>>>>running test 4904"
./replace_wrapper '[^0-9][a-c]' ''  < ./inputs/temp-test/726.inp.313.1 
echo ">>>>>>>>running test 4905"
./replace_wrapper '[^0-9][a-c]' ''  < ./inputs/temp-test/727.inp.313.2 
echo ">>>>>>>>running test 4906"
./replace_wrapper '[^0-9]\q2#' 'N_j  maExCfe(RK#?/SXIIyOqB[%kuLjKCnrk'  < ./inputs/input/ruin.853 
echo ">>>>>>>>running test 4907"
./replace_wrapper '[^0-9]^$' '@%&a'  < ./inputs/temp-test/1011.inp.434.8 
echo ">>>>>>>>running test 4908"
./replace_wrapper '[^0-9]^' '@%&a'  < ./inputs/temp-test/1009.inp.434.1 
echo ">>>>>>>>running test 4909"
./replace_wrapper '[^0-9]^' '@%&a'  < ./inputs/temp-test/1010.inp.434.2 
echo ">>>>>>>>running test 4910"
./replace_wrapper '[^0-9]^*[0-9]?[0-9]-c-@@*[9-B][^-z]?' '@n'  < ./inputs/temp-test/1068.inp.459.1 
echo ">>>>>>>>running test 4911"
./replace_wrapper '[^0-9]^*[0-9]?[0-9]-c-@@*[9-B][^-z]?' '@n'  < ./inputs/temp-test/1069.inp.459.3 
echo ">>>>>>>>running test 4912"
./replace_wrapper '[^0-9]a-c]-@*?' 'a@nb@tc'  < ./inputs/temp-test/851.inp.366.1 
echo ">>>>>>>>running test 4913"
./replace_wrapper '[^0-9]a-c]-@*?' 'a@nb@tc'  < ./inputs/temp-test/852.inp.366.3 
echo ">>>>>>>>running test 4914"
./replace_wrapper '[^0-9o]' 'A'  < ./inputs/input/ruin.1222 
echo ">>>>>>>>running test 4915"
./replace_wrapper '[^0-9z-}c-a]' 'X'  < ./inputs/input/ruin.1842 
echo ">>>>>>>>running test 4916"
./replace_wrapper '[^0[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?[^0-9]-?[9-B]?-[9-B]?-9]-?[9-B]?-[9-B]*?[[^0-9]-?[9-B]?-[9-B]?^0-9]*-?[9-B]?-[9-B]?' 'a'  < ./inputs/input/ruin.1517 
echo ">>>>>>>>running test 4917"
./replace_wrapper '[^1]' 'Iaz-cZ"a'\''A:(eeGG\^<6w1DDcCJ,9$Yr26[8Ap4Xuo=ZZ%dkomXc8sOhWnlrc0S'  < ./inputs/input/ruin.1248 
echo ">>>>>>>>running test 4918"
./replace_wrapper '[^1]*$' 'Iaz-cZ"a'\''A:(eeGG\^<6w1DDcCJ,9$Yr26[8Ap4Xuo=ZZ%dkomXc8sOhWnlrc0S'  < ./inputs/input/ruin.1248 
echo ">>>>>>>>running test 4919"
./replace_wrapper '[^2]' '!'  < ./inputs/input/ruin.558 
echo ">>>>>>>>running test 4920"
./replace_wrapper '[^4]' 'H'  < ./inputs/input/ruin.50 
echo ">>>>>>>>running test 4921"
./replace_wrapper '[^6]' 'p7/\=6eLD*=^?('  < ./inputs/input/ruin.1297 
echo ">>>>>>>>running test 4922"
./replace_wrapper '[^6]*?' '%'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4923"
./replace_wrapper '[^9-B] *' '&a@%'  < ./inputs/temp-test/2074.inp.879.1 
echo ">>>>>>>>running test 4924"
./replace_wrapper '[^9-B] *' '&a@%'  < ./inputs/temp-test/2075.inp.879.3 
echo ">>>>>>>>running test 4925"
./replace_wrapper '[^9-B] *' 'a&'  < ./inputs/temp-test/295.inp.133.1 
echo ">>>>>>>>running test 4926"
./replace_wrapper '[^9-B] *' 'a&'  < ./inputs/temp-test/296.inp.133.2 
echo ">>>>>>>>running test 4927"
./replace_wrapper '[^9-B] *' 'a&'  < ./inputs/temp-test/297.inp.133.3 
echo ">>>>>>>>running test 4928"
./replace_wrapper '[^9-B] *' 'a@n'  < ./inputs/temp-test/1748.inp.743.1 
echo ">>>>>>>>running test 4929"
./replace_wrapper '[^9-B] *' 'a@n'  < ./inputs/temp-test/1749.inp.743.2 
echo ">>>>>>>>running test 4930"
./replace_wrapper '[^9-B] *' 'a@n'  < ./inputs/temp-test/1750.inp.743.3 
echo ">>>>>>>>running test 4931"
./replace_wrapper '[^9-B]' '&@n$'  < ./inputs/temp-test/640.inp.276.2 
echo ">>>>>>>>running test 4932"
./replace_wrapper '[^9-B]' '&@n'  < ./inputs/temp-test/639.inp.276.1 
echo ">>>>>>>>running test 4933"
./replace_wrapper '[^9-B]' '&@n'  < ./inputs/temp-test/640.inp.276.2 
echo ">>>>>>>>running test 4934"
./replace_wrapper '[^9-B]' '&@n^'  < ./inputs/temp-test/639.inp.276.1 
echo ">>>>>>>>running test 4935"
./replace_wrapper '[^9-B]' 'NEW'  < ./inputs/temp-test/398.inp.174.1 
echo ">>>>>>>>running test 4936"
./replace_wrapper '[^9-B]' 'NEW'  < ./inputs/temp-test/399.inp.174.2 
echo ">>>>>>>>running test 4937"
./replace_wrapper '[^9-B]' 'NEW'  < ./inputs/temp-test/400.inp.174.3 
echo ">>>>>>>>running test 4938"
./replace_wrapper '[^9-B]' 'a&'  < ./inputs/temp-test/1537.inp.658.1 
echo ">>>>>>>>running test 4939"
./replace_wrapper '[^9-B]' 'a&'  < ./inputs/temp-test/1538.inp.658.3 
echo ">>>>>>>>running test 4940"
./replace_wrapper '[^9-B]' 'a@n'  < ./inputs/temp-test/76.inp.33.1 
echo ">>>>>>>>running test 4941"
./replace_wrapper '[^9-B]' 'a@n'  < ./inputs/temp-test/77.inp.33.3 
echo ">>>>>>>>running test 4942"
./replace_wrapper '[^9-B]' 'a@n'  < ./inputs/temp-test/78.inp.33.4 
echo ">>>>>>>>running test 4943"
./replace_wrapper '[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1119.inp.481.1 
echo ">>>>>>>>running test 4944"
./replace_wrapper '[^9-B]' 'a@nb@tc'  < ./inputs/temp-test/1120.inp.481.3 
echo ">>>>>>>>running test 4945"
./replace_wrapper '[^9-B]*$' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 4946"
./replace_wrapper '[^9-B]*$' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 4947"
./replace_wrapper '[^9-B]*' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 4948"
./replace_wrapper '[^9-B]*' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 4949"
./replace_wrapper '[^9-B]*'  < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 4950"
./replace_wrapper '[^9-B]**'  'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 4951"
./replace_wrapper '[^9-B]-' '&a@%'  < ./inputs/temp-test/639.inp.276.1 
echo ">>>>>>>>running test 4952"
./replace_wrapper '[^9-B]-' '&a@%'  < ./inputs/temp-test/640.inp.276.2 
echo ">>>>>>>>running test 4953"
./replace_wrapper '[^9-B]-' '@%&a'  < ./inputs/temp-test/2128.inp.902.1 
echo ">>>>>>>>running test 4954"
./replace_wrapper '[^9-B]-' '@%&a'  < ./inputs/temp-test/2129.inp.902.2 
echo ">>>>>>>>running test 4955"
./replace_wrapper '[^9-B]-' '@%&a'  < ./inputs/temp-test/2130.inp.902.3 
echo ">>>>>>>>running test 4956"
./replace_wrapper '[^9-B]-' '@%@&'  < ./inputs/temp-test/1500.inp.643.1 
echo ">>>>>>>>running test 4957"
./replace_wrapper '[^9-B]-' '@%@&'  < ./inputs/temp-test/1501.inp.643.2 
echo ">>>>>>>>running test 4958"
./replace_wrapper '[^9-B]-' '@n'  < ./inputs/temp-test/2183.inp.924.1 
echo ">>>>>>>>running test 4959"
./replace_wrapper '[^9-B]-' '@n'  < ./inputs/temp-test/2184.inp.924.2 
echo ">>>>>>>>running test 4960"
./replace_wrapper '[^9-B]-' '@n'  < ./inputs/temp-test/2185.inp.924.3 
echo ">>>>>>>>running test 4961"
./replace_wrapper '[^9-B]-' 'b@t'  < ./inputs/temp-test/886.inp.381.1 
echo ">>>>>>>>running test 4962"
./replace_wrapper '[^9-B]-' 'b@t'  < ./inputs/temp-test/887.inp.381.2 
echo ">>>>>>>>running test 4963"
./replace_wrapper '[^9-B]-*' 'b@t'  < ./inputs/temp-test/1606.inp.683.1 
echo ">>>>>>>>running test 4964"
./replace_wrapper '[^9-B]-*' 'b@t'  < ./inputs/temp-test/1607.inp.683.2 
echo ">>>>>>>>running test 4965"
./replace_wrapper '[^9-B]-*' 'b@t'  < ./inputs/temp-test/1608.inp.683.4 
echo ">>>>>>>>running test 4966"
./replace_wrapper '[^9-B]--?[9-B]-[a--b]-?^?[^9-B]' '@%&a'  < ./inputs/temp-test/1035.inp.445.1 
echo ">>>>>>>>running test 4967"
./replace_wrapper '[^9-B]--?[9-B]-[a--b]-?^?[^9-B]' '@%&a'  < ./inputs/temp-test/1036.inp.445.3 
echo ">>>>>>>>running test 4968"
./replace_wrapper '[^9-B]--[a--b][^9-B]?[a--b]-' '@%&a'  < ./inputs/temp-test/1581.inp.674.1 
echo ">>>>>>>>running test 4969"
./replace_wrapper '[^9-B]--[a--b][^9-B]?[a--b]-' '@%&a'  < ./inputs/temp-test/1582.inp.674.2 
echo ">>>>>>>>running test 4970"
./replace_wrapper '[^9-B]--[a--b][^9-B]?[a--b]-' '@%&a'  < ./inputs/temp-test/1583.inp.674.3 
echo ">>>>>>>>running test 4971"
./replace_wrapper '[^9-B]-@**[^9-B]?-*' 'b@t'  < ./inputs/temp-test/1628.inp.692.1 
echo ">>>>>>>>running test 4972"
./replace_wrapper '[^9-B]-[^0-9]?[^9-B]--??^-[^a--b]-?' '@t'  < ./inputs/temp-test/780.inp.336.1 
echo ">>>>>>>>running test 4973"
./replace_wrapper '[^9-B]-[^0-9]?[^9-B]--??^-[^a--b]-?' '@t'  < ./inputs/temp-test/781.inp.336.2 
echo ">>>>>>>>running test 4974"
./replace_wrapper '[^9-B]-[^0-9]?[^9-B]--??^-[^a--b]-?' '@t'  < ./inputs/temp-test/782.inp.336.3 
echo ">>>>>>>>running test 4975"
./replace_wrapper '[^9-B]-[^9-B][9-B]-[0-9]' '@t'  < ./inputs/temp-test/356.inp.156.1 
echo ">>>>>>>>running test 4976"
./replace_wrapper '[^9-B]-[^9-B][9-B]-[0-9]' '@t'  < ./inputs/temp-test/357.inp.156.3 
echo ">>>>>>>>running test 4977"
./replace_wrapper '[^9-B]-[^9-B][9-B]-[0-9]' '@t@'  < ./inputs/temp-test/357.inp.156.3 
echo ">>>>>>>>running test 4978"
./replace_wrapper '[^9-B]-[^9-B][9-B]-[0-9]@' '@t'  < ./inputs/temp-test/356.inp.156.1 
echo ">>>>>>>>running test 4979"
./replace_wrapper '[^9-B]? -?-[9-B]-[^9-B][^9-B]-' '&a@%'  < ./inputs/temp-test/1317.inp.565.1 
echo ">>>>>>>>running test 4980"
./replace_wrapper '[^9-B]? -?-[9-B]-[^9-B][^9-B]-' '&a@%'  < ./inputs/temp-test/1318.inp.565.3 
echo ">>>>>>>>running test 4981"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/1603.inp.682.1 
echo ">>>>>>>>running test 4982"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/1604.inp.682.2 
echo ">>>>>>>>running test 4983"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/1605.inp.682.3 
echo ">>>>>>>>running test 4984"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/2158.inp.914.1 
echo ">>>>>>>>running test 4985"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/2159.inp.914.2 
echo ">>>>>>>>running test 4986"
./replace_wrapper '[^9-B]?' '&'  < ./inputs/temp-test/2160.inp.914.3 
echo ">>>>>>>>running test 4987"
./replace_wrapper '[^9-B]?' '@%&a'  < ./inputs/temp-test/1874.inp.795.1 
echo ">>>>>>>>running test 4988"
./replace_wrapper '[^9-B]?' '@%&a'  < ./inputs/temp-test/1875.inp.795.3 
echo ">>>>>>>>running test 4989"
./replace_wrapper '[^9-B]?' '@%&a'  < ./inputs/temp-test/1876.inp.795.4 
echo ">>>>>>>>running test 4990"
./replace_wrapper '[^9-B]?' '@%@&'  < ./inputs/temp-test/1157.inp.498.1 
echo ">>>>>>>>running test 4991"
./replace_wrapper '[^9-B]?' '@%@&'  < ./inputs/temp-test/1553.inp.665.1 
echo ">>>>>>>>running test 4992"
./replace_wrapper '[^9-B]?' '@%@&'  < ./inputs/temp-test/1554.inp.665.2 
echo ">>>>>>>>running test 4993"
./replace_wrapper '[^9-B]?' 'NEW'  < ./inputs/temp-test/1080.inp.465.1 
echo ">>>>>>>>running test 4994"
./replace_wrapper '[^9-B]?' 'NEW'  < ./inputs/temp-test/507.inp.221.1 
echo ">>>>>>>>running test 4995"
./replace_wrapper '[^9-B]?' 'NEW'  < ./inputs/temp-test/508.inp.221.3 
echo ">>>>>>>>running test 4996"
./replace_wrapper '[^9-B]?-' '&'  < ./inputs/temp-test/439.inp.193.1 
echo ">>>>>>>>running test 4997"
./replace_wrapper '[^9-B]?-' '&'  < ./inputs/temp-test/440.inp.193.2 
echo ">>>>>>>>running test 4998"
./replace_wrapper '[^9-B]?-' '&'  < ./inputs/temp-test/441.inp.193.3 
echo ">>>>>>>>running test 4999"
./replace_wrapper '[^9-B]?-' '&'  < ./inputs/temp-test/442.inp.193.4 
echo ">>>>>>>>running test 5000"
./replace_wrapper '[^9-B]?-?[^a--b]-' ''  < ./inputs/temp-test/969.inp.418.1 
echo ">>>>>>>>running test 5001"
./replace_wrapper '[^9-B]?-?[^a--b]-' ''  < ./inputs/temp-test/970.inp.418.2 
echo ">>>>>>>>running test 5002"
./replace_wrapper '[^9-B]?-?[^a--b]-' ''  < ./inputs/temp-test/971.inp.418.3 
echo ">>>>>>>>running test 5003"
./replace_wrapper '[^9-B]?-[^0-9]' '&'  < ./inputs/temp-test/1912.inp.812.1 
echo ">>>>>>>>running test 5004"
./replace_wrapper '[^9-B]?-[^0-9]' '&'  < ./inputs/temp-test/1913.inp.812.3 
echo ">>>>>>>>running test 5005"
./replace_wrapper '[^9-B]?-[^9-B]-*-[^9-B][^0-9]-*-[^0-9]' '@%&a'  < ./inputs/temp-test/1081.inp.466.1 
echo ">>>>>>>>running test 5006"
./replace_wrapper '[^9-B]?-[^9-B]-*-[^9-B][^0-9]-*-[^0-9]' '@%&a'  < ./inputs/temp-test/1082.inp.466.3 
echo ">>>>>>>>running test 5007"
./replace_wrapper '[^9-B]??[a-c]?[^9-B]-' '&'  < ./inputs/temp-test/656.inp.285.1 
echo ">>>>>>>>running test 5008"
./replace_wrapper '[^9-B]?[9-B]a-c]' '&'  < ./inputs/temp-test/242.inp.108.1 
echo ">>>>>>>>running test 5009"
./replace_wrapper '[^9-B]?[9-B]a-c]' '&'  < ./inputs/temp-test/243.inp.108.3 
echo ">>>>>>>>running test 5010"
./replace_wrapper '[^9-B]?[^a-]-' '@%&a'  < ./inputs/temp-test/2188.inp.926.1 
echo ">>>>>>>>running test 5011"
./replace_wrapper '[^9-B]?[a-c-?a-][^a-]-?-[9-B][0-9][^a-c*[0-9][^0-9]@[[9-B][^a-c]$' ''  < ./inputs/temp-test/1223.inp.525.6 
echo ">>>>>>>>running test 5012"
./replace_wrapper '[^9-B]?[a-c-?a-][^a-]-?-[9-B][0-9][^a-c*[0-9][^0-9]@[[9-B][^a-c]' ''  < ./inputs/temp-test/1221.inp.525.1 
echo ">>>>>>>>running test 5013"
./replace_wrapper '[^9-B]?[a-c-?a-][^a-]-?-[9-B][0-9][^a-c*[0-9][^0-9]@[[9-B][^a-c]' ''  < ./inputs/temp-test/1222.inp.525.4 
echo ">>>>>>>>running test 5014"
./replace_wrapper '[^9-B]@*' '@%&a'  < ./inputs/temp-test/2270.inp.962.1 
echo ">>>>>>>>running test 5015"
./replace_wrapper '[^9-B]@*' '@%&a'  < ./inputs/temp-test/2271.inp.962.2 
echo ">>>>>>>>running test 5016"
./replace_wrapper '[^9-B]@*' '@%&a'  < ./inputs/temp-test/2272.inp.962.3 
echo ">>>>>>>>running test 5017"
./replace_wrapper '[^9-B]@**' ''  < ./inputs/temp-test/1285.inp.552.1 
echo ">>>>>>>>running test 5018"
./replace_wrapper '[^9-B]@**' ''  < ./inputs/temp-test/1286.inp.552.2 
echo ">>>>>>>>running test 5019"
./replace_wrapper '[^9-B]@**' '@%@&'  < ./inputs/temp-test/1916.inp.814.1 
echo ">>>>>>>>running test 5020"
./replace_wrapper '[^9-B]@**-[^a-^*-^-]^*' 'a@nb@tc'  < ./inputs/temp-test/1281.inp.550.1 
echo ">>>>>>>>running test 5021"
./replace_wrapper '[^9-B]@*^[^-z]-?[9-B]?-[0-9][^a-c[9-B]$' 'a@n'  < ./inputs/temp-test/452.inp.197.6 
echo ">>>>>>>>running test 5022"
./replace_wrapper '[^9-B]@*^[^-z]-?[9-B]?-[0-9][^a-c[9-B]' 'a@n'  < ./inputs/temp-test/450.inp.197.1 
echo ">>>>>>>>running test 5023"
./replace_wrapper '[^9-B]@*^[^-z]-?[9-B]?-[0-9][^a-c[9-B]' 'a@n'  < ./inputs/temp-test/451.inp.197.3 
echo ">>>>>>>>running test 5024"
./replace_wrapper '[^9-B]@['   < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 5025"
./replace_wrapper '[^9-B]@['   < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 5026"
./replace_wrapper '[^9-B]@[' 'a@n'  < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 5027"
./replace_wrapper '[^9-B]@[' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 5028"
./replace_wrapper '[^9-B]@[' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 5029"
./replace_wrapper '[^9-B]@[*$' '&'  < ./inputs/temp-test/2030.inp.861.8 
echo ">>>>>>>>running test 5030"
./replace_wrapper '[^9-B]@[*' '&'  < ./inputs/temp-test/2029.inp.861.1 
echo ">>>>>>>>running test 5031"
./replace_wrapper '[^9-B]@[*?[^0-9]-??a-][^a-@t@@?' 'a@n'  < ./inputs/temp-test/1520.inp.651.1 
echo ">>>>>>>>running test 5032"
./replace_wrapper '[^9-B]@[*?[^0-9]-??a-][^a-@t@@?' 'a@n'  < ./inputs/temp-test/1521.inp.651.2 
echo ">>>>>>>>running test 5033"
./replace_wrapper '[^9-B]@t*[^9-B]-[a--b][-z]-$' ''  < ./inputs/temp-test/835.inp.359.6 
echo ">>>>>>>>running test 5034"
./replace_wrapper '[^9-B]@t*[^9-B]-[a--b][-z]-' ''  < ./inputs/temp-test/833.inp.359.1 
echo ">>>>>>>>running test 5035"
./replace_wrapper '[^9-B]@t*[^9-B]-[a--b][-z]-' ''  < ./inputs/temp-test/834.inp.359.3 
echo ">>>>>>>>running test 5036"
./replace_wrapper '[^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z][^9-B]@t*[^9-B]-[a--b][-z]-' ''  < ./inputs/temp-test/833.inp.359.1 
echo ">>>>>>>>running test 5037"
./replace_wrapper '[^9-B]A*' 'a&'  < ./inputs/temp-test/1130.inp.486.1 
echo ">>>>>>>>running test 5038"
./replace_wrapper '[^9-B]A*' 'a&'  < ./inputs/temp-test/1131.inp.486.2 
echo ">>>>>>>>running test 5039"
./replace_wrapper '[^9-B]A*' 'a&'  < ./inputs/temp-test/1132.inp.486.3 
echo ">>>>>>>>running test 5040"
./replace_wrapper '[^9-B][-z]?[0-9][@t]?[0-9]?' 'a@n'  < ./inputs/temp-test/55.inp.24.1 
echo ">>>>>>>>running test 5041"
./replace_wrapper '[^9-B][-z]?[0-9][@t]?[0-9]?' 'a@n'  < ./inputs/temp-test/56.inp.24.2 
echo ">>>>>>>>running test 5042"
./replace_wrapper '[^9-B][-z]?[0-9][@t]?[0-9]?' 'a@n'  < ./inputs/temp-test/57.inp.24.4 
echo ">>>>>>>>running test 5043"
./replace_wrapper '[^9-B][9-B]'  '&@n' < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5044"
./replace_wrapper '[^9-B][9-B]'   < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5045"
./replace_wrapper '[^9-B][9-B]'   < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5046"
./replace_wrapper '[^9-B][9-B]'   < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 5047"
./replace_wrapper '[^9-B][9-B]' '&@n'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5048"
./replace_wrapper '[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5049"
./replace_wrapper '[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5050"
./replace_wrapper '[^9-B][9-B]' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 5051"
./replace_wrapper '[^9-B][9-B]' 'a&'  < ./inputs/temp-test/2103.inp.891.1 
echo ">>>>>>>>running test 5052"
./replace_wrapper '[^9-B][9-B]' 'a@nb@tc'  < ./inputs/temp-test/856.inp.368.1 
echo ">>>>>>>>running test 5053"
./replace_wrapper '[^9-B][9-B]' 'a@nb@tc'  < ./inputs/temp-test/857.inp.368.3 
echo ">>>>>>>>running test 5054"
./replace_wrapper '[^9-B][9-B]*$'   < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5055"
./replace_wrapper '[^9-B][9-B]*$'   < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5056"
./replace_wrapper '[^9-B][9-B]*$' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5057"
./replace_wrapper '[^9-B][9-B]*$' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5058"
./replace_wrapper '[^9-B][9-B]*$' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 5059"
./replace_wrapper '[^9-B][9-B]*' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5060"
./replace_wrapper '[^9-B][9-B]*' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5061"
./replace_wrapper '[^9-B][9-B]*' '@%&a'  < ./inputs/temp-test/205.inp.91.3 
echo ">>>>>>>>running test 5062"
./replace_wrapper '[^9-B][9-B]-' 'b@t'  < ./inputs/temp-test/1041.inp.448.1 
echo ">>>>>>>>running test 5063"
./replace_wrapper '[^9-B][9-B]-*?[^@@]-a-]-' '@%&a'  < ./inputs/temp-test/2140.inp.907.1 
echo ">>>>>>>>running test 5064"
./replace_wrapper '[^9-B][9-B]-*?[^@@]-a-]-' '@%&a'  < ./inputs/temp-test/2141.inp.907.2 
echo ">>>>>>>>running test 5065"
./replace_wrapper '[^9-B][9-B]-*?[^@@]-a-]-' '@%&a'  < ./inputs/temp-test/2142.inp.907.3 
echo ">>>>>>>>running test 5066"
./replace_wrapper '[^9-B][9-B]-^-]^-][^a-]-' ''  < ./inputs/temp-test/1708.inp.728.1 
echo ">>>>>>>>running test 5067"
./replace_wrapper '[^9-B][9-B]-^-]^-][^a-]-' ''  < ./inputs/temp-test/1709.inp.728.3 
echo ">>>>>>>>running test 5068"
./replace_wrapper '[^9-B][]@[' 'a@n'  < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 5069"
./replace_wrapper '[^9-B][]@[' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 5070"
./replace_wrapper '[^9-B][][9-B]' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5071"
./replace_wrapper '[^9-B][^0-9]-?[^0-9]?--' 'a&'  < ./inputs/temp-test/1526.inp.654.1 
echo ">>>>>>>>running test 5072"
./replace_wrapper '[^9-B][^0-9]-?[^0-9]?--' 'a&'  < ./inputs/temp-test/1527.inp.654.2 
echo ">>>>>>>>running test 5073"
./replace_wrapper '[^9-B][^]@[' 'a@n'  < ./inputs/temp-test/219.inp.98.1 
echo ">>>>>>>>running test 5074"
./replace_wrapper '[^9-B][^]@[' 'a@n'  < ./inputs/temp-test/221.inp.98.3 
echo ">>>>>>>>running test 5075"
./replace_wrapper '[^9-B][^]@[**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 5076"
./replace_wrapper '[^9-B][^][9-B]' '@%&a'  < ./inputs/temp-test/204.inp.91.2 
echo ">>>>>>>>running test 5077"
./replace_wrapper '[^9-B][a-c]' '&a@%'  < ./inputs/temp-test/1441.inp.618.1 
echo ">>>>>>>>running test 5078"
./replace_wrapper '[^9-B][a-c]' '&a@%'  < ./inputs/temp-test/1442.inp.618.3 
echo ">>>>>>>>running test 5079"
./replace_wrapper '[^9-B][a-c]' ''  < ./inputs/temp-test/1674.inp.714.1 
echo ">>>>>>>>running test 5080"
./replace_wrapper '[^9-B][a-c]' ''  < ./inputs/temp-test/1675.inp.714.2 
echo ">>>>>>>>running test 5081"
./replace_wrapper '[^9-B][a-c]' ''  < ./inputs/temp-test/1676.inp.714.3 
echo ">>>>>>>>running test 5082"
./replace_wrapper '[^9-B][a-c]' ''  < ./inputs/temp-test/1677.inp.714.4 
echo ">>>>>>>>running test 5083"
./replace_wrapper '[^9-B][a-c]' '@%&a'  < ./inputs/temp-test/1304.inp.561.1 
echo ">>>>>>>>running test 5084"
./replace_wrapper '[^9-B][a-c]' '@%&a'  < ./inputs/temp-test/1305.inp.561.3 
echo ">>>>>>>>running test 5085"
./replace_wrapper '[^9-B][a-c]' '@n'  < ./inputs/temp-test/1825.inp.777.1 
echo ">>>>>>>>running test 5086"
./replace_wrapper '[^9-B][a-c]' '@n'  < ./inputs/temp-test/1826.inp.777.2 
echo ">>>>>>>>running test 5087"
./replace_wrapper '[^9-B][a-c]' '@n'  < ./inputs/temp-test/1827.inp.777.3 
echo ">>>>>>>>running test 5088"
./replace_wrapper '[^9-B][a-c]?[^0-9]-' '@%&a'  < ./inputs/temp-test/1276.inp.548.1 
echo ">>>>>>>>running test 5089"
./replace_wrapper '[^9-B][a-c]?[^0-9]-' '@%&a'  < ./inputs/temp-test/1277.inp.548.3 
echo ">>>>>>>>running test 5090"
./replace_wrapper '[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-' '@%&a'  < ./inputs/temp-test/1276.inp.548.1 
echo ">>>>>>>>running test 5091"
./replace_wrapper '[^9-B][a-c][9-B]' '&@n'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 5092"
./replace_wrapper '[^9-B][a-c][9-B]'  < ./inputs/temp-test/529.inp.229.2 
echo ">>>>>>>>running test 5093"
./replace_wrapper '[^9-B]^-?[a-c][^9-B]^a-c][-z]?a-c]' 'a@nb@tc'  < ./inputs/temp-test/1658.inp.707.1 
echo ">>>>>>>>running test 5094"
./replace_wrapper '[^9-B]^-?[a-c][^9-B]^a-c][-z]?a-c]' 'a@nb@tc'  < ./inputs/temp-test/1659.inp.707.3 
echo ">>>>>>>>running test 5095"
./replace_wrapper '[^9-B]^-?[a-c][^9-B]^a-c][-z]?a-c]' 'a@nb@tc'  < ./inputs/temp-test/1660.inp.707.4 
echo ">>>>>>>>running test 5096"
./replace_wrapper '[^9-B]a-c]' '@%&a'  < ./inputs/temp-test/1177.inp.507.1 
echo ">>>>>>>>running test 5097"
./replace_wrapper '[^9-B]c' '@%&a'  < ./inputs/temp-test/2236.inp.948.1 
echo ">>>>>>>>running test 5098"
./replace_wrapper '[^9-B]c' '@%&a'  < ./inputs/temp-test/2237.inp.948.2 
echo ">>>>>>>>running test 5099"
./replace_wrapper '[^<]' 'v?,P"%A`LsBP\u4d; CqOH,&_r=)BCe9t#gvb<Wt>raU4E4x'  < ./inputs/input/ruin.1484 
echo ">>>>>>>>running test 5100"
./replace_wrapper '[^>-A0-9]' '5%-v^<c1y2IcI}I/_G%E/:epn= `B:MO'  < ./inputs/input/ruin.304 
echo ">>>>>>>>running test 5101"
./replace_wrapper '[^>-A>-AA-G0-90-9A-G]O\.K' '`'  < ./inputs/input/ruin.278 
echo ">>>>>>>>running test 5102"
./replace_wrapper '[^>-AA-G]' '.'  < ./inputs/input/ruin.1307 
echo ">>>>>>>>running test 5103"
./replace_wrapper '[^>-AA-Gc-a]' ';=bn:S4Ymbn'  < ./inputs/input/ruin.1234 
echo ">>>>>>>>running test 5104"
./replace_wrapper '[^>-A]$' '~IL;#{y,f"Kv+2t6x'  < ./inputs/input/ruin.112 
echo ">>>>>>>>running test 5105"
./replace_wrapper '[^>-A]' ''  < ./inputs/input/ruin.1644 
echo ">>>>>>>>running test 5106"
./replace_wrapper '[^>-A]' '04++/5T7m;q&X>WdTwHm!3/9e)&'  < ./inputs/input/ruin.1608 
echo ">>>>>>>>running test 5107"
./replace_wrapper '[^>-A]' '96Nl[*)'  < ./inputs/input/ruin.1489 
echo ">>>>>>>>running test 5108"
./replace_wrapper '[^>-A]' '@'  < ./inputs/input/ruin.873 
echo ">>>>>>>>running test 5109"
./replace_wrapper '[^>-A]' 'H'  < ./inputs/input/ruin.1206 
echo ">>>>>>>>running test 5110"
./replace_wrapper '[^>-A]' 'J'  < ./inputs/input/ruin.1539 
echo ">>>>>>>>running test 5111"
./replace_wrapper '[^>-A]' 'SyR'  < ./inputs/input/ruin.980 
echo ">>>>>>>>running test 5112"
./replace_wrapper '[^>-A]' '}5$dExu:2n)dfDa6,}^W.u#[w1}E_A'  < ./inputs/input/ruin.1850 
echo ">>>>>>>>running test 5113"
./replace_wrapper '[^>-A]?*' '04++/5T7m;q&X>WdTwHm!3/9e)&'  < ./inputs/input/ruin.1608 
echo ">>>>>>>>running test 5114"
./replace_wrapper '[^>-AzZ-a]^_`a-z-}z-}]' 'Z}~ZyBzkd3:;$=h'  < ./inputs/input/ruin.216 
echo ">>>>>>>>running test 5115"
./replace_wrapper '[^>]' 'C<t,7!I$c'  < ./inputs/input/ruin.69 
echo ">>>>>>>>running test 5116"
./replace_wrapper '[^@@]%-' 'a&'  < ./inputs/temp-test/2350.inp.998.1 
echo ">>>>>>>>running test 5117"
./replace_wrapper '[^@@]%-' 'a&'  < ./inputs/temp-test/2351.inp.998.2 
echo ">>>>>>>>running test 5118"
./replace_wrapper '[^@@]-%' 'a&'  < ./inputs/temp-test/2352.inp.998.3 
echo ">>>>>>>>running test 5119"
./replace_wrapper '[^@@]-' 'a&'  < ./inputs/temp-test/2350.inp.998.1 
echo ">>>>>>>>running test 5120"
./replace_wrapper '[^@@]-' 'a&'  < ./inputs/temp-test/2351.inp.998.2 
echo ">>>>>>>>running test 5121"
./replace_wrapper '[^@@]-' 'a&'  < ./inputs/temp-test/2352.inp.998.3 
echo ">>>>>>>>running test 5122"
./replace_wrapper '[^@@][@@]@n[a-c' ''  < ./inputs/temp-test/587.inp.252.1 
echo ">>>>>>>>running test 5123"
./replace_wrapper '[^@@][@@]@n[a-c' ''  < ./inputs/temp-test/588.inp.252.3 
echo ">>>>>>>>running test 5124"
./replace_wrapper '[^@@][a-cc*-[-z]-?[^0-9][^@n][a-c@[-' '@%&a'  < ./inputs/temp-test/1739.inp.740.1 
echo ">>>>>>>>running test 5125"
./replace_wrapper '[^@@][a-cc*-[-z]-?[^0-9][^@n][a-c@[-' '@%&a'  < ./inputs/temp-test/1740.inp.740.2 
echo ">>>>>>>>running test 5126"
./replace_wrapper '[^@]' 'K'  < ./inputs/input/ruin.1974 
echo ">>>>>>>>running test 5127"
./replace_wrapper '[^@]' 'Y'  < ./inputs/input/ruin.1729 
echo ">>>>>>>>running test 5128"
./replace_wrapper '[^@n]' '&'  < ./inputs/temp-test/1098.inp.473.1 
echo ">>>>>>>>running test 5129"
./replace_wrapper '[^@n]?' ''  < ./inputs/temp-test/1905.inp.808.1 
echo ">>>>>>>>running test 5130"
./replace_wrapper '[^@n]?? *?^a-c][9-B]??-?-[^0-9]$' 'a@n'  < ./inputs/temp-test/2170.inp.917.6 
echo ">>>>>>>>running test 5131"
./replace_wrapper '[^@n]?? *?^a-c][9-B]??-?-[^0-9]' 'a@n'  < ./inputs/temp-test/2168.inp.917.1 
echo ">>>>>>>>running test 5132"
./replace_wrapper '[^@n]?? *?^a-c][9-B]??-?-[^0-9]' 'a@n'  < ./inputs/temp-test/2169.inp.917.4 
echo ">>>>>>>>running test 5133"
./replace_wrapper '[^@n]@n?@[[^-z]a-]?a-][^a-c-[^a--]' '&'  < ./inputs/temp-test/79.inp.34.1 
echo ">>>>>>>>running test 5134"
./replace_wrapper '[^@t] $' 'a&'  < ./inputs/temp-test/1185.inp.510.6 
echo ">>>>>>>>running test 5135"
./replace_wrapper '[^@t] ' 'a&'  < ./inputs/temp-test/1183.inp.510.1 
echo ">>>>>>>>running test 5136"
./replace_wrapper '[^@t] ' 'a&'  < ./inputs/temp-test/1184.inp.510.4 
echo ">>>>>>>>running test 5137"
./replace_wrapper '[^A-G0-9Z-a]^_`a-A-GABCDEFG]' '7'  < ./inputs/input/ruin.1287 
echo ">>>>>>>>running test 5138"
./replace_wrapper '[^A-G0-9]' ' t;btzU%_Q3*,&<&9'  < ./inputs/input/ruin.1825 
echo ">>>>>>>>running test 5139"
./replace_wrapper '[^A-G0-9z-}]' '6qn`J_lW>TE~j|(+QIxZ[~_-#xQ'\''T'  < ./inputs/input/ruin.1702 
echo ">>>>>>>>running test 5140"
./replace_wrapper '[^A-GA-GA-Gc-aZ-a]^_`a][^A-GA-GA-Gc-aZ-a]^_`a]' 'p'  < ./inputs/input/ruin.663 
echo ">>>>>>>>running test 5141"
./replace_wrapper '[^A-GZ-a]^_`a]' ':'  < ./inputs/input/ruin.1089 
echo ">>>>>>>>running test 5142"
./replace_wrapper '[^A-GZ-a]^_`a]' 'nb>?q$.;cKX_xZHjjQ<3,7j|'  < ./inputs/input/ruin.1853 
echo ">>>>>>>>running test 5143"
./replace_wrapper '[^A-G]' '$'  < ./inputs/input/ruin.997 
echo ">>>>>>>>running test 5144"
./replace_wrapper '[^A-G]' '3'  < ./inputs/input/ruin.1993 
echo ">>>>>>>>running test 5145"
./replace_wrapper '[^A-G]' '8(taNmoh5G<.1@&eZ{_/NNPSZT<l`wW%-PGz=0TF'  < ./inputs/input/ruin.1212 
echo ">>>>>>>>running test 5146"
./replace_wrapper '[^A-G]' '='  < ./inputs/input/ruin.615 
echo ">>>>>>>>running test 5147"
./replace_wrapper '[^A-G]' '?NKkky:[kyHQAcp-0g*J6%]|{c'  < ./inputs/input/ruin.665 
echo ">>>>>>>>running test 5148"
./replace_wrapper '[^A-G]' 'CzPGix*Bb(l^H^r63iE<=zqCo'  < ./inputs/input/ruin.1801 
echo ">>>>>>>>running test 5149"
./replace_wrapper '[^A-G]' 'S q2fRrNoKYz'  < ./inputs/input/ruin.1292 
echo ">>>>>>>>running test 5150"
./replace_wrapper '[^A-G]' '[`nuc|R-<Hwk'\''VjNT0GK}y42aaJD*q;p=y.B ,V^\'\''yUvqN0:tC+`GE| RPYRK#CQ-F.]@QEs@MP$+](mI7<'  < ./inputs/input/ruin.170 
echo ">>>>>>>>running test 5151"
./replace_wrapper '[^A-G]' '`'  < ./inputs/input/ruin.18 
echo ">>>>>>>>running test 5152"
./replace_wrapper '[^A-G]' '`T0QCI\YA:p1`8M(v)J.;m+=d_V]a@uddt@#`;*d7EupFJ%SV1"Wczcv&\ma2 .{N[G:X8[+*yj\!*B#%#6.&JU(l6^U1mTncrlWq'  < ./inputs/input/ruin.1893 
echo ">>>>>>>>running test 5153"
./replace_wrapper '[^A-G]' 'dY?s%djpY}ZoPrp@$E8wLalV3!OK|6dCMk.xt}K"T&3#OEnKHvf}\<rwJ5@`G(.Afmx'  < ./inputs/input/ruin.791 
echo ">>>>>>>>running test 5154"
./replace_wrapper '[^A-G]' 'e1 n@lk)dOmuvvM8V'  < ./inputs/input/ruin.551 
echo ">>>>>>>>running test 5155"
./replace_wrapper '[^A-G]' 'jhIKJsma3Dy7'  < ./inputs/input/ruin.1534 
echo ">>>>>>>>running test 5156"
./replace_wrapper '[^A-G]' 'k/bmA,d@Ho|K*j/g.0;>s!'  < ./inputs/input/ruin.1309 
echo ">>>>>>>>running test 5157"
./replace_wrapper '[^A-G]??' 'i'  < ./inputs/input/ruin.1178 
echo ">>>>>>>>running test 5158"
./replace_wrapper '[^A-Gc-aLA-G]' 'Z'  < ./inputs/input/ruin.538 
echo ">>>>>>>>running test 5159"
./replace_wrapper '[^A-G~]' '{f'  < ./inputs/input/ruin.228 
echo ">>>>>>>>running test 5160"
./replace_wrapper '[^BA-Gc-a]' '\'  < ./inputs/input/ruin.619 
echo ">>>>>>>>running test 5161"
./replace_wrapper '[^C]' 'O'  < ./inputs/input/ruin.1023 
echo ">>>>>>>>running test 5162"
./replace_wrapper '[^D]' '!Sc2Bq xEh9%Q/E?O'  < ./inputs/input/ruin.1964 
echo ">>>>>>>>running test 5163"
./replace_wrapper '[^J]' 'L'  < ./inputs/input/ruin.1240 
echo ">>>>>>>>running test 5164"
./replace_wrapper '[^J]' 'QM'  < ./inputs/input/ruin.81 
echo ">>>>>>>>running test 5165"
./replace_wrapper '[^J]*$' 'L'  < ./inputs/input/ruin.1240 
echo ">>>>>>>>running test 5166"
./replace_wrapper '[^L]' '&=3PUz)'  < ./inputs/input/ruin.21 
echo ">>>>>>>>running test 5167"
./replace_wrapper '[^N.Z-a]^_`a]X' 'S@'  < ./inputs/input/ruin.1502 
echo ">>>>>>>>running test 5168"
./replace_wrapper '[^U]' '"c9`I|c[Y#fc?)'  < ./inputs/input/ruin.182 
echo ">>>>>>>>running test 5169"
./replace_wrapper '[^W]' '$3)'  < ./inputs/input/ruin.174 
echo ">>>>>>>>running test 5170"
./replace_wrapper '[^X]' ')S!M:mm9v3&y.W'  < ./inputs/input/ruin.1001 
echo ">>>>>>>>running test 5171"
./replace_wrapper '[^Z-a]' 'Xi]{E>{[.5?-L6'\''TGdSR-lMJd/,znD|npnWvV]}:P0~<Vr;0Re'  < ./inputs/input/ruin.760 
echo ">>>>>>>>running test 5172"
./replace_wrapper '[^Z-a]^_`a-0-90123456789C-0-90123456789r-z-}z-}-Z-aZ[]^_`a]' '%'  < ./inputs/input/ruin.856 
echo ">>>>>>>>running test 5173"
./replace_wrapper '[^Z-a]^_`a-Z-aZ[]^_`a]' '!5-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_-aA-GZ-a]^_s#S?%gG"i*'  < ./inputs/input/ruin.1051 
echo ">>>>>>>>running test 5174"
./replace_wrapper '[^Z-a]^_`a-Z-aZ[]^_`a]' '!5s#S?%gG"i*'  < ./inputs/input/ruin.1051 
echo ">>>>>>>>running test 5175"
./replace_wrapper '[^Z-a]^_`a-c-ac-a-A-GABCDEFG]' '/&dr!{2h/LY=2Sb#WM=uI'  < ./inputs/input/ruin.1522 
echo ">>>>>>>>running test 5176"
./replace_wrapper '[^Z-a]^_`a-c-ac-a]' 'h'  < ./inputs/input/ruin.641 
echo ">>>>>>>>running test 5177"
./replace_wrapper '[^Z-a]^_`a-z-}z-}-A-GABCDEFG-0-90123456789-z-}z-}-0-90123456789]' 'pF)HeS a`g9$#F>7z9x$'  < ./inputs/input/ruin.572 
echo ">>>>>>>>running test 5178"
./replace_wrapper '[^Z-a]^_`aP-Z-aZ[]^_`a-0-90123456789]' '='  < ./inputs/input/ruin.461 
echo ">>>>>>>>running test 5179"
./replace_wrapper '[^Z-a]^_`aV-0-90123456789]' '_'  < ./inputs/input/ruin.871 
echo ">>>>>>>>running test 5180"
./replace_wrapper '[^Z-a]^_`a]' '#CQ3@U,)/aDf|9p jfjO3Y[H:AI[f|8Wz)'  < ./inputs/input/ruin.1475 
echo ">>>>>>>>running test 5181"
./replace_wrapper '[^Z-a]^_`a]' ')'  < ./inputs/input/ruin.258 
echo ">>>>>>>>running test 5182"
./replace_wrapper '[^Z-a]^_`a]' '.'  < ./inputs/input/ruin.421 
echo ">>>>>>>>running test 5183"
./replace_wrapper '[^Z-a]^_`a]' '/'  < ./inputs/input/ruin.128 
echo ">>>>>>>>running test 5184"
./replace_wrapper '[^Z-a]^_`a]' '<w2G+@s,+~@V#/k%Z6lmTA 6(wV6-6!+Mk$H=Q'  < ./inputs/input/ruin.1677 
echo ">>>>>>>>running test 5185"
./replace_wrapper '[^Z-a]^_`a]' '>,gDlLZK3'  < ./inputs/input/ruin.1274 
echo ">>>>>>>>running test 5186"
./replace_wrapper '[^Z-a]^_`a]' '?K&QWk{]S_'  < ./inputs/input/ruin.1618 
echo ">>>>>>>>running test 5187"
./replace_wrapper '[^Z-a]^_`a]' 'FAl8eCyn8mwJA=!.|Xn"s*I\H1JJhky#,D4RAuz*[}'  < ./inputs/input/ruin.595 
echo ">>>>>>>>running test 5188"
./replace_wrapper '[^Z-a]^_`a]' 'H'  < ./inputs/input/ruin.460 
echo ">>>>>>>>running test 5189"
./replace_wrapper '[^Z-a]^_`a]' 'OV9D!H{O-Vw_tNc8I'  < ./inputs/input/ruin.1802 
echo ">>>>>>>>running test 5190"
./replace_wrapper '[^Z-a]^_`a]' 'Q0}@_^cnC7s.L'  < ./inputs/input/ruin.522 
echo ">>>>>>>>running test 5191"
./replace_wrapper '[^Z-a]^_`a]' 'QP2S'  < ./inputs/input/ruin.1410 
echo ">>>>>>>>running test 5192"
./replace_wrapper '[^Z-a]^_`a]' 'Xi]{E>{[1d2qd.5?-L6'\''TGdSR-lMJd/,znD|npnWvV]}:P0~<Vr;0Re'  < ./inputs/input/ruin.760 
echo ">>>>>>>>running test 5193"
./replace_wrapper '[^Z-a]^_`a]' 'n'  < ./inputs/input/ruin.454 
echo ">>>>>>>>running test 5194"
./replace_wrapper '[^Z-a]^_`a]?*' '?K&QWk{]S_'  < ./inputs/input/ruin.1618 
echo ">>>>>>>>running test 5195"
./replace_wrapper '[^Z-a]^_`a]@n' 'H&@t@t@t'  < ./inputs/input/ruin.460 
echo ">>>>>>>>running test 5196"
./replace_wrapper '[^Z-a]^_`a]\p@fz[@@' 'K'  < ./inputs/input/ruin.146 
echo ">>>>>>>>running test 5197"
./replace_wrapper '[^Z]@@' 'Q5"'  < ./inputs/input/ruin.1666 
echo ">>>>>>>>running test 5198"
./replace_wrapper '[^]%?@*' 'NEW'  < ./inputs/temp-test/523.inp.226.5 
echo ">>>>>>>>running test 5199"
./replace_wrapper '[^]%@*?' '@%&a'  < ./inputs/temp-test/199.inp.89.5 
echo ">>>>>>>>running test 5200"
./replace_wrapper '[^]' '@n67@n67@n'  < ./inputs/moni/f8.inp 
echo ">>>>>>>>running test 5201"
./replace_wrapper '[^]- ' '&'  < ./inputs/temp-test/524.inp.227.1 
echo ">>>>>>>>running test 5202"
./replace_wrapper '[^]-*[^0-9]' '&'  < ./inputs/temp-test/200.inp.90.1 
echo ">>>>>>>>running test 5203"
./replace_wrapper '[^]?@*' 'NEW'  < ./inputs/temp-test/521.inp.226.1 
echo ">>>>>>>>running test 5204"
./replace_wrapper '[^]?@*' 'NEW'  < ./inputs/temp-test/522.inp.226.3 
echo ">>>>>>>>running test 5205"
./replace_wrapper '[^][^0-9]-?[9-B]?-[9-B]?' '@t'  < ./inputs/temp-test/526.inp.228.3 
echo ">>>>>>>>running test 5206"
./replace_wrapper '[^][^9-B]@[' 'a@n'  < ./inputs/temp-test/220.inp.98.2 
echo ">>>>>>>>running test 5207"
./replace_wrapper '[^][^9-B][9-B]' '@%&a'  < ./inputs/temp-test/203.inp.91.1 
echo ">>>>>>>>running test 5208"
./replace_wrapper '[^][^a-c][9-B]' '@%&a'  < ./inputs/temp-test/223.inp.99.3 
echo ">>>>>>>>running test 5209"
./replace_wrapper '[^][a-c?$' 'a&'  < ./inputs/temp-test/520.inp.225.8 
echo ">>>>>>>>running test 5210"
./replace_wrapper '[^][a-c?' 'a&'  < ./inputs/temp-test/516.inp.225.1 
echo ">>>>>>>>running test 5211"
./replace_wrapper '[^][a-c?' 'a&'  < ./inputs/temp-test/517.inp.225.2 
echo ">>>>>>>>running test 5212"
./replace_wrapper '[^][a-c?' 'a&'  < ./inputs/temp-test/518.inp.225.3 
echo ">>>>>>>>running test 5213"
./replace_wrapper '[^][a-c?' 'a&'  < ./inputs/temp-test/519.inp.225.4 
echo ">>>>>>>>running test 5214"
./replace_wrapper '[^a-' '&'  < ./inputs/temp-test/2315.inp.982.1 
echo ">>>>>>>>running test 5215"
./replace_wrapper '[^a-' '&a@%'  < ./inputs/temp-test/1363.inp.585.2 
echo ">>>>>>>>running test 5216"
./replace_wrapper '[^a-' '&a@%'  < ./inputs/temp-test/1364.inp.585.3 
echo ">>>>>>>>running test 5217"
./replace_wrapper '[^a--' '@%&a'  < ./inputs/temp-test/704.inp.305.1 
echo ">>>>>>>>running test 5218"
./replace_wrapper '[^a--' '@%&a'  < ./inputs/temp-test/705.inp.305.2 
echo ">>>>>>>>running test 5219"
./replace_wrapper '[^a--?[9-B]?[0-9]' 'a@n'  < ./inputs/temp-test/1361.inp.584.1 
echo ">>>>>>>>running test 5220"
./replace_wrapper '[^a--?[9-B]?[0-9]' 'a@n'  < ./inputs/temp-test/1362.inp.584.2 
echo ">>>>>>>>running test 5221"
./replace_wrapper '[^a--]' 'b@t'  < ./inputs/temp-test/1502.inp.644.1 
echo ">>>>>>>>running test 5222"
./replace_wrapper '[^a--]' 'b@t'  < ./inputs/temp-test/1503.inp.644.3 
echo ">>>>>>>>running test 5223"
./replace_wrapper '[^a--]' 'b@t'  < ./inputs/temp-test/1504.inp.644.4 
echo ">>>>>>>>running test 5224"
./replace_wrapper '[^a--]??[0-9]' '@%@&'  < ./inputs/temp-test/1930.inp.820.1 
echo ">>>>>>>>running test 5225"
./replace_wrapper '[^a--]??[0-9]' '@%@&'  < ./inputs/temp-test/1931.inp.820.4 
echo ">>>>>>>>running test 5226"
./replace_wrapper '[^a--]@*$' 'a@nb@tc'  < ./inputs/temp-test/383.inp.166.8 
echo ">>>>>>>>running test 5227"
./replace_wrapper '[^a--]@*' 'a@nb@tc'  < ./inputs/temp-test/381.inp.166.1 
echo ">>>>>>>>running test 5228"
./replace_wrapper '[^a--]@*' 'a@nb@tc'  < ./inputs/temp-test/382.inp.166.3 
echo ">>>>>>>>running test 5229"
./replace_wrapper '[^a--]a-c]--]?[^9-B][a--b]@[*-' '@%&a'  < ./inputs/temp-test/1795.inp.763.1 
echo ">>>>>>>>running test 5230"
./replace_wrapper '[^a--b]' '&a@%'  < ./inputs/temp-test/1417.inp.608.1 
echo ">>>>>>>>running test 5231"
./replace_wrapper '[^a--b]' 'a@nb@tc'  < ./inputs/temp-test/946.inp.407.1 
echo ">>>>>>>>running test 5232"
./replace_wrapper '[^a--b]-[9-B]$' 'a&'  < ./inputs/temp-test/838.inp.360.9 
echo ">>>>>>>>running test 5233"
./replace_wrapper '[^a--b]-[9-B]' 'a&'  < ./inputs/temp-test/836.inp.360.1 
echo ">>>>>>>>running test 5234"
./replace_wrapper '[^a--b]-[9-B]' 'a&'  < ./inputs/temp-test/837.inp.360.2 
echo ">>>>>>>>running test 5235"
./replace_wrapper '[^a--b]?[^9-B]? *[^0-9]-' 'NEW'  < ./inputs/temp-test/2117.inp.898.1 
echo ">>>>>>>>running test 5236"
./replace_wrapper '[^a--b]?[^9-B]? *[^0-9]-' 'NEW'  < ./inputs/temp-test/2118.inp.898.2 
echo ">>>>>>>>running test 5237"
./replace_wrapper '[^a--b]?[^9-B]? *[^0-9]-' 'NEW'  < ./inputs/temp-test/2119.inp.898.3 
echo ">>>>>>>>running test 5238"
./replace_wrapper '[^a-?[a-]?-?-]' '&'  < ./inputs/temp-test/46.inp.20.1 
echo ">>>>>>>>running test 5239"
./replace_wrapper '[^a-?[a-]?-?-]' '&'  < ./inputs/temp-test/47.inp.20.2 
echo ">>>>>>>>running test 5240"
./replace_wrapper '[^a-?[a-]?-?-]' '&'  < ./inputs/temp-test/48.inp.20.3 
echo ">>>>>>>>running test 5241"
./replace_wrapper '[^a-@[' 'a&'  < ./inputs/temp-test/190.inp.86.1 
echo ">>>>>>>>running test 5242"
./replace_wrapper '[^a-[9-B]?' '&'  < ./inputs/temp-test/1469.inp.630.1 
echo ">>>>>>>>running test 5243"
./replace_wrapper '[^a-[9-B]?' '&'  < ./inputs/temp-test/1470.inp.630.2 
echo ">>>>>>>>running test 5244"
./replace_wrapper '[^a-]' 'a&'  < ./inputs/temp-test/595.inp.256.1 
echo ">>>>>>>>running test 5245"
./replace_wrapper '[^a-]' 'a&'  < ./inputs/temp-test/596.inp.256.2 
echo ">>>>>>>>running test 5246"
./replace_wrapper '[^a-]?' '&a@%'  < ./inputs/temp-test/1518.inp.650.1 
echo ">>>>>>>>running test 5247"
./replace_wrapper '[^a-]?' '&a@%'  < ./inputs/temp-test/1519.inp.650.3 
echo ">>>>>>>>running test 5248"
./replace_wrapper '[^a-]?' '@%&a'  < ./inputs/temp-test/2041.inp.866.1 
echo ">>>>>>>>running test 5249"
./replace_wrapper '[^a-]?' '@%&a'  < ./inputs/temp-test/2042.inp.866.2 
echo ">>>>>>>>running test 5250"
./replace_wrapper '[^a-]?' '@%&a'  < ./inputs/temp-test/2043.inp.866.3 
echo ">>>>>>>>running test 5251"
./replace_wrapper '[^a-]?[0-9]-a-c]--*-@[' '&a@%'  < ./inputs/temp-test/544.inp.236.1 
echo ">>>>>>>>running test 5252"
./replace_wrapper '[^a-]?[0-9]-a-c]--*-@[' '&a@%'  < ./inputs/temp-test/545.inp.236.2 
echo ">>>>>>>>running test 5253"
./replace_wrapper '[^a-]?[0-9]-a-c]--*-@[' '&a@%'  < ./inputs/temp-test/546.inp.236.3 
echo ">>>>>>>>running test 5254"
./replace_wrapper '[^a-][0-9]' 'a@n'  < ./inputs/temp-test/553.inp.239.1 
echo ">>>>>>>>running test 5255"
./replace_wrapper '[^a-][0-9]' 'a@n'  < ./inputs/temp-test/554.inp.239.3 
echo ">>>>>>>>running test 5256"
./replace_wrapper '[^a-][9-B]' '@t'  < ./inputs/temp-test/326.inp.145.1 
echo ">>>>>>>>running test 5257"
./replace_wrapper '[^a-][9-B]' '@t'  < ./inputs/temp-test/327.inp.145.2 
echo ">>>>>>>>running test 5258"
./replace_wrapper '[^a-][9-B]' '@t'  < ./inputs/temp-test/328.inp.145.3 
echo ">>>>>>>>running test 5259"
./replace_wrapper '[^a-][a-c]' 'NEW'  < ./inputs/temp-test/1084.inp.467.1 
echo ">>>>>>>>running test 5260"
./replace_wrapper '[^a-][a-c]' 'NEW'  < ./inputs/temp-test/1085.inp.467.3 
echo ">>>>>>>>running test 5261"
./replace_wrapper '[^a-][a-c]' 'NEW'  < ./inputs/temp-test/1086.inp.467.4 
echo ">>>>>>>>running test 5262"
./replace_wrapper '[^a-c' 'NEW'  < ./inputs/temp-test/1864.inp.791.1 
echo ">>>>>>>>running test 5263"
./replace_wrapper '[^a-c--[^9-B][0-9]@[[^@@]-' '@%&a'  < ./inputs/temp-test/2120.inp.899.1 
echo ">>>>>>>>running test 5264"
./replace_wrapper '[^a-c--[^9-B][0-9]@[[^@@]-' '@%&a'  < ./inputs/temp-test/2121.inp.899.3 
echo ">>>>>>>>running test 5265"
./replace_wrapper '[^a-c?-$' '&a@%'  < ./inputs/temp-test/1002.inp.431.8 
echo ">>>>>>>>running test 5266"
./replace_wrapper '[^a-c?-' '&a@%'  < ./inputs/temp-test/1000.inp.431.1 
echo ">>>>>>>>running test 5267"
./replace_wrapper '[^a-c?-' '&a@%'  < ./inputs/temp-test/1001.inp.431.3 
echo ">>>>>>>>running test 5268"
./replace_wrapper '[^a-c] ' '&'  < ./inputs/temp-test/404.inp.177.1 
echo ">>>>>>>>running test 5269"
./replace_wrapper '[^a-c] ' '&'  < ./inputs/temp-test/405.inp.177.2 
echo ">>>>>>>>running test 5270"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/1778.inp.758.1 
echo ">>>>>>>>running test 5271"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/1779.inp.758.2 
echo ">>>>>>>>running test 5272"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/1780.inp.758.3 
echo ">>>>>>>>running test 5273"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/2279.inp.966.1 
echo ">>>>>>>>running test 5274"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/2280.inp.966.2 
echo ">>>>>>>>running test 5275"
./replace_wrapper '[^a-c]' '@%@&'  < ./inputs/temp-test/2281.inp.966.4 
echo ">>>>>>>>running test 5276"
./replace_wrapper '[^a-c]' 'NEW'  < ./inputs/temp-test/1541.inp.660.1 
echo ">>>>>>>>running test 5277"
./replace_wrapper '[^a-c]' 'NEW'  < ./inputs/temp-test/1542.inp.660.3 
echo ">>>>>>>>running test 5278"
./replace_wrapper '[^a-c]**' 'a'  < ./inputs/moni/f7.inp 
echo ">>>>>>>>running test 5279"
./replace_wrapper '[^a-c]*-[0-9]?[@@]?[^9-B]A ?' ''  < ./inputs/temp-test/116.inp.53.1 
echo ">>>>>>>>running test 5280"
./replace_wrapper '[^a-c]*?' 'a&'  < ./inputs/temp-test/126.inp.59.1 
echo ">>>>>>>>running test 5281"
./replace_wrapper '[^a-c]*?' 'a&'  < ./inputs/temp-test/127.inp.59.2 
echo ">>>>>>>>running test 5282"
./replace_wrapper '[^a-c]*?--*?* *[a--b][^a-c]' 'a@nb@tc'  < ./inputs/temp-test/6.inp.3.1 
echo ">>>>>>>>running test 5283"
./replace_wrapper '[^a-c]*?--*?* *[a--b][^a-c]' 'a@nb@tc'  < ./inputs/temp-test/7.inp.3.3 
echo ">>>>>>>>running test 5284"
./replace_wrapper '[^a-c]*?--*?* *[a--b][^a-c]' 'a@nb@tc'  < ./inputs/temp-test/8.inp.3.4 
echo ">>>>>>>>running test 5285"
./replace_wrapper '[^a-c]-' '&'  < ./inputs/temp-test/1571.inp.671.1 
echo ">>>>>>>>running test 5286"
./replace_wrapper '[^a-c]-' '&'  < ./inputs/temp-test/1572.inp.671.4 
echo ">>>>>>>>running test 5287"
./replace_wrapper '[^a-c]-' '&a@%'  < ./inputs/temp-test/2014.inp.855.1 
echo ">>>>>>>>running test 5288"
./replace_wrapper '[^a-c]-' '&a@%'  < ./inputs/temp-test/2015.inp.855.3 
echo ">>>>>>>>running test 5289"
./replace_wrapper '[^a-c]-' '&a@%'  < ./inputs/temp-test/2016.inp.855.4 
echo ">>>>>>>>running test 5290"
./replace_wrapper '[^a-c]-' '@%@&'  < ./inputs/temp-test/601.inp.259.1 
echo ">>>>>>>>running test 5291"
./replace_wrapper '[^a-c]-' '@%@&'  < ./inputs/temp-test/602.inp.259.3 
echo ">>>>>>>>running test 5292"
./replace_wrapper '[^a-c]-' 'a&'  < ./inputs/temp-test/1810.inp.769.1 
echo ">>>>>>>>running test 5293"
./replace_wrapper '[^a-c]-' 'a&'  < ./inputs/temp-test/1811.inp.769.3 
echo ">>>>>>>>running test 5294"
./replace_wrapper '[^a-c]-?[_-z][^--' '@%&a'  < ./inputs/temp-test/261.inp.116.1 
echo ">>>>>>>>running test 5295"
./replace_wrapper '[^a-c]-?[_-z][^--' '@%&a'  < ./inputs/temp-test/262.inp.116.2 
echo ">>>>>>>>running test 5296"
./replace_wrapper '[^a-c]-?[_-z][^--' '@%&a'  < ./inputs/temp-test/263.inp.116.3 
echo ">>>>>>>>running test 5297"
./replace_wrapper '[^a-c]-]' '&a@%'  < ./inputs/temp-test/2053.inp.871.1 
echo ">>>>>>>>running test 5298"
./replace_wrapper '[^a-c]-]' '&a@%'  < ./inputs/temp-test/2054.inp.871.2 
echo ">>>>>>>>running test 5299"
./replace_wrapper '[^a-c]-]' '&a@%'  < ./inputs/temp-test/2055.inp.871.4 
echo ">>>>>>>>running test 5300"
./replace_wrapper 'abc'   < ./inputs/moni/t4.inp 
echo ">>>>>>>>running test 5301"
./replace_wrapper 'abc'   < ./inputs/moni/t5.inp 
echo ">>>>>>>>running test 5302"
./replace_wrapper '@abc'   < ./inputs/moni/t5.inp 
echo ">>>>>>>>running test 5303"
./replace_wrapper 'tt'   < ./inputs/moni/t1.inp 
echo ">>>>>>>>running test 5304"
./replace_wrapper 'abc'   < ./inputs/moni/t2.inp 
echo ">>>>>>>>running test 5305"
./replace_wrapper '77'   < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5306"
./replace_wrapper '@77'   < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5307"
./replace_wrapper 'IlG'  < ./inputs/moni/t6.inp 
echo ">>>>>>>>running test 5308"
./replace_wrapper '@IlG'  < ./inputs/moni/t6.inp 
echo ">>>>>>>>running test 5309"
./replace_wrapper '%abc'   < ./inputs/moni/t5.inp 
echo ">>>>>>>>running test 5310"
./replace_wrapper '%IlG'  < ./inputs/moni/t6.inp 
echo ">>>>>>>>running test 5311"
./replace_wrapper '%77'   < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5312"
./replace_wrapper 'IlG\a88888888888888888$'  < ./inputs/moni/t6.inp 
echo ">>>>>>>>running test 5313"
./replace_wrapper 'Da*'  < ./inputs/moni/t7.inp 
echo ">>>>>>>>running test 5314"
./replace_wrapper '%77*'   < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5315"
./replace_wrapper '[0-7][0-7]'  < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5316"
./replace_wrapper '[0-7]*'  < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5317"
./replace_wrapper 'abc*'  < ./inputs/moni/t2.inp 
echo ">>>>>>>>running test 5318"
./replace_wrapper '77?'  < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5319"
./replace_wrapper '7?7'  < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5320"
./replace_wrapper '[a-z]*'  < ./inputs/moni/t2.inp 
echo ">>>>>>>>running test 5321"
./replace_wrapper '77[6-9]'   < ./inputs/moni/t3.inp 
echo ">>>>>>>>running test 5322"
./replace_wrapper '[am]*$' 'foo'  < ./inputs/moni/nn1.t 
echo ">>>>>>>>running test 5323"
./replace_wrapper '[a-Z(1-9]*$' 'foo'  < ./inputs/moni/nn1.t 
echo ">>>>>>>>running test 5324"
./replace_wrapper '[a-Z(1-9]*$' 'foo'  < ./inputs/input/ruin.624 
echo ">>>>>>>>running test 5325"
./replace_wrapper '[Cm]*$' 'a@f'  < ./inputs/input/ruin.304 
echo ">>>>>>>>running test 5326"
./replace_wrapper '[Cm]*$' 'a&'  < ./inputs/input/ruin.304 
echo ">>>>>>>>running test 5327"
./replace_wrapper '[Cm]*$'   < ./inputs/input/ruin.304 
echo ">>>>>>>>running test 5328"
./replace_wrapper '[Da]*$' 'a&'  < ./inputs/input/ruin.717 
echo ">>>>>>>>running test 5329"
./replace_wrapper '$' '@t'  < ./inputs/input/ruin.1121 
echo ">>>>>>>>running test 5330"
./replace_wrapper '$' '%&'  < ./inputs/input/ruin.1122 
echo ">>>>>>>>running test 5331"
./replace_wrapper '[>dE]*$' '@n'  < ./inputs/input/ruin.1782 
echo ">>>>>>>>running test 5332"
./replace_wrapper '[1-8;a-Z]*$' '@@n'  < ./inputs/input/ruin.714 
echo ">>>>>>>>running test 5333"
./replace_wrapper '@@*$' '&E9p\6X[t<jnR3{*3PQSno!);(&'  < ./inputs/input/ruin.1256 
echo ">>>>>>>>running test 5334"
./replace_wrapper '@@*$' '@tW'  < ./inputs/input/ruin.1247 
echo ">>>>>>>>running test 5335"
./replace_wrapper '@t*$' '&a&'  < ./inputs/input/ruin.1244 
echo ">>>>>>>>running test 5336"
./replace_wrapper 'd*$' '@t'  < ./inputs/moni/nn2.t 
echo ">>>>>>>>running test 5337"
./replace_wrapper 'W' 'cCeuNv}}<pw83QZL=`?=f9b?1A'  < ./inputs/input/ruin.24 
echo ">>>>>>>>running test 5338"
./replace_wrapper '-[9-B][9-B] *-^*^a-][@n]' '@t&@n'  < ./inputs/temp-test/1044.inp.450.2 
echo ">>>>>>>>running test 5339"
./replace_wrapper 'W' 'cCeuNv}}<pw83QZLabcefghijz[`?=f9b?1A'  < ./inputs/input/ruin.24 
echo ">>>>>>>>running test 5340"
./replace_wrapper '@@' 'abcdefghigjklmnhijklmopqrstuvwxyz012345678901234567890123456'  < ./inputs/input/ruin.98 
echo ">>>>>>>>running test 5341"
./replace_wrapper '-?-@**[^0-9]-@@*[^9-B]?@n*$' 'abcdefg@&'  < ./inputs/temp-test/2078.inp.880.6 
echo ">>>>>>>>running test 5342"
./replace_wrapper '@@' 'anystringthatisquitelongwillworkithinkforgettingthisduexercisedforthiserr'  < ./inputs/input/ruin.150 
echo ">>>>>>>>running test 5343"
./replace_wrapper '@@*'\'*$',^P&Sh6@@' '@titsthe & in this string that matters'  < ./inputs/input/ruin.1119 
echo ">>>>>>>>running test 5344"
./replace_wrapper '9@@*[^Z-a]^_a]' 'thisoneIdontunderstandunlessthestringisalreadylong'  < ./inputs/input/ruin.28 
echo ">>>>>>>>running test 5345"
./replace_wrapper '7979797979@n' 'a&&a'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5346"
./replace_wrapper '[79]*@n' 'a&&a'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5347"
./replace_wrapper '[79]*@n' 'a@4&@t&a'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5348"
./replace_wrapper '[1-9]*@n' 'a@4&@t&a'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5349"
./replace_wrapper '?[1-9]*@n' 'a@4&@t&a'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5350"
./replace_wrapper '?[!]*@n' 'a&[0-9]'  < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5351"
./replace_wrapper '!!!!!!777!!@n' 'a&[0-9]'  < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5352"
./replace_wrapper '!!!*777!!@n' 'a&[0-9]'  < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5353"
./replace_wrapper '[7]*!!@n' 'a&[0-9]'  < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5354"
./replace_wrapper '[1]*@n' '11&@t@t@@'  < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5355"
./replace_wrapper '%11111@nl[^6]inbetweend@t@n%%88*erwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5356"
./replace_wrapper '%11111@nl[^6]inbetweend@t@n%%88*erwhatjust@t@t@tgvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5357"
./replace_wrapper '&11111@nl[^1-6]betweend@t@n%%88*erwhatjust@t@t@tgvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5358"
./replace_wrapper '@1@n11@nl[^1-6]betweend@t@n%%88*erwhatjust@t@t@tgvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5359"
./replace_wrapper '@1@t11%%l[1-60]betweend@t@n%%88*erwhatjust999999gvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5360"
./replace_wrapper  '#@@[^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5361"
./replace_wrapper  '%@@@^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5362"
./replace_wrapper  '%@@@^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^*8*8*[9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5363"
./replace_wrapper  '%@**^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^*8*8*[9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5364"
./replace_wrapper  '@n33[^9-0]omea%harlongstringdoesntmatt@twhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5365"
./replace_wrapper  '%n33123456&&&a%harlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5366"
./replace_wrapper  '%n331*3456&&&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5367"
./replace_wrapper  '%n331*3456&&&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acterswilldojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5368"
./replace_wrapper  '%n331*3456&&&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredonesntmatteraslonga[![estringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acterswilldojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5369"
./replace_wrapper  '%n331*3456&&&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredonesntmatteraslonga[![estringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acter]]illdojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5370"
./replace_wrapper  '@n331*34[&*]&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredon@@@ntteraslonga[![estringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acter]]illdojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5371"
./replace_wrapper  '@n3@t@t@t&*]&a%@**rlongstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredon@@@ntteraslonga[![estringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acter]]illdojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5372"
./replace_wrapper '%)0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9[]Oys4{Ym@&Eg*[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF[Z-a]^_[Z-a]^_*[Z-a]^_*' 'a'   < ./inputs/input/ruin.1616 
echo ">>>>>>>>running test 5373"
./replace_wrapper '@n@nEq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QS[8-9]V0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$Q*0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<A[^a-c][0-9]@[*' '&a@%'  < ./inputs/temp-test/589.inp.253.1 
echo ">>>>>>>>running test 5374"
./replace_wrapper '123??!*' '&&&&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5375"
./replace_wrapper '[d]*' '&@@&@@&@@@@'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5376"
./replace_wrapper '8?8?8?88??88??8888888888' '&@t&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5377"
./replace_wrapper 'th?si?aca?etha[t]isalongline' '&aa&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5378"
./replace_wrapper 'th?si?aca?etha[t]isalong[li]*ne' '&aa&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5379"
./replace_wrapper '[0-9]*ddd' '&[0-9]&[^0-9]&'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5380"
./replace_wrapper '12?!*' '&&&&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5381"
./replace_wrapper '%thisisacase' '&a@@[0-9]a&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5382"
./replace_wrapper '%[a-b]*$' '&@t&@t&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5383"
./replace_wrapper '[0-3]!*$' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5384"
./replace_wrapper '%@@ [^0-*]@**^[^@@]-[0-9][@t][^0-9]@*f^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5385"
./replace_wrapper 'for $his du the key $hing is to hav* a ccl at exactly the right length more [@@]' 'sub doesnt matter'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5386"
./replace_wrapper '[^0[^0-9]abc^[^@@]-[0-9][^0-9]1234[^0-9]@**^[^@@][9-B -[0-9]!!0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5387"
./replace_wrapper '[0-^9]@nl[^ ]inbeweendoesntmatterwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5388"
./replace_wrapper 'NEW*EW-[0-9][^0-9][@t][^0-9]@**^[^@@][erg-[0-9][^0-9][@t][3459]@**^[^@@][9-B]-[0-9][^0-9][@t][^0abc-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5389"
./replace_wrapper '@11111@nl[^6]i@retweend@t@t%%88*erwha[0-st@t@t@tgvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5390"
./replace_wrapper 'theccl *ust contain an @ and {}[]nt know wa*at else [a-z]* stuff is OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5391"
./replace_wrapper '[0-&]aal[^!]inbetweendoesntmatterwhatjustgettingvariety%finthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5392"
./replace_wrapper '[50123495123412345512345123]123!56@a35123451234551234512345612341234564444[^@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5393"
./replace_wrapper '%)0J&Y6XsP[0-9]3aKh3HTW9ITsk@m9* * s4{Ym@&Eg1[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9[]Oys4{Ym@&Eg*[G|ntmx;o|2xwF})0J&Y6XsPqpxC53aKh3HTW9ITsk@m9aFOys4{Ym@&Eg1[G|ntmx;o|2xwF[Z-a]^_[Z-a]^_*[Z-a]^_*' 'a'   < ./inputs/input/ruin.1616 
echo ">>>>>>>>running test 5394"
./replace_wrapper '@n%%Eq/SH{S$QV0"e<bz-[(*Z9QSH{@tQV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QS[8-9]V0"$<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$Q*0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<p-f]Eq/SH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<bz-[(*Z9QSH{S$QV0"e<A[^a-c][0-9]@[*' '&a@%'  < ./inputs/temp-test/589.inp.253.1 
echo ">>>>>>>>running test 5395"
./replace_wrapper '%%331*34[&*]&a%@**^longstringdoesntmatt@t*t*t*tisbutmustbeverylongwhateverthecharactersaredon@@@ntteraslonga[![^stringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcha[]acter]]illdojusttypingins[0-9]ars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' '[0-9]substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5396"
./replace_wrapper '45' '&abdfegh123456789123412345678912345678956789123456789123456789123312345678945678912345678912345678912345679123456789'  < ./inputs/moni/f1.inp 
echo ">>>>>>>>running test 5397"
./replace_wrapper '4' '&abdfegh1234567891234123451234567890872348793847239847234234234324367891234312345678945678912345678912345678912345679123456789'  < ./inputs/moni/f1.inp 
echo ">>>>>>>>running test 5398"
./replace_wrapper '66' '&abdfegh1234567891234&1234512345678908723487938&4723984723423423432436&312345678945678912345678912345678912345679123456789'  < ./inputs/moni/f5.inp 
echo ">>>>>>>>running test 5399"
./replace_wrapper 'thisisacasethatisalongline' '&aa&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5400"
./replace_wrapper 'thisisacasethatisa' '&aa&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5401"
./replace_wrapper 'this[a-z]*' '&a&a&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5402"
./replace_wrapper 'this[a-z]*$' '&a&a&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5403"
./replace_wrapper '%thi[a-z]*' '&@t&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5404"
./replace_wrapper '123[7-9]*' '&@t&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5405"
./replace_wrapper '%123[7-9]*' '&@t&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5406"
./replace_wrapper '%123[7-9]*$' '&@t&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5407"
./replace_wrapper '%123[7-9]*$' '&@t@t&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5408"
./replace_wrapper '123[7-9]*' '&@&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5409"
./replace_wrapper '123?[7-9]*' '&@&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5410"
./replace_wrapper '123[^1-6]*' '&@&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5411"
./replace_wrapper '%123[^1-6]*' '&@&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5412"
./replace_wrapper '123[^1-6]*$' '&@&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5413"
./replace_wrapper '123[^1-6]*$' '&[0-9]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5414"
./replace_wrapper '123[1-9]*$' '&&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5415"
./replace_wrapper '123[1-9]*$' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5416"
./replace_wrapper '123[1-9abcdefgh]*$' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5417"
./replace_wrapper '%123[1-9abcdefgh]*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5418"
./replace_wrapper '%123[1-9@t]*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5419"
./replace_wrapper '%123[1-9@f]*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5420"
./replace_wrapper '123[@1-9]*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5421"
./replace_wrapper '[0-3]!*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5422"
./replace_wrapper '123!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5423"
./replace_wrapper '123!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5424"
./replace_wrapper '[0-9!]*' '&[lkjasdlkjdf]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5425"
./replace_wrapper '%[0-9!]*' '&@t@t#45678[0-9]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5426"
./replace_wrapper '123[!]*' '&@t@t#45678[0-9]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5427"
./replace_wrapper '123[!!!!!!!!!!!!!]*7' '&@t@t#45678[0-9]&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5428"
./replace_wrapper 'more[0-9a-z]*' '&@t@t#45678[0-9]&'   < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5429"
./replace_wrapper 'morestuffinalongline111111111111111111111111111' '&aaaaa&'   < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5430"
./replace_wrapper 'this**' 'sub'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5431"
./replace_wrapper '123[7-9]**' '&a&'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5432"
./replace_wrapper '[!]**' '&@t[6-0]&'  < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5433"
./replace_wrapper '[1]**' '&alachamazoo@t@t@&&'  < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5434"
./replace_wrapper '?[1]**' '&alachamazoo@t@t@&&'  < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5435"
./replace_wrapper '%[a-z]*[1]**' '&alachamazoo@t@t@&&'  < ./inputs/moni/rr4.t 
echo ">>>>>>>>running test 5436"
./replace_wrapper '[a-z]*'   < ./inputs/moni/t5.inp 
echo ">>>>>>>>running test 5437"
./replace_wrapper 'this'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5438"
./replace_wrapper 'nomatch@n' 'a&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5439"
./replace_wrapper 'thisisacasethatisalongline@n' '&a&'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5440"
./replace_wrapper ']@n' '=@t&lk'  < ./inputs/input/ruin.277 
echo ">>>>>>>>running test 5441"
./replace_wrapper '@t@n' '/&q@t@t'  < ./inputs/input/ruin.539 
echo ">>>>>>>>running test 5442"
./replace_wrapper '@**^[^@@][9-B]-[0-9][^0-9][@t][^0[^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5443"
./replace_wrapper '[^0[^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5444"
./replace_wrapper '[^0[^0-9]@**^[^@@]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5445"
./replace_wrapper '[^0[^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]' '@%@&'  < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5446"
./replace_wrapper '[^0[^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@][9-B]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5447"
./replace_wrapper '[^0[^0-9]@**^[^@@]-[0-9][@t][^0-9]@**^[^@@][9-B]-[0-9][^0-9][@t][^0-9]@**^[^@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5448"
./replace_wrapper '[^0123495@**^[^@@]-12345[@t]123456@**^[^@@]12345-12345123456[@t][^0-9]@**^[^@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5449"
./replace_wrapper '[^0123495123412345-123451234123456@**51234512345-123451234561234123456@**^[^@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5450"
./replace_wrapper '[5012349512341234551234512341234561235123451234551234512345612341234564444[^@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5451"
./replace_wrapper '[501234951234123455123451234123456123512345123455123451234561234123456444412[@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5452"
./replace_wrapper '4501234951234123455123451234123456123512345123455123451234561234123456444412[@@]'   < ./inputs/temp-test/1397.inp.600.1 
echo ">>>>>>>>running test 5453"
./replace_wrapper 'for this du the key thing is to have a ccl at exactly the right length more [@@]' 'sub doesnt matter'  < ./inputs/moni/rr1.t 
echo ">>>>>>>>running test 5454"
./replace_wrapper 'theccl must contain an @ and I dont know wahat else [a-z]* stuff is OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5455"
./replace_wrapper '@t@nlongtextinbetweendoesntmatterwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5456"
./replace_wrapper '[0-9]@nl[^6]inbetweendoesntmatterwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5457"
./replace_wrapper '[0-9]@nl[^6]inbetweend@t@n%%$$*erwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5458"
./replace_wrapper '[0-9]@nl[^6]inbetweend@t@n%%88*erwhatjustgettingvariety%$inthestr&& OK here[@@]'  < ./inputs/moni/rr2.t 
echo ">>>>>>>>running test 5459"
./replace_wrapper '?p&y=3[Z][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?[^0-9]-' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5460"
./replace_wrapper '?p&y=3[Z][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5461"
./replace_wrapper '?p&y=3[Z]12345?123456-[^9-B]12345?[^0-9]-1234561234512345?123456-12345612345?123456-1234561234512345?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5462"
./replace_wrapper '?p&y=3[Z]12345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?[^0-9]-[^9-B][a][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5463"
./replace_wrapper '?p&y=3[Z]12345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-123456[a-c]?[^0-9]-[^9-B][a-c ][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5464"
./replace_wrapper '?p&y=3[Z]12345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-123456[a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5465"
./replace_wrapper '?p&y=3[Z]12345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c][a-c]?' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5466"
./replace_wrapper '?p&y=3[Z]12345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c]' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5467"
./replace_wrapper 'someacharlongstringdoesntmatterwhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-[^9-B][a-c][a-c]?[^0-9]-[^9-B][a-c]?[^0-9]-[^9-B][a-c-c]' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5468"
./replace_wrapper 'someacharlongstringdoesntmatterwhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?123456-1234561234512345?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?[^0-9]-[^9-B][a-c-c]' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5469"
./replace_wrapper 'someacharlongstringdoesntmatterwhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?123456hereanycharcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-c]' '~'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5470"
./replace_wrapper 'someacharlongstringdoesntmatterwhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?123456hereanycharcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-12345612312345?123456-12345612345?123456-12345612345612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5471"
./replace_wrapper '%omeacharlongstringdoesntmatt@twhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?123456hereanych$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-inputfiledoesntmattereitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5472"
./replace_wrapper '@t@@[^9-0]omeacharlongstringdoesntmatt@twhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-inputfiledoesntmattereitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5473"
./replace_wrapper '@t@@[^9-0]omeacharlongstringdoesntmatt@twhatitisbutmustbeverylongwhateverthecharactersaredonesntmatteraslongasthestringistherightlengthandendswiththerightcharacterlkj45?1234ch$rcharcacterswilldojusttypinginsomechars@nandsomeflags@n@t-12345612345?123456-@3@##filedoesntmatt&&eitherasitsneverprocessed&&@@45612345?123456-123456123455?123456-1234561234512345?123456-12345612345?123456-1234561234567890?123456-12345612345?123456-1234561234512345?123456-12345612345?123456-123456[a-c-9]' 'substringdoesntmatter'  < ./inputs/input/ruin.1338 
echo ">>>>>>>>running test 5474"
./replace_wrapper '123!*' '&&&&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5475"
./replace_wrapper '?!*' '&&&&'   < ./inputs/moni/rr3.t 
echo ">>>>>>>>running test 5476"
./replace_wrapper 'a*$' '&&&&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5477"
./replace_wrapper '%[a-b]*' '&&&&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5478"
./replace_wrapper '[a-b]*' '&@t&@t&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5479"
./replace_wrapper '[^b-z]*' '&@t&@t&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5480"
./replace_wrapper 'aa' '&@t&@t&'   < ./inputs/moni/rr5.t 
echo ">>>>>>>>running test 5481"
./replace_wrapper '88888888888888888888888888' '&@t&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5482"
./replace_wrapper '8888888888888?8888888888888' '&@t&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5483"
./replace_wrapper '8888888888888?8888888888888$' '&@t&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5484"
./replace_wrapper '[0-9]*' '&@t&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5485"
./replace_wrapper '[6-8@3]*' '&&@t&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5486"
./replace_wrapper '[8-8]*' '&foo&foo&'   < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5487"
./replace_wrapper '[+#()1-9]*' '&77&@t&'  < ./inputs/moni/rr6.t 
echo ">>>>>>>>running test 5488"
./replace_wrapper 'ddd' '&@t&@t&'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5489"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5490"
./replace_wrapper '[d]*' '&&@t&'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5491"
./replace_wrapper '[d]*' '&ababababababababababababababababa&@t&'  < ./inputs/moni/rr7.t 
echo ">>>>>>>>running test 5492"
./replace_wrapper '}EB0$FtY|' 'd`?K#C~VsV'  < ./inputs/input/ruin.10 
echo ">>>>>>>>running test 5493"
./replace_wrapper 'foobarf foobarfoobarfoobarfoobarfoobarfoobarfoobar'  < ./inputs/input/ruin.2 
echo ">>>>>>>>running test 5494"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr8.t 
echo ">>>>>>>>running test 5495"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr9.t 
echo ">>>>>>>>running test 5496"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr10.t 
echo ">>>>>>>>running test 5497"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr11.t 
echo ">>>>>>>>running test 5498"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr12.t 
echo ">>>>>>>>running test 5499"
./replace_wrapper '[d]*' '&@t&@t&'  < ./inputs/moni/rr13.t 
echo ">>>>>>>>running test 5500"
./replace_wrapper 'a*' '&@t&@t&'  < ./inputs/moni/rr14.t 
echo ">>>>>>>>running test 5501"
./replace_wrapper 'l*' '&@t&@t&'  < ./inputs/moni/rr14.t 
echo ">>>>>>>>running test 5502"
./replace_wrapper '@l*' '&@t&@t&'  < ./inputs/moni/rr15.t 
echo ">>>>>>>>running test 5503"
./replace_wrapper '[1-9]*' '&@t&@t&'  < ./inputs/moni/rr16.t 
echo ">>>>>>>>running test 5504"
./replace_wrapper '[^0a-z]*' '&@t&@t&'  < ./inputs/moni/rr16.t 
echo ">>>>>>>>running test 5505"
./replace_wrapper '[1-8@t]*' '&@t&@t&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5506"
./replace_wrapper '[1-8@t!()]*' '&@t&@t&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5507"
./replace_wrapper '[1]*' '&@t&@t&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5508"
./replace_wrapper '[1]*' '&@t&                      &'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5509"
./replace_wrapper '1*' '&      &          &'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5510"
./replace_wrapper '[1@&@@@n]*' '&@t&          &'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5511"
./replace_wrapper '1*' '&@t@t&&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5512"
./replace_wrapper '1*' '&&@p@q[0-9]&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5513"
./replace_wrapper '1*' '&@5%&[0-9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5514"
./replace_wrapper '[1-8@t!()]*' '&plain&textl&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5515"
./replace_wrapper '[1-8@t[]]*' '&plain&textl&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5516"
./replace_wrapper '[^0a-z@t%]*' '&@t&@t&'  < ./inputs/moni/rr16.t 
echo ">>>>>>>>running test 5517"
./replace_wrapper '[^0a-z%]*' '&@t&@t&'  < ./inputs/moni/rr16.t 
echo ">>>>>>>>running test 5518"
./replace_wrapper '[1-9]*' '&@5%&[0-9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5519"
./replace_wrapper '[@n1-9]*' '&@5%&[0-9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5520"
./replace_wrapper '1*' '&[[[]]]@t&&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5521"
./replace_wrapper '1*' '&%[-]]]@t&&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5522"
./replace_wrapper '[-1-9]*' '&@5%&[0-9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5523"
./replace_wrapper '[%1-9]*' '&@5%&[0-9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5524"
./replace_wrapper '[%1-9]*' '&@t&[0]9 &'  < ./inputs/moni/rr18.t 
echo ">>>>>>>>running test 5525"
./replace_wrapper '[1@&@@@@#@%%^*@@n]*' '&@t&          &'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5526"
./replace_wrapper '[1@&@*@@#@%%^@@n]*' '&@t&          &'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5527"
./replace_wrapper '[d]*' '&@t& lkj[0-9]&'  < ./inputs/moni/rr19.t 
echo ">>>>>>>>running test 5528"
./replace_wrapper '[d*]*' '&@t&@t&'  < ./inputs/moni/rr8.t 
echo ">>>>>>>>running test 5529"
./replace_wrapper '[*d]*' '&@t&@t&'  < ./inputs/moni/rr9.t 
echo ">>>>>>>>running test 5530"
./replace_wrapper '[d]*' '&$$$$$&@t&'  < ./inputs/moni/rr10.t 
echo ">>>>>>>>running test 5531"
./replace_wrapper '[$d%]*' '&@t&@t&'  < ./inputs/moni/rr11.t 
echo ">>>>>>>>running test 5532"
./replace_wrapper '[@^d]*' '&@t&@t&'  < ./inputs/moni/rr12.t 
echo ">>>>>>>>running test 5533"
./replace_wrapper '[@!d]*' '&@t&@t&'  < ./inputs/moni/rr13.t 
echo ">>>>>>>>running test 5534"
./replace_wrapper '[@]*1*' '&&@p@q[0-9]&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5535"
./replace_wrapper '1*' '&[[[]]]&@t@@&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5536"
./replace_wrapper '[@t1-8@t]*' '&&@t@t&'  < ./inputs/moni/rr17.t 
echo ">>>>>>>>running test 5537"
./replace_wrapper '[dab]*' '&@t&@t&'  < ./inputs/moni/rr8.t 
echo ">>>>>>>>running test 5538"
./replace_wrapper '[d1]*' '&@t&@t&'  < ./inputs/moni/rr9.t 
echo ">>>>>>>>running test 5539"
./replace_wrapper '[^ad]*' '&@t&@t&'  < ./inputs/moni/rr10.t 
echo ">>>>>>>>running test 5540"
./replace_wrapper '[d]*' '&&@t@t&'  < ./inputs/moni/rr11.t 
echo ">>>>>>>>running test 5541"
./replace_wrapper '[d]*' '&&@y@Y@Y@Y@Y@Y@Y@Y&'  < ./inputs/moni/rr12.t 
echo ">>>>>>>>running test 5542"
./replace_wrapper '[d]*' '&&()*()*()*)(*))(*&'  < ./inputs/moni/rr13.t 
