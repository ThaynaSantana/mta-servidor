-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByBetinho.txd' ) 
engineImportTXD( txd, 51 ) 
dff = engineLoadDFF('ByBetinho.dff', 51) 
engineReplaceModel( dff, 51 )
end)
