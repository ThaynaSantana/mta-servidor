-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '168.txd' ) 
engineImportTXD( txd, 168 ) 
dff = engineLoadDFF('168.dff', 168) 
engineReplaceModel( dff, 168 )
end)
