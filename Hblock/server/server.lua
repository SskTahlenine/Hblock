ESX = nil
local playersHealing, deadPlayers = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Coffre

ESX.RegisterServerCallback('yamsbal:playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end
	

	cb(all_items)

	
end)

ESX.RegisterServerCallback('yamsbal:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ballas', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('yamsbal:putStockItems')
AddEventHandler('yamsbal:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ballas', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('yamsbal:takeStockItems')
AddEventHandler('yamsbal:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ballas', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
	end)
end)


---

-- Peds ballas

RegisterServerEvent('accueil:ballas')
AddEventHandler('accueil:ballas', function()
    
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'ballas' or thePlayer.job2.name == 'ballas' then		
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Ballas', '~p~Appel', 'Un Ballas est appelé au Quartier.', 'CHAR_BLANK_ENTRY', 8)
        end
    end
end)

RegisterNetEvent('yamsoo:achatballas')
AddEventHandler('yamsoo:achatballas', function(item, price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon(item, 50)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)