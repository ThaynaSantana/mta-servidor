-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '10.txd' ) 
engineImportTXD( txd, 200 ) 
dff = engineLoadDFF('10.dff', 200) 
engineReplaceModel( dff, 200 )
end)
