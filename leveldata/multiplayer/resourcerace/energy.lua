local RRPI_PlayerProgress     = 1
local RRPI_PlayerColour       = 2
local RRPN_Parameters         = 3
SCAR_ATITemplates =
{
    playerProgress =
    {        
        --progressBackground =
        {
            mesh =
            {
                colour = {0.7,0.7,0.7,0.5},
                renderFlags = {"scaleX", "scaleY"},
                LODs =
                {
                    0, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
                }
            },
            placement2D =
            {
                factorX = 0.08,
                factorY = 0,
                plusX = 0,
                plusY = 0,
                factorWidth = 0.1,
                factorHeight = 1,
                plusWidth = PixelWidth() * 2,
                plusHeight = PixelHeight() * 2,
                visibility = {},
            },
        },
        --progress =
        {
            floatParam = RRPI_PlayerProgress,
            colourParam = RRPI_PlayerColour,
            mesh =
            {
                renderFlags = {"scaleX", "scaleY", "clipRight"},
                LODs =
                {
                    0, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
                }
            },
            placement2D =
            {
                factorX = 0.08,
                factorY = 0,
                plusX = 0,
                plusY = 0,
                factorWidth = 0.1,
                factorHeight = 1,
                visibility = {},
            },
        },
    },    
}