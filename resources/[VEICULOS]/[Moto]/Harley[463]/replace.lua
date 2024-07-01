-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '463.txd' ) 
engineImportTXD( txd, 463 ) 
dff = engineLoadDFF('463.dff', 463) 
engineReplaceModel( dff, 463 )
end)
