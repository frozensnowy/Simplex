-- This file contains all the UIScreens that will be loaded on startup of the app and on startup of the game.

-- Currently the UI only supports one style sheet, support for multiple stylesheets may be supported in the future if needed.
StyleSheets =
{
	HW2StyleSheet =
	{
		filename = "DATA:\\UI\\NewUI\\Styles\\HW2Styles.lua",
	},
}

-- These screens will be loaded in order of listing...
FrontEndScreens =
{
	;
	{
		name = "Background",
		filename = "DATA:\\UI\\NewUI\\Main\\New\\Background.lua",
		activated = 0,
	},
	-- This is the LuaScript that has the code for the screen
	{
		-- This is the name identifier for the screen.
		name = "NewMainMenu",
		filename = "DATA:\\UI\\NewUI\\Main\\New\\NewMainMenu.lua",
		-- Activate on front end startup (default is zero)
		activated = 0,
		-- Type of menu (default is UIScreen)
		type = "MainMenu",
	},
	{
		name = "CreditsScreen",
		filename = "DATA:\\UI\\NewUI\\creditsscreen.lua",
		activated = 0,
	},
	{
		name = "EULA",
		filename = "DATA:\\UI\\NewUI\\EULA.lua",
		activated = 0,
	},
	{
		name = "meme",
		filename = "DATA:\\UI\\NewUI\\meme.lua",
		activated = 0,
	},
	{
		name = "PasswordScreen",
		filename = "DATA:\\UI\\NewUI\\Shared\\PasswordScreen.lua",
		activated = 0,
	},
	{
		name = "StyleSheetTestScreen",
		filename = "DATA:\\UI\\NewUI\\Styles\\StyleSheetTestScreen.lua",
		activated = 0,
	},
	-- "type" is commented out by default. Careful with this one. It doesn't have a "back" button.
	{
		name = "NotForPublicDisplay",
		filename = "DATA:\\UI\\NewUI\\NotForPublicDisplay.lua",
		activated = 0,
--		type = "NotForPublicDisplay",
	},
	-- don't know if this one needs a "type" (used by functions within Homeworld2.exe)
	{
		name = "ScarProfilerEditBox",
		filename = "DATA:\\UI\\NewUI\\ScarProfilerEditBox.lua",
		activated = 0,
--		type = "ScarProfilerEditBox",
	},
	{
		name = "UserProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPUserProfile.lua",
		activated = 0,
		type = "UserProfile",
	},
	{
		name = "NewProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPNewProfile.lua",
		activated = 0,
		type = "NewProfile",
	},
	{
		name = "MissionSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\MissionSelect.lua",
		activated = 0,
		type = "SPMissionSelect",
	},
	{
		name = "PlayerSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\PlayerSetup.lua",
		activated = 0,
		type = "PlayerSetup",
	},
	{
		name = "EmblemSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\EmblemSelect.lua",
		activated = 0,
		type = "EmblemSelect",
	},
	{
		name = "LobbyScreen",
		filename = "DATA:\\UI\\NewUI\\GameRoom.lua",
		activated = 0,
		type = "LobbyScreen",
	},	
	{
		name = "GameTypeInfo",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameTypeInfo.lua",
		activated = 0,
		type = "GameTypeInfo",
	},
	{
		name = "PatchInfoDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\PatchInfoDialog.lua",
		activated = 0,
		type = "PatchInfoDialog",
	},	
	{
		name = "CreateGameScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\CreateGameScreen.lua",
		activated = 0,
		type = "CreateGameScreen",
	},		
	{
		name = "LobbyTitleRoom",
		filename = "DATA:\\UI\\NewUI\\ServerLobby.lua",
		activated = 0,
		type = "LobbyTitleRoom",
	},		
	{
		name = "PatchScreen",
		filename = "DATA:\\UI\\NewUI\\PatchScreen.lua",
		activated = 0,
		type = "PatchScreen",
	},	
	{
		name = "Stats",
		filename = "DATA:\\UI\\NewUI\\Stats.lua",
		activated = 0,
		type = "Statistics",
	},
	{
		name = "GameSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameSetup.lua",
		activated = 0,
		type = "GameSetup",
	},
	{
		name = "GameSetup_HelpTip",
		filename = "DATA:\\UI\\NewUI\\Shared\\gamesetup_helptip.lua",
		activated = 0,
	},
	{
		-- req'd for ConnectionType
		name = "DirectConnection",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\DirectConnection.lua",
		activated = 0,
		type = "DirectConnectionScreen",
	},
	{
		-- req'd for ConnectionType
		name = "IPConnect",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\IPConnect.lua",
		activated = 0,
		type = "UIDialog",
	},
	-- Warning: DirectConnection and IPConnect must be loaded before this screen
	{
		name = "ConnectionType",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\ConnectionType.lua",
		activated = 0,
		type = "ConnectionType",
	},
	{
		name = "FEGameOptions",
		filename = "DATA:\\UI\\NewUI\\FEGameOptions.lua",
		activated = 0,
		type = "FEGameOptions",
	},
	{
		name = "GameInfoScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameInfoScreen.lua",
		activated = 0,
		type = "GameInfoScreen",
	},	
	{
		name = "GameFilterScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameFilterScreen.lua",
		activated = 0,
		type = "GameFilterScreen",
	},	
		
	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},
	{
		name = "WaitMessage",
		filename = "DATA:\\UI\\NewUI\\WaitMessage.lua",
		activated = 0,
		type = "WaitMessage",
	},
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},
	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},
	{
		name = "PlayMoviesScreen",
		filename = "DATA:\\UI\\NewUI\\PlayMoviesScreen.lua",
		activated = 0,
		type = "PlayMoviesScreen",
	},
}

