haxor = {		
	size = {2+30, 73, 60, 270-30},	
	onShow = "UI_PlaySound('SFX_ThisTabDisplaysAllSpecialActions')",
	onHide = "",
	
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1, 
	;		
---haxor---------------------------------------------------------------		
		{ 
		  type = "Frame", 
		  position = {0, 0},		    
		  size = {60, 240},
		  autoarrange = 1, 
		  autoarrangeWidth = 60, 
		  wrapping = 1,
		  autoarrangeSpace = 0, 	
		; 	
---healselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "healselect",     
			  helpTip = "HEAL SELECTED SHIPS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','healselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_heal.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "healselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---killselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "killselect",     
			  helpTip = "DETONATE SELECTED SHIPS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','killselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_kill.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "killselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---invincibleselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "invincibleselect",     
			  helpTip = "MAKE SELECTED SHIPS INVINCIBLE", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','invincibleselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_invincible.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "invincibleselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---vincibleselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "vincibleselect",     
			  helpTip = "UNDO ALL INVINCIBLE HAX", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','vincibleselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_vincible.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "vincibleselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---hyperspaceinselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "hyperspaceinselect",     
			  helpTip = "MAKE SELECTED SHIPS ENTER HYPERSPACE", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','hyperspaceinselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_hyperspacein.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "hyperspaceinselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---hyperspaceoutselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "hyperspaceoutselect",
			  helpTip = "EXIT HYPERSPACE AT CAMERA LOCATION", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','hyperspaceoutselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_hyperspaceout.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "hyperspaceoutselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---promoteselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "promoteselect",
			  helpTip = "PROMOTE SELECTED SHIPS WITH EXPERIENCE", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','promoteselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_promote.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "promoteselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---honourselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "honourselect",
			  helpTip = "ADD HONOUR POINTS FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','honourselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_honour.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "honourselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---researchselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "researchselect",
			  helpTip = "BURN RESEARCH FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','researchselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_research.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "researchselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---buildselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "buildselect",
			  helpTip = "SET BUILD SPEED FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','buildselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_build.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "buildselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---resourceselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "resourceselect",
			  helpTip = "FILL RUs FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','resourceselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_resource.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "resourceselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---powerselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "powerselect",
			  helpTip = "CHARGE ENERGY FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','powerselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_power.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "powerselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---unitcapselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "unitcapselect",
			  helpTip = "UNLIMIT UNIT CAP FOR SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','unitcapselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_unitcap.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "unitcapselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---transferselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "transferselect",
			  helpTip = "TRANSFER SELECTED SHIPS TO SELECTED PLAYER", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','transferselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_transfer.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "transferselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---manualselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "manualselect",
			  helpTip = "REMOVE AI FROM SELECTED SHIPS", 
			  helpTipTextLabel = "commandsHelpTip",
			  helpTipScreen = "NewTaskbar",
			  onMouseClicked = "UI_SetElementVisible('haxor','manualselected',1)",
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_manual.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "manualselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
---aiselect-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "aiselect",
			  helpTip = "RESTORE AI TO DEFAULT", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('haxor','aiselected',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_ai.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "aiselectlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			},
			
					   			  
},


	{
		type = "Frame",
		position = {0,0,},
		name = "manualselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "aiselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "unitcapselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "transferselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "powerselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "resourceselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "buildselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "researchselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "honourselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "promoteselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "killselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "healselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "invincibleselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "vincibleselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "hyperspaceinselected",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "hyperspaceoutselected",
		size = {0,0,},
		visible = 0,
	},
	
}

selector= {		
	size = {2, 73, 90, 270+60},	
	onShow = "UI_HideScreen('BuildQueueMenu'); UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('UnitCapInfoPopup1'); UI_HideScreen('YearMenu'); UI_HideScreen('EnergyMenu')",		
	onHide = "UI_HideScreen('haxor')",
	
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1, 
	;		
---fighter---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	    
		  size = {90, 30},	
		; 
---fighter-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "fighter",     
			  helpTip = "FIGHTERS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'fighter', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\fighterfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "fighterlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	
		}, 
		
---corvette---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 30},	    
		  size = {90, 30},	
		; 
