-- CBI Prayers
--copyright 2015-2016 Austin Lubetkin
supportedOrientations(LANDSCAPE_ANY)
displayMode(FULLSCREEN_NO_BUTTONS)
-- Use this function to perform your initial setup
function setup()
    trans = {255}
    recording = false
    tween(8,trans,{0})
    speech.rate = .3
    hasslid = true
    touch = vec2(0,0)
    location.enable()
    helpending = true
    calendarchecktwo = true
    helpspeak = false
    helping = false
    helpcheck = true
    calendarcheck = true
    touchtemp = vec2(WIDTH,0)
    if readLocalData("weekstart") ~= os.date("*t")["day"]-(os.date("*t")["wday"]) then
        clearLocalData()
        saveLocalData("weekstart",os.date("*t")["day"]-(os.date("*t")["wday"]))
    end
    calendarout = false
    saveLocalData("date",os.date("*t")["wday"])
    font("Baskerville")
    prayerlengths = {13,37,43,22,16+41+2,28+62,51,86}
    xw = WIDTH/1024
    position = vec3(0,WIDTH/4,0)
    menuout = true
    prayers = {"שְׁמַע", "יִשְׂרָאֵל,"," יְיָ", "אֱלֹהֵינוּ,"," יְיָ"," אֶחָֽד:,","בָּרוּךְ", "שֵׁם"," כְּבוֹד", "מַלְכוּתוֹ ","לְעוֹלָם", "וָעֶד.","וְאָהַבְתָּ","אֵת","יְיָ","אֱלֹהֶיךָ," ,"בְּכָל-לְבָֽבְךָ, ","וּבְכָל-נַפְשְׁךָ,","וּבְכָל-מְאֹדֶֽךָ.","וְהָיוּ", "הַדְּבָרִים","הָאֵלֶּה,", "אֲשֶׁר", "אָֽנֹכִי", "מְצַוְּךָ", "הַיּוֹם,", "עַל-לְבָבֶֽךָ:"," וְשִׁנַּנְתָּם","לְבָנֶיךָ,"," וְדִבַּרְתָּ"," בָּם"," בְּשִׁבְתְּךָ"," בְּבֵיתֶךָ,"," וּבְלֶכְתְּךָ"," בַדֶּרֶךְ"," וּֽבְשָׁכְבְּךָ,"," וּבְקוּמֶֽךָ."," וּקְשַׁרְתָּם"," לְאוֹת"," עַל-יָדֶךָ,"," וְהָיוּ"," לְטֹטָפֹת"," בֵּין ","עֵינֶֽיךָ,"," וּכְתַבְתָּם"," עַל"," מְזֻזֹת"," בֵּיתֶךָ","וּבִשְׁעָרֶֽיךָ:","","בָּרוּךְ"," אַתָּה"," יְיָ","      אֱלֹהֵֽינוּ ","וֵאלֹהֵי","   אֲבוֹתֵֽינוּ ","וְאִמוֹתֵינוּ,"," אֱלֹהֵי","     אַבְרָהָם, ","אֱלֹהֵי"," יִצְחָק,"," וֵאלֹהֵי ","יַעֲקֹב, ","אֱלֹהֵי"," שָׂרָה,"," אֱלֹהֵי","   רִבְקָה,"," אֱלֹהֵי","  רָחֵל","       וֵאלֹהֵי"," לֵאָה.","   הָאֵל","     הַגָּדוֹל"," הַגִּבּוֹר"," וְהַנּוֹרָא,     "," אֵל","       עֶלְיוֹן,"," גּוֹמֵל","     חֲסָדִים","      טוֹבִים,"," וְקוֹנֵה"," הַכֹּל, ","וְזוֹכֵר"," חַסְדֵי"," אָבוֹת  ","        וְאִמָּהוֹת,"," וּמֵבִיא"," גְּאֻלָּה"," לִבְנֵי"," בְנֵיהֶם"," לְמַעַן"," שְׁמוֹ", "       בְּאַהֲבָה.","לְמַעַן"," תִּזְכְּרוּ          "," וַעֲשִׂיתֶם","            אֶת-כָּל-מִצְוֹתָי,"," וִהְיִיתֶם","     קְדֹשִים","           לֵאלֹֽהֵיכֶֽם: "," אֲנִי ","יְיָ","                 אֱלֹֽהֵיכֶם",",   אֲשֶׁר","     הוֹצֵאתִי"," אֶתְכֶם"," מֵאֶֽרֶץ ","מִצְרַיִם, ","לִהְיוֹת ","      לָכֶם","           לֵֽאלֹהִים,"," אֲנִי"," יְיָ ","      אֱלֹֽהֵיכֶם.","אֱמֶת","אַתָּה"," גִּבּוֹר"," לְעוֹלָם"," אֲדֹנָי,"," מְחַיֵּה ","הַכֹּל ","(מֵתִים)"," אַתָּה, ","רַב","         לְהוֹשִֽׁיעַ.","מַשִּׁיב"," הָרֽוּחַ"," וּמוֹרִיד"," הַגֶּֽשֶׁם.","מוֹרִיד"," הַטַּל.","מְכַלְכֵּל"," חַיִּים ","בְּחֶֽסֶד, ","מְחַיֵּה ","הַכֹּל ","(מֵתִים) ","בְּרַחֲמִים ","רַבִּים,"," סוֹמֵךְ ","נוֹפְלִים,"," וְרוֹפֵא ","חוֹלִים,"," וּמַתִּיר ","אֲסוּרִים, ","וּמְקַיֵּם ","אֱמוּנָתוֹ ","לִישֵׁנֵי ","עָפָר,"," מִי ","     כָמֽוֹךָ"," בַּֽעַל ","גְּבוּרוֹת"," וּמִי ","דּֽוֹמֶה"," לָּךְ, ","מֶֽלֶךְ"," מֵמִית"," וּמְחַיֶּה"," וּמַצְמִֽיחַ"," יְשׁוּעָה. ","וְנֶאֱמָן ","אַתָּה"," לְהַחֲיוֹת"," הַכֹּל"," (מֵתִים)."," בָּרוּךְ"," אַתָּה,"," יְיָ, ","מְחַיֵּה ","הַכֹּל"," (הַמֵּתִים).","בָּרוּךְ"," אַתָּה"," יְיָ ","אֱלֹהֵֽינוּ ","מֶֽלֶךְ"," הָעוֹלָם,"," אֲשֶׁר"," בָּחַר"," בִּנְבִיאִים"," טוֹבִים,"," וְרָצָה","   בְדִבְרֵיהֶם ","הַנֶאֱמָרִים"," בֶּאֱמֶת,"," בָּרוּךְ"," אַתָּה"," יְיָ, ","הַבּוֹחֵר"," בַּתּוֹרָה"," וּבְמֹשֶׁה"," עַבְדּוֹ,"," וּבְיִשְׂרָאֵל ","עַמּוֹ,"," וּבִנְבִיאֵי ","הָאֱמֶת"," וָצֶֽדֶק.","בָּרוּךְ ","אַתָּה ","יְיָ"," אֱלֹהֵֽינוּ ","מֶֽלֶךְ ","הָעוֹלָם, ","צוּר"," כָּל ","הָעוֹלָמִים,"," צַדִּיק"," בְּכָל"," הַדּוֹרוֹת, ","הָאֵל"," הַנֶּאֱמָן"," הָאוֹמֵר"," וְעֹשֶׂה, ","הַמְדַבֵּר"," וּמְקַיֵּם,"," שֶׁכָּל"," דְּבָרָיו"," אֶמֶת"," וָצֶֽדֶק."," עַל"," הַתּוֹרָה,"," וְעַל"," הָעֲבוֹדָה,"," וְעַל ","      הַנְּבִיאִים,"," וְעַל"," יוֹם"," הַשַּׁבָּת"," הַזֶּה,"," שֶׁנָתַֽתָּ"," לָֽנוּ ","יְיָ"," אֱלֹהֵינוּ, ","לִקְדֻשָּׁה"," וְלִמְנוּחָה,"," לְכָבוֹד ","      וּלְתִפְאַָֽרֶת."," עַל"," הַכֹּל ","יְיָ"," אֱלֹהֵֽינוּ,"," אֲנַֽחְנוּ ","מוֹדִים"," לָךְ, ","וּמְבָרְכִים ","אוֹתָךְ,"," יִתְבָּרַךְ"," שִׁמְךָ ","בְּפִי"," כָּל"," חַי"," תָּמִיד"," לְעוֹלָם ","וָעֶד."," בָּרוּךְ"," אַתָּה ","יְיָ, ","מְקַדֵּשׁ"," הַשַּׁבָּת ","בָּרְכוּ ","אֶת ","יְיָ"," הַמְּבוֹרָךְ: ","בָּרוּךְ ","יְיָ"," הַמְּבוֹרָךְ ","לְעוֹלָם ","וָעֶד:"," בָּרוּךְ ","אַתָּה"," יְיָ ","אֱלֹהֵֽינוּ ","מֶֽלֶךְ"," הָעוֹלָם,"," אֲשֶׁר"," בָּֽחַר ","בָּֽנוּ ","מִכָּל ","הָעַמִים"," וְנָֽתַן"," לָֽנוּ"," אֶת"," תּוֹרָתוֹ:"," בָּרוּךְ"," אַתָּה"," יְיָ,"," נוֹתֵן","     הַתּוֹרָה:","בָּרוּךְ"," אַתָּה"," יְיָ"," אֱלֹהֵֽינוּ ","מֶֽלֶךְ ","הָעוֹלָם,"," אֲשֶׁר"," נָֽתַן"," לָֽנוּ ","תּוֹרַת ","אֱמֶת,"," וְחַיֵּי"," עוֹלָם"," נָטַע"," בְּתוֹכֵֽנוּ:"," בָּרוּךְ"," אַתָּה"," יְיָ,"," נוֹתֵן ","הַתּוֹרָה:","נְקַדֵּשׁ"," אֶת ","שִׁמְךָ ","בָּעוֹלָם, ","כְּשֵׁם ","  שֶׁמַּקְדִּישִׁים ","אוֹתוֹ ","בִּשְׁמֵי ","מָרוֹם, ","כַּכָּתוּב ","עַל ","יַד ","נְבִיאֶֽךָ,"," וְקָרָא ","זֶה ","אֶל ","זֶה"," וְאָמַר:  ","   קָדוֹשׁ ","    קָדוֹשׁ"," קָדוֹשׁ"," יְיָ"," צְבָאוֹת,  ","    מְלֹא"," כָל"," הָאָֽרֶץ ","כְּבוֹדוֹ.","אַדִּיר"," אַדִּירֵנוּ ","יְיָ ","אַדֹנֵינוּ ","מָה","אַדִּיר    ","   שִׁמְךָ"," בְּכָל ","הָאָרֶץ!","בָּרוּךְ"," כְּבוֹד ","יְיָ, ","מִמְּקוֹמוֹ.","אֶחָד"," הוּא"," אֱלֹהֵינוּ,"," הוּא"," אָבִינוּ, ","הוּא"," מַלכֵּנוּ, ","הוּא ","מוֹשִׁיעֵנוּ"," וְהוּא ","יַשְׁמִיעֵנוּ"," בְּרַחֲמָיו ","לְעֵינֵי ","כָּל"," חָי","אֲנִי"," יְיָ"," אֱלֹהֵיכֶם!","יִמְלֹךְ"," יְיָ ","לְעוֹלָם, ","אֱלֹהַֽיִךְ ","צִיּוֹן ","לְדֹר ","וָדֹר,"," הַלְלוּיָהּ.","לְדוֹר"," וָדוֹר"," נַגִּיד"," גָּדְלֶֽךָ ","וּלְנֵֽצַח ","נְצָחִים"," קְדֻשָּׁתְךָ"," נַקְדִּישׁ,"," וְשִׁבְחֲךָ ","אֱלֹהֵֽינוּ ","מִפִּֽינוּ ","לֹא ","יָמוּשׁ ","לְעוֹלָם"," וָעֶד."," בָּרוּךְ ","אַתָּה"," יְיָ,"," הָאֵל ","הַקָּדוֹשׁ."}
    table.remove(prayers,50)
    prayerstrans = {"shma","yis rai ell","adon eye","ell oh hey new","adon eye","yeh hud","bah roosh", "shame", "kuhv ode", "mahl who toe", "leh oh lahm","va edd","vee uh hawv tuh", "ate", "adon eye", "ell low heh hah","beh hall liv vah veh hah","ew veh hall nahf sheh hah","ew veh hall may oh deh hah","veh hi you","hahd vahr ream","hah aih leh","ah sher","ah no he","mitz awe veh hah","hah yh ohm","all liv vah veh hah", "vih she non tom","liv ah neh hah","vih dee bar tauh","bom","bih sheev teh hah","beh vey teh hah","oov leck teh hah","vauh dare wreck","oov shoke beh hah","oov koo meh hah","ook shar tom","leh oat","all yauh deh hah","veh hi you","leh tote tahf oat","bane","aih neh ha","ook tahv tom", "all","miz zoo zote","bay teh hah","ooh vee sha reh hah","bah roosh","ah ta","adon eye","ell oh hey new","vell oh hey","ah vote tain new","vih emo tain new","ell oh hey","ah  vrah hahm","ell oh hey","yitz chalk","vell oh hey", "yah ah cove","ell oh hey","sah rah","ell oh hey", "rihv kah","ell oh hey","rah chell","vell oh hey","lay ah","hah ail","hah ghah dole","hah ghi bore","veh han nore rah","ell","ell yah own","go mail","ha sah deem","toe veem","veh cone nay","hah coal","vez owe chayer","hass day","a vote","vih eem mauh hote", "ooh may vee","gheh who lah","liv nay","veh nay hem","leh mauh aun","she moe","beh ah hah vuh","leh mauh aun","tiss ka rue","veh ah see tehm","et coal mihtz vote tai","vih yi tehm","keh doe sheem","leh ell low hey hem","ah knee","adon eye","ell hey hem","ah share","hoet zay tea","et chehm","may eir rehtz","mitz ray yeem","lih yoat","lah hem","leh ell oh heem","ah knee","adon eye","ell low hey hem","heh met","ah tah","ghi bore","leh oh lahm","adon eye","mih hah yay","hah coal","may team","ah tah","rahv","leh hoe sea ah","mah sheev","hah rue auch","oom more reed","hah ghah shem","more reed","hah tahll","mih hah kale","hah yeem","beh hess sed","mik hah yay","hah coal","may team","bah rah hah meem","rah beem","sow meich","know fleem","veh row fay","whole leem","oommah tear","uss sir ream","oom kah yeem","emmoon nah toe","lish ain nay","afar","me","hah moe hah","bah ahl","give rue wrote","ooh me","doe meh","loch","mehl lech","may meet","oom hah yay","oom matz me och","yeh shoe hah","veh neh heh maun","ah tah","leh hah chah yote","hah coal","may team","bah roosh","ah tah","adon eye","mih hah yay","hah coal","hah may team","bah roosh","ah tah","adon eye","ell oh hey new","mehl lech","hah oh lahm","ah share","bah har","bihn vee eam","toe veem","vih raht zah","vih deev ray hem","hah neh em mahr ream","beh em met","bah roosh","ah tah","adon eye","hah boe share","bah tore rah","oov moe sheh","ov dough","oov yis ray ell","ah moe","oov vihn vih ey","hah heh met","vaht zehd deck","bah roosh","ah tah","adon eye","ell low hey new","mehl lech","hah owe lahm","tzur","coal","hah owe lah meem","tzah deek","beh whole","hah doe wrote","hah ail","hah neh heh mohn","hah owe merr","veh owe seh","hom dah beer","oom kah yeem","sheh coal","deh vaur rahv","emmet","vaht zehd deck","all","hah tore rah","veh all","hah ov ode day","veh all","han vee eem","veh all","yoem","hah shah baht","hah zeh","sheh nah tah tah","law new","adon eye","ell oh hey new","leek do shah","veh leem new hah","leh hah vode","ool tea far reht","all"," hah coal","adon eye","ell oh hey new","ah nach new","moe deem","lach","oom var heem","ote tah","yiht bar rach","sheem hah","beh fee","coal","hi","tah meed","leh oh lahm","vah ehd","bah roosh","ah tah","adon eye","mick kah daysh","hah shah baht","bar who","et","adon eye","haum vore rah","bah roosh","adon eye","haum vore rah","leh owe lahm","vauh ed","bah roosh","auh tah","adon eye","ell low hey new","mehl lech","hah owe laum","auh share","bah har","bah new","mee koal","hauh auh meem","veh nauh taun","law new","et","tore rauh toe","bah roosh","auh tah","adon eye","no tain","hauh tore rah","bah roosh","auh tah","adon eye","ell low hey new","mehl lech","hah owe laum","auh share","nah taun"," lawn new","tore rauht","em met","vih hah yay","owe laum","not tah","beh toe hey new","bah roosh","auh tah","adon eye","note tain","hah tore rah","neck kah daysh","et","she mah hah","bah owe lum","keh shame","sheh mach dee sheem","owe toe","beesh may","mah rome","kah kah toove","all","yod","nih vee eh kah","vih kah rah","zeh","ell","zeh","vih ah mar","kah doesh","kah doesh","kah doesh","adon eye","tiz vah oat","mih low","shoal","hah are retz","kih voe dough","a deer","a deer rain new","adon eye","adon nay new","mah","a deer","sheem hah","bih whole","hah are retz","bah roosh","kih vode","adon eye","meme koe moe","eck hud","who","ell low hey new","who","a vee new","who mall kay new","who","moe shay new","vih who","yash me seen new","bih rah hah mih vah","lih ane nay","coal","hey","a knee","adon eye","ell low hey hem","yeem loke","adon eye","lih owe lom","ell low hey yeesh","tiz zee own","lih door","vah door","hah lih you yah","lih door","vih door","nah geed","god leh hah","ool nay zak","nih zah heem","kih do shot hah","knock deesh","vih sheev hah hah","ell low hey new","me pee new","low","yah moosh","lih owe lahm","vah ed","bah roosh","ah tah","adon eye","hah ail", "hah kah doush"}
    prayerspos = {vec2(WIDTH*7/8,5*HEIGHT/8),vec2(24*WIDTH/32,5*HEIGHT/8),vec2(21*WIDTH/32,5*HEIGHT/8),vec2(17*WIDTH/32,5*HEIGHT/8),vec2(14*WIDTH/32,5*HEIGHT/8),vec2(11*WIDTH/32,5*HEIGHT/8),vec2(WIDTH*7/8,4*HEIGHT/8),vec2(25*WIDTH/32,HEIGHT/2),vec2(22*WIDTH/32,HEIGHT/2),vec2(18*WIDTH/32,HEIGHT/2),vec2(55*WIDTH/64,3*HEIGHT/8),vec2(23*WIDTH/32,HEIGHT/8*3),vec2(WIDTH*117/64,HEIGHT*7/8),vec2(WIDTH*55/32,HEIGHT*7/8),vec2(WIDTH*105/64,HEIGHT*7/8),vec2(WIDTH*49/32,HEIGHT*7/8),vec2(WIDTH*87/64,HEIGHT*7/8),vec2(WIDTH*117/64,HEIGHT*6/8),vec2(WIDTH*51/32,HEIGHT*6/8),vec2(WIDTH*92/64,HEIGHT*6/8),vec2(WIDTH*42/32,HEIGHT*6/8),vec2(WIDTH*75/64,HEIGHT*6/8),vec2(WIDTH*34/32,HEIGHT*6/8),vec2(WIDTH*61/32,HEIGHT*5/8),vec2(WIDTH*58/32,HEIGHT*5/8),vec2(WIDTH*109/64,HEIGHT*5/8),vec2(WIDTH*99/64,HEIGHT*5/8),vec2(WIDTH*89/64,HEIGHT*5/8),vec2(WIDTH*81/64,HEIGHT*5/8),vec2(WIDTH*74/64,HEIGHT*5/8),vec2(WIDTH*68/64,HEIGHT*5/8),vec2(WIDTH*117/64,HEIGHT/2),vec2(WIDTH*107/64,HEIGHT/2),vec2(WIDTH*98/64,HEIGHT/2),vec2(WIDTH*90/64,HEIGHT/2),vec2(WIDTH*81/64,HEIGHT/2),vec2(WIDTH*71/64,HEIGHT/2),vec2(WIDTH*117/64,HEIGHT*3/8),vec2(WIDTH*108/64,HEIGHT*3/8),vec2(WIDTH*99/64,HEIGHT*3/8),vec2(WIDTH*91/64,HEIGHT*3/8),vec2(WIDTH*83/64,HEIGHT*3/8),vec2(WIDTH*76/64,HEIGHT*3/8),vec2(WIDTH*69/64,HEIGHT*3/8),vec2(WIDTH*117/64,HEIGHT/4),vec2(WIDTH*110/64,HEIGHT*2/8),vec2(WIDTH*105/64,HEIGHT/4),vec2(WIDTH*98/64,HEIGHT/4),vec2(WIDTH*89/64,HEIGHT/4),vec2(WIDTH*79/64,HEIGHT/4)}
    for i = 13,50 do
        prayerspos[i].y = prayerspos[i].y - HEIGHT/6
    end
    totallines = 6*WIDTH
    index = 50
    
    characters = 0
    for i = 50, 92 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    linenum = 1
    posit = WIDTH*(117+64*2)/64
    for i = 50,92 do
        if posit - string.len(prayers[index])*charspace/1.2 <= WIDTH*(125+64)/64 then
            posit = WIDTH*(117+64*2)/64
            linenum = linenum + 1
        end
        -- while posit > 128 do
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/8+25)
        -- print((prayers[index]))
        posit = posit - string.len(prayers[index])*charspace/1.2
        index = index + 1
        --  end
    end
    
    
    totallines = 4*WIDTH
    index = 93
    
    characters = 0
    --print(prayers[114])
    for i = 93, 114 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    linenum = 1
    posit = WIDTH*(117+64)/64
    for i = 93,114 do
        if posit - string.len(prayers[index])*charspace/1.2 <= WIDTH*(126)/64 then
            posit = WIDTH*(117+64)/64
            linenum = linenum + 1
        end
        -- while posit > 128 do
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/8+25)
        -- print((prayers[index]))
        posit = posit - string.len(prayers[index])*charspace/1.2
        index = index + 1
        --  end
    end
    
    
    
    
    totallines = 2*WIDTH
    index = 115
    
    characters = 0
    -- print(prayers[124])
    for i = 115, 124 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    linenum = 2
    posit = WIDTH*(117+64*3)/64
    for i = 115,124 do
        if posit - string.len(prayers[index])*charspace/1.2 <= WIDTH*(126+64*2)/64 then
            posit = WIDTH*(117+64*3)/64
            linenum = linenum + 1
        end
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/16+25)
        posit = posit - string.len(prayers[index])*charspace/1.2
        index = index + 1
    end
    linenum = linenum+1
    posit = WIDTH*(117+64*3)/64
    for i = 125,128 do
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/16+25)
        posit = posit - WIDTH*7/8/6
        index = index + 1
    end
    linenum = linenum+1
    posit = WIDTH*(117+64*3)/64
    for i = 129,130 do
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/16+25)
        posit = posit - 100
        index = index + 1
    end
    
    linenum = linenum +1
    totallines = 8*WIDTH
    index = 131
    
    characters = 0
    for i = 131, 171 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    posit = WIDTH*(117+64*3)/64
    for i = 131,171 do
        if posit - string.len(prayers[index])*charspace/1.2 <= WIDTH*(124+64*2)/64 then
            posit = WIDTH*(117+64*3)/64
            linenum = linenum + 1
        end
        prayerspos[index] = vec2(posit,HEIGHT*7/8-linenum*HEIGHT/16+25)
        posit = posit - string.len(prayers[index])*charspace/1.2
        index = index + 1
    end
    
    
    
    totallines = 4*WIDTH
    index = 172
    
    characters = 0
    -- print(prayers[124])
    for i = 172, 197 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    linenum = 1
    posit = WIDTH*(117+64*5)/64
    for i = 172,197 do
        if posit - string.len(prayers[index])*charspace/1.2 <= WIDTH*(126+64*4)/64 then
            posit = WIDTH*(117+64*5)/64
            linenum = linenum + 1
        end
        -- while posit > 128 do
        prayerspos[index] = vec2(posit,HEIGHT*13/16-linenum*HEIGHT/16+25)
        -- print((prayers[index]))
        posit = posit - string.len(prayers[index])*charspace/1.2
        if string.len(prayers[index]) <= string.len(prayers[202]) then
            posit = posit - ((string.len(prayers[202])-string.len(prayers[index])))*charspace
        end
        index = index + 1
        --  end
    end
    totallines = 8*WIDTH
    index = 198
    
    characters = 0
    -- print(prayers[124])
    for i = 198, 198+61 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters
    linenum = linenum+ 1
    posit = WIDTH*(117+64*5)/64
    for i = 198,198+61 do
        if posit - string.len(prayers[index])*charspace/1 <= WIDTH*(126+64*4)/64 then
            posit = WIDTH*(118+64*5)/64
            linenum = linenum + 1
        end
        -- while posit > 128 do
        prayerspos[index] = vec2(posit,HEIGHT*13/16-linenum*HEIGHT/16+25)
        -- print((prayers[index]))
        posit = posit - string.len(prayers[index])*charspace/1.2
        if prayers[index] ~= nil then
            if string.len(prayers[index]) <= string.len(prayers[202]) then
                posit = posit - ((string.len(prayers[202])-string.len(prayers[index])))*charspace
            end
        end
        index = index + 1
        --  end
    end
    
    

    --torah blessing
    
    totallines = 6*WIDTH
    index = 198+62
    
    characters = 0
    -- print(prayers[124])
    for i = 198+62, 198+62+28+20 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters*1.1
    linenum = 1
    posit = WIDTH*(117+64*4)/64
    for i = 198+62,198+62+28 +20 do
        
        if posit - string.len(prayers[index])*charspace/1 <= WIDTH*(126+64*3)/64  or i == 198+62+29 then
            posit = WIDTH*(118+64*4)/64
            linenum = linenum + 1
            if i == 198+62+29 then
                
                linenum = linenum + 1
            end
        end
        -- while posit > 128 do
        prayerspos[index] = vec2(posit,HEIGHT*13/16-linenum*HEIGHT/16+25)
        -- print((prayers[index]))
        posit = posit - string.len(prayers[index])*charspace/1.2
        if prayers[index] ~= nil then
            if string.len(prayers[index]) <= string.len(prayers[202]) then
                posit = posit - ((string.len(prayers[202])-string.len(prayers[index])))*charspace
            end
        end
        index = index + 1
        --  end
    end
    --print(#prayers)
    totallines = 10*WIDTH
    index = 198+62+28 +21
    
    characters = 0
    -- print(prayers[124])
    for i = 198+62+28 +21, 198+62+28+21+85 do
        characters = characters + string.len(prayers[i]) + 1
    end
    charspace = totallines/characters*1.1
    linenum = 1
    posit = WIDTH*(117+64*6)/64
    for i = 198+62+28 +21,198+62+28 +21+85 do
        
        if posit - string.len(prayers[index])*charspace/1 <= WIDTH*(126+64*5)/64  or i == 198+62+29 then
            posit = WIDTH*(118+64*6)/64
            linenum = linenum + 1
        end
        prayerspos[index] = vec2(posit,HEIGHT*13/16-linenum*HEIGHT/16+25)
        posit = posit - string.len(prayers[index])*charspace/1.2
        if prayers[index] ~= nil then
            if string.len(prayers[index]) <= string.len(prayers[202]) then
                posit = posit - ((string.len(prayers[202])-string.len(prayers[index])))*charspace/1.1
            else
                prayerspos[index].x = prayerspos[index].x -30
            end
            posit = posit - 2
        end
        index = index + 1
    end
    
    
    table.insert(prayers,172,"Before")
    table.insert(prayerspos,172,vec2(WIDTH*6.25+position.x,HEIGHT*14/16-30))
    table.insert(prayerstrans,172,"before")
    table.insert(prayers,261,"Before")
    table.insert(prayerspos,261,vec2(WIDTH*5.25+position.x,HEIGHT*14/16-30))
    table.insert(prayerstrans,261,"before")
    table.insert(prayers,291,"After")
    table.insert(prayerspos,291,vec2(WIDTH*5.25+position.x,HEIGHT*9/16-30))
    table.insert(prayerstrans,291,"after")
    table.insert(prayers,198,"After")
    table.insert(prayerspos,198,vec2(WIDTH*6.93+position.x,HEIGHT*9/16-30))
    table.insert(prayerstrans,198,"after")
    table.insert(prayers,172,"☀️")
    table.insert(prayerspos,172,vec2(WIDTH*5+position.x-70,HEIGHT/2-30+HEIGHT/8))
    table.insert(prayerstrans,172,"Only read This Line in Summer")
    table.insert(prayers,172,"❄️")
    table.insert(prayerspos,172,vec2(WIDTH*5+position.x-70,HEIGHT*5/8-30+HEIGHT/16))
    table.insert(prayerstrans,172,"Only read This Line in Winter")
    table.insert(prayers,1,"❓")
    table.insert(prayerspos,1,vec2(WIDTH-30,30))
    table.insert(prayerstrans,1,"Double tap a word to see how to say it and slide the menu to see additional prayers")

    prayertitles = {"שְׁמַע","וְאָהַבְתָּ1","וְאָהַבְתָּ2","אָבוֹת וְאִמָּהוֹת","גְּבוּרוֹת","תּוֹרָה","הַתּוֹרָה","קְדֻשָּׁ"}
    prayertitletrans  = {"shma","vee uh hawv tuh part one","vee uh hawv tuh part 2","ah vote vih eem mah hote","give rue wrote","tore rah","houghf tore rah","keh do shah"}--,"tore rah blessing","hahf tore rah"}

    titletouch = false
    approaching = 0
    approachingconstant = 0.
    hidecheck = true
    --prayerprogress = {}
    prayerhiglighted = {}
    --  for i = 1, 114 do
    --table.insert(prayerprogress,false)
    --  prayerprogress[i] = false
    -- prayerhiglighted[i] = false
    --    end
    keys = {}
    i = 0
    prayersindex = {}
    prayertitlepos = {}
    --  prayertitletrans = {}
    table.insert(prayertitles,4,table.remove(prayertitles,3))
    table.insert(prayertitletrans,4,table.remove(prayertitletrans,3))
    table.insert(prayertitles,7,table.remove(prayertitles,6))
    table.insert(prayertitletrans,7,table.remove(prayertitletrans,6))
    for numprayer,title in ipairs(prayertitletrans) do
        prayersindex[numprayer] = (numprayer-1)*-WIDTH
        prayertitlepos[numprayer] = HEIGHT-3*HEIGHT/16*numprayer
        for h = 1, prayerlengths[math.tointeger(numprayer)] do
            prayerhiglighted[i+h] = false
            keys[i+h]= title..h
        end
        i = i + prayerlengths[math.tointeger(numprayer)]
    end
    table.insert(prayersindex,4,table.remove(prayersindex,3))
    table.insert(prayertitlepos,4,table.remove(prayertitlepos,3))
    table.insert(prayersindex,7,table.remove(prayersindex,6))
    table.insert(prayertitlepos,7,table.remove(prayertitlepos,6))
    --print(prayers[60])
    --print(keys[60])
    --  prayerprogress = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}
    --  print(prayers[174])
    saveLocalData(keys[173]..(os.date("*t")["wday"]),1)
    saveLocalData(keys[1]..(os.date("*t")["wday"]),1)
    saveLocalData(keys[174]..(os.date("*t")["wday"]),1)
    saveLocalData(keys[175]..(os.date("*t")["wday"]),1)
    saveLocalData(keys[201]..(os.date("*t")["wday"]),1)
    --   print(prayers[201])
    if os.date("*t")["month"] >= 12 or os.date("*t")["month"] <= 2 then
        for i = 125,128 do
            saveLocalData(keys[i]..(os.date("*t")["wday"]),1)
        end
    else if os.date("*t")["month"] >= 6 and os.date("*t")["month"] <= 8 then
            for i = 129,130 do
                saveLocalData(keys[i]..(os.date("*t")["wday"]),1)
            end
        end
    end
