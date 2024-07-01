
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '217.txd' ) 
engineImportTXD( txd, 217 ) 
dff = engineLoadDFF('217.dff', 217 ) 
engineReplaceModel( dff, 217 )
end)


  -- ✖  Postador:+TenorioLoko  ✖   -- ✖  Postador:+TenorioLoko  ✖   -- ✖  Postador:+TenorioLoko  ✖  