-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '274.txd' ) 
engineImportTXD( txd, 274 ) 
dff = engineLoadDFF('274.dff', 274) 
engineReplaceModel( dff, 274 )
end)
