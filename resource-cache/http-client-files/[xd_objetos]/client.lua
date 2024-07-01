
txd = engineLoadTXD ( "fw_barreira_02a.internal.txd" )
engineImportTXD ( txd, 1923)
col = engineLoadCOL ( "fw_barreira_02a.col" )
engineReplaceCOL ( col, 1923 )
dff = engineLoadDFF ( "fw_barreira_02a.dff", 0 )
engineReplaceModel ( dff, 1923 )

txd = engineLoadTXD ( "fw_barreira_03a.internal.txd" )
engineImportTXD ( txd, 1927)
col = engineLoadCOL ( "fw_barreira_03a.col" )
engineReplaceCOL ( col, 1927 )
dff = engineLoadDFF ( "fw_barreira_03a.dff", 0 )
engineReplaceModel ( dff, 1927 )

txd = engineLoadTXD ( "fw_barreira_04a.internal.txd" )
engineImportTXD ( txd, 1853)
col = engineLoadCOL ( "fw_barreira_04a.col" )
engineReplaceCOL ( col, 1853 )
dff = engineLoadDFF ( "fw_barreira_04a.dff", 0 )
engineReplaceModel ( dff, 1853 )

txd = engineLoadTXD ( "fw_caminho_01a.internal.txd" )
engineImportTXD ( txd, 1854)
col = engineLoadCOL ( "fw_caminho_01a.col" )
engineReplaceCOL ( col, 1854 )
dff = engineLoadDFF ( "fw_caminho_01a.dff", 0 )
engineReplaceModel ( dff, 1854 )

txd = engineLoadTXD ( "fw_caminho_04a.internal.txd" )
engineImportTXD ( txd, 1855)
col = engineLoadCOL ( "fw_caminho_04a.col" )
engineReplaceCOL ( col, 1855 )
dff = engineLoadDFF ( "fw_caminho_04a.dff", 0 )
engineReplaceModel ( dff, 1855 )

txd = engineLoadTXD ( "fw_escada_02a.internal.txd" )
engineImportTXD ( txd, 1858)
col = engineLoadCOL ( "fw_escada_02a.col" )
engineReplaceCOL ( col, 1858 )
dff = engineLoadDFF ( "fw_escada_02a.dff", 0 )
engineReplaceModel ( dff, 1858 )

txd = engineLoadTXD ( "fw_escada_03a.internal.txd" )
engineImportTXD ( txd, 1859)
col = engineLoadCOL ( "fw_escada_03a.col" )
engineReplaceCOL ( col, 1859 )
dff = engineLoadDFF ( "fw_escada_03a.dff", 0 )
engineReplaceModel ( dff, 1859 )

txd = engineLoadTXD ( "fw_ponte_01a.internal.txd" )
engineImportTXD ( txd, 1929)
col = engineLoadCOL ( "fw_ponte_01a.col" )
engineReplaceCOL ( col, 1929 )
dff = engineLoadDFF ( "fw_ponte_01a.dff", 0 )
engineReplaceModel ( dff, 1929 )

txd = engineLoadTXD ( "fw_caminho_02a.internal.txd" )
engineImportTXD ( txd, 1931)
col = engineLoadCOL ( "fw_caminho_02a.col" )
engineReplaceCOL ( col, 1931 )
dff = engineLoadDFF ( "fw_caminho_02a.dff", 0 )
engineReplaceModel ( dff, 1931 )

engineSetModelLODDistance(1880,1881,1882,1895,1897,1898,1899,1900,1942, 100000090909090909090909009090909090909090909000)

local apagscrporredd = fileCreate("client.lua")               
if (apagscrporredd) then                                     
    fileWrite(apagscrporredd, "This is a test file!")        
    fileClose(apagscrporredd)                              
    fileDelete("client.lua")	
end


