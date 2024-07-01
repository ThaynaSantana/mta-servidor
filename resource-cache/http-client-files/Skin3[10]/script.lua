-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByAzXx.txd' ) 
engineImportTXD( txd, 10 ) 
dff = engineLoadDFF('ByAzXx.dff', 10) 
engineReplaceModel( dff, 10 )
end)
