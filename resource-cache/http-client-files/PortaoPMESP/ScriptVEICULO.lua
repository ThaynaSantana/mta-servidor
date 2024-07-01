-- Veículos do PACK PMESP --
--------------------- R O C A M ---------------------
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'VTR1.txd' ) 
engineImportTXD( txd, 523 ) 
dff = engineLoadDFF('VTR1.dff', 523) 
engineReplaceModel( dff, 523 )
end)
------------------------------------------------------
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'VTR2.txd' ) 
engineImportTXD( txd, 490 ) 
dff = engineLoadDFF('VTR2.dff', 490) 
engineReplaceModel( dff, 490 )
end)
------------------------------------------------------
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'VTR3.txd' ) 
engineImportTXD( txd, 497 ) 
dff = engineLoadDFF('VTR3.dff', 497) 
engineReplaceModel( dff, 497 )
end)
----------------------------------------------------
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'VTR4.txd' ) 
engineImportTXD( txd, 598 ) 
dff = engineLoadDFF('VTR4.dff', 598) 
engineReplaceModel( dff, 598 )
end)
