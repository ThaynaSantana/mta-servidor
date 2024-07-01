-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'wayfarer.txd' ) 
engineImportTXD( txd, 461 ) 
dff = engineLoadDFF('wayfarer.dff', 461) 
engineReplaceModel( dff, 461 )
end)
