-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '408.txd' ) 
engineImportTXD( txd, 408 ) 
dff = engineLoadDFF('408.dff', 408) 
engineReplaceModel( dff, 408 )
end)
