-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'wayfarer.txd' ) 
engineImportTXD( txd, 469 ) 
dff = engineLoadDFF('wayfarer.dff', 469) 
engineReplaceModel( dff, 469 )
end)
