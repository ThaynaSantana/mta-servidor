-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '469.txd' ) 
engineImportTXD( txd, 469 ) 
dff = engineLoadDFF('469.dff', 469) 
engineReplaceModel( dff, 469 )
end)
