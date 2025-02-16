DIALOGWIDTH = 180
DIALOGHEIGHT = 80

hyperspaceout =
{
    size =
    { 300, 25, DIALOGWIDTH, DIALOGHEIGHT, },
    stylesheet = "HW2StyleSheet",
    pixelUVCoords = 1,
    ;
    {
        type = "Frame",
        name = "m_frmDialogRoot",
        size =
        { DIALOGWIDTH, DIALOGHEIGHT, },
        backgroundColor = "FEColorDialog",
        autosize = 1,
        marginHeight = 1,
        ;
        {
            type = "Frame",
            position =
            { 2, 2, },
            size =
            { DIALOGWIDTH - 4, DIALOGHEIGHT - 4, },
            style = "FEPopupBackgroundStyle",
        },
        {
            type = "Frame",
            position =
            { 1, 1, },
            size =
            { DIALOGWIDTH - 2, DIALOGHEIGHT - 2, },
            ;
            {
                type = "Frame",
                size =
                { DIALOGWIDTH - 2, DIALOGHEIGHT - 2, },
                borderWidth = 1,
                borderColor = "FEColorPopupOutline", },
        },
        {
            type = "Frame",
            position =
            { 1, 0, },
            autosize = 1,
            autoarrange = 1,
            autoarrangeWidth = DIALOGWIDTH - 2,
            autoarrangeSpace = 2,
            ;
            {
                type = "Frame",
                size =
                { DIALOGWIDTH - 4, DIALOGHEIGHT - 4, },
                ;
                {
                    type = "TextLabel",
                    name = "lblTitle",
                    position =
                    { 2, 2, },
                    size =
                    { DIALOGWIDTH - 6, 15, },
                    Text =
                    {
                        textStyle = "FEHeading3",
                        vAlign = "Middle",
                        hAlign = "Center",
                        text = "Objectives Complete", },
                },
                {
                    type = "TextLabel",
                    name = "lblSubTitle",
                    position =
                    { 2, 17, },
                    size =
                    { DIALOGWIDTH - 6, 13, },
                    Text =
                    {
                        textStyle = "FEHeading4",
                        vAlign = "Middle",
                        hAlign = "Center",
                        text = "All primary objectives have been completed.", },
                },
                {
                    type = "TextLabel",
                    name = "lblSubTitle",
                    position =
                    { 2, 30, },
                    size =
                    { DIALOGWIDTH - 6, 13, },
                    Text =
                    {
                        textStyle = "FEHeading4",
                        vAlign = "Middle",
                        hAlign = "Center",
                        text = "Do you want to leave this mission?", },
                },
                {
                    type = "Frame",
                    position =
                    { 0, 45, },
                    size =
                    { DIALOGWIDTH - 4, 20, }
                    ;
                    {
                        type = "TextButton",
                        position = { (DIALOGWIDTH - 60) / 2, 2, },
                        size = { 60, 17, },
                        name = "btnHyperspaceOut",
                        buttonStyle = "FEButtonStyle2",
                        Text =
                        {
                            textStyle = "FEButtonTextStyle",
                            text = "Exit Mission",
                        },
                        onMouseClicked = [[
                            UI_HideScreen('hyperspaceout');
                            UI_SetElementVisible("hyperspaceout", "btnHyperspaceOut", 0)
                            print('Button clicked, UI screen hidden')
                        ]],
                    },
                },
            },
        },
    },
}