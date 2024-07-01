-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'SAMURAI.txd' ) 
engineImportTXD( txd, 302 ) 
dff = engineLoadDFF('SAMURAI.dff', 302) 
engineReplaceModel( dff, 302 )
end)
