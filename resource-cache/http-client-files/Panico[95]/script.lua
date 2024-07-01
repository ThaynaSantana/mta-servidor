function replaceModel() 
  txd = engineLoadTXD("95.txd", 95 )
  engineImportTXD(txd, 95)
  dff = engineLoadDFF("95.dff", 95 )
  engineReplaceModel(dff, 95)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)