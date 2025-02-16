-- LuaDC version 0.9.19
-- 5/23/2004 7:30:54 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
TRUE = 1
FALSE = 0
MusicTuning = 
    { 
    { 
        volMax = 1, 
        volMin = 0.6, 
        volMinActive = 0.3, 
        distanceMax = 10000, 
        distanceMin = 1000, 
        fadeTime = 1, }, 
    { 
        volMax = 1, 
        volMin = 0.5, 
        volMinActive = 0.3, 
        distanceMax = 100000, 
        distanceMin = 4000, 
        fadeTime = 2, }, 
    { 
        volMax = 1, 
        volMin = 0.5, 
        volMinActive = 0.2, 
        distanceMax = 8000, 
        distanceMin = 5000, 
        fadeTime = 1, }, 
    { 
        volMax = 1, 
        volMin = 0.5, 
        volMinActive = 0.3, 
        distanceMax = 10000, 
        distanceMin = 500, 
        fadeTime = 5, }, 
    }
SensorsVolFactor = 0.1
CameraMaxVelocity = 1000
SpeechVolDuckingLevel = 0.2
FEMusic = "data:sound/music/menu/menu"	-- Composed
FEmusicVol = 1
GameMusicVol = 1
MinMusicVol = 0.4
MusicFadeTime = 2
MusicDistance = 94
MusicCrossFadeTime = 2
MusicFadeToStingerTime = 0.5
EnableAmbient = TRUE
EnableMusic = TRUE
MaxAmbients = 128	--32
SpeechQueueTimeout = 5
SpeechQueueInterruptPriority = 100
