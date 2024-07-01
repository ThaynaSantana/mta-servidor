-- server.lua

function discord()
	outputChatBox("Entre no nosso servidor do discord, convite -> discord.gg/MkGcArPhbM")
end

function list_commands()
	outputChatBox("LISTA DE COMANDOS DO BRASILIA RP")
	outputChatBox("---------------------------------------")
	outputChatBox("/192  -> CHAMA SAMU")
	outputChatBox("/continencia -> ANIMAÇÃO DE RESPEITO")
	outputChatBox("B - INVENTARIO")
	outputChatBox("M - Ativa/Desativa CURSOR DO MOUSE")
	outputChatBox("X - MAOS PARA CIMA")
	outputChatBox("F3 - PAINEL DE CONFIG. MIRA")
	outputChatBox("F5 - PAINEL ACESSO VIP")
end

addCommandHandler("discord", discord)
addCommandHandler("ajuda", list_commands)