end

-- This function gets called once every frame
function draw()
    -- if trans[0] == 0 then
    -- print(touch.y)
    if recording then
        startRecording()
        recording = false
    end
    if helpending and CurrentTouch.state ~= ENDED then
        touch.x = CurrentTouch.x
        touch.y = CurrentTouch.y
    end
    i = 1
    --print(position.x)
    --print(approachingconstant)
    -- This sets a dark background color
    if position.x <= approaching - 20*xw or position.x >= approaching + 20*xw then
        position.x = position.x - approachingconstant
    end
    if titletouch == false then
        if menuout then
            if position.y < WIDTH/4 then
                position.y = position.y + 1
            end
        else
            if position.y > -WIDTH/8 then
                position.y = position.y - 1
            end
        end
    end
    background(207, 220, 222, 255)
    font("AppleColorEmoji")
    fontSize(65*xw)
    --if helping == false then
    
    --  end
    --text("☀️",WIDTH*3.5+position.x,HEIGHT/4)
    font("Baskerville")
    if location.available() then
        if location.course ~= nil then
            if location.course > 0 then
                fill(99, 191, 191, 86)
                rect(WIDTH*3-65*xw+position.x,HEIGHT/4,60,60)
                if location.course >= 45 and location.course <= 135 then
                    fill(71, 222, 21, 207)
                    fontSize(45*xw)
                    text("E",WIDTH*3-65+position.x,HEIGHT/4)
                else
                    fill(255, 0, 0, 211)
                    fontSize(25*xw)
                    text("face",WIDTH*3-65+position.x+30,HEIGHT/4+45)
                    text("east",WIDTH*3-65+position.x+30,HEIGHT/4+20)
                end
            end
        end
    end
    tint(255, 255, 255, 81)
    sprite("Project:CBI logo v3",0,0,WIDTH,HEIGHT)
    tint(255, 255, 255, 255)
    fontSize(50*xw)
    if helping then
        help:draw()
        if CurrentTouch.state ~= ENDED and helpcheck and help.sliding == false then
            if CurrentTouch.y <= HEIGHT/4 then
                helpending = false
                touch.x = help:getx()
                touch.y = help:gety()
                help = nil
                helping = false
                touchtemp = vec2(CurrentTouch.x,CurrentTouch.y)
            else if helpspeak then
                    helpspeak = false
                    help:speak(CurrentTouch.x)
                end
            end
        end
        fontSize(60*xw)
    else
        -- font("AppleColorEmoji")
        -- fontSize(65)
        --if helping == false then
        
        --  end
        --   text("☀️",WIDTH*5+position.x-70,HEIGHT/2-30+HEIGHT/8)
        
        --text("❄️",WIDTH*5+position.x-70,HEIGHT*5/8-30+HEIGHT/16)
        font("Baskerville")
        -- text("before",WIDTH*6.5+position.x,HEIGHT*13/16-30)
        fontSize(50*xw)
        prayerspos[1].x = WIDTH-30*xw-position.x
        for t = 1, #prayers do
                if touch.x-position.x < prayerspos[t].x+string.len(prayers[t])*2.4*xw and touch.x-position.x > prayerspos[t].x-string.len(prayers[t])*2.4*xw and touch.y <= prayerspos[t].y+30*xw and touch.y >= prayerspos[t].y -30*xw and helpending and touch.x ~= touchtemp.x and touch.y ~= touchtemp.y and touch.x >= position.y then
                if position.x > approaching - 20*xw and position.x < approaching + 20*xw and hasslid then
                    --print(prayerlengths[1])
                    if prayerhiglighted[t] == false and helpending then
                        -- sound(sounds[t])
                        helpcheck = false
                        speech.say(prayerstrans[t])
                        --  if t <= prayerlengths[1] then
                        -- prayerprogress[t] = true
                        
                        if math.tointeger(readLocalData(keys[t]..(os.date("*t")["wday"]),0) )== 0 then
                            saveLocalData(keys[t]..(os.date("*t")["wday"]),1)
                        end
                        --  end
                    else if CurrentTouch.state == BEGAN and helpcheck then
                            help = window(prayerstrans[t],touch.x,touch.y)
                            helping = true
                            helpspeak = false
                            prayerhiglighted[t] = false
                            --counter = 0
                            -- for z =
                        end
                    end
                    if helping == false and helpending then
                        prayerhiglighted[t] = true
                    end
                else
                    prayerhiglighted[t] = false
                end
            else
                prayerhiglighted[t] = false
            end
            if prayerhiglighted[t] then
                fill(255, 0, 0, 255)
            else
                fill(33, 39, 54, 255)
            end
            text(prayers[t],prayerspos[t].x+position.x,prayerspos[t].y)
        end
        y = 0
        strokeWidth(1.0)
        -- stroke(24, 89, 161, 255)
        while y <= position.y do
            stroke(24, 89, 161,(255*(position.y/(WIDTH/8)))*(position.y-y)/position.y)
            line(y,0,y,HEIGHT)
            y = y + 1
        end
        if CurrentTouch.state == BEGAN and hidecheck then
            if touch.x <= WIDTH/4+ HEIGHT/8 +20 and touch.x >= WIDTH/4 -20 and touch.y >= 30*HEIGHT/32 -40 then
                hidecheck = false
                if menuout then
                    menuout = false
                else
                    menuout = true
                end
            end
            if  touch.x <= position.y then
                titletouch = true
            end
        end
    end
    if CurrentTouch.state == ENDED then
        hasslid = true
        calendarcheck = true
        titletouch = false
        hidecheck = true
        helpcheck = true
        helpspeak = true
        helpending = true
    end
    if touch.x <= position.y and CurrentTouch.state ~= ENDED then
        if position.z >= -HEIGHT/8 then
            if position.z < (#prayerlengths*3-2)*HEIGHT/16 then
                position.z = position.z - CurrentTouch.deltaY
            else
                position.z = -HEIGHT/8 - CurrentTouch.deltaY
            end
        else
            position.z = HEIGHT*(#prayerlengths*3-2)/16 - CurrentTouch.deltaY
        end
    end
    strokeWidth(4)
    fontSize(xw*60)
    for i=1, #prayertitlepos do
        temp = true
        for r = 1, prayerlengths[i] do
            if math.tointeger(readLocalData(prayertitletrans[i]..(r)..math.tointeger(os.date("*t")["wday"]),0)) == 0 and approaching == prayersindex[i] then
                temp = false
            end
        end
        if temp and math.tointeger(readLocalData(prayertitletrans[i]..os.date("*t")["wday"]))~=1 and approaching == prayersindex[i] then
        end
        spriteMode(CORNER)
        if calendarout then
            sprite("Dropbox:calendarbox",3*WIDTH/8,HEIGHT*3/4,WIDTH*5/8,HEIGHT/4)
            if approaching == prayersindex[i] then
                -- print(i)
                calendarchecktwo = false
                for h = 1,7 do
                    -- if i <= 1 then
                    --if readLocalData(keys[h],0) == 1 then
                    fontSize(20*xw)
                    if (os.date("*t")["day"]-os.date("*t")["wday"]+h-1) > 0 then
                        text(os.date("*t")["day"]-os.date("*t")["wday"]+h,WIDTH*7/16+(h-1)*.076*WIDTH,HEIGHT*27.75/32)
                        
                        fontSize(60*xw)
                        if math.tointeger(readLocalData(prayertitletrans[i]..h,0) ) == 1 then
                            font("AppleColorEmoji")
                            text("✔️",WIDTH*7/16+(h-1)*.076*WIDTH,HEIGHT*29/32)
                            font("Baskerville")
                        else if math.tointeger(readLocalData(prayertitletrans[i]..h,0)) == 0 then
                                font("AppleColorEmoji")
                                fontSize(70*xw)
                                text("❌",WIDTH*7/16+(h-1)*.076*WIDTH,HEIGHT*29/32)
                                font("Baskerville")
                                fontSize(60*xw)
                            end
                        end
                    end
                end
            end
        else
            sprite("Dropbox:calendar",WIDTH*7/8,HEIGHT*6/8,HEIGHT/16)
            fontSize()
        end
        if helping == false then
            
            stroke(87, 50, 216, 69)
            fill(207, 210, 213, 138)
            continuity = 0
            if prayertitlepos[i]-position.z< -HEIGHT/8 then
                continuity = #prayerlengths*3*HEIGHT/16
            elseif prayertitlepos[i]-position.z > #prayerlengths*3*HEIGHT/16 then
                continuity = -HEIGHT/8
            end
            fontSize(60*xw)
            strokeWidth(4.0)
            rect(position.y - 4*WIDTH/16,prayertitlepos[i]-position.z+continuity,5*WIDTH/16,HEIGHT/8)
            fill(0, 0, 0, 212)
            text(prayertitles[i],position.y-3*WIDTH/32,prayertitlepos[i]-position.z+HEIGHT/16+continuity)
            if prayertitlepos[i] < 0 then
                prayertitlepos[i] = prayertitlepos[i] + 22*HEIGHT/8
            end
            if prayertitlepos[i] > 22*HEIGHT/16 then
                prayertitlepos[i] = prayertitlepos[i] - 22*HEIGHT/8
            end
            --  end
            -- end
            fontSize(xw*20)
            fill(0,0,0,25)
            strokeWidth(0)
            rect(WIDTH/4,30*HEIGHT/32-15,HEIGHT/8,HEIGHT/16-10)
            fill(68, 81, 108, 232)
            if menuout == true then
                text("hide",19*WIDTH/64,31*HEIGHT/32-20)
            else
                fontSize(xw*18)
                text("unhide",19*WIDTH/64,31*HEIGHT/32-20)
            end
            -- This sets the line thickness
            --strokeWidth(5)
            if CurrentTouch.state == BEGAN and touch.x <= position.y + WIDTH/8 +20*xw and CurrentTouch.y >= prayertitlepos[i]-position.z+continuity - HEIGHT/16+25*xw and CurrentTouch.y <= prayertitlepos[i]-position.z+continuity + HEIGHT/8 and hidecheck then
                -- print("contact")
                if approaching ~= prayersindex[i] then
                    speech.say(prayertitletrans[i])
                end
                hasslid = false
                approaching = prayersindex[i]
                
                if approaching > position.x then
                    positionvec = vec2(position.x,0)
                    approachingconstant = (-1.*positionvec:dist(vec2(approaching,0)))/60.
                else
                    positionvec = vec2(position.x,0)
                    approachingconstant = (1.*positionvec:dist(vec2(approaching,0)))/60.
                end
            end
            
        end
    end
    -- Do your drawing here
    if CurrentTouch.state == BEGAN and calendarcheck and CurrentTouch.x >= WIDTH*7/8 and CurrentTouch.y >= HEIGHT*6/8 then
        calendarcheck = false
        if calendarout then calendarout = false else calendarout = true end
    end
    i = 1
    calendarchecktwo = true
    --else
    fill(207, 220, 222, trans[1])
    rect(0,0,WIDTH,HEIGHT)
    tint(255, 255, 255, trans[1])
    sprite("Project:CBI logo v3",0,0,WIDTH,HEIGHT)
    fontSize(45*xw)
    fill(49, 66, 130, trans[1])
    text("B'nai Israel Hebrew Education App",WIDTH*2.7/4,HEIGHT*3.7/4)
    fontSize(25*xw)
    text("By Austin Lubetkin",WIDTH*2.7/4,HEIGHT*3.5/4)
    tint(255, 255, 255, 255)
end


window = class()

function window:init(word,xpos,ypos)
    self.xpos = xpos
    self.ypos = ypos
    self.sliding = true
    self.position = {HEIGHT/4,0}
    self.temp = word
    tween(1.5,self.position,{HEIGHT/2,255},tween.easing.linear)
    self.word = {}
    self.index = vec2(1,1)
    self.highlighted = {}
    self.char = 0
    while string.find(self.temp," ",self.index.y)~= nil do
        self.highlighted[self.index.x] = false
        self.word[self.index.x]=string.sub(self.temp,self.index.y,string.find(self.temp," ",self.index.y)-1)
        self.char = self.char + string.len(self.word[self.index.x])
        self.index.y = string.find(self.temp," ",self.index.y)+1
        self.index.x = self.index.x+ 1
    end
    self.highlighted[self.index.x] = false
    self.word[self.index.x] = string.sub(self.temp,self.index.y)
    self.char = self.char + string.len(self.word[self.index.x]) + 2
    self.charspace = 5*WIDTH/(6*self.char)
end
function window:getx()
    return self.xpos
end
function window:gety()
    return self.ypos
end
function window:draw()
    if CurrentTouch.state == ENDED then
        self.sliding = false
    end
    fill(176, 207, 208, self.position[2])
    font("ArialMT")
    rectMode(CENTER)
    rect(WIDTH/2,self.position[1],5*WIDTH/6,HEIGHT/2)
    fontSize(self.charspace)
    rectMode(CORNER)
    self.filler = WIDTH/6+self.charspace+WIDTH/24
    for c = 1, self.index.x do
        if self.highlighted[c] then
            fill(233, 6, 6, self.position[2])
        else
            fill(37, 36, 55, self.position[2])
        end
        text(self.word[c],self.filler,self.position[1])
        self.filler = self.filler + string.len(self.word[c])*self.charspace/2+self.charspace
    end
    fill(37, 36, 55, self.position[2])
    font("AppleColorEmoji")
    fontSize(100*xw)
    text("❌",WIDTH/2,HEIGHT/4-50)
    font("Baskerville")
end

function window:speak(x)
    self.filler= WIDTH/12
    self.pos = WIDTH/6+self.charspace+WIDTH/24
    for f = 1, self.index.x do
        if x > self.pos-string.len(self.word[f])*self.charspace/2 and x < self.pos+string.len(self.word[f])*self.charspace/2 and self.highlighted[f] == false then
            self.highlighted[f] = true
            speech.say(self.word[f])
        else
            self.highlighted[f] = false
        end
        self.pos = self.pos + string.len(self.word[f])*self.charspace/2 +self.charspace
    end
end