addEventHandler("onClientResourceStart", resourceRoot, function()

col=engineLoadCOL("hospitalFull1Col.col")
engineReplaceCOL(col, 3997)

txd=engineLoadTXD("hospitalFull1.txd")
engineImportTXD(txd, 3997) --ID de objeto a sustituir

dff=engineLoadDFF("hospitalFull2.dff")
engineReplaceModel(dff, 3997, true)

engineSetModelLODDistance(3997, 700)


removeWorldModel(4003, 800, 1481.08, -1747.03, 33.5234)

removeWorldModel(4173, 2000, 1427.27, -1756.18, 15)

removeWorldModel(4172, 2000, 1534.77, -1756.18, 15)


end)


addEventHandler("onClientResourceStop", resourceRoot, function()
restoreWorldModel(4003, 800, 1481.08, -1747.03, 33.5234) --Banderas
restoreWorldModel(4173, 2000, 1427.27, -1756.18, 15)
restoreWorldModel(4172, 2000, 1534.77, -1756.18, 15)

end)
