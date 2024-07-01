txd = engineLoadTXD( '37.txd' )
engineImportTXD( txd, 37 )
dff = engineLoadDFF('37.dff', 37)
engineReplaceModel( dff, 37 )