---corvette-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "corvette",     
			  helpTip = "CORVETTES", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'corvette', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\corvettefs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "corvettelabel",
						position = {3,20},
						size = {24, 10},			
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	
		}, 				
---frigate---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 60},	    
		  size = {90, 30},	
		; 
---frigate-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "frigate",     
			  helpTip = "FRIGATES", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'frigate', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\frigatefs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "frigatelabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	
		}, 					
		
---platform---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 150},	    
		  size = {90, 30},	
		; 
---platform-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "platform",     
			  helpTip = "PLATFORMS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'platform', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\platformfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "platformlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 
		}, 					
		
---capital prod---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 120},	    
		  size = {90, 30},	
		; 
---capital prod-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "capital",     
			  helpTip = "PRODUCTION CAPITAL SHIPS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'capital', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\warshipfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "capitallabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	
		}, 		
		
---armed capital---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 90},	    
		  size = {90, 30},	
		; 
---armed capital-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "armedcapital",     
			  helpTip = "ARMED CAPITAL SHIPS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'armedcapital', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\capitalfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "armedcapitallabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 
		}, 																																	
		
---utility---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 180},	    
		  size = {90, 30},	
		; 
---utility-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "utility",     
			  helpTip = "UTILITIES", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'utility', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\utilityfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "utilitylabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 
			  				 		  			  			  		  				 		  			  		  				 		  	  				 		 		  		  				 		  		  				 		 		  	  				 		 				    			  		  				 		 				    		  		  				 		 				    				 		 		  			  				 		 		  			  			  				 		 		  	  				
		},	
		
---weapon---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 210},	    
		  size = {90, 30},	
		; 
---weapon-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "weapon",     
			  helpTip = "WEAPONS", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'weapon', 0)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\weaponfs.tga",
			        textureUV = { -18, -11, 80, 80, },
			    },						
				;
				  {
						type = "TextLabel",
						name = "weaponlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 
		},															
		
---fleet---------------------------------------------------------------		
		{ 
		  type = "Frame", 
		  position = {0, 240},		    
		  autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 300, 
		  autoarrangeSpace = 0, 	
		; 	
---fleet-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "fleet",     
			  helpTip = "ALL CLASSES", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'fleet', 0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\hgn_fleetfs.tga",
			        textureUV = { -22, -21, 160, 160, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "fleetlabel",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---refresh-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "btnrefresh",     
			  helpTip = "CONFIRM SELECTION", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'refresh', 0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\refreshfs_new.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },						
				},
			},
---haxor-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "btnhaxor",     
			  helpTip = "HAXOR CONSOLE", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_ToggleScreen( 'haxor', 0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_console.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },						
				},
			},
},

