addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '300.txd' ) 
engineImportTXD( txd, 300 ) 
dff = engineLoadDFF('300.dff', 300) 
engineReplaceModel( dff, 300 )
end)