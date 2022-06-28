--registers our recepies
hook.Add("RegisterRecepies", "BaseRegisterRecepies", function()
    local recepies = {
        --You add the recepie by the key below to the fabricator directly
        Wooden_Bowl = {
            Description = "Craft yourself a pretty boring wooden bowl",
            Resources = {
                Wood = 15
            },
            Rewards = {
                Resources = {
                    Wooden_Bowl = 1
                },
                Experience = {
                    --get more crafting skill
                    Crafting = 10
                }
            }
        }
    }

    GM.RegisterRecepies(recepies)
end)