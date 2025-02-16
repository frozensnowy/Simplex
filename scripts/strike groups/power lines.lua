-- LuaDC version 0.9.19
-- 5/23/2004 7:23:48 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
strikegroup = 
{ 
    Name = "Core", 
    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
    OffsetFromParent = 
        { 0, 0, 0, }, 
    Children = 
        { 
        
--MS/SY e Super Cap
        
        { 
            Name = "CoreRight", 
            DesiredShipTypes = "BigCapitalShip, Mothership", 
            OffsetFromParent = 
                { -1, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "CoreRightRight", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "CoreRightUP", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightUPRight", 
                            DesiredShipTypes = "BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreRightDown", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightDownRight", 
                            DesiredShipTypes = "BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "CoreLeft", 
            DesiredShipTypes = "BigCapitalShip, Mothership", 
            OffsetFromParent = 
                { 1, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "CoreLeftLeft", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "CoreLeftUP", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftUPLeft", 
                            DesiredShipTypes = "BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreLeftDown", 
                    DesiredShipTypes = "BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftDownLeft", 
                            DesiredShipTypes = "BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
                
--Small Cap                
        
        { 
            Name = "CoreRight1", 
            DesiredShipTypes = "SmallCapitalShip", 
            OffsetFromParent = 
                { -1, 0.25, 0, }, 
            Children = 
                { 
                { 
                    Name = "CoreRightRight1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "CoreRightUP1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightUPRight1", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreRightDown1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightDownRight1", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "CoreLeft1", 
            DesiredShipTypes = "SmallCapitalShip", 
            OffsetFromParent = 
                { 1, 0.25, 0, }, 
            Children = 
                { 
                { 
                    Name = "CoreLeftLeft1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "CoreLeftUP1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftUPLeft1", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreLeftDown1", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftDownLeft1", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
                
--Frigates                       
        
        { 
            Name = "CoreRight2", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { -1, 0.5, -1, }, 
            Children = 
                { 
                { 
                    Name = "CoreRightRight2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "CoreRightUP2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightUPRight2", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreRightDown2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightDownRight2", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "CoreLeft2", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { 1, 0.5, -1, }, 
            Children = 
                { 
                { 
                    Name = "CoreLeftLeft2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "CoreLeftUP2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftUPLeft2", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreLeftDown2", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftDownLeft2", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
                                 
--Fighters/Corvette                
        
        { 
            Name = "CoreRight3", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { -1, 0.75, -2, }, 
            Children = 
                { 
                { 
                    Name = "CoreRightRight3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "CoreRightUP3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightUPRight3", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreRightDown3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightDownRight3", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "CoreLeft3", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { 1, 0.75, -2, }, 
            Children = 
                { 
                { 
                    Name = "CoreLeftLeft3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "CoreLeftUP3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftUPLeft3", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreLeftDown3", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftDownLeft3", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        }, }
