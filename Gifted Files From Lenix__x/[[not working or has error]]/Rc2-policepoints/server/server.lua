local QBCore = exports[Rc2store.Core]:GetCoreObject()



QBCore.Commands.Add(Rc2store.CheckPointsCommand, 'Check your police points', {}, false, function(source, args)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.PlayerData.job.name == 'police' then
        TriggerClientEvent('QBCore:Notify', source, 'Police Points: ' .. xPlayer.PlayerData.metadata['policepoints'],
            'success', 7000)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You Cant use that',
            'error', 7000)
    end
end)
RegisterNetEvent('Rc2-police:addpoints', function(amt)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.PlayerData.job.name == 'police' then
        xPlayer.Functions.SetMetaData('policepoints', xPlayer.PlayerData.metadata['policepoints'] + amt)
        TriggerClientEvent('QBCore:Notify', source, 'You received : ' .. amt .. " police point",
            'success', 7000)
    end
end)
RegisterNetEvent('Rc2-police:giveppoints', function(id, amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local p = QBCore.Functions.GetPlayerByCitizenId(id)
    local globalinfo = Player.PlayerData.metadata['policepoints']
    if p then
        p.Functions.SetMetaData('policepoints', p.PlayerData.metadata['policepoints'] + amt)
        TriggerClientEvent('QBCore:Notify', p.PlayerData.source, 'You received : ' .. amt .. " police points",
            'success', 7000)
            QBCore.Functions.CreateLog(
                "copspoint",
                "LSPD Point System",
                "green",
                "**"..GetPlayerName(src) .. "** **"..p.."** Have earned new XP Points  **"..globalinfo['policepoints'].."**",
                false
            )
    end
end)
RegisterNetEvent('Rc2-police:rmvppoints', function(id, amt)
    local src = source
    local p = QBCore.Functions.GetPlayerByCitizenId(id)
    local Player = QBCore.Functions.GetPlayer(src)
    local globalinfo = Player.PlayerData.metadata['policepoints']
    if p.PlayerData.metadata['policepoints'] - amt < 0 then
        return TriggerClientEvent('QBCore:Notify', source, "Oh Oh be careful for the player points",
            'error', 7000)
    end
    if p then
        p.Functions.SetMetaData('policepoints', p.PlayerData.metadata['policepoints'] - amt)
        TriggerClientEvent('QBCore:Notify', p.PlayerData.source, amt .. " police points was removed from u",
            'success', 7000)
            QBCore.Functions.CreateLog(
                "copspoint",
                "LSPD Point System",
                "red",
                "**"..GetPlayerName(source) .. "** **"..p.."** Have remove XP Points  **"..globalinfo['policepoints'].."**",
                false

            )
    end
end)
RegisterNetEvent('Rc2-police:rmvallppp', function(id)
    local p = QBCore.Functions.GetPlayerByCitizenId(id)
    if p then
        p.Functions.SetMetaData('policepoints', 0)
        return TriggerClientEvent('QBCore:Notify', source, "Oh Oh be careful for the player points",
        'error', 7000)
    end
end)
QBCore.Functions.CreateCallback('Rc2-playermanagement:server:getpoliceofficers', function(source, cb, args)
    local players = {}
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == 'police' then
            table.insert(players, {
                firstname = v.PlayerData.charinfo.firstname,
                lastname = v.PlayerData.charinfo.lastname,
                job = v.PlayerData.job.name,
                grade = v.PlayerData.job.grade.name,
                cid = v.PlayerData.citizenid,
                ppoints = v.PlayerData.metadata['policepoints'],
                playerid = v.PlayerData.source

            })
        end
    end
    cb(players)
end)    
