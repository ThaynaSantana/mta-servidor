addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '586.txd' ) 
engineImportTXD( txd, 586 ) 
dff = engineLoadDFF('586.dff', 586) 
engineReplaceModel( dff, 586 )
end)
