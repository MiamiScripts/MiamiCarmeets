RegisterNetEvent("miamicarmeets:chat")
AddEventHandler("miamicarmeets:chat", function()
	TriggerClientEvent('chatMessage', -1, '^6[ALERT]', { 0, 0, 0 }, " New Carmeet Scheduled")
end)