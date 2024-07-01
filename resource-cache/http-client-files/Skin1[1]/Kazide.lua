addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByKAZIDE.txd' ) 
engineImportTXD( txd, 1 ) 
dff = engineLoadDFF('ByKAZIDE.dff', 1) 
engineReplaceModel( dff, 1 )
end)

-- https://www.youtube.com/KAZIDE