---player control---------------------------------------------------------------		
		{ 
		  type = "Frame", 
		  position = {0, 270},		    
		  autosize = 1, 
		  autoarrange = 1, 
		  wrapping = 1,
		  autoarrangeWidth = 90, 
		  autoarrangeSpace = 0, 	
		; 	
---control player 1-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer1",     
			  helpTip = "SELECT FROM PLAYER 1", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',1); UI_SetElementVisible('selector','selectplayer2',0); UI_SetElementVisible('selector','selectplayer3',0); UI_SetElementVisible('selector','selectplayer4',0); UI_SetElementVisible('selector','selectplayer5',0); UI_SetElementVisible('selector','selectplayer6',0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_1.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer1label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---control player 2-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer2",     
			  helpTip = "SELECT FROM PLAYER 2", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',0); UI_SetElementVisible('selector','selectplayer2',1); UI_SetElementVisible('selector','selectplayer3',0); UI_SetElementVisible('selector','selectplayer4',0); UI_SetElementVisible('selector','selectplayer5',0); UI_SetElementVisible('selector','selectplayer6',0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_2.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer2label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 	  
---control player 3-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer3",     
			  helpTip = "SELECT FROM PLAYER 3", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',0); UI_SetElementVisible('selector','selectplayer2',0); UI_SetElementVisible('selector','selectplayer3',1); UI_SetElementVisible('selector','selectplayer4',0); UI_SetElementVisible('selector','selectplayer5',0); UI_SetElementVisible('selector','selectplayer6',0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_3.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer3label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---control player 4-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer4",     
			  helpTip = "SELECT FROM PLAYER 4", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',0); UI_SetElementVisible('selector','selectplayer2',0); UI_SetElementVisible('selector','selectplayer3',0); UI_SetElementVisible('selector','selectplayer4',1); UI_SetElementVisible('selector','selectplayer5',0); UI_SetElementVisible('selector','selectplayer6',0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_4.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer4label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---control player 5-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer5",     
			  helpTip = "SELECT FROM PLAYER 5", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',0); UI_SetElementVisible('selector','selectplayer2',0); UI_SetElementVisible('selector','selectplayer3',0); UI_SetElementVisible('selector','selectplayer4',0); UI_SetElementVisible('selector','selectplayer5',1); UI_SetElementVisible('selector','selectplayer6',0)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_5.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer5label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
---control player 6-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "controlplayer6",     
			  helpTip = "SELECT FROM PLAYER 6", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetElementVisible('selector','selectplayer1',0); UI_SetElementVisible('selector','selectplayer2',0); UI_SetElementVisible('selector','selectplayer3',0); UI_SetElementVisible('selector','selectplayer4',0); UI_SetElementVisible('selector','selectplayer5',0); UI_SetElementVisible('selector','selectplayer6',1)",		
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1, 	
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\haxor_6.tga",
			        textureUV = { -18, -18, 80, 80, },
			    },
			  ;
			  	{
						type = "TextLabel",
						name = "controlplayer6label",
						position = {3,20},
						size = {24, 10},		
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},       				
				},
			}, 
			 			  
},

	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer1",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer2",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer3",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer4",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer5",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "selectplayer6",
		size = {0,0,},
		visible = 0,
	},

}	


---SCREENS-------------------------------------------------------------------------------------------------------


---fighter---------------------------------------------------------------------

fighter =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'fighter', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'fighter', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'fighter', 0)",
	}	

---corvette-------------------------------------------------------------------

corvette =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'corvette', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'corvette', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'corvette', 0)",
	}
	
---frigate-------------------------------------------------------------------

frigate =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'frigate', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'frigate', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'frigate', 0)",	
	}
	
---platform-------------------------------------------------------------------

platform =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'platform', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'platform', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'platform', 0)",	
	}
		
---capital-------------------------------------------------------------------

capital =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'capital', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'capital', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'capital', 0)",
	}
armedcapital =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'armedcapital', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'armedcapital', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'armedcapital', 0)",
	}	
	
---utility-------------------------------------------------------------------

utility =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'utility', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'utility', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'utility', 0)",
	}

---weapon-------------------------------------------------------------------

weapon =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'weapon', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'weapon', 1)",	
	  onHide = "UI_SetButtonPressed('selector', 'weapon', 0)",	
	}
	
---fleet----------------------------------------------------------------------

fleet =  
  {    	
	  claimMousePress = 1,
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'fleet', 0)",},
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 
		onShow = "UI_SetButtonPressed('selector', 'fleet', 1); UI_SetScreenVisible( 'fighter', 1); UI_SetScreenVisible( 'corvette', 1); UI_SetScreenVisible( 'frigate', 1); UI_SetScreenVisible( 'platform', 1); UI_SetScreenVisible( 'utility', 1); UI_SetScreenVisible( 'capital', 1); UI_SetScreenVisible( 'armedcapital', 1); UI_SetScreenVisible( 'weapon', 1)",	
		onHide = "UI_SetButtonPressed('selector', 'fleet', 0); UI_SetScreenVisible( 'fighter', 0); UI_SetScreenVisible( 'corvette', 0); UI_SetScreenVisible( 'frigate', 0); UI_SetScreenVisible( 'platform', 0); UI_SetScreenVisible( 'utility', 0); UI_SetScreenVisible( 'capital', 0); UI_SetScreenVisible( 'armedcapital', 0); UI_SetScreenVisible( 'weapon', 0)",	
	}			
refresh =  
  {    	
	  claimMousePress = 1, 
	  RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'refresh', 0)",}, 
		size = {0, 0, 0, 0},
		stylesheet = "HW2StyleSheet",		
		pixelUVCoords = 1, 	
	}