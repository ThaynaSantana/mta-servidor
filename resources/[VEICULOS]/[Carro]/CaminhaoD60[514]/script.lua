-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '499.txd' ) 
engineImportTXD( txd, 514 ) 
dff = engineLoadDFF('499.dff', 514) 
engineReplaceModel( dff, 514 )
end)
