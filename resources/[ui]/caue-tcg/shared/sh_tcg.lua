
This site has been acquired by Toptal
(Attention! API endpoint has changed)
Save New Duplicate & Edit Just Text1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
293
294
295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
319
320
321
322
323
324
325
326
TCG = {}

TCG.Cards = {
    ["playboicarti"] = {
        name = "Playboi Carti",
        description = "She my best friend yeah we not a couple",
        image = "https://i.imgur.com/8YJz7yA.png",
    },
    ["kanyewest"] = {
        name = "Kanye West",
        description = "Today I thought about killing you, premeditated murder",
        image = "https://i.imgur.com/jmjqSXW.png",
    },
    ["ghostfacekillah"] = {
        name = "Ghostface Killah",
        description = "Sometimes I look up at the stars and analyze the sky and ask myself was I meant to be here... why?",
        image = "https://i.imgur.com/K2FrQJu.png",
    },
    ["nlechoppa"] = {
        name = "NLE Choppa",
        description = "I am a menace keep me a rack just like tennis",
        image = "https://i.imgur.com/rY6diby.png",
    },
    ["lilnasx"] = {
        name = "Lil Nax X",
        description = "I got hos on hoes and they out of control",
        image = "https://i.imgur.com/ir9x26b.png",
    },
    ["asaprocky"] = {
        name = "A$AP Rocky",
        description = "I praise the Lord then break the law",
        image = "https://i.imgur.com/ZnI21yE.png",
    },
    ["bhadbabie"] = {
        name = "Bhad Bhabie",
        description = "I just do not care what people have to say",
        image = "https://i.imgur.com/pOAsnGQ.png",
    },
    ["cardib"] = {
        name = "Cardi B",
        description = "Knock me down 9 times but i get up 10",
        image = "https://i.imgur.com/hBWBDzz.png",
    },
    ["childishgambino"] = {
        name = "Childish Gambino",
        description = "Being happy is the goal but greatness is my vision",
        image = "https://i.imgur.com/biuSXNW.png",
    },
    ["dababy"] = {
        name = "DaBaby",
        description = "Anything i do i am doing it for a reason",
        image = "https://i.imgur.com/FfHyq3j.png",
    },
    ["desiigner"] = {
        name = "Desiigner",
        description = "The biggest challenge for me is just knowing how to calm down",
        image = "https://i.imgur.com/w9IuHol.png",
    },
    ["dojacat"] = {
        name = "Doja Cat",
        description = "I really pull from everyone i am absorbent",
        image = "https://i.imgur.com/QKPdSb1.png",
    },
    ["drake"] = {
        name = "Drake",
        description = "Everybody has an addiction mine happens to be success",
        image = "https://i.imgur.com/pIJRKj9.png",
    },
    ["fettywap"] = {
        name = "Fetty Wap",
        description = "This is something you should know i do not ever chase no hoes",
        image = "https://i.imgur.com/OFV6CqY.png",
    },
    ["future"] = {
        name = "Future",
        description = "I know i have not always done things the right way",
        image = "https://i.imgur.com/oTHZGT3.png",
    },
    ["juicewrld"] = {
        name = "Juice Wrld",
        description = "You found another one but i am the better one",
        image = "https://i.imgur.com/0ubR8oW.png",
    },
    ["kayflock"] = {
        name = "Kay Flock",
        description = "Like every opp shot nigga",
        image = "https://i.imgur.com/ixaCNUn.png",
    },
    ["kendricklamar"] = {
        name = "Kendrick Lamar",
        description = "Live your life live it right",
        image = "https://i.imgur.com/xUNYlUk.png",
    },
    ["kodakblack"] = {
        name = "Kodak Black",
        description = "Adults think it is disrespectful when you do not let them disrespect you",
        image = "https://i.imgur.com/pkszDPt.png",
    },
    ["lildurk"] = {
        name = "Lil Durk",
        description = "You aint get back for your mans you in the club like he aint dead",
        image = "https://i.imgur.com/0sZK1YN.png",
    },
    ["lilloaded"] = {
        name = "Lil Loaded",
        description = "Keep me on the block block baby block.",
        image = "https://i.imgur.com/uSHSrjn.png",
    },
    ["lilpeep"] = {
        name = "Lil Peep",
        description = "She said i am a crybaby i can not be up lately",
        image = "https://i.imgur.com/mVQMiFu.png",
    },
    ["lilpump"] = {
        name = "Lil Pump",
        description = "Spend three racks on a new chain",
        image = "https://i.imgur.com/z5RnEnW.png",
    },
    ["liluzivert"] = {
        name = "Lil Uzi Vert",
        description = "I am just doing me and to me that is what got me this far",
        image = "https://i.imgur.com/US0UzTn.png",
    },
    ["lilwayne"] = {
        name = "Lil Wayne",
        description = "Love me or hate me i swear it will not make or break me",
        image = "https://i.imgur.com/pIONqTL.png",
    },
    ["macmiller"] = {
        name = "Mac Miller",
        description = "They are gonna try to tell you no, shatter all your dreams",
        image = "https://i.imgur.com/qEATNdb.png",
    },
    ["metroboomin"] = {
        name = "Metro Boomin",
        description = "Big white mansion my habitat",
        image = "https://i.imgur.com/vEFqmyX.png",
    },
    ["nbayoungboy"] = {
        name = "NBA YoungBoy",
        description = "O block pack get rolled up",
        image = "https://i.imgur.com/4XcjEPi.png",
    },
    ["nickiminaj"] = {
        name = "Nicki Minaj",
        description = "Stay in school",
        image = "https://i.imgur.com/hMfxqKx.png",
    },
    ["offset"] = {
        name = "Offset",
        description = "You can never forget God",
        image = "https://i.imgur.com/vx1R3Uq.png",
    },
    ["postmalone"] = {
        name = "Post Malone",
        description = "Me and kurt feel the same too much pleasure is pain",
        image = "https://i.imgur.com/UfSWQ46.png",
    },
    ["pushat"] = {
        name = "Pusha T",
        description = "Pain is joy when it cries, it is my smile in disguise.",
        image = "https://i.imgur.com/1aRYVYU.png",
    },
    ["rickross"] = {
        name = "Rick Ross",
        description = "Every day is a new opportunity to reach that goal",
        image = "https://i.imgur.com/0lDS49E.png",
    },
    ["roddyricch"] = {
        name = "Roddy Ricch",
        description = "I do not follow nobody path i did it my own way",
        image = "https://i.imgur.com/IWpqUmX.png",
    },
    ["21savage"] = {
        name = "21 Savage",
        description = "Never stop hustling",
        image = "https://i.imgur.com/H0ONNGz.png",
    },
    ["snoopdogg"] = {
        name = "Snoop Dogg",
        description = "If the ride is more fly then you must buy",
        image = "https://i.imgur.com/lCaG44J.png",
    },
    ["travisscott"] = {
        name = "Travis Scott",
        description = "Who left her hometown world all for that alley",
        image = "https://i.imgur.com/iEVpzEc.png",
    },
    ["trippered"] = {
        name = "Trippie Red",
        description = "Maybe you should wish it more",
        image = "https://i.imgur.com/VAlhRfB.png",
    },
    ["tylerthecreator"] = {
        name = "Tyler, the Creator",
        description = "I never want to grow up",
        image = "https://i.imgur.com/dOjRxJk.png",
    },
    ["wizkhalifa"] = {
        name = "Wiz Khalifa",
        description = "You do not need to many people to be happy",
        image = "https://i.imgur.com/QJQ9BTj.png",
    },
    ["xxxtentacion"] = {
        name = "XXXTentacion",
        description = "You ever seen a nigga hung with a gold chain?",
        image = "https://i.imgur.com/AfKCzkg.png",
    },
    ["ybncordae"] = {
        name = "YBN Cordae",
        description = "Do not let nobody tell you can not do whatever the fuck you put your mind too",
        image = "https://i.imgur.com/CRKyY9F.png",
    },
    ["ybnnahmir"] = {
        name = "YBN Nahmir",
        description = "I am trying to spread peac low key",
        image = "https://i.imgur.com/bNEKgce.png",
    },
    ["ynwmelly"] = {
        name = "YNW Melly",
        description = "I wake up in the morning i got murder on my mind",
        image = "https://i.imgur.com/yZoyeNX.png",
    },
    ["youngthug"] = {
        name = "Young Thug",
        description = "First you get that money then you get that power",
        image = "https://i.imgur.com/kKzmZ74.png",
    },
    ["50cent"] = {
        name = "50 Cent",
        description = "Wise men listen and laugh, while fools tak",
        image = "https://i.imgur.com/OohG2dz.png",
    },
    ["biddaddykane"] = {
        name = "Big Daddy Kane",
        description = "if you are what you eat then feed me dope",
        image = "https://i.imgur.com/bHXj4NM.png",
    },
    ["dmx"] = {
        name = "DMX",
        description = "Every day i get closer to God",
        image = "https://i.imgur.com/by8hH90.png",
    },
    ["drdre"] = {
        name = "Dr. Dre",
        description = "Still D.R.E",
        image = "https://i.imgur.com/dOTZfWX.png",
    },
    ["eazye"] = {
        name = "Eazy-E",
        description = "The boys in the hood are always hard",
        image = "https://i.imgur.com/Xx1piQJ.png",
    },
    ["eminem"] = {
        name = "Eminem",
        description = "A lot of my rhymes are just to get chuckles out of people",
        image = "https://i.imgur.com/0Y2TveX.png",
    },
    ["icecube"] = {
        name = "Ice Cube",
        description = "I think, to me, reality is better than being fake",
        image = "https://i.imgur.com/mppyvzh.png",
    },
    ["jayz"] = {
        name = "Jay Z",
        description = "Only God can judge me so i am gone, either love me or leave me alone",
        image = "https://i.imgur.com/Su1niBX.png",
    },
}

TCG.Packs = {
    ["tcgtestpack"] = {
        "playboicarti",
        "kanyewest",
        "ghostfacekillah",
        "nlechoppa",
        "lilnasx",
        "asaprocky",
        "bhadbabie",
        "cardib",
        "childishgambino",
        "dababy",
        "desiigner",
        "dojacat",
        "drake",
        "fettywap",
        "future",
        "juicewrld",
        "kayflock",
        "kendricklamar",
        "kodakblack",
        "lildurk",
        "lilloaded",
        "lilpeep",
        "lilpump",
        "liluzivert",
        "lilwayne",
        "macmiller",
        "nbayoungboy",
        "nickiminaj",
        "offset",
        "postmalone",
        "pushat",
        "rickross",
        "roddyricch",
        "21savage",
        "snoopdogg",
        "travisscott",
        "trippered",
        "tylerthecreator",
        "wizkhalifa",
        "xxxtentacion",
        "ybncordae",
        "ybnnahmir",
        "ynwmelly",
        "youngthug",
        "50cent",
        "biddaddykane",
        "dmx",
        "drdre",
        "eazye",
        "eminem",
        "icecube",
        "jayz",
    },
}