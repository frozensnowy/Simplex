UnitCapInfoPopupWidth = 200
MAXHEIGHT = 356
PROGRESSBGCOLOR = { 70, 74, 85, 190}
SHIPQUEUECOLOR = {246, 212, 0, 255}

UnitCapInfoPopup= {

	
	maxColor = {255,255,255,255}, -- color for max pop reached	
	availColor = {255,255,255,255},	-- color for pop available
	
	size = {2, 71, 100, 200},
	
	RootElementSettings = {
		autosize = 1,
	},
	
	onShow = "UI_HideScreen('BuildQueueMenu'); UI_HideScreen('UnitCapInfoPopup1'); UI_HideScreen('selector'); UI_HideScreen('YearMenu'); UI_HideScreen('EnergyMenu')",
	
	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	clickThrough = 1,
	
	;	
	
	-- Tab spacer frame to clone
	{
		type = "Frame",
		name = "frmTabSpacer",
		size = {10, 15},
		giveParentMouseInput = 1,
	},

	-- Title to clone
	{
		type = "TextLabel",
		name = "lblNameToClone",
		position = {4,0},
		size = {UnitCapInfoPopupWidth-16, 15},
		Text = {
			textStyle = "IGHeading2",
		},
		giveParentMouseInput = 1,
		dropShadow = 1,
		visible = 0,
	},
	
	-- Unit cap item to clone
	{
		type = "Frame",
		name = "frmItemToClone",
		autosize = 1,		
		giveParentMouseInput = 1,
		visible = 0,
		;
		
		{
			type = "Frame",
			name = "frmName",
			position = {4,0},
			size = {UnitCapInfoPopupWidth - 50, 12},
			autoarrange = 1,
			autoarrangeWidth = 300, -- this is needed b/c of spacers
			visible = 0,
			;
		},
		
		
		{	
			type = "TextLabel",
			name = "lblUnitCap",
			position = {UnitCapInfoPopupWidth - 46, 0},
			size = {45, 12},
			Text = {
				font = "ATISmallFont",
				color = {255,255,255,255},
				hAlign = "Right",
				vAlign = "Middle",
				text = "",
				--text = "<c %06x>%d</c>",				
				offset = {-6,0},
			},
			giveParentMouseInput = 1,
			--dropShadow = 1,
			visible = 0,
		},		
	},
		
	{
		type = "Frame",
		--position = {2,17},
		autosize = 1,
		backgroundColor = { 0, 0, 0, 0, },		--"IGColorBackground1",
		giveParentMouseInput = 1,
		autoarrange = 1,
		autoarrangeWidth = UnitCapInfoPopupWidth,
		maxSize = {UnitCapInfoPopupWidth, MAXHEIGHT},
		visible = 0,
		;
		
		-- Frame to hold all unit caps
		{
			type = "Frame",
			name = "frmItems",
			autosize = 1,
			autoarrange = 1,
			autoarrangeWidth = UnitCapInfoPopupWidth,
			giveParentMouseInput = 1,
			visible = 0,
		},
		
	},
		
---INTESTAZIONE-----------------------------------------------------
	{
		type = "Frame",
		position = {3,0},
		size = {110, 356},			
		;
		{
			type = "Frame",
			position = {0, 0},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\degree_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 0},
			size = {80, 13},								
			Text = {
				text = "Military Rank", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		}, 
		{
			type = "Frame",
			position = {0, 13},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\honor_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 13},
			size = {80, 13},								
			Text = {
				text = "Honour", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},   
		{
			type = "TextLabel",
			position = {23, 23},
			size = {80, 13},								
			Text = {
				text = "Battle", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},                
		{
			type = "TextLabel",
			position = {23, 33},
			size = {80, 13},								
			Text = {
				text = "Capture", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},                
		{
			type = "TextLabel",
			position = {23, 43},
			size = {80, 13},								
			Text = {
				text = "Tribute", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},                
		{
			type = "TextLabel",
			position = {23, 53},
			size = {80, 13},								
			Text = {
				text = "Research", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},                
		{
			type = "TextLabel",
			position = {23, 63},
			size = {80, 13},								
			Text = {
				text = "Build", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "TextLabel",
			position = {23, 73},
			size = {80, 13},								
			Text = {
				text = "RUs", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 86},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\crew_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 86},
			size = {80, 13},								
			Text = {
				text = "Crew", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		}, 
		{
			type = "Frame",
			position = {0, 99},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\officer_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 99},
			size = {80, 13},								
			Text = {
				text = "Officers", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 112},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\computerlink_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 112},
			size = {80, 13},								
			Text = {
				text = "Remote Monitor", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 125},
			size = {13,13},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\lightning_yellow_1600.TGA", 
				textureUV = {0,4,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 125},
			size = {80, 13},								
			Text = {
				text = "Energy", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 125+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\tech_1600.TGA",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 125+13},
			size = {80, 13},								
			Text = {
				text = "Research Score", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 138+13},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\maintenance_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 138+13},
			size = {80, 13},								
			Text = {
				text = "Maintenance", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  		
		{
			type = "Frame",
			position = {0, 164},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\fleet_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 164},
			size = {80, 13},								
			Text = {
				text = "Fleet", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		}, 
		{
			type = "TextLabel",
			position = {23, 174},
			size = {80, 13},								
			Text = {
				text = "Fighters", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		}, 
		{
			type = "TextLabel",
			position = {23, 184},
			size = {80, 13},								
			Text = {
				text = "Corvettes", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "TextLabel",
			position = {23, 194},
			size = {80, 13},								
			Text = {
				text = "Frigates", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "TextLabel",
			position = {23, 204},
			size = {80, 13},								
			Text = {
				text = "Capital Ships", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		}, 
		{
			type = "TextLabel",
			position = {23, 214},
			size = {80, 13},								
			Text = {
				text = "Platforms", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},    
		{
			type = "TextLabel",
			position = {23, 224},
			size = {80, 13},								
			Text = {
				text = "Utilities", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 237},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 237},
			size = {80, 13},								
			Text = {
				text = "RUs", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 237+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 237+13},
			size = {80, 13},								
			Text = {
				text = "RU by Fusion", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},   
		{
			type = "Frame",
			position = {0, 250+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 250+13},
			size = {80, 13},								
			Text = {
				text = "RU by Trade", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		{
			type = "Frame",
			position = {0, 263+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion1_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 263+13},
			size = {95, 13},								
			Text = {
				text = "RU by Mining Base", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		
		{
			type = "Frame",
			position = {0, 276+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion3_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 276+13},
			size = {95, 13},								
			Text = {
				text = "RU by Population", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  

		{
			type = "Frame",
			position = {0, 289+13},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\bounty_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 289+13},
			size = {80, 13},								
			Text = {
				text = "RU by Bounty", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  

		{
			type = "Frame",
			position = {0, 289+26},
			size = {16,16},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\diplomacy_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},						
		},		
		{
			type = "TextLabel",
			position = {15, 289+26},
			size = {80, 13},								
			Text = {
				text = "Diplomacy Fee", 
				textStyle = "IGHeading2",
				offset = {0,0},
			},
		},  
		
		{
			type = "TextLabel",
			position = {15, 305+26},
			size = {80, 13},								
			Text = {
				text = "SCORE", 
				textStyle = "IGHeading1",
				offset = {0,0},
				color = "FEColorHeading2",
			},
		},   
  },
--------------------------------------------------------
	{
		type = "Frame",
		position = {113,0},
		size = {110, 356},			
		;
		{		        
			type = "TextLabel",
			position = {0, 0},
			size = {110,  13},
			name = "lblgrado1",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 13},
			size = {110,  13},
			name = "lblhonor",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 23},
			size = {110,  13},
			name = "lblhonorbattle",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 33},
			size = {110,  13},
			name = "lblhonorcapture",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 43},
			size = {110,  13},
			name = "lblhonortribute",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 53},
			size = {110,  13},
			name = "lblhonorresearch",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 63},
			size = {110,  13},
			name = "lblhonorbuild",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 73},
			size = {110,  13},
			name = "lblhonorru",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 86},
			size = {110,  13},
			name = "lblPopUnits",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {12, 86},
			size = {110,  13},
			name = "lblPopUnitsr",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 99},
			size = {110,  13},
			name = "lblPopOfficerUnits",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {6, 99},
			size = {110,  13},
			name = "lblPopOfficerUnitsr",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {0, 112},
			size = {110,  13},
			name = "lblstatus",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 112},
			size = {110,  13},
			name = "lblstatuss",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 125},
			size = {110,  13},
			name = "energy",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {0, 125+13},
			size = {110,  13},
			name = "lbltotalscore",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 138+13},
			size = {110,  13},
			name = "lblMaintenance",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {0, 164},
			size = {110,  13},
			name = "fleet",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 174},
			size = {110,  13},
			name = "fighter",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 184},
			size = {110,  13},
			name = "corvette",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 194},
			size = {110,  13},
			name = "frigate",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 204},
			size = {110,  13},
			name = "capital",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 214},
			size = {110,  13},
			name = "platform",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 224},
			size = {110,  13},
			name = "utility",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 237},
			size = {110,  13},
			name = "lblResourceUnits",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
		{		        
			type = "TextLabel",
			position = {0, 237+13},
			size = {110,  13},
			name = "lblFusion",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 250+13},
			size = {110,  13},
			name = "lbltrade",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 263+13},
			size = {110,  13},
			name = "lblmegalith",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 276+13},
			size = {110,  13},
			name = "lblplanet",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 289+13},
			size = {110,  13},
			name = "bounty",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 289+26},
			size = {110,  13},
			name = "diplomacy",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},
		{		        
			type = "TextLabel",
			position = {0, 305+26},
			size = {110,  13},
			name = "lblscore",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},		
