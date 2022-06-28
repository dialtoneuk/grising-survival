--registers our recepies
hook.Add("AfterResourcesLoaded", "RegisterFabricators", function()
    local fabricator = {
        Workbench = {
            Entity = "fabricator_workbench",
            Description = "Basic Workbench",
            --Model = "blah/blah",
            Recepies = {
                Wooden_Bowl = true
            }, --what recepies can be crafted here
            Requirements = {
                Crafting = 5 --must have a crafting level of 5 to use
            },
        },
    }

    GM.RegisterCraftSites(fabricator)
end)