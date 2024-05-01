local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return end
    if player.PlayerData.job.onduty then
        player.Functions.SetJobDuty(false)
        TriggerClientEvent('ox_lib:alertDialog', source, {
            header = '放置中',
            content = '一定時間放置したため退勤状態になりました',
            centered = true,
            cancel = false
        })
    end
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    cb(QBCore.Functions.GetPermission(source))
end)
