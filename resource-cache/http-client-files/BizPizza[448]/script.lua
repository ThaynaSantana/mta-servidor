-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'sanchez.txd' ) 
engineImportTXD( txd, 448 ) 
dff = engineLoadDFF('sanchez.dff', 448) 
engineReplaceModel( dff, 448 )
end)
