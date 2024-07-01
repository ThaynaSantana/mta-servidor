txd_cristo = engineLoadTXD ( "cristo.txd" )
engineImportTXD ( txd_cristo, 1596 )
col_cristo = engineLoadCOL ( "cristo.col" )
engineReplaceCOL ( col_cristo, 1596 )
dff_cristo = engineLoadDFF ( "cristo.dff", 0 )
engineReplaceModel ( dff_cristo, 1596 )
engineSetModelLODDistance(1596, 500)



