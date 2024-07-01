-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'cc.txd' ) 
engineImportTXD( txd, 44 ) 
dff = engineLoadDFF('ryder2.dff', 44) 
engineReplaceModel( dff, 44 )
end)
