-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByCaiqueS.txd' ) 
engineImportTXD( txd, 21 ) 
dff = engineLoadDFF('ByCaiqueS.dff', 21) 
engineReplaceModel( dff, 21 )
end)
