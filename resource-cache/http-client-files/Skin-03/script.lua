-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '165.txd' ) 
engineImportTXD( txd, 165 ) 
dff = engineLoadDFF('165.dff', 165) 
engineReplaceModel( dff, 165 )
end)
