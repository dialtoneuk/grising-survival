--registers our recepies
hook.Add("PostGamemodeLoaded","RegisterCraftSites", function()

   local craftsites = {
        Stone_Workbench = {
            Entity = "gs_stone_workbench",
            Recepies = {
                "Wooden_Bowl"
            },
            SkillRequirements = {}
        },
        Iron_Workbench = {
            Entity = "gs_stone_workbench",
            Recepies = {
                "Wooden_Bowl"
            },
            SkillRequirements = {
                Blacksmithing = 1 -- must be blacksmithing level 1 to use
            }
        }
   }

   GM.RegisterCraftSites(craftsites)
end)
