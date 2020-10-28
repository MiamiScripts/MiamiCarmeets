Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/setcarmeet', 'Start a carmeet!', {
    { name="Time", help="How long do you want the blip to last in minutes" }
})
end)

blipActive = false

RegisterCommand('setcarmeet', function(source, args)
	if args[1] == nil then
		TriggerEvent('notification', 'You must enter a time', 2)
	else
		blipActive = true
		TriggerServerEvent("miamicarmeets:chat")
		Citizen.Wait(args[1] * 60000/4)
		TriggerServerEvent("miamicarmeets:chat")
		Citizen.Wait(args[1] * 60000/4)
		TriggerServerEvent("miamicarmeets:chat")
		Citizen.Wait(args[1] * 60000/4)
		TriggerServerEvent("miamicarmeets:chat")
		Citizen.Wait(args[1] * 60000/4)
		TriggerServerEvent("miamicarmeets:chat")
		blipActive = false

	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if blipActive then
				local targetCoords = GetEntityCoords(PlayerPedId())
				local blip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

				SetBlipSprite (blip, Config.Blip.Sprite)
				SetBlipScale  (blip, Config.Blip.Scale)
				SetBlipColour (blip, Config.Blip.Colour)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName(Strings['blip_name'])
				EndTextCommandSetBlipName(blip)
			end
end)
