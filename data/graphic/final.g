digraph FST {
rankdir = LR;
size = "170,220";
label = "";
center = 1;
orientation = Landscape;
ranksep = "0.2";
nodesep = "0.12";
0 [label = "0", shape = circle, style = bold, fontsize = 14]
	0 -> 1 [label = "<eps>:sil/4.0427", fontsize = 14];
	0 -> 2 [label = "<eps>:sp/4.0427", fontsize = 14];
1 [label = "1/0.084212", shape = doublecircle, style = solid, fontsize = 14]
	1 -> 3 [label = "sil:布/5.6114", fontsize = 14];
	1 -> 4 [label = "sil:<eps>/4.1955", fontsize = 14];
	1 -> 5 [label = "sil:的/5.2113", fontsize = 14];
	1 -> 6 [label = "sil:赢/4.5569", fontsize = 14];
	1 -> 7 [label = "sil:<eps>/4.1613", fontsize = 14];
	1 -> 8 [label = "sil:剪刀/4.388", fontsize = 14];
	1 -> 9 [label = "sil:了/5.2052", fontsize = 14];
	1 -> 10 [label = "sil:你/4.4869", fontsize = 14];
	1 -> 11 [label = "sil:平/5.5826", fontsize = 14];
	1 -> 12 [label = "sil:<eps>/4.0078", fontsize = 14];
	1 -> 2 [label = "sp:sp/3.4336", fontsize = 14];
2 [label = "2/0.084243", shape = doublecircle, style = solid, fontsize = 14]
	2 -> 3 [label = "sp:布/5.6114", fontsize = 14];
	2 -> 4 [label = "sp:<eps>/4.1956", fontsize = 14];
	2 -> 5 [label = "sp:的/5.2113", fontsize = 14];
	2 -> 6 [label = "sp:赢/4.5569", fontsize = 14];
	2 -> 7 [label = "sp:<eps>/4.1613", fontsize = 14];
	2 -> 8 [label = "sp:剪刀/4.3881", fontsize = 14];
	2 -> 9 [label = "sp:了/5.2052", fontsize = 14];
	2 -> 10 [label = "sp:你/4.4869", fontsize = 14];
	2 -> 11 [label = "sp:平/5.5826", fontsize = 14];
	2 -> 12 [label = "sp:<eps>/4.0079", fontsize = 14];
	2 -> 1 [label = "uu2-k+uu3:sil/3.4336", fontsize = 14];
3 [label = "3", shape = circle, style = solid, fontsize = 14]
	3 -> 13 [label = "b+u4:<eps>/7.1526e-07", fontsize = 14];
4 [label = "4", shape = circle, style = solid, fontsize = 14]
	4 -> 14 [label = "ch+u1:出/0.27762", fontsize = 14];
	4 -> 15 [label = "ch+u2:锤子/1.4149", fontsize = 14];
5 [label = "5", shape = circle, style = solid, fontsize = 14]
	5 -> 16 [label = "d+e1:<eps>/-4.7684e-07", fontsize = 14];
6 [label = "6", shape = circle, style = solid, fontsize = 14]
	6 -> 17 [label = "iii+i2:<eps>", fontsize = 14];
7 [label = "7", shape = circle, style = solid, fontsize = 14]
	7 -> 18 [label = "iuu+u3:<eps>", fontsize = 14];
8 [label = "8", shape = circle, style = solid, fontsize = 14]
	8 -> 19 [label = "j+i3:<eps>", fontsize = 14];
9 [label = "9", shape = circle, style = solid, fontsize = 14]
	9 -> 20 [label = "l+e1:<eps>/-2.3842e-06", fontsize = 14];
10 [label = "10", shape = circle, style = solid, fontsize = 14]
	10 -> 21 [label = "n+i3:<eps>/-4.7684e-07", fontsize = 14];
11 [label = "11", shape = circle, style = solid, fontsize = 14]
	11 -> 22 [label = "p+i2:<eps>", fontsize = 14];
12 [label = "12", shape = circle, style = solid, fontsize = 14]
	12 -> 23 [label = "sh+ix2:石头/0.38018", fontsize = 14];
	12 -> 24 [label = "sh+ix4:是/1.147", fontsize = 14];
13 [label = "13", shape = circle, style = solid, fontsize = 14]
	13 -> 25 [label = "b-u4+b:布/3.7842", fontsize = 14];
	13 -> 26 [label = "b-u4+ch:<eps>/2.3693", fontsize = 14];
	13 -> 27 [label = "b-u4+d:的/3.3841", fontsize = 14];
	13 -> 28 [label = "b-u4+iii:赢/2.7297", fontsize = 14];
	13 -> 29 [label = "b-u4+iuu:<eps>/2.3341", fontsize = 14];
	13 -> 30 [label = "b-u4+j:剪刀/2.5608", fontsize = 14];
	13 -> 31 [label = "b-u4+l:了/3.378", fontsize = 14];
	13 -> 32 [label = "b-u4+n:你/2.6597", fontsize = 14];
	13 -> 33 [label = "b-u4+p:平/3.7554", fontsize = 14];
	13 -> 34 [label = "b-u4+sh:<eps>/2.1807", fontsize = 14];
	13 -> 1 [label = "b-u4:sil/1.6074", fontsize = 14];
	13 -> 2 [label = "b-u4:sp/1.6073", fontsize = 14];
14 [label = "14", shape = circle, style = solid, fontsize = 14]
	14 -> 35 [label = "ch-u1+b:布/4.4693", fontsize = 14];
	14 -> 36 [label = "ch-u1+ch:<eps>/3.0544", fontsize = 14];
	14 -> 37 [label = "ch-u1+d:的/1.3621", fontsize = 14];
	14 -> 38 [label = "ch-u1+iii:赢/3.4148", fontsize = 14];
	14 -> 39 [label = "ch-u1+iuu:<eps>/3.0192", fontsize = 14];
	14 -> 40 [label = "ch-u1+j:剪刀/1.1677", fontsize = 14];
	14 -> 41 [label = "ch-u1+l:了/4.0631", fontsize = 14];
	14 -> 42 [label = "ch-u1+n:你/3.3448", fontsize = 14];
	14 -> 43 [label = "ch-u1+p:平/4.4405", fontsize = 14];
	14 -> 44 [label = "ch-u1+sh:<eps>/2.8658", fontsize = 14];
	14 -> 1 [label = "ch-u1:sil/2.2925", fontsize = 14];
	14 -> 2 [label = "ch-u1:sp/2.2924", fontsize = 14];
15 [label = "15", shape = circle, style = solid, fontsize = 14]
	15 -> 45 [label = "ch-u2+ea2:<eps>", fontsize = 14];
16 [label = "16", shape = circle, style = solid, fontsize = 14]
	16 -> 46 [label = "d-e1+b:布/4.4938", fontsize = 14];
	16 -> 47 [label = "d-e1+ch:<eps>/3.079", fontsize = 14];
	16 -> 48 [label = "d-e1+d:的/4.0938", fontsize = 14];
	16 -> 49 [label = "d-e1+iii:赢/3.4394", fontsize = 14];
	16 -> 50 [label = "d-e1+iuu:<eps>/3.0448", fontsize = 14];
	16 -> 51 [label = "d-e1+j:剪刀/3.2705", fontsize = 14];
	16 -> 52 [label = "d-e1+l:了/4.0877", fontsize = 14];
	16 -> 53 [label = "d-e1+n:你/3.3694", fontsize = 14];
	16 -> 54 [label = "d-e1+p:平/4.465", fontsize = 14];
	16 -> 55 [label = "d-e1+sh:<eps>/0.53989", fontsize = 14];
	16 -> 1 [label = "d-e1:sil/2.317", fontsize = 14];
	16 -> 2 [label = "d-e1:sp/2.317", fontsize = 14];
17 [label = "17", shape = circle, style = solid, fontsize = 14]
	17 -> 56 [label = "iii-i2+ng:<eps>/-4.7684e-07", fontsize = 14];
18 [label = "18", shape = circle, style = solid, fontsize = 14]
	18 -> 57 [label = "iuu-u3+o3:<eps>/9.5367e-07", fontsize = 14];
19 [label = "19", shape = circle, style = solid, fontsize = 14]
	19 -> 58 [label = "j-i3+ee3:<eps>", fontsize = 14];
20 [label = "20", shape = circle, style = solid, fontsize = 14]
	20 -> 46 [label = "l-e1+b:布/3.7841", fontsize = 14];
	20 -> 47 [label = "l-e1+ch:<eps>/2.3692", fontsize = 14];
	20 -> 48 [label = "l-e1+d:的/3.384", fontsize = 14];
	20 -> 49 [label = "l-e1+iii:赢/2.7296", fontsize = 14];
	20 -> 50 [label = "l-e1+iuu:<eps>/2.335", fontsize = 14];
	20 -> 51 [label = "l-e1+j:剪刀/2.5607", fontsize = 14];
	20 -> 52 [label = "l-e1+l:了/3.3779", fontsize = 14];
	20 -> 53 [label = "l-e1+n:你/2.6596", fontsize = 14];
	20 -> 54 [label = "l-e1+p:平/3.7553", fontsize = 14];
	20 -> 59 [label = "l-e1+sh:<eps>/2.1806", fontsize = 14];
	20 -> 1 [label = "l-e1:sil/1.6073", fontsize = 14];
	20 -> 2 [label = "l-e1:sp/1.6073", fontsize = 14];
21 [label = "21", shape = circle, style = solid, fontsize = 14]
	21 -> 60 [label = "n-i3+b:布/4.4204", fontsize = 14];
	21 -> 61 [label = "n-i3+ch:<eps>/1.1966", fontsize = 14];
	21 -> 62 [label = "n-i3+d:的/4.0203", fontsize = 14];
	21 -> 63 [label = "n-i3+iii:赢/1.317", fontsize = 14];
	21 -> 64 [label = "n-i3+iuu:<eps>/2.9713", fontsize = 14];
	21 -> 65 [label = "n-i3+j:剪刀/3.197", fontsize = 14];
	21 -> 66 [label = "n-i3+l:了/4.0142", fontsize = 14];
	21 -> 67 [label = "n-i3+n:你/3.2959", fontsize = 14];
	21 -> 68 [label = "n-i3+p:平/4.3916", fontsize = 14];
	21 -> 69 [label = "n-i3+sh:<eps>/2.8168", fontsize = 14];
	21 -> 1 [label = "n-i3:sil/2.2436", fontsize = 14];
	21 -> 2 [label = "n-i3:sp/2.2435", fontsize = 14];
22 [label = "22", shape = circle, style = solid, fontsize = 14]
	22 -> 70 [label = "p-i2+ng:<eps>/4.7684e-07", fontsize = 14];
23 [label = "23", shape = circle, style = solid, fontsize = 14]
	23 -> 71 [label = "sh-ix2+t:<eps>", fontsize = 14];
24 [label = "24", shape = circle, style = solid, fontsize = 14]
	24 -> 72 [label = "sh-ix4+b:布/4.5171", fontsize = 14];
	24 -> 73 [label = "sh-ix4+ch:<eps>/3.1012", fontsize = 14];
	24 -> 74 [label = "sh-ix4+d:的/4.117", fontsize = 14];
	24 -> 75 [label = "sh-ix4+iii:赢/3.4626", fontsize = 14];
	24 -> 76 [label = "sh-ix4+iuu:<eps>/3.067", fontsize = 14];
	24 -> 77 [label = "sh-ix4+j:剪刀/3.2937", fontsize = 14];
	24 -> 78 [label = "sh-ix4+l:了/4.1109", fontsize = 14];
	24 -> 79 [label = "sh-ix4+n:你/3.3926", fontsize = 14];
	24 -> 80 [label = "sh-ix4+p:平/4.4883", fontsize = 14];
	24 -> 81 [label = "sh-ix4+sh:<eps>/0.5252", fontsize = 14];
	24 -> 1 [label = "sh-ix4:sil/2.3393", fontsize = 14];
	24 -> 2 [label = "sh-ix4:sp/2.3393", fontsize = 14];
25 [label = "25", shape = circle, style = solid, fontsize = 14]
	25 -> 13 [label = "u4-b+u4:<eps>/7.1526e-07", fontsize = 14];
26 [label = "26", shape = circle, style = solid, fontsize = 14]
	26 -> 14 [label = "u4-ch+u1:出/0.27762", fontsize = 14];
	26 -> 15 [label = "u4-ch+u2:锤子/1.4149", fontsize = 14];
27 [label = "27", shape = circle, style = solid, fontsize = 14]
	27 -> 16 [label = "u4-d+e1:<eps>/-4.7684e-07", fontsize = 14];
28 [label = "28", shape = circle, style = solid, fontsize = 14]
	28 -> 17 [label = "u4-iii+i2:<eps>", fontsize = 14];
29 [label = "29", shape = circle, style = solid, fontsize = 14]
	29 -> 18 [label = "u4-iuu+u3:<eps>", fontsize = 14];
30 [label = "30", shape = circle, style = solid, fontsize = 14]
	30 -> 19 [label = "u4-j+i3:<eps>", fontsize = 14];
31 [label = "31", shape = circle, style = solid, fontsize = 14]
	31 -> 20 [label = "u4-l+e1:<eps>/-2.3842e-06", fontsize = 14];
32 [label = "32", shape = circle, style = solid, fontsize = 14]
	32 -> 21 [label = "u4-n+i3:<eps>/-4.7684e-07", fontsize = 14];
33 [label = "33", shape = circle, style = solid, fontsize = 14]
	33 -> 22 [label = "u4-p+i2:<eps>", fontsize = 14];
34 [label = "34", shape = circle, style = solid, fontsize = 14]
	34 -> 23 [label = "u4-sh+ix2:石头/0.38018", fontsize = 14];
	34 -> 24 [label = "u4-sh+ix4:是/1.147", fontsize = 14];
35 [label = "35", shape = circle, style = solid, fontsize = 14]
	35 -> 13 [label = "u1-b+u4:<eps>/7.1526e-07", fontsize = 14];
36 [label = "36", shape = circle, style = solid, fontsize = 14]
	36 -> 14 [label = "u1-ch+u1:出/0.27762", fontsize = 14];
	36 -> 15 [label = "u1-ch+u2:锤子/1.4149", fontsize = 14];
37 [label = "37", shape = circle, style = solid, fontsize = 14]
	37 -> 82 [label = "u1-d+e1:<eps>/4.7684e-07", fontsize = 14];
38 [label = "38", shape = circle, style = solid, fontsize = 14]
	38 -> 17 [label = "u1-iii+i2:<eps>", fontsize = 14];
39 [label = "39", shape = circle, style = solid, fontsize = 14]
	39 -> 18 [label = "u1-iuu+u3:<eps>", fontsize = 14];
40 [label = "40", shape = circle, style = solid, fontsize = 14]
	40 -> 83 [label = "u1-j+i3:<eps>", fontsize = 14];
41 [label = "41", shape = circle, style = solid, fontsize = 14]
	41 -> 20 [label = "u1-l+e1:<eps>/-2.3842e-06", fontsize = 14];
42 [label = "42", shape = circle, style = solid, fontsize = 14]
	42 -> 21 [label = "u1-n+i3:<eps>/-4.7684e-07", fontsize = 14];
43 [label = "43", shape = circle, style = solid, fontsize = 14]
	43 -> 22 [label = "u1-p+i2:<eps>", fontsize = 14];
44 [label = "44", shape = circle, style = solid, fontsize = 14]
	44 -> 23 [label = "u1-sh+ix2:石头/0.38018", fontsize = 14];
	44 -> 24 [label = "u1-sh+ix4:是/1.147", fontsize = 14];
45 [label = "45", shape = circle, style = solid, fontsize = 14]
	45 -> 84 [label = "u2-ea2+i2:<eps>", fontsize = 14];
46 [label = "46", shape = circle, style = solid, fontsize = 14]
	46 -> 13 [label = "e1-b+u4:<eps>/7.1526e-07", fontsize = 14];
47 [label = "47", shape = circle, style = solid, fontsize = 14]
	47 -> 14 [label = "e1-ch+u1:出/0.27762", fontsize = 14];
	47 -> 15 [label = "e1-ch+u2:锤子/1.4149", fontsize = 14];
48 [label = "48", shape = circle, style = solid, fontsize = 14]
	48 -> 16 [label = "e1-d+e1:<eps>/-4.7684e-07", fontsize = 14];
49 [label = "49", shape = circle, style = solid, fontsize = 14]
	49 -> 17 [label = "e1-iii+i2:<eps>", fontsize = 14];
50 [label = "50", shape = circle, style = solid, fontsize = 14]
	50 -> 18 [label = "e1-iuu+u3:<eps>", fontsize = 14];
51 [label = "51", shape = circle, style = solid, fontsize = 14]
	51 -> 19 [label = "e1-j+i3:<eps>", fontsize = 14];
52 [label = "52", shape = circle, style = solid, fontsize = 14]
	52 -> 20 [label = "e1-l+e1:<eps>/-2.3842e-06", fontsize = 14];
53 [label = "53", shape = circle, style = solid, fontsize = 14]
	53 -> 21 [label = "e1-n+i3:<eps>/-4.7684e-07", fontsize = 14];
54 [label = "54", shape = circle, style = solid, fontsize = 14]
	54 -> 22 [label = "e1-p+i2:<eps>", fontsize = 14];
55 [label = "55", shape = circle, style = solid, fontsize = 14]
	55 -> 23 [label = "e1-sh+ix2:石头/2.7316", fontsize = 14];
	55 -> 85 [label = "e1-sh+ix4:是/0.064775", fontsize = 14];
56 [label = "56", shape = circle, style = solid, fontsize = 14]
	56 -> 86 [label = "i2-ng+b:布/3.8563", fontsize = 14];
	56 -> 87 [label = "i2-ng+ch:<eps>/2.4414", fontsize = 14];
	56 -> 88 [label = "i2-ng+d:的/3.4562", fontsize = 14];
	56 -> 89 [label = "i2-ng+iii:赢/2.8018", fontsize = 14];
	56 -> 90 [label = "i2-ng+iuu:<eps>/2.4072", fontsize = 14];
	56 -> 91 [label = "i2-ng+j:剪刀/2.6329", fontsize = 14];
	56 -> 92 [label = "i2-ng+l:了/2.288", fontsize = 14];
	56 -> 93 [label = "i2-ng+n:你/2.7318", fontsize = 14];
	56 -> 94 [label = "i2-ng+p:平/3.8274", fontsize = 14];
	56 -> 95 [label = "i2-ng+sh:<eps>/2.2527", fontsize = 14];
	56 -> 1 [label = "i2-ng:sil/1.6794", fontsize = 14];
	56 -> 2 [label = "i2-ng:sp/1.6794", fontsize = 14];
57 [label = "57", shape = circle, style = solid, fontsize = 14]
	57 -> 96 [label = "u3-o3+b:我/4.745", fontsize = 14];
	57 -> 97 [label = "u3-o3+ch:我/1.5212", fontsize = 14];
	57 -> 98 [label = "u3-o3+d:我/4.3449", fontsize = 14];
	57 -> 99 [label = "u3-o3+iii:我/1.6416", fontsize = 14];
	57 -> 100 [label = "u3-o3+iuu:我/3.2959", fontsize = 14];
	57 -> 101 [label = "u3-o3+j:我/3.5216", fontsize = 14];
	57 -> 102 [label = "u3-o3+l:我/4.3388", fontsize = 14];
	57 -> 103 [label = "u3-o3+m:我们/1.2431", fontsize = 14];
	57 -> 104 [label = "u3-o3+n:我/3.6205", fontsize = 14];
	57 -> 105 [label = "u3-o3+p:我/4.7162", fontsize = 14];
	57 -> 106 [label = "u3-o3+sh:我/3.1415", fontsize = 14];
	57 -> 107 [label = "u3-o3:我/2.5681", fontsize = 14];
	57 -> 108 [label = "u3-o3:我/2.5682", fontsize = 14];
58 [label = "58", shape = circle, style = solid, fontsize = 14]
	58 -> 109 [label = "i3-ee3+nn:<eps>", fontsize = 14];
59 [label = "59", shape = circle, style = solid, fontsize = 14]
	59 -> 23 [label = "e1-sh+ix2:石头/0.38018", fontsize = 14];
	59 -> 24 [label = "e1-sh+ix4:是/1.147", fontsize = 14];
60 [label = "60", shape = circle, style = solid, fontsize = 14]
	60 -> 13 [label = "i3-b+u4:<eps>/7.1526e-07", fontsize = 14];
61 [label = "61", shape = circle, style = solid, fontsize = 14]
	61 -> 110 [label = "i3-ch+u1:出/0.037693", fontsize = 14];
	61 -> 15 [label = "i3-ch+u2:锤子/3.2237", fontsize = 14];
62 [label = "62", shape = circle, style = solid, fontsize = 14]
	62 -> 16 [label = "i3-d+e1:<eps>/-4.7684e-07", fontsize = 14];
63 [label = "63", shape = circle, style = solid, fontsize = 14]
	63 -> 111 [label = "i3-iii+i2:<eps>", fontsize = 14];
64 [label = "64", shape = circle, style = solid, fontsize = 14]
	64 -> 18 [label = "i3-iuu+u3:<eps>", fontsize = 14];
65 [label = "65", shape = circle, style = solid, fontsize = 14]
	65 -> 19 [label = "i3-j+i3:<eps>", fontsize = 14];
66 [label = "66", shape = circle, style = solid, fontsize = 14]
	66 -> 20 [label = "i3-l+e1:<eps>/-2.3842e-06", fontsize = 14];
67 [label = "67", shape = circle, style = solid, fontsize = 14]
	67 -> 21 [label = "i3-n+i3:<eps>/-4.7684e-07", fontsize = 14];
68 [label = "68", shape = circle, style = solid, fontsize = 14]
	68 -> 22 [label = "i3-p+i2:<eps>", fontsize = 14];
69 [label = "69", shape = circle, style = solid, fontsize = 14]
	69 -> 23 [label = "i3-sh+ix2:石头/0.38018", fontsize = 14];
	69 -> 24 [label = "i3-sh+ix4:是/1.147", fontsize = 14];
70 [label = "70", shape = circle, style = solid, fontsize = 14]
	70 -> 86 [label = "i2-ng+b:布/4.0532", fontsize = 14];
	70 -> 87 [label = "i2-ng+ch:<eps>/2.6384", fontsize = 14];
	70 -> 88 [label = "i2-ng+d:的/3.6541", fontsize = 14];
	70 -> 89 [label = "i2-ng+iii:赢/2.9997", fontsize = 14];
	70 -> 90 [label = "i2-ng+iuu:<eps>/2.6041", fontsize = 14];
	70 -> 91 [label = "i2-ng+j:剪刀/2.8309", fontsize = 14];
	70 -> 112 [label = "i2-ng+l:了/1.3115", fontsize = 14];
	70 -> 93 [label = "i2-ng+n:你/2.9288", fontsize = 14];
	70 -> 94 [label = "i2-ng+p:平/4.0254", fontsize = 14];
	70 -> 95 [label = "i2-ng+sh:<eps>/2.4507", fontsize = 14];
	70 -> 1 [label = "i2-ng:sil/1.8764", fontsize = 14];
	70 -> 2 [label = "i2-ng:sp/1.8764", fontsize = 14];
71 [label = "71", shape = circle, style = solid, fontsize = 14]
	71 -> 113 [label = "ix2-t+at2:<eps>", fontsize = 14];
72 [label = "72", shape = circle, style = solid, fontsize = 14]
	72 -> 13 [label = "ix4-b+u4:<eps>/7.1526e-07", fontsize = 14];
73 [label = "73", shape = circle, style = solid, fontsize = 14]
	73 -> 14 [label = "ix4-ch+u1:出/0.27762", fontsize = 14];
	73 -> 15 [label = "ix4-ch+u2:锤子/1.4149", fontsize = 14];
74 [label = "74", shape = circle, style = solid, fontsize = 14]
	74 -> 16 [label = "ix4-d+e1:<eps>/-4.7684e-07", fontsize = 14];
75 [label = "75", shape = circle, style = solid, fontsize = 14]
	75 -> 17 [label = "ix4-iii+i2:<eps>", fontsize = 14];
76 [label = "76", shape = circle, style = solid, fontsize = 14]
	76 -> 18 [label = "ix4-iuu+u3:<eps>", fontsize = 14];
77 [label = "77", shape = circle, style = solid, fontsize = 14]
	77 -> 19 [label = "ix4-j+i3:<eps>", fontsize = 14];
78 [label = "78", shape = circle, style = solid, fontsize = 14]
	78 -> 20 [label = "ix4-l+e1:<eps>/-2.3842e-06", fontsize = 14];
79 [label = "79", shape = circle, style = solid, fontsize = 14]
	79 -> 21 [label = "ix4-n+i3:<eps>/-4.7684e-07", fontsize = 14];
80 [label = "80", shape = circle, style = solid, fontsize = 14]
	80 -> 22 [label = "ix4-p+i2:<eps>", fontsize = 14];
81 [label = "81", shape = circle, style = solid, fontsize = 14]
	81 -> 114 [label = "ix4-sh+ix2:石头/0.02643", fontsize = 14];
	81 -> 24 [label = "ix4-sh+ix4:是/3.5353", fontsize = 14];
82 [label = "82", shape = circle, style = solid, fontsize = 14]
	82 -> 46 [label = "d-e1+b:布/4.4939", fontsize = 14];
	82 -> 47 [label = "d-e1+ch:<eps>/3.079", fontsize = 14];
	82 -> 48 [label = "d-e1+d:的/4.0938", fontsize = 14];
	82 -> 49 [label = "d-e1+iii:赢/3.4394", fontsize = 14];
	82 -> 50 [label = "d-e1+iuu:<eps>/3.0438", fontsize = 14];
	82 -> 51 [label = "d-e1+j:剪刀/3.2705", fontsize = 14];
	82 -> 52 [label = "d-e1+l:了/4.0877", fontsize = 14];
	82 -> 53 [label = "d-e1+n:你/3.3694", fontsize = 14];
	82 -> 54 [label = "d-e1+p:平/4.4651", fontsize = 14];
	82 -> 55 [label = "d-e1+sh:<eps>/0.53993", fontsize = 14];
	82 -> 1 [label = "d-e1:sil/2.3171", fontsize = 14];
	82 -> 2 [label = "d-e1:sp/2.317", fontsize = 14];
83 [label = "83", shape = circle, style = solid, fontsize = 14]
	83 -> 115 [label = "j-i3+ee3:<eps>", fontsize = 14];
84 [label = "84", shape = circle, style = solid, fontsize = 14]
	84 -> 116 [label = "ea2-i2+z:<eps>", fontsize = 14];
85 [label = "85", shape = circle, style = solid, fontsize = 14]
	85 -> 72 [label = "sh-ix4+b:布/4.5161", fontsize = 14];
	85 -> 73 [label = "sh-ix4+ch:<eps>/3.1013", fontsize = 14];
	85 -> 74 [label = "sh-ix4+d:的/4.117", fontsize = 14];
	85 -> 75 [label = "sh-ix4+iii:赢/3.4626", fontsize = 14];
	85 -> 76 [label = "sh-ix4+iuu:<eps>/3.0671", fontsize = 14];
	85 -> 77 [label = "sh-ix4+j:剪刀/3.2938", fontsize = 14];
	85 -> 78 [label = "sh-ix4+l:了/4.11", fontsize = 14];
	85 -> 79 [label = "sh-ix4+n:你/3.3917", fontsize = 14];
	85 -> 80 [label = "sh-ix4+p:平/4.4883", fontsize = 14];
	85 -> 81 [label = "sh-ix4+sh:<eps>/0.52525", fontsize = 14];
	85 -> 1 [label = "sh-ix4:sil/2.3393", fontsize = 14];
	85 -> 2 [label = "sh-ix4:sp/2.3393", fontsize = 14];
86 [label = "86", shape = circle, style = solid, fontsize = 14]
	86 -> 13 [label = "ng-b+u4:<eps>/7.1526e-07", fontsize = 14];
87 [label = "87", shape = circle, style = solid, fontsize = 14]
	87 -> 14 [label = "ng-ch+u1:出/0.27762", fontsize = 14];
	87 -> 15 [label = "ng-ch+u2:锤子/1.4149", fontsize = 14];
88 [label = "88", shape = circle, style = solid, fontsize = 14]
	88 -> 16 [label = "ng-d+e1:<eps>/-4.7684e-07", fontsize = 14];
89 [label = "89", shape = circle, style = solid, fontsize = 14]
	89 -> 17 [label = "ng-iii+i2:<eps>", fontsize = 14];
90 [label = "90", shape = circle, style = solid, fontsize = 14]
	90 -> 18 [label = "ng-iuu+u3:<eps>", fontsize = 14];
91 [label = "91", shape = circle, style = solid, fontsize = 14]
	91 -> 19 [label = "ng-j+i3:<eps>", fontsize = 14];
92 [label = "92", shape = circle, style = solid, fontsize = 14]
	92 -> 117 [label = "ng-l+e1:<eps>/-1.9073e-06", fontsize = 14];
93 [label = "93", shape = circle, style = solid, fontsize = 14]
	93 -> 21 [label = "ng-n+i3:<eps>/-4.7684e-07", fontsize = 14];
94 [label = "94", shape = circle, style = solid, fontsize = 14]
	94 -> 22 [label = "ng-p+i2:<eps>", fontsize = 14];
95 [label = "95", shape = circle, style = solid, fontsize = 14]
	95 -> 23 [label = "ng-sh+ix2:石头/0.38018", fontsize = 14];
	95 -> 24 [label = "ng-sh+ix4:是/1.147", fontsize = 14];
96 [label = "96", shape = circle, style = solid, fontsize = 14]
	96 -> 13 [label = "o3-b+u4:布/7.1526e-07", fontsize = 14];
97 [label = "97", shape = circle, style = solid, fontsize = 14]
	97 -> 110 [label = "o3-ch+u1:出/0.037693", fontsize = 14];
	97 -> 15 [label = "o3-ch+u2:锤子/3.2237", fontsize = 14];
98 [label = "98", shape = circle, style = solid, fontsize = 14]
	98 -> 16 [label = "o3-d+e1:的/-4.7684e-07", fontsize = 14];
99 [label = "99", shape = circle, style = solid, fontsize = 14]
	99 -> 111 [label = "o3-iii+i2:赢", fontsize = 14];
100 [label = "100", shape = circle, style = solid, fontsize = 14]
	100 -> 18 [label = "o3-iuu+u3:<eps>", fontsize = 14];
101 [label = "101", shape = circle, style = solid, fontsize = 14]
	101 -> 19 [label = "o3-j+i3:剪刀", fontsize = 14];
102 [label = "102", shape = circle, style = solid, fontsize = 14]
	102 -> 20 [label = "o3-l+e1:了/-2.3842e-06", fontsize = 14];
103 [label = "103", shape = circle, style = solid, fontsize = 14]
	103 -> 118 [label = "o3-m+at1:<eps>", fontsize = 14];
104 [label = "104", shape = circle, style = solid, fontsize = 14]
	104 -> 21 [label = "o3-n+i3:你/-4.7684e-07", fontsize = 14];
105 [label = "105", shape = circle, style = solid, fontsize = 14]
	105 -> 22 [label = "o3-p+i2:平", fontsize = 14];
106 [label = "106", shape = circle, style = solid, fontsize = 14]
	106 -> 23 [label = "o3-sh+ix2:石头/0.38018", fontsize = 14];
	106 -> 24 [label = "o3-sh+ix4:是/1.147", fontsize = 14];
107 [label = "107", shape = circle, style = solid, fontsize = 14]
	107 -> 119 [label = "<eps>:sil/0.084243", fontsize = 14];
	107 -> 120 [label = "sil:sil/5.6114", fontsize = 14];
	107 -> 4 [label = "sil:sil/4.1956", fontsize = 14];
	107 -> 121 [label = "sil:sil/5.2113", fontsize = 14];
	107 -> 122 [label = "sil:sil/4.5569", fontsize = 14];
	107 -> 7 [label = "sil:sil/4.1613", fontsize = 14];
	107 -> 123 [label = "sil:sil/4.3881", fontsize = 14];
	107 -> 124 [label = "sil:sil/5.2052", fontsize = 14];
	107 -> 125 [label = "sil:sil/4.4869", fontsize = 14];
	107 -> 126 [label = "sil:sil/5.5826", fontsize = 14];
	107 -> 12 [label = "sil:sil/4.0079", fontsize = 14];
	107 -> 108 [label = "sp:sil/3.4336", fontsize = 14];
108 [label = "108", shape = circle, style = solid, fontsize = 14]
	108 -> 127 [label = "<eps>:sp/0.084212", fontsize = 14];
	108 -> 120 [label = "sp:sp/5.6114", fontsize = 14];
	108 -> 4 [label = "sp:sp/4.1955", fontsize = 14];
	108 -> 121 [label = "sp:sp/5.2113", fontsize = 14];
	108 -> 122 [label = "sp:sp/4.5569", fontsize = 14];
	108 -> 7 [label = "sp:sp/4.1613", fontsize = 14];
	108 -> 123 [label = "sp:sp/4.388", fontsize = 14];
	108 -> 124 [label = "sp:sp/5.2052", fontsize = 14];
	108 -> 125 [label = "sp:sp/4.4869", fontsize = 14];
	108 -> 126 [label = "sp:sp/5.5826", fontsize = 14];
	108 -> 12 [label = "sp:sp/4.0078", fontsize = 14];
	108 -> 107 [label = "uu2-k+uu3:sp/3.4336", fontsize = 14];
109 [label = "109", shape = circle, style = solid, fontsize = 14]
	109 -> 128 [label = "ee3-nn+d:<eps>", fontsize = 14];
110 [label = "110", shape = circle, style = solid, fontsize = 14]
	110 -> 35 [label = "ch-u1+b:布/4.4692", fontsize = 14];
	110 -> 36 [label = "ch-u1+ch:<eps>/3.0544", fontsize = 14];
	110 -> 37 [label = "ch-u1+d:的/1.3621", fontsize = 14];
	110 -> 38 [label = "ch-u1+iii:赢/3.4147", fontsize = 14];
	110 -> 39 [label = "ch-u1+iuu:<eps>/3.0202", fontsize = 14];
	110 -> 40 [label = "ch-u1+j:剪刀/1.1677", fontsize = 14];
	110 -> 41 [label = "ch-u1+l:了/4.0631", fontsize = 14];
	110 -> 42 [label = "ch-u1+n:你/3.3448", fontsize = 14];
	110 -> 43 [label = "ch-u1+p:平/4.4404", fontsize = 14];
	110 -> 44 [label = "ch-u1+sh:<eps>/2.8657", fontsize = 14];
	110 -> 1 [label = "ch-u1:sil/2.2924", fontsize = 14];
	110 -> 2 [label = "ch-u1:sp/2.2924", fontsize = 14];
111 [label = "111", shape = circle, style = solid, fontsize = 14]
	111 -> 129 [label = "iii-i2+ng:<eps>/-4.7684e-07", fontsize = 14];
112 [label = "112", shape = circle, style = solid, fontsize = 14]
	112 -> 130 [label = "ng-l+e1:<eps>/1.9073e-06", fontsize = 14];
113 [label = "113", shape = circle, style = solid, fontsize = 14]
	113 -> 131 [label = "t-at2+uu2:<eps>/-2.3842e-07", fontsize = 14];
114 [label = "114", shape = circle, style = solid, fontsize = 14]
	114 -> 132 [label = "sh-ix2+t:<eps>", fontsize = 14];
115 [label = "115", shape = circle, style = solid, fontsize = 14]
	115 -> 133 [label = "i3-ee3+nn:<eps>", fontsize = 14];
116 [label = "116", shape = circle, style = solid, fontsize = 14]
	116 -> 134 [label = "i2-z+iy3:<eps>/7.1526e-07", fontsize = 14];
117 [label = "117", shape = circle, style = solid, fontsize = 14]
	117 -> 46 [label = "l-e1+b:布/3.7841", fontsize = 14];
	117 -> 47 [label = "l-e1+ch:<eps>/2.3692", fontsize = 14];
	117 -> 48 [label = "l-e1+d:的/3.384", fontsize = 14];
	117 -> 49 [label = "l-e1+iii:赢/2.7296", fontsize = 14];
	117 -> 50 [label = "l-e1+iuu:<eps>/2.335", fontsize = 14];
	117 -> 51 [label = "l-e1+j:剪刀/2.5607", fontsize = 14];
	117 -> 52 [label = "l-e1+l:了/3.3779", fontsize = 14];
	117 -> 53 [label = "l-e1+n:你/2.6596", fontsize = 14];
	117 -> 54 [label = "l-e1+p:平/3.7553", fontsize = 14];
	117 -> 59 [label = "l-e1+sh:<eps>/2.1806", fontsize = 14];
	117 -> 1 [label = "l-e1:sil/1.6073", fontsize = 14];
	117 -> 2 [label = "l-e1:sp/1.6073", fontsize = 14];
118 [label = "118", shape = circle, style = solid, fontsize = 14]
	118 -> 135 [label = "m-at1+nn:<eps>/-2.3842e-06", fontsize = 14];
119 [label = "119", shape = doublecircle, style = solid, fontsize = 14]
120 [label = "120", shape = circle, style = solid, fontsize = 14]
	120 -> 13 [label = "b+u4:布/7.1526e-07", fontsize = 14];
121 [label = "121", shape = circle, style = solid, fontsize = 14]
	121 -> 16 [label = "d+e1:的/-4.7684e-07", fontsize = 14];
122 [label = "122", shape = circle, style = solid, fontsize = 14]
	122 -> 17 [label = "iii+i2:赢", fontsize = 14];
123 [label = "123", shape = circle, style = solid, fontsize = 14]
	123 -> 19 [label = "j+i3:剪刀", fontsize = 14];
124 [label = "124", shape = circle, style = solid, fontsize = 14]
	124 -> 20 [label = "l+e1:了/-2.3842e-06", fontsize = 14];
125 [label = "125", shape = circle, style = solid, fontsize = 14]
	125 -> 21 [label = "n+i3:你/-4.7684e-07", fontsize = 14];
126 [label = "126", shape = circle, style = solid, fontsize = 14]
	126 -> 22 [label = "p+i2:平", fontsize = 14];
127 [label = "127", shape = doublecircle, style = solid, fontsize = 14]
128 [label = "128", shape = circle, style = solid, fontsize = 14]
	128 -> 136 [label = "nn-d+aa1:<eps>", fontsize = 14];
129 [label = "129", shape = circle, style = solid, fontsize = 14]
	129 -> 86 [label = "i2-ng+b:布/3.8563", fontsize = 14];
	129 -> 87 [label = "i2-ng+ch:<eps>/2.4415", fontsize = 14];
	129 -> 88 [label = "i2-ng+d:的/3.4562", fontsize = 14];
	129 -> 89 [label = "i2-ng+iii:赢/2.8018", fontsize = 14];
	129 -> 90 [label = "i2-ng+iuu:<eps>/2.4063", fontsize = 14];
	129 -> 91 [label = "i2-ng+j:剪刀/2.633", fontsize = 14];
	129 -> 92 [label = "i2-ng+l:了/2.2881", fontsize = 14];
	129 -> 93 [label = "i2-ng+n:你/2.7319", fontsize = 14];
	129 -> 94 [label = "i2-ng+p:平/3.8275", fontsize = 14];
	129 -> 95 [label = "i2-ng+sh:<eps>/2.2528", fontsize = 14];
	129 -> 1 [label = "i2-ng:sil/1.6795", fontsize = 14];
	129 -> 2 [label = "i2-ng:sp/1.6795", fontsize = 14];
130 [label = "130", shape = circle, style = solid, fontsize = 14]
	130 -> 46 [label = "l-e1+b:布/3.7847", fontsize = 14];
	130 -> 47 [label = "l-e1+ch:<eps>/2.3688", fontsize = 14];
	130 -> 48 [label = "l-e1+d:的/3.3846", fontsize = 14];
	130 -> 49 [label = "l-e1+iii:赢/2.7302", fontsize = 14];
	130 -> 50 [label = "l-e1+iuu:<eps>/2.3346", fontsize = 14];
	130 -> 51 [label = "l-e1+j:剪刀/2.5613", fontsize = 14];
	130 -> 52 [label = "l-e1+l:了/3.3785", fontsize = 14];
	130 -> 53 [label = "l-e1+n:你/2.6602", fontsize = 14];
	130 -> 54 [label = "l-e1+p:平/3.7558", fontsize = 14];
	130 -> 59 [label = "l-e1+sh:<eps>/2.1811", fontsize = 14];
	130 -> 1 [label = "l-e1:sil/1.6069", fontsize = 14];
	130 -> 2 [label = "l-e1:sp/1.6068", fontsize = 14];
131 [label = "131", shape = circle, style = solid, fontsize = 14]
	131 -> 137 [label = "at2-uu2+b:布/3.7839", fontsize = 14];
	131 -> 138 [label = "at2-uu2+ch:<eps>/2.369", fontsize = 14];
	131 -> 139 [label = "at2-uu2+d:的/3.3838", fontsize = 14];
	131 -> 140 [label = "at2-uu2+iii:赢/2.7304", fontsize = 14];
	131 -> 141 [label = "at2-uu2+iuu:<eps>/2.3348", fontsize = 14];
	131 -> 142 [label = "at2-uu2+j:剪刀/2.5605", fontsize = 14];
	131 -> 143 [label = "at2-uu2+l:了/3.3777", fontsize = 14];
	131 -> 144 [label = "at2-uu2+n:你/2.6594", fontsize = 14];
	131 -> 145 [label = "at2-uu2+p:平/3.7561", fontsize = 14];
	131 -> 146 [label = "at2-uu2+sh:<eps>/2.1813", fontsize = 14];
	131 -> 1 [label = "at2-uu2:sil/1.6071", fontsize = 14];
	131 -> 2 [label = "at2-uu2:sp/1.6071", fontsize = 14];
132 [label = "132", shape = circle, style = solid, fontsize = 14]
	132 -> 147 [label = "ix2-t+at2:<eps>", fontsize = 14];
133 [label = "133", shape = circle, style = solid, fontsize = 14]
	133 -> 148 [label = "ee3-nn+d:<eps>", fontsize = 14];
134 [label = "134", shape = circle, style = solid, fontsize = 14]
	134 -> 149 [label = "z-iy3+b:布/3.7842", fontsize = 14];
	134 -> 150 [label = "z-iy3+ch:<eps>/2.3693", fontsize = 14];
	134 -> 151 [label = "z-iy3+d:的/3.3841", fontsize = 14];
	134 -> 152 [label = "z-iy3+iii:赢/2.7297", fontsize = 14];
	134 -> 153 [label = "z-iy3+iuu:<eps>/2.3341", fontsize = 14];
	134 -> 154 [label = "z-iy3+j:剪刀/2.5608", fontsize = 14];
	134 -> 155 [label = "z-iy3+l:了/3.378", fontsize = 14];
	134 -> 156 [label = "z-iy3+n:你/2.6597", fontsize = 14];
	134 -> 157 [label = "z-iy3+p:平/3.7554", fontsize = 14];
	134 -> 158 [label = "z-iy3+sh:<eps>/2.1807", fontsize = 14];
	134 -> 1 [label = "z-iy3:sil/1.6074", fontsize = 14];
	134 -> 2 [label = "z-iy3:sp/1.6073", fontsize = 14];
135 [label = "135", shape = circle, style = solid, fontsize = 14]
	135 -> 159 [label = "at1-nn+b:布/4.3007", fontsize = 14];
	135 -> 160 [label = "at1-nn+ch:<eps>/2.8859", fontsize = 14];
	135 -> 161 [label = "at1-nn+d:的/3.9006", fontsize = 14];
	135 -> 162 [label = "at1-nn+iii:赢/3.2462", fontsize = 14];
	135 -> 163 [label = "at1-nn+iuu:<eps>/2.8516", fontsize = 14];
	135 -> 164 [label = "at1-nn+j:剪刀/3.0774", fontsize = 14];
	135 -> 165 [label = "at1-nn+l:了/3.8946", fontsize = 14];
	135 -> 166 [label = "at1-nn+n:你/3.1763", fontsize = 14];
	135 -> 167 [label = "at1-nn+p:平/0.8393", fontsize = 14];
	135 -> 168 [label = "at1-nn+sh:<eps>/2.6972", fontsize = 14];
	135 -> 1 [label = "at1-nn:sil/2.1239", fontsize = 14];
	135 -> 2 [label = "at1-nn:sp/2.1239", fontsize = 14];
136 [label = "136", shape = circle, style = solid, fontsize = 14]
	136 -> 169 [label = "d-aa1+uu1:<eps>/-2.3842e-07", fontsize = 14];
137 [label = "137", shape = circle, style = solid, fontsize = 14]
	137 -> 13 [label = "uu2-b+u4:<eps>/7.1526e-07", fontsize = 14];
138 [label = "138", shape = circle, style = solid, fontsize = 14]
	138 -> 14 [label = "uu2-ch+u1:出/0.27762", fontsize = 14];
	138 -> 15 [label = "uu2-ch+u2:锤子/1.4149", fontsize = 14];
139 [label = "139", shape = circle, style = solid, fontsize = 14]
	139 -> 16 [label = "uu2-d+e1:<eps>/-4.7684e-07", fontsize = 14];
140 [label = "140", shape = circle, style = solid, fontsize = 14]
	140 -> 17 [label = "uu2-iii+i2:<eps>", fontsize = 14];
141 [label = "141", shape = circle, style = solid, fontsize = 14]
	141 -> 18 [label = "uu2-iuu+u3:<eps>", fontsize = 14];
142 [label = "142", shape = circle, style = solid, fontsize = 14]
	142 -> 19 [label = "uu2-j+i3:<eps>", fontsize = 14];
143 [label = "143", shape = circle, style = solid, fontsize = 14]
	143 -> 20 [label = "uu2-l+e1:<eps>/-2.3842e-06", fontsize = 14];
144 [label = "144", shape = circle, style = solid, fontsize = 14]
	144 -> 21 [label = "uu2-n+i3:<eps>/-4.7684e-07", fontsize = 14];
145 [label = "145", shape = circle, style = solid, fontsize = 14]
	145 -> 22 [label = "uu2-p+i2:<eps>", fontsize = 14];
146 [label = "146", shape = circle, style = solid, fontsize = 14]
	146 -> 23 [label = "uu2-sh+ix2:石头/0.38018", fontsize = 14];
	146 -> 24 [label = "uu2-sh+ix4:是/1.147", fontsize = 14];
147 [label = "147", shape = circle, style = solid, fontsize = 14]
	147 -> 170 [label = "t-at2+uu2:<eps>", fontsize = 14];
148 [label = "148", shape = circle, style = solid, fontsize = 14]
	148 -> 171 [label = "nn-d+aa1:<eps>", fontsize = 14];
149 [label = "149", shape = circle, style = solid, fontsize = 14]
	149 -> 13 [label = "iy3-b+u4:<eps>/7.1526e-07", fontsize = 14];
150 [label = "150", shape = circle, style = solid, fontsize = 14]
	150 -> 14 [label = "iy3-ch+u1:出/0.27762", fontsize = 14];
	150 -> 15 [label = "iy3-ch+u2:锤子/1.4149", fontsize = 14];
151 [label = "151", shape = circle, style = solid, fontsize = 14]
	151 -> 16 [label = "iy3-d+e1:<eps>/-4.7684e-07", fontsize = 14];
152 [label = "152", shape = circle, style = solid, fontsize = 14]
	152 -> 17 [label = "iy3-iii+i2:<eps>", fontsize = 14];
153 [label = "153", shape = circle, style = solid, fontsize = 14]
	153 -> 18 [label = "iy3-iuu+u3:<eps>", fontsize = 14];
154 [label = "154", shape = circle, style = solid, fontsize = 14]
	154 -> 19 [label = "iy3-j+i3:<eps>", fontsize = 14];
155 [label = "155", shape = circle, style = solid, fontsize = 14]
	155 -> 20 [label = "iy3-l+e1:<eps>/-2.3842e-06", fontsize = 14];
156 [label = "156", shape = circle, style = solid, fontsize = 14]
	156 -> 21 [label = "iy3-n+i3:<eps>/-4.7684e-07", fontsize = 14];
157 [label = "157", shape = circle, style = solid, fontsize = 14]
	157 -> 22 [label = "iy3-p+i2:<eps>", fontsize = 14];
158 [label = "158", shape = circle, style = solid, fontsize = 14]
	158 -> 23 [label = "iy3-sh+ix2:石头/0.38018", fontsize = 14];
	158 -> 24 [label = "iy3-sh+ix4:是/1.147", fontsize = 14];
159 [label = "159", shape = circle, style = solid, fontsize = 14]
	159 -> 13 [label = "nn-b+u4:<eps>/7.1526e-07", fontsize = 14];
160 [label = "160", shape = circle, style = solid, fontsize = 14]
	160 -> 14 [label = "nn-ch+u1:出/0.27762", fontsize = 14];
	160 -> 15 [label = "nn-ch+u2:锤子/1.4149", fontsize = 14];
161 [label = "161", shape = circle, style = solid, fontsize = 14]
	161 -> 16 [label = "nn-d+e1:<eps>/-4.7684e-07", fontsize = 14];
162 [label = "162", shape = circle, style = solid, fontsize = 14]
	162 -> 17 [label = "nn-iii+i2:<eps>", fontsize = 14];
163 [label = "163", shape = circle, style = solid, fontsize = 14]
	163 -> 18 [label = "nn-iuu+u3:<eps>", fontsize = 14];
164 [label = "164", shape = circle, style = solid, fontsize = 14]
	164 -> 19 [label = "nn-j+i3:<eps>", fontsize = 14];
165 [label = "165", shape = circle, style = solid, fontsize = 14]
	165 -> 20 [label = "nn-l+e1:<eps>/-2.3842e-06", fontsize = 14];
166 [label = "166", shape = circle, style = solid, fontsize = 14]
	166 -> 21 [label = "nn-n+i3:<eps>/-4.7684e-07", fontsize = 14];
167 [label = "167", shape = circle, style = solid, fontsize = 14]
	167 -> 172 [label = "nn-p+i2:<eps>", fontsize = 14];
168 [label = "168", shape = circle, style = solid, fontsize = 14]
	168 -> 23 [label = "nn-sh+ix2:石头/0.38018", fontsize = 14];
	168 -> 24 [label = "nn-sh+ix4:是/1.147", fontsize = 14];
169 [label = "169", shape = circle, style = solid, fontsize = 14]
	169 -> 173 [label = "aa1-uu1+b:布/3.7839", fontsize = 14];
	169 -> 174 [label = "aa1-uu1+ch:<eps>/2.369", fontsize = 14];
	169 -> 175 [label = "aa1-uu1+d:的/3.3838", fontsize = 14];
	169 -> 176 [label = "aa1-uu1+iii:赢/2.7304", fontsize = 14];
	169 -> 177 [label = "aa1-uu1+iuu:<eps>/2.3348", fontsize = 14];
	169 -> 178 [label = "aa1-uu1+j:剪刀/2.5605", fontsize = 14];
	169 -> 179 [label = "aa1-uu1+l:了/3.3777", fontsize = 14];
	169 -> 180 [label = "aa1-uu1+n:你/2.6594", fontsize = 14];
	169 -> 181 [label = "aa1-uu1+p:平/3.7561", fontsize = 14];
	169 -> 182 [label = "aa1-uu1+sh:<eps>/2.1813", fontsize = 14];
	169 -> 1 [label = "aa1-uu1:sil/1.6071", fontsize = 14];
	169 -> 2 [label = "aa1-uu1:sp/1.6071", fontsize = 14];
170 [label = "170", shape = circle, style = solid, fontsize = 14]
	170 -> 137 [label = "at2-uu2+b:布/3.7838", fontsize = 14];
	170 -> 138 [label = "at2-uu2+ch:<eps>/2.3689", fontsize = 14];
	170 -> 139 [label = "at2-uu2+d:的/3.3847", fontsize = 14];
	170 -> 140 [label = "at2-uu2+iii:赢/2.7303", fontsize = 14];
	170 -> 141 [label = "at2-uu2+iuu:<eps>/2.3347", fontsize = 14];
	170 -> 142 [label = "at2-uu2+j:剪刀/2.5614", fontsize = 14];
	170 -> 143 [label = "at2-uu2+l:了/3.3776", fontsize = 14];
	170 -> 144 [label = "at2-uu2+n:你/2.6593", fontsize = 14];
	170 -> 145 [label = "at2-uu2+p:平/3.756", fontsize = 14];
	170 -> 146 [label = "at2-uu2+sh:<eps>/2.1812", fontsize = 14];
	170 -> 1 [label = "at2-uu2:sil/1.607", fontsize = 14];
	170 -> 2 [label = "at2-uu2:sp/1.607", fontsize = 14];
171 [label = "171", shape = circle, style = solid, fontsize = 14]
	171 -> 183 [label = "d-aa1+uu1:<eps>/-9.5367e-07", fontsize = 14];
172 [label = "172", shape = circle, style = solid, fontsize = 14]
	172 -> 184 [label = "p-i2+ng:<eps>/4.7684e-07", fontsize = 14];
173 [label = "173", shape = circle, style = solid, fontsize = 14]
	173 -> 13 [label = "uu1-b+u4:<eps>/7.1526e-07", fontsize = 14];
174 [label = "174", shape = circle, style = solid, fontsize = 14]
	174 -> 14 [label = "uu1-ch+u1:出/0.27762", fontsize = 14];
	174 -> 15 [label = "uu1-ch+u2:锤子/1.4149", fontsize = 14];
175 [label = "175", shape = circle, style = solid, fontsize = 14]
	175 -> 16 [label = "uu1-d+e1:<eps>/-4.7684e-07", fontsize = 14];
176 [label = "176", shape = circle, style = solid, fontsize = 14]
	176 -> 17 [label = "uu1-iii+i2:<eps>", fontsize = 14];
177 [label = "177", shape = circle, style = solid, fontsize = 14]
	177 -> 18 [label = "uu1-iuu+u3:<eps>", fontsize = 14];
178 [label = "178", shape = circle, style = solid, fontsize = 14]
	178 -> 19 [label = "uu1-j+i3:<eps>", fontsize = 14];
179 [label = "179", shape = circle, style = solid, fontsize = 14]
	179 -> 20 [label = "uu1-l+e1:<eps>/-2.3842e-06", fontsize = 14];
180 [label = "180", shape = circle, style = solid, fontsize = 14]
	180 -> 21 [label = "uu1-n+i3:<eps>/-4.7684e-07", fontsize = 14];
181 [label = "181", shape = circle, style = solid, fontsize = 14]
	181 -> 22 [label = "uu1-p+i2:<eps>", fontsize = 14];
182 [label = "182", shape = circle, style = solid, fontsize = 14]
	182 -> 23 [label = "uu1-sh+ix2:石头/0.38018", fontsize = 14];
	182 -> 24 [label = "uu1-sh+ix4:是/1.147", fontsize = 14];
183 [label = "183", shape = circle, style = solid, fontsize = 14]
	183 -> 173 [label = "aa1-uu1+b:布/3.784", fontsize = 14];
	183 -> 174 [label = "aa1-uu1+ch:<eps>/2.3691", fontsize = 14];
	183 -> 175 [label = "aa1-uu1+d:的/3.3839", fontsize = 14];
	183 -> 176 [label = "aa1-uu1+iii:赢/2.7305", fontsize = 14];
	183 -> 177 [label = "aa1-uu1+iuu:<eps>/2.3349", fontsize = 14];
	183 -> 178 [label = "aa1-uu1+j:剪刀/2.5607", fontsize = 14];
	183 -> 179 [label = "aa1-uu1+l:了/3.3779", fontsize = 14];
	183 -> 180 [label = "aa1-uu1+n:你/2.6595", fontsize = 14];
	183 -> 181 [label = "aa1-uu1+p:平/3.7562", fontsize = 14];
	183 -> 182 [label = "aa1-uu1+sh:<eps>/2.1805", fontsize = 14];
	183 -> 1 [label = "aa1-uu1:sil/1.6072", fontsize = 14];
	183 -> 2 [label = "aa1-uu1:sp/1.6072", fontsize = 14];
184 [label = "184", shape = circle, style = solid, fontsize = 14]
	184 -> 86 [label = "i2-ng+b:布/4.0532", fontsize = 14];
	184 -> 87 [label = "i2-ng+ch:<eps>/2.6384", fontsize = 14];
	184 -> 88 [label = "i2-ng+d:的/3.6541", fontsize = 14];
	184 -> 89 [label = "i2-ng+iii:赢/2.9997", fontsize = 14];
	184 -> 90 [label = "i2-ng+iuu:<eps>/2.6041", fontsize = 14];
	184 -> 91 [label = "i2-ng+j:剪刀/2.8309", fontsize = 14];
	184 -> 112 [label = "i2-ng+l:了/1.3115", fontsize = 14];
	184 -> 93 [label = "i2-ng+n:你/2.9288", fontsize = 14];
	184 -> 94 [label = "i2-ng+p:平/4.0254", fontsize = 14];
	184 -> 95 [label = "i2-ng+sh:<eps>/2.4507", fontsize = 14];
	184 -> 1 [label = "i2-ng:sil/1.8764", fontsize = 14];
	184 -> 2 [label = "i2-ng:sp/1.8764", fontsize = 14];
}
