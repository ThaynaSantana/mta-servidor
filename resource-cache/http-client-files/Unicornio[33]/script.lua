-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'BANCOTDTByCostela.txd' ) 
engineImportTXD( txd, 33 ) 
dff = engineLoadDFF('BANCOTDTByCostela.dff', 33) 
engineReplaceModel( dff, 33 )
end)
