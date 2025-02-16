MenuBackgroundPicNum=50
MenuBackgroundPicID = random(MenuBackgroundPicNum)
MenuBackgroundPic={}
MenuBackgroundPic[1]="DATA:UI/NewUI/Background/menu_background_16000_stellaris27.tga"
MenuBackgroundPic[2]="DATA:UI/NewUI/Background/menu_background_16000_stellaris1.tga"
MenuBackgroundPic[3]="DATA:UI/NewUI/Background/menu_background_16000_stellaris2.tga"
MenuBackgroundPic[4]="DATA:UI/NewUI/Background/menu_background_16000_stellaris3.tga"
MenuBackgroundPic[5]="DATA:UI/NewUI/Background/menu_background_16000_stellaris4.tga"
MenuBackgroundPic[6]="DATA:UI/NewUI/Background/menu_background_16000_stellaris5.tga"
MenuBackgroundPic[7]="DATA:UI/NewUI/Background/menu_background_16000_stellaris6.tga"
MenuBackgroundPic[8]="DATA:UI/NewUI/Background/menu_background_16000_stellaris7.tga"
MenuBackgroundPic[9]="DATA:UI/NewUI/Background/menu_background_16000_stellaris8.tga"
MenuBackgroundPic[10]="DATA:UI/NewUI/Background/menu_background_16000_stellaris9.tga"
MenuBackgroundPic[11]="DATA:UI/NewUI/Background/menu_background_16000_stellaris10.tga"
MenuBackgroundPic[12]="DATA:UI/NewUI/Background/menu_background_16000_stellaris11.tga"
MenuBackgroundPic[13]="DATA:UI/NewUI/Background/menu_background_16000_stellaris12.tga"
MenuBackgroundPic[14]="DATA:UI/NewUI/Background/menu_background_16000_stellaris13.tga"
MenuBackgroundPic[15]="DATA:UI/NewUI/Background/menu_background_16000_stellaris14.tga"
MenuBackgroundPic[16]="DATA:UI/NewUI/Background/menu_background_16000_stellaris15.tga"
MenuBackgroundPic[17]="DATA:UI/NewUI/Background/menu_background_16000_stellaris16.tga"
MenuBackgroundPic[18]="DATA:UI/NewUI/Background/menu_background_16000_stellaris17.tga"
MenuBackgroundPic[19]="DATA:UI/NewUI/Background/menu_background_16000_stellaris18.tga"
MenuBackgroundPic[20]="DATA:UI/NewUI/Background/menu_background_16000_stellaris19.tga"
MenuBackgroundPic[21]="DATA:UI/NewUI/Background/menu_background_16000_stellaris20.tga"
MenuBackgroundPic[22]="DATA:UI/NewUI/Background/menu_background_16000_stellaris21.tga"
MenuBackgroundPic[23]="DATA:UI/NewUI/Background/menu_background_16000_stellaris22.tga"
MenuBackgroundPic[24]="DATA:UI/NewUI/Background/menu_background_16000_stellaris23.tga"
MenuBackgroundPic[25]="DATA:UI/NewUI/Background/menu_background_16000_stellaris24.tga"
MenuBackgroundPic[26]="DATA:UI/NewUI/Background/menu_background_16000_stellaris25.tga"
MenuBackgroundPic[27]="DATA:UI/NewUI/Background/menu_background_16000_stellaris26.tga"
MenuBackgroundPic[28]="DATA:UI/NewUI/Background/menu_background_16000.tga"
MenuBackgroundPic[29]="DATA:UI/NewUI/Background/menu_background_16000_stellaris28.tga"
MenuBackgroundPic[30]="DATA:UI/NewUI/Background/menu_background_16000_stellaris29.tga"
MenuBackgroundPic[31]="DATA:UI/NewUI/Background/menu_background_16000_stellaris30.tga"
MenuBackgroundPic[32]="DATA:UI/NewUI/Background/menu_background_16000_stellaris31.tga"
MenuBackgroundPic[33]="DATA:UI/NewUI/Background/menu_background_16000_stellaris32.tga"
MenuBackgroundPic[34]="DATA:UI/NewUI/Background/menu_background_16000_stellaris33.tga"
MenuBackgroundPic[35]="DATA:UI/NewUI/Background/menu_background_16000_stellaris34.tga"
MenuBackgroundPic[36]="DATA:UI/NewUI/Background/menu_background_16000_stellaris35.tga"
MenuBackgroundPic[37]="DATA:UI/NewUI/Background/menu_background_16000_stellaris36.tga"
MenuBackgroundPic[38]="DATA:UI/NewUI/Background/menu_background_16000_stellaris37.tga"
MenuBackgroundPic[39]="DATA:UI/NewUI/Background/menu_background_16000_stellaris38.tga"
MenuBackgroundPic[40]="DATA:UI/NewUI/Background/menu_background_16000_stellaris39.tga"
MenuBackgroundPic[41]="DATA:UI/NewUI/Background/menu_background_16000_stellaris40.tga"
MenuBackgroundPic[42]="DATA:UI/NewUI/Background/menu_background_16000_stellaris41.tga"
MenuBackgroundPic[43]="DATA:UI/NewUI/Background/menu_background_16000_stellaris42.tga"
MenuBackgroundPic[44]="DATA:UI/NewUI/Background/menu_background_16000_stellaris43.tga"
MenuBackgroundPic[45]="DATA:UI/NewUI/Background/menu_background_16000_stellaris44.tga"
MenuBackgroundPic[46]="DATA:UI/NewUI/Background/menu_background_16000_stellaris45.tga"
MenuBackgroundPic[47]="DATA:UI/NewUI/Background/menu_background_16000_stellaris46.tga"
MenuBackgroundPic[48]="DATA:UI/NewUI/Background/menu_background_16000_stellaris47.tga"
MenuBackgroundPic[49]="DATA:UI/NewUI/Background/menu_background_16000_stellaris48.tga"
MenuBackgroundPic[50]="DATA:UI/NewUI/Background/menu_background_16000_stellaris49.tga"

Background = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = {}, 
    pixelUVCoords = 1, 
; 
{ 
    type = "Frame", 
    name = "frmBackground_1", 
    visible = 1, 
    position = 
        { 0, 0, }, 
    size = 
        { 800, 600, }, 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 800, 600, }, 
        textureUV = 
            { 0, 0, 1600, 1200, }, 	--800,600
        texture = MenuBackgroundPic[MenuBackgroundPicID], }, }, 	--"DATA:UI/NewUI/Background/menu_background_16000_stellaris"..random(1,48)..".tga"
}
