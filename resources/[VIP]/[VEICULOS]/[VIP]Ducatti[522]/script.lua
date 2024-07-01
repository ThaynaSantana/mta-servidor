-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'nrg500.txd' ) 
engineImportTXD( txd, 522 ) 
dff = engineLoadDFF('nrg500.dff', 522) 
engineReplaceModel( dff, 522 )
end)