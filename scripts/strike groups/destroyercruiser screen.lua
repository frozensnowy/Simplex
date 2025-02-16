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
        
--Small Cap                
        
        { 
            Name = "Frigate Front", 
            DesiredShipTypes = "SmallCapitalShip", 
            OffsetFromParent = 
                { 0, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "FrigateUp", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeft", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateRight", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateLeft", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "FrigateRight", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "FrigateDown", 
                    DesiredShipTypes = "SmallCapitalShip", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRight", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateLeft", 
                            DesiredShipTypes = "SmallCapitalShip", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        
--MS/SY e Super Cap
        
        { 
            Name = "CoreRight", 
            DesiredShipTypes = "BigCapitalShip, Mothership", 
            OffsetFromParent = 
                { -1, 0, 0, }, 
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
                { 1, 0, 0, }, 
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
                

                
--Frigates                       
        
        { 
            Name = "Frigate Front1", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { 0, 0, -1, }, 
            Children = 
                { 
                { 
                    Name = "FrigateUp1", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeft1", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateRight1", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateLeft1", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "FrigateRight1", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "FrigateDown1", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRight1", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateLeft1", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
                                 
--Fighters/Corvette                
        
        { 
            Name = "Frigate Front2", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { 0, 0, -2, }, 
            Children = 
                { 
                { 
                    Name = "FrigateUp2", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeft2", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateRight2", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateLeft2", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "FrigateRight2", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "FrigateDown2", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRight2", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateLeft2", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        }, }