---Medals
  	{
			type = "Frame",
			position = {17+1, 24},
			size = {9,8},
			name = "battlemedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 24},
			size = {9,8},
			name = "battlemedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 24},
			size = {9,8},
			name = "battlemedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 24},
			size = {9,8},
			name = "battlemedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 24},
			size = {10,9},
			name = "battlemedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		
		{
			type = "Frame",
			position = {17+1, 34},
			size = {9,8},
			name = "capturemedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 34},
			size = {9,8},
			name = "capturemedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 34},
			size = {9,8},
			name = "capturemedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 34},
			size = {9,8},
			name = "capturemedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 34},
			size = {10,9},
			name = "capturemedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},	
		
		{
			type = "Frame",
			position = {17+1, 44},
			size = {9,8},
			name = "tributemedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 44},
			size = {9,8},
			name = "tributemedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 44},
			size = {9,8},
			name = "tributemedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 44},
			size = {9,8},
			name = "tributemedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 44},
			size = {10,9},
			name = "tributemedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},	
		
		{
			type = "Frame",
			position = {17+1, 54},
			size = {9,8},
			name = "researchmedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 54},
			size = {9,8},
			name = "researchmedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 54},
			size = {9,8},
			name = "researchmedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 54},
			size = {9,8},
			name = "researchmedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 54},
			size = {10,9},
			name = "researchmedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		
		{
			type = "Frame",
			position = {17+1, 64},
			size = {9,8},
			name = "buildmedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 64},
			size = {9,8},
			name = "buildmedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 64},
			size = {9,8},
			name = "buildmedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 64},
			size = {9,8},
			name = "buildmedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 64},
			size = {10,9},
			name = "buildmedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},	
		
		{
			type = "Frame",
			position = {17+1, 74},
			size = {9,8},
			name = "rumedal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {25+1, 74},
			size = {9,8},
			name = "rumedal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {33+1, 74},
			size = {9,8},
			name = "rumedal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {41+1, 74},
			size = {9,8},
			name = "rumedal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},
		{
			type = "Frame",
			position = {49+1, 74},
			size = {10,9},
			name = "rumedal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,					
		},																			
		
	},						                
		
}
	