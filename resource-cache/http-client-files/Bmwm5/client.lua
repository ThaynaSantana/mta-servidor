--By Reventon

function AracYukle560()
    local txd = engineLoadTXD ('547.txd')
    engineImportTXD(txd,547)
    local dff = engineLoadDFF('547.dff',547)
    engineReplaceModel(dff,547)
end
addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),AracYukle560)

--By Reventon