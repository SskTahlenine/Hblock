Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

--- MENU ---

local open = false 
local accueilHblock = RageUI.CreateMenu('	~l~Hblock', Config.pastouche) 
local sousacceil = RageUI.CreateSubMenu(accueilHblock, '	~l~Accueil', Config.pastouche)
accueilHblock.Display.Header = true 
accueilHblock.Closed = function()
  open = false
  nomprenom = nil
  numero = nil
  heurerdv = nil
  rdvmotif = nil
end

--- FUNCTION OPENMENU ---

function accHblock() 
    if open then 
		open = false
		RageUI.Visible(accueilHblock, false)
		return
	else
		open = true 
		RageUI.Visible(accueilHblock, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(accueilHblock, function()

        RageUI.Button("Appellé un Hblock", nil, {RightLabel = "→→"}, not codesCooldown5 , {
            onSelected = function()
            codesCooldown5 = true 
        TriggerServerEvent('accueil:Hblock')
        ESX.ShowNotification('~g~Votre message a bien été envoyé aux membre des Hblock.')
        Citizen.SetTimeout(120000, function() codesCooldown5 = false end)
       end 
    })

    RageUI.Button("Informations Recrutement", nil, {RightLabel = "→→"}, true , {
        onSelected = function()
          end
    }, sousacceil)  



    end)

    RageUI.IsVisible(sousacceil, function()

        RageUI.Separator('	~l~Informations Recrutement Hblock')
        RageUI.Separator('↓')
        RageUI.Separator('	~l~Recrutement ~g~ON')
        RageUI.Separator('	~l~Plus d\'info sur notre Site')
        

    end)
   
         
			
		Wait(0)
	   end
	end)
 end
end


local posacHblock = {
	{x = 77.89, y = -1926.94, z = 20.88}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 500

        for k in pairs(posacHblock) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posacHblock[k].x, posacHblock[k].y, posacHblock[k].z) 

        
            if dist <= 3.0 then
               wait = 0
                Visual.Subtitle("Appuyez sur [	~l~E~w~] pour parler à un 	~l~Hblock", 1) 
                if IsControlJustPressed(1,51) then
                    accHblock()
            end
        end
    Citizen.Wait(wait)
    end
end
end)

-- Peds   
  
local npcHblock = {
	{hash="csb_Hblockog", x = 77.89, y = -1926.94, z = 20.80, a = 326.12},
}

Citizen.CreateThread(function()
	for _, item2 in pairs(npcHblock) do
		local hash = GetHashKey(item2.hash)
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		pedHblock = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
		SetBlockingOfNonTemporaryEvents(pedHblock, true)
		FreezeEntityPosition(pedHblock, true)
		SetEntityInvincible(pedHblock, true)
	end
 end)  
