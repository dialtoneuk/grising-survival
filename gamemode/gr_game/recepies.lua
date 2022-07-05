--registers our recipies
hook.Add("RegisterRecipies", "BaseRegisterRecipies", function()
    local recipies = {
        --You add the recipie by the key below to the fabricator directly
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

    GM.RegisterRecipies(recipies)
end)