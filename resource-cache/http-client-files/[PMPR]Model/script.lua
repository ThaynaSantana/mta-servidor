-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD ( "PMPR.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 1905 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "PMPR.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 1905 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "PMPR.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 1905 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(1905, 99999999) --ID do objeto e a distância que ele irá carregar - distancia está como 500
end)