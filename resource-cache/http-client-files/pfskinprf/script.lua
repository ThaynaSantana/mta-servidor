-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by Mosquitin

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'MsQ.txd' ) 
engineImportTXD( txd, 14 ) 
dff = engineLoadDFF('MsQ.dff', 14) 
engineReplaceModel( dff, 14 )
end)
