if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

function RegisterCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function RegisterUsableItem(...)
    QBCore.Functions.CreateUseableItem(...)
end

function ShowNotification(target, text)
	TriggerClientEvent(GetCurrentResourceName()..":showNotification", target, text)
end

function Search(source, name)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if (name == "money") then
        return xPlayer.PlayerData.money['cash']
    elseif (name == "bank") then
        return xPlayer.PlayerData.money['cash'] -- If anyone knows how to get bank balance for QBCore, let me know.
    else
        local item = xPlayer.Functions.GetItemByName(name)
        if item ~= nil then 
            return item.amount
        else
            return 0
        end
    end
end

function AddItem(source, name, amount, metadata)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if (name == "money") then
        return xPlayer.Functions.AddMoney("cash", amount)
    elseif (name == "bank") then
        return xPlayer.Functions.AddMoney("cash", amount) -- If anyone knows how to add to bank balance for QBCore, let me know.
    else
        return xPlayer.Functions.AddItem(name, amount, nil, metadata)
    end
end

function RemoveItem(source, name, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if (name == "money") then
        return xPlayer.Functions.RemoveMoney("cash", amount)
    elseif (name == "bank") then
        return xPlayer.Functions.RemoveMoney("cash", amount) -- If anyone knows how to remove from bank balance for QBCore, let me know.
    else
        return xPlayer.Functions.RemoveItem(name, amount)
    end
end 

function CanAccessGroup(source, data)
    if not data then return true end
    local pdata = QBCore.Functions.GetPlayer(source).PlayerData
    for k,v in pairs(data) do 
        if (pdata.job.name == k and pdata.job.grade.level >= v) then return true end
    end
    return false
end 

function GetIdentifier(source)
    local xPlayer = QBCore.Functions.GetPlayer(source).PlayerData
    return xPlayer.citizenid 
end

function GetPlayerIdentity(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    cb({
        firstname = xPlayer.PlayerData.charinfo.firstname,
        lastname = xPlayer.PlayerData.charinfo.lastname,
        dateofbirth = xPlayer.PlayerData.charinfo.birthdate,
        sex = xPlayer.PlayerData.charinfo.sex, 
        height = "6'0"
    })
end

function DocumentItemHandler(source, item)
    TriggerClientEvent("nc_documents:displayDocument", -1, GetEntityCoords(GetPlayerPed(source)), item.info)
end