ESX = exports['es_extended']:getSharedObject()

local inventory = exports["qs-inventory"]

RegisterServerEvent('drug:moneyWash')
AddEventHandler('drug:moneyWash', function(moneyWash)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then

        local dirtyMoney = Config.DirtyMoney

        local minToClean = Config.MoneyWash[moneyWash].minToClean

        if inventory:GetItemTotalAmount(source, dirtyMoney) < minToClean then
            TriggerClientEvent('okokNotify:Alert', source, 'LAVAGEM', 'Você não tem a quantidade necessária para lavar!', 5000, 'error', true)
        else
            inventory:RemoveItem(source, dirtyMoney, minToClean)
            inventory:AddItem(source, 'money', minToClean)

            TriggerClientEvent('okokNotify:Alert', source, 'LAVAGEM', 'Você lavou ' .. minToClean ' de dinheiro sujo' , 5000, 'success', false)

        end

    end

end
)

RegisterServerEvent('drug:collect')
AddEventHandler('drug:collect', function(drug)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local item = Config.Drugs[drug].collectItem

        if inventory:CanCarryItem(source, item, 1) then
            inventory:AddItem(source, item, 1)

            TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você coletou ' .. inventory:GetItemLabel(item), 5000, 'success', false)
        else    
            TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você não tem espaço suficiente! ', 5000, 'error', false)
        end
    end

end)

RegisterServerEvent('drug:process')
AddEventHandler('drug:process', function(drug)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local collectItem = Config.Drugs[drug].collectItem
        local processItem = Config.Drugs[drug].processItem
        
        local minToProcess = Config.Drugs[drug].minToProcess

        if inventory:GetItemTotalAmount(source, collectItem) < minToProcess then
            TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você não tem a quantidade necessária para processar!', 5000, 'error', true)
        else
            if inventory:CanCarryItem(source, processItem, 1) then
                inventory:AddItem(source, processItem, 1)
                inventory:RemoveItem(source, collectItem, 5)
    
                TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você coletou ' .. inventory:GetItemLabel(processItem), 5000, 'success', false)
            else    
                TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você não tem espaço suficiente! ', 5000, 'error', false)
            end
        end   

    end

end)

RegisterServerEvent('drug:sell')
AddEventHandler('drug:sell', function(drug)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local processItem = Config.Drugs[drug].processItem

        local quantityToSell = Config.Drugs[drug].quantityToSell
        local sellValue = Config.Drugs[drug].sellValue

        if inventory:GetItemTotalAmount(source, processItem) < quantityToSell then
            TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você não tem a quantidade necessária para vender!', 5000, 'error', true)
        else

            local dirtyMoney = Config.DirtyMoney

            if inventory:CanCarryItem(source, dirtyMoney, sellValue) then
                inventory:RemoveItem(source, processItem, quantityToSell)
                inventory:AddItem(source, dirtyMoney, sellValue)

                TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você vendeu ' .. inventory:GetItemLabel(processItem), 5000, 'success', false)
            else
                TriggerClientEvent('okokNotify:Alert', source, 'DROGAS', 'Você não tem espaço suficiente! ', 5000, 'error', false)
            end

        end

    end

end)
  