-- in-between-game screens
TransientScreens =
{
	;
	{
		name = "LoadingScreen",
		filename = "DATA:UI/NewUI/LoadingScreen.lua",
		activated = 0,
	},	
}

-- in-game screens
GameScreens =
{
	;
	--{
		--name = "gallery",
		--filename = "DATA:\\UI\\NewUI\\gallery.lua",
		--activated = 0,
	--},
	--{
		--name = "InGameGalleryVaygr",
		--filename = "DATA:\\UI\\NewUI\\ingamegalleryvaygr.lua",
		--activated = 0,
	--},
	{
		name = "ComplexLogo",
		filename = "DATA:\\UI\\NewUI\\complexlogo.lua",		
		activated = 0,
	},
	{
		name = "Accolades",
		filename = "DATA:\\UI\\NewUI\\accolades.lua",		
		activated = 0,
	},
	{
		name = "Pointer",
		filename = "DATA:\\UI\\NewUI\\Pointer.lua",
		type = "Pointer",
		activated = 1,
	},
	{
		name = "GenericScreen",
		filename = "DATA:\\UI\\NewUI\\Generic.lua",
		activated = 0,
	},			
	{
		name = "ResourceMenu",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
	},
	{
		name = "year1alt",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
	},
	{
		name = "year2alt",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
	},
	--{
		--name = "ResourceMenu1",
		--filename = "DATA:\\UI\\NewUI\\Resource2.lua",
		--activated = 0,
	--},	
	{
		name = "battlearena",
		filename = "DATA:\\UI\\NewUI\\battlearena.lua",
		activated = 0,
	},	
	{
		name = "YearMenu",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
	},
	{
		name = "EnergyMenu",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
	},
	--{
		--name = "GameParameterMenu",
		--filename = "DATA:\\UI\\NewUI\\Resource.lua",
		--activated = 0,
	--},
	{
		name = "rank",
		filename = "DATA:\\UI\\NewUI\\rank.lua",
		activated = 0,
	},
	{
		name = "crisis",
		filename = "DATA:\\UI\\NewUI\\crisis.lua",
		activated = 0,
	},
	{
		name = "hyperspaceout",
		filename = "DATA:\\UI\\NewUI\\hyperspaceout.lua",
		activated = 0,
	},

	{
		name = "easteregg",
		filename = "DATA:\\UI\\NewUI\\easteregg.lua",
		activated = 0,
	},
	{
		name = "general",
		filename = "DATA:\\UI\\NewUI\\general.lua",
		activated = 0,
	},
	{
		name = "gamble",
		filename = "DATA:\\UI\\NewUI\\gamble.lua",
		activated = 0,
	},		
	{
		name = "battlearenamsg",
		filename = "DATA:\\UI\\NewUI\\battlearenamsg.lua",
		activated = 0,
	},			
	{
		name = "rurace",
		filename = "DATA:\\UI\\NewUI\\rurace.lua",
		activated = 0,
	},	
	{
		name = "planet_mercury",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_venus",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_saturn",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_uranus",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
	{
		name = "planet_moon",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_earth",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
	{
		name = "planet_mars",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_jupiter",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_europa",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_io",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_callisto",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		
	{
		name = "planet_ganymeade",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},				
	{
		name = "planet_pluto",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_neptune",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
  {
		name = "planet_list",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_list_beam",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_list_jf",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_list_fs",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
	{
		name = "planet_list_sf",
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
  {
		name = "planet_list_mercury",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_venus",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_earth",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
	{
		name = "planet_list_moon",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},	
  {
		name = "planet_list_mars",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_jupiter",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_io",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
	{
		name = "planet_list_europa",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_callisto",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_ganymeade",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_saturn",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
	{
		name = "planet_list_uranus",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_neptune",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},			
  {
		name = "planet_list_pluto",		
		filename = "DATA:\\UI\\NewUI\\planets.lua",
		activated = 0,
	},		  
	{
		name = "death",
		filename = "DATA:\\UI\\NewUI\\death.lua",
		activated = 0,
	},			
--	{
--		name = "PopMenu",
--		filename = "DATA:\\UI\\NewUI\\Pop.lua",
--		activated = 0,
--	},
	{
		name = "UnitCapInfoPopup",
		type = "UnitCapInfoPopup",
		filename = "DATA:\\UI\\NewUI\\UnitCapInfoPopup.lua",
		activated = 0,
	},
	{
		name = "UnitCapInfoPopup1",
		type = "UnitCapInfoPopup",
		filename = "DATA:\\UI\\NewUI\\UnitCapInfoPopup1.lua",
		activated = 0,
	},
	{
		name = "New1",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},
	{
		name = "New2",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},
	{
		name = "New3",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},	
	{
		name = "New4",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},
	{
		name = "enablemotion",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},
	{
		name = "disablemotion",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},								
	{
		name = "tube1",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},			
	{
		name = "tube2",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},			
	{
		name = "tube3",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},
  {
		name = "planetbar",		
		filename = "DATA:\\UI\\NewUI\\New1.lua",
		activated = 0,
	},			 	
	{
		name = "selector",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},	
	{
		name = "fighter",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},	
	{
		name = "corvette",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "frigate",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "platform",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "utility",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},	
	{
		name = "weapon",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "capital",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},	
	{
		name = "armedcapital",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "fleet",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},		
	{
		name = "refresh",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "haxor",		
		filename = "DATA:\\UI\\NewUI\\selector.lua",
		activated = 0,
	},
	{
		name = "drive",		
		filename = "DATA:\\UI\\NewUI\\drive.lua",
		activated = 0,
	},
	{
		name = "FlightPanel",		
		filename = "DATA:\\UI\\NewUI\\drive.lua",
		activated = 0,
	},
	{
		name = "UnitsMenu",
		filename = "DATA:\\UI\\NewUI\\Units.lua",
		activated = 0,
	},
	{
		name = "ObjectivesList",
		filename = "DATA:\\UI\\NewUI\\ObjectivesList.lua",
		activated = 0,
		type = "ObjectivesList",
	},
	-- Build menu must be loaded before the research menu
	{
		name = "NewBuildMenu",
		filename = "DATA:\\UI\\NewUI\\Build\\FinalBuild.lua",
		activated = 0,
		type = "FinalBuildMenu",	
	},
	{
		name = "NewLaunchMenu",
		filename = "DATA:\\UI\\NewUI\\NewLaunch.lua",
		activated = 0,
		type = "NewLaunchMenu",
	},
	{
		name = "NewResearchMenu",
		filename = "DATA:\\UI\\NewUI\\Research\\Research.lua",
		activated = 0,
		type = "NewResearchMenu",		
	},
	{
		name = "BuildInfo",
		filename = "DATA:\\UI\\NewUI\\Build\\BuildInfo.lua",
		activated = 0,
		type = "BuildInfo",
	},
	{
		name = "ResearchInfo",
		filename = "DATA:\\UI\\NewUI\\Research\\ResearchInfo.lua",
		activated = 0,
		type = "ResearchInfo",
	},
	{
		name = "NewTaskbar",
		filename = "DATA:\\UI\\NewUI\\NewTaskbar.lua",
		activated = 0,
		type = "NewTaskbar",
	},
	{
		name = "EventsScreen",
		filename = "DATA:\\UI\\NewUI\\EventsScreen.lua",
		activated = 0,
		type = "EventsScreen",
	},
	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},
	{
		name = "SubtitleInputScreen",
		filename = "DATA:\\UI\\NewUI\\SubtitleInput.lua",
		activated = 0,
	},
	{
		name = "RightClickMenu",
		filename = "DATA:\\UI\\NewUI\\RightClickMenu.lua",
		activated = 0,
		type = "RightClickMenu",
	},
	{
		name = "DiplomacyScreen",
		filename = "DATA:\\UI\\NewUI\\DiplomacyScreen.lua",
		activated = 0,
		type = "DiplomacyScreen",
	},
	{
		name = "InGameMenu",
		filename = "DATA:\\UI\\NewUI\\InGameMenu.lua",
		activated = 0,
		type = "GameMenu",
	},
	{
		name = "FleetMenu",
		filename = "DATA:\\UI\\NewUI\\FleetMenu.lua",
		activated = 0,
	},
	{	
		name = "TacticsMenu",
		filename = "DATA:\\UI\\NewUI\\TacticsMenu.lua",
		activated = 0,
	},
	{
		name = "StrikeGroupsMenu",
		filename = "DATA:\\UI\\NewUI\\StrikeGroupsMenu.lua",
		activated = 0,
	},
	{
		name = "BuildQueueMenu",
		filename = "DATA:\\UI\\NewUI\\BuildQueueMenu.lua",
		activated = 0,
		type = "BuildQueueMenu",
	},
	{
		name = "ChatScreen",
		filename = "DATA:\\UI\\NewUI\\ChatScreen.lua",
		activated = 0,
		type = "ChatScreen",
	},
	{
		name = "ChatFloating",
		filename = "DATA:\\UI\\NewUI\\ChatFloating.lua",
		activated = 1,
	},
	{
		name = "PlayerLaggingScreen",
		filename = "DATA:\\UI\\NewUI\\PlayerLaggingScreen.lua",
		activated = 0,
		type = "PlayerLaggingScreen",
	},
	{
		name = "SMFiltersMenu",
		filename = "DATA:\\UI\\NewUI\\SMFiltersMenu.lua",
		activated = 0,
		type = "SMFiltersMenu",
	},
	{
		name = "SpeechRecall",
		filename = "DATA:\\UI\\NewUI\\SpeechRecall.lua",
		activated = 0,
		type = "SpeechRecall",
	},
	{
		name = "Gall",
		filename = "DATA:\\UI\\NewUI\\Gall.lua",
		activated = 0,
		--type = "SpeechRecall",
	},
	{
		name = "PauseScreen",
		filename = "DATA:\\UI\\NewUI\\Shared\\PauseScreen.lua",
		activated = 0,
	},
	{
		name = "InGameOptions",
		filename = "DATA:\\UI\\NewUI\\InGameOptions.lua",
		activated = 0,
		type = "InGameOptions",
	},
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},
	{
		name = "GameOverScreen",
		filename = "DATA:\\UI\\NewUI\\GameOverScreen.lua",
		activated = 0,
		type = "GameOverScreen",
	},	
	{
		name = "PlaybackMenu",
		filename = "DATA:\\UI\\NewUI\\Playback\\PlaybackMenu.lua",
		activated = 0,
		type = "PlaybackMenu",
	},

	{
		name = "BadSettings",
		filename = "DATA:\\UI\\NewUI\\BadSettings.lua",
		activated = 0,
		type = "UIDialog",
	},

	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},

	{
		name = "YesNoDialogVictory",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},
	{
		name = "go",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		--type = "UIDialog",
	},	
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},	
	-- Msic player
	{ 
			name = "MusicMenu", 
			filename = "DATA:\\UI\\NewUI\\MusicPlayer.lua", 
			activated = 0, 
	}, 
	{ 
			name = "MusicListMenu", 
			filename = "DATA:\\UI\\NewUI\\MusicList.lua", 
			activated = 0, 
	},
}
