Accolades = 
{ 
  size = 
      { 0, 0, 800, 326, }, 
  stylesheet = "HW2StyleSheet", 
  pixelUVCoords = 1,   
  clickThrough = 1,  
  RootElementSettings = 
  { 
      backgroundColor = { 0, 0, 0, 0, },		--"FEColorBackground1", 
   }, 
; 

---Mesc------------------------------------------------------------------------------------------------------

	{ 
    type = "Frame", 
    name = "mescaccolades",
    position = 
        { 0, 25, }, 	--0,20 was blocking the subtitle a little bit
    autosize = 1,
    autoarrange = 1, 
    autoarrangeWidth = 800, 
    vAlign = "Top",
	  hAlign = "Center",
	; 

	---explosivespree
		{ 
	    type = "Frame", 
	    name = "explosivespree", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\explosivespree.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "EXPLOSIVE SPREE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "explosivespreebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "explosivespreecount", 
			},
		},
	---demolitionexpert
		{ 
	    type = "Frame", 
	    name = "demolitionexpert", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\demolitionexpert.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "DEMO EXPERT", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "demolitionexpertbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "demolitionexpertcount", 
			},
		},
	---hurtlocker
		{ 
	    type = "Frame", 
	    name = "hurtlocker", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\hurtlocker.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "HURT LOCKER", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "hurtlockerbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "hurtlockercount", 
			},
		},

	---artillerystrike
		{ 
	    type = "Frame", 
	    name = "artillerystrike", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\artillerystrike.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "ARTILLERY SHOT", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "artillerystrikebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "artillerystrikecount", 
			},
		},

	---snipingspree
		{ 
	    type = "Frame", 
	    name = "snipingspree", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\snipingspree.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "SNIPING SPREE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "snipingspreebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "snipingspreecount", 
			},
		},
	---marksman
		{ 
	    type = "Frame", 
	    name = "marksman", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\marksman.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "MARKSMAN", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "marksmanbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "marksmancount", 
			},
		},
	---sharpshooter
		{ 
	    type = "Frame", 
	    name = "sharpshooter", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\sharpshooter.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "SHARPSHOOTER", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "sharpshooterbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "sharpshootercount", 
			},
		},

	},	--Mesc

---KILLING SPREES------------------------------------------------------------------------------------------------------

	{ 
    type = "Frame", 
    name = "sprees",
    position = 
        { 0, 120, }, 
    autosize = 1,
    autoarrange = 1, 
    autoarrangeWidth = 800, 
    vAlign = "Top",
	  hAlign = "Center",
	; 

	---firstblood
		{ 
	    type = "Frame", 
	    name = "firstblood", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\firstblood.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "FIRST BLOOD", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "firstbloodbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "firstbloodcount", 
			},
		},

	---repair
		{ 
	    type = "Frame", 
	    name = "repair", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\repair.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "SHIP REPAIR", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "repairbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "repaircount", 
			},
		},

	---killingspree
		{ 
	    type = "Frame", 
	    name = "killingspree", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\killingspree.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "KILLING SPREE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "killingspreebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "killingspreecount", 
			},
		},
	---rampage
		{ 
	    type = "Frame", 
	    name = "rampage", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\rampage.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "RAMPAGE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "rampagebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "rampagecount", 
			},
		},
	---relentless
		{ 
	    type = "Frame", 
	    name = "relentless", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\relentless.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "RELENTLESS", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "relentlessbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "relentlesscount", 
			},
		},
	---unstoppable
		{ 
	    type = "Frame", 
	    name = "unstoppable", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\unstoppable.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "UNSTOPPABLE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "unstoppablebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "unstoppablecount", 
			},
		},
	---slayer
		{ 
	    type = "Frame", 
	    name = "slayer", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\slayer.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "SLAYER", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "slayerbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "slayercount", 
			},
		},

	---nojoy
		{ 
	    type = "Frame", 
	    name = "nojoy", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\nojoy.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "NO JOY", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "nojoybounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "nojoycount", 
			},
		},
	
	---finalblow
		{ 
	    type = "Frame", 
	    name = "finalblow", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\finalblow.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "FINAL BLOW", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "finalblowbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "finalblowcount", 
			},
		},
	
	},	--sprees

---MULTI KILLS------------------------------------------------------------------------------------------------------

	{ 
    type = "Frame", 
    name = "multikills",
    position = 
        { 0, 200, }, 
    autosize = 1,
    autoarrange = 1, 
    autoarrangeWidth = 800, 
    vAlign = "Top",
	  hAlign = "Center",
	; 
	
	---assist
		{ 
	    type = "Frame", 
	    name = "assist", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\assist.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "ASSIST", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "assistbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "assistcount", 
			},
		},

	---revenge
		{ 
	    type = "Frame", 
	    name = "revenge", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\revenge.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "REVENGE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "revengebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "revengecount", 
			},
		},

	---doublekill
		{ 
	    type = "Frame", 
	    name = "doublekill", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\doublekill.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "DOUBLE KILL", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "doublekillbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "doublekillcount", 
			},
		},
	---triplekill
		{ 
	    type = "Frame", 
	    name = "triplekill", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\triplekill.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "TRIPLE KILL", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "triplekillbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "triplekillcount", 
			},
		},
	---quatrakill
		{ 
	    type = "Frame", 
	    name = "quatrakill", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\quatrakill.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "QUATRA KILL", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "quatrakillbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "quatrakillcount", 
			},
		},
	---ultrakill
		{ 
	    type = "Frame", 
	    name = "ultrakill", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\ultrakill.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "ULTRA KILL", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "ultrakillbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "ultrakillcount", 
			},
		},
	---teamkill
		{ 
	    type = "Frame", 
	    name = "teamkill", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\teamkill.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "TEAM KILL", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "teamkillbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "teamkillcount", 
			},
		},

	---flagcapture
		{ 
	    type = "Frame", 
	    name = "flagcapture", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\flagcapture.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "SHIP CAPTURE", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "flagcapturebounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "flagcapturecount", 
			},
		},
		
	---aftermath
		{ 
	    type = "Frame", 
	    name = "aftermath", 
	    size = 
	        { 72, 80, }, 
		; 
			--icon
			{
				type = "Frame",
				position = {11, 12},
				size = {50,56},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\accolades\\aftermath.tga",				
					color = OUTLINECOLOR,
					},						
			},	
			--description
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
		        text = "MAD", 
		    }, 
			}, 	
			--bounty
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 66, }, 
		    size = 
		        { 72, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Center",	
				}, 	
				name = "aftermathbounty", 
			},
			--count
	    { 
		    type = "TextLabel",     
		    position = 
		        { 0, 52, }, 
		    size = 
		        { 60, 14, }, 
		    Text = 
		    { 
		        textStyle = "IGHeading2", 
		        hAlign = "Right",	
				}, 	
				name = "aftermathcount", 
			},
		},


	},	--multikills

}


			--count
--			{ 
--			    type = "TextLabel", 
--			    position = 
--			        { 92, 92, }, 
--			    size = 
--			        { 36, 13, }, 
--			    Text = 
--			    { 
--			        textStyle = "IGHeading2", 
--			        hAlign = "Left", 
--			        vAlign = "Center", 
--			    }, 
--			    name = "killingspreecount", 
--			}, 