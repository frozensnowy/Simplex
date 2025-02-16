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
        { 
            Name = "CoreRight", 
            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
            OffsetFromParent = 
                { -1, 0, 0, }, 
            Children = 
                { 
                { 
                    Name = "CoreRightRight", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "CoreRightUP", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightUPRight", 
                            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreRightDown", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreRightDownRight", 
                            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "CoreLeft", 
            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
            OffsetFromParent = 
                { 1, 0, 0, }, 
            Children = 
                { 
                { 
                    Name = "CoreLeftLeft", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "CoreLeftUP", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftUPLeft", 
                            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "CoreLeftDown", 
                    DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "CoreLeftDownLeft", 
                            DesiredShipTypes = "SmallCapitalShip, BigCapitalShip, Mothership", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, },  
        { 
            Name = "Frigate Front", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { 0, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "FrigateUp", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeft", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateRight", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateLeft", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "FrigateRight", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "FrigateDown", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRight", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        { 
                            Name = "FrigateLeft", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "Fighter Forward", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { 0, 0, 2.5, }, 
            Children = 
                { 
                { 
                    Name = "Fighter Back left", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { -1, 0, -0.5, }, 
                    Children = 
                        { 
                        { 
                            Name = "Fighter Back left", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { -1, 0, -0.25, }, }, 
                        { 
                            Name = "Fighter Back left", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { -2, 0, -0.5, }, }, 
                        }, }, 
                { 
                    Name = "Fighter Back right", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 1, 0, -0.5, }, 
                    Children = 
                        { 
                        { 
                            Name = "Fighter Back right", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 1, 0, -0.25, }, }, 
                        { 
                            Name = "Fighter Back left", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 2, 0, -0.5, }, }, 
                        }, }, 
                { 
                    Name = "Fighter Up", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, 1, -0.5, }, 
                    Children = 
                        { 
                        { 
                            Name = "Fighter up", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 0, 1, -0.25, }, }, 
                        { 
                            Name = "Fighter Back left", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 0, 2, -0.5, }, }, 
                        }, }, 
                { 
                    Name = "Fighter Down", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, -1, -0.5, }, 
                    Children = 
                        { 
                        { 
                            Name = "Fighter Down", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 0, -1, -0.25, }, }, 
                        { 
                            Name = "Fighter Down", 
                            DesiredShipTypes = "Fighter", 
                            OffsetFromParent = 
                                { 0, -2, -0.5, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "Corvette Left", 
            DesiredShipTypes = "Corvette, Utility", 
            OffsetFromParent = 
                { 1, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "Corvette Back", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, 0, -1, }, }, 
                { 
                    Name = "Corvette Up", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, }, 
                }, }, 
        { 
            Name = "Corvette Right", 
            DesiredShipTypes = "Corvette, Utility", 
            OffsetFromParent = 
                { -1, 0, 1, }, 
            Children = 
                { 
                { 
                    Name = "Corvette Back", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, 0, -1, }, }, 
                { 
                    Name = "Corvette Up", 
                    DesiredShipTypes = "Fighter", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, }, 
                }, }, 
        }, }
