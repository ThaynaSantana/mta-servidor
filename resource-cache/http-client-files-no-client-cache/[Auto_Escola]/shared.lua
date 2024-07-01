local noLicenseText = {
	["car"] = "Você não tem permissão para dirigir! Obtenha sua carteira de motorista primeiro.",
	["bus"] = "Você não possui licença para transporte de passageiros.",
	["truck"] = "Você não tem licença para operar um transporte de carga.",
	["bike"] = "Você não tem carteira de motorista.",
	["heli"] = "Você não sabe pilotar um helicóptero.",
	["plane"] = "Você não sabe pilotar um avião.",
	["boat"] = "Você não sabe como conduzir o transporte aquático.",
	["spec"] = "Você não tem permissão para usar veículos especiais."
}

function outputNoLicense(licType, player)
	local text = noLicenseText[licType] or "Você não pode controlar isso!"
	outputBadMessage(text, player)
end

function outputNoLicenseClient(licType)
	local text = noLicenseText[licType] or "Você não pode controlar isso!"
	outputChatBox("[Escola de condução] #FF3232"..text, 255,253,208, true)
end

price = {
	bikeExam =	{num =  10000, str =  "10 000 $"},
	carExam =	{num =  18000, str =  "18 000 $."},
	truckExam =	{num =  30000, str =  "30 000 $."},
	busExam =	{num =  30000, str =  "30 000 $."},
	specExam =	{num = 100000, str = "100 000 $."},
	boatExam =	{num = 100000, str = "100 000 $."},
	heliExam =	{num = 100000, str = "100 000 $."},
	planeExam =	{num = 100000, str = "100 000 $."}
}

function getExamPrice(examType)
	examType = tostring(examType).."Exam"
	return (price[examType]) and (price[examType].num) or 0
end
