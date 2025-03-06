local ox_target = exports.ox_target
local ox_lib = exports.ox_lib

for drug, data in pairs(Config.Drugs) do

    for _, collectLocation in pairs(data.collectLocations) do

        ox_target:addSphereZone({
            coords = collectLocation,
            radius = 1.5,
            options = {
                label = 'Apanha ' .. data.collectItemLabel,
                onSelect = function()

                    lib.progressCircle({
                        duration = 5000,
                        position = 'bottom',
                        label = 'Apanhando ' .. data.collectItemLabel,
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                             move = true,
                             combat = true
                        },
                        anim = {
                           dict = "amb@prop_human_bum_bin@idle_a",
                            clip = "idle_a",
                        },
                     })

                    TriggerServerEvent('drug:collect', drug)
                end
            }
        })

    end

    for _, processLocation in pairs(data.processLocations) do

        ox_target:addSphereZone({
            coords = processLocation,
            radius = 1.5,
            options = {
                label = 'Processo ' .. data.processItemLabel,
                onSelect = function()

                    lib.progressCircle({
                        duration = 5000,
                        position = 'bottom',
                        label = 'Processando ' .. data.processItemLabel,
                        seWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            combat = true
                        },
                        anim = {
                            dict = "amb@prop_human_bum_bin@idle_a",
                            clip = "idle_a",
                        },
                    })

                    TriggerServerEvent('drug:process', drug)
                end
                
            }
        })
        
    end
end
