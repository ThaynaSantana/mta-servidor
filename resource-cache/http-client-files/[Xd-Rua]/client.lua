addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('1.txd',true)
engineImportTXD(txd, 1947)
local dff = engineLoadDFF('1.dff', 0)
engineReplaceModel(dff, 1947)
local col = engineLoadCOL('1.col')
engineReplaceCOL(col, 1947)
engineSetModelLODDistance(1947, 500)


end)


--------------------------------------------------------------------------------
----------------------------------------------------- DIREITOS AUTORAIS SEUS CORNOS 

----CASO QUEIRA MAIS MODS BONS FREE É MODELAGEM VENHA PARA NOSSA COMUNIDADE DE MTA LIMK:https://discord.gg/CveAPMGA88
-----------------------------------------------