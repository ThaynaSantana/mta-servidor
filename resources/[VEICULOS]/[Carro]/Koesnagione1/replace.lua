-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter )

addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),function () 
txd = engineLoadTXD ( '541.txd' ) 
engineImportTXD ( txd, 541 ) 
dff = engineLoadDFF('541.dff', 541) 
engineReplaceModel ( dff, 541 )
end)
