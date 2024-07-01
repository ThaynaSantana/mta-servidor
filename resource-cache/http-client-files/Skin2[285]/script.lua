-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByKAZIDE.txd' ) 
engineImportTXD( txd, 285 ) 
dff = engineLoadDFF('ByKAZIDE.dff', 285) 
engineReplaceModel( dff, 285 )
end)
