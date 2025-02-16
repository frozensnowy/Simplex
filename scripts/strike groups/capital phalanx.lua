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
            Name = "FrigateRight", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { -0.25, 0, -2, }, 
            Children = 
                { 
                { 
                    Name = "FrigateRightRight", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "FrigateRightUP", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRightUPRight", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateRightDown", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateRightDownRight", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "FrigateLeft", 
            DesiredShipTypes = "Frigate, Capturer", 
            OffsetFromParent = 
                { 0.25, 0, -2, }, 
            Children = 
                { 
                { 
                    Name = "FrigateLeftLeft", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "FrigateLeftUP", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeftUPLeft", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "FrigateLeftDown", 
                    DesiredShipTypes = "Frigate, Capturer", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "FrigateLeftDownLeft", 
                            DesiredShipTypes = "Frigate, Capturer", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "Strikecraft and JunkRight", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { -0.15, 0, -3.25, }, 
            Children = 
                { 
                { 
                    Name = "Strikecraft and JunkRightRight", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { -1, 0, 0, }, }, 
                { 
                    Name = "Strikecraft and JunkRightUP", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "Strikecraft and JunkRightUPRight", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "Strikecraft and JunkRightDown", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "Strikecraft and JunkRightDownRight", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { -1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        { 
            Name = "Strikecraft and JunkLeft", 
            DesiredShipTypes = "Fighter, Corvette, Utility", 
            OffsetFromParent = 
                { 0.15, 0, -3.25, }, 
            Children = 
                { 
                { 
                    Name = "Strikecraft and JunkLeftLeft", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 1, 0, 0, }, }, 
                { 
                    Name = "Strikecraft and JunkLeftUP", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, 1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "Strikecraft and JunkLeftUPLeft", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                { 
                    Name = "Strikecraft and JunkLeftDown", 
                    DesiredShipTypes = "Fighter, Corvette, Utility", 
                    OffsetFromParent = 
                        { 0, -1, 0, }, 
                    Children = 
                        { 
                        { 
                            Name = "Strikecraft and JunkLeftDownLeft", 
                            DesiredShipTypes = "Fighter, Corvette, Utility", 
                            OffsetFromParent = 
                                { 1, 0, 0, }, }, 
                        }, }, 
                }, }, 
        }, }
