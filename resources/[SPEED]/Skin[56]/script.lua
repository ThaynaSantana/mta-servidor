-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByBetinho.txd' ) 
engineImportTXD( txd, 56 ) 
dff = engineLoadDFF('ByBetinho.dff', 56) 
engineReplaceModel( dff, 56 )
end)
