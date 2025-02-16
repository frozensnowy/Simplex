
Heartbeat_sendIamAlive      = 3750       -- send an alive game msg after X milliseconds

Heartbeat_aliveTime         = 12500      -- countdown for the alive phase in milliseconds before being dying. 
                                         -- each time a gamemsg is received, the countdown is restarted. Must be greater than ms_sendIamAlive

Heartbeat_dyingTime         = 6250       -- countdown for the dying phase in milliseconds before being dead. 
                                         -- the countdown is restarted and set to alive phase if a gameMsg is received

Migration_timeEstablishingConnection = 6250  -- time (in millisecond) allowed to try to connect with a host before trying with another one
Migration_timeConnected              = 6250  -- time (in millisecond) allowed to stay connected with a host without receiving any new notification from him
Migration_timeAcceptingConnection    = 12500 -- time (in millisecond) allowed to let player connect with the host
Migration_maxLoopOnCaptainList       = 2     -- max nb of time allowed to loop on the captain list before failing to migrate