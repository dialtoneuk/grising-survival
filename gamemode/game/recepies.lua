--registers our recepies
hook.Add("PostGamemodeLoaded","RegisterRecepies", function()

    local recepies = {
        Wooden_Bowl = {
            Ingredients = {
                Wood = 15
            },
            Amount = 1,
            SkillAdvancements = {
                --get more crafting skill
                Crafting = 10
            }
        },
        --admin only
        Special_Wooden_Bowl = {
            Ingredients = {
                Wood = 15
            },
            Item = "Wooden_Bowl", --item
            Amount = 1,
            Admin = true,
        },
        --admin only
        Weapon = {
            Ingredients = {
                Wood = 15
            },
            Rewards = {
                Items = {
                    Wooden_Bowl = 1
                },
                Weapons = {
                    "gms_weapon"
                },
                Entities = {
                    "gms_entity"
                }
            },
            Amount = 1,
            Admin = true,
            SkillAdvancements = {
                --implicit _Crafting skill
                Weapons_Crafting = 10
            }
        },
    }

    GM.RegisterRecepies(recepies)
end)
