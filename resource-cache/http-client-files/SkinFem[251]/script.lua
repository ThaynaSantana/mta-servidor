-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '251.txd' ) 
engineImportTXD( txd, 251 ) 
dff = engineLoadDFF('251.dff', 251) 
engineReplaceModel( dff, 251 )
end)
