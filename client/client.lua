ESX = exports["es_extended"]:getSharedObject()

local ox_target = exports.ox_target
local ox_lib = exports.ox_lib

for moneyWash, data in pairs(Config.MoneyWash) do

    local job = data.job

    ox_target:addSphereZone({
        coords = data.location,
        radius = 1.5,
        options = {
            label = 'Lavar Dinheiro Sujo',
            onSelect = function()

                if ESX.GetPlayerData().job.name ~= job then
                    exports['okokNotify']:Alert('LAVAGEM', 'Não tens permissão para usar isso!', 5000, 'error', true)   
                    
                    return
                end

                lib.progressCircle({
                    duration = 5000,
                    position = 'bottom',
                    label = 'Lavando dinheiro sujo',
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

                TriggerServerEvent('drug:moneyWash', moneyWash)

            end 
        }
    })

end

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

    for _, sellPedLocation in pairs(data.sellPedLocation) do

        local pedModel = `a_m_m_tramp_01`

        RequestModel(pedModel)

        while not HasModelLoaded(pedModel) do
            Wait(10)
        end

        local ped = CreatePed(4, pedModel, sellPedLocation.x, sellPedLocation.y, sellPedLocation.z - 1.0, sellPedLocation.w, false, true)
        
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        ox_target:addLocalEntity(ped, {

            name = 'ped_interact',
            label = 'Vender ' .. data.processItemLabel,
            icon = 'fa-solid fa-handshake',
            onSelect = function()

                lib.progressCircle({
                    duration = 5000,
                    position = 'bottom',
                    label = 'Vendendo ' .. data.processItemLabel,
                    seWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                        combat = true
                    },
                    anim = {
                        dict = "mp_common",
                        clip = "givetake1_a",
                    },
                })

                TriggerServerEvent('drug:sell', drug)

            end

        })

    end

end
