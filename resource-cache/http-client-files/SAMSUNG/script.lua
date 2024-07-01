-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'lanblokb.txd' ) 
engineImportTXD( txd, 4011 ) 
dff = engineLoadDFF('figfree2_lan.dff', 4011) 
engineReplaceModel( dff, 4011 )
end)
