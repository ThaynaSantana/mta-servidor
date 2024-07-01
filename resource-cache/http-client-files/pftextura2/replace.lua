function Bz ()
Bztxd = engineLoadTXD ( "2927.txd" )
engineImportTXD ( Bztxd, 2927, 2928, 2929 )

Bz2 = engineLoadTXD ( "3095.txd" )
engineImportTXD ( Bz2, 3095 )

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Bz )