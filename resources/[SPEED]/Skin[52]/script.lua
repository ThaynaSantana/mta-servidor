-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByBetinho.txd' ) 
engineImportTXD( txd, 52 ) 
dff = engineLoadDFF('ByBetinho.dff', 52) 
engineReplaceModel( dff, 52 )
end)
