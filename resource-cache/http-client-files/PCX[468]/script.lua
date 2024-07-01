-- Script feito por lucas/instagram= @lcsss_s --

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'PCX.txd' ) 
engineImportTXD( txd, 468 ) 
dff = engineLoadDFF('PCX.dff', 468) 
engineReplaceModel( dff, 468 )
end)
