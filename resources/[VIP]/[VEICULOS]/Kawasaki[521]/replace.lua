txd = engineLoadTXD("TenorioLoko.txd")
engineImportTXD(txd, 521)
dff = engineLoadDFF("TenorioLoko.dff", 521)
engineReplaceModel(dff, 521)
