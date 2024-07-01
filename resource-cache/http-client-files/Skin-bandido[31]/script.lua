txd = engineLoadTXD( 'rando.txd' )
engineImportTXD( txd, 31 )
dff = engineLoadDFF('rando.dff', 31)
engineReplaceModel( dff, 31 )