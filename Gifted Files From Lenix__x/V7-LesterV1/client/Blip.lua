CreateThread(function()
	LaPuertaBlip = AddBlipForCoord(vector3(-778.71, 313.15, 85.7))
	SetBlipSprite(LaPuertaBlip, 77)
	SetBlipDisplay(LaPuertaBlip, 4)
	SetBlipScale(LaPuertaBlip, 0.8)
	SetBlipColour(LaPuertaBlip, 2)
    SetBlipAsShortRange(LaPuertaBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Lester")
    EndTextCommandSetBlipName(LaPuertaBlip)
end)