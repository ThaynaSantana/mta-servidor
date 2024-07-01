function ReplaceSkin()
txd = engineLoadTXD('SKIN1.txd', 140)
engineImportTXD(txd, 140)
dff = engineLoadDFF('SKIN1.dff', 140)
engineReplaceModel(dff, 140)
---------------------------------------
txd = engineLoadTXD('SKIN2.txd', 141)
engineImportTXD(txd, 141)
dff = engineLoadDFF('SKIN2.dff', 141)
engineReplaceModel(dff, 141)
---------------------------------------
txd = engineLoadTXD('SKIN3.txd', 142)
engineImportTXD(txd, 142)
dff = engineLoadDFF('SKIN3.dff', 142)
engineReplaceModel(dff, 142)
--[[---------------------------------------
txd = engineLoadTXD('9.txd', 9)
engineImportTXD(txd, 9)
dff = engineLoadDFF('9.dff', 9)
engineReplaceModel(dff, 9)
---------------------------------------
txd = engineLoadTXD('10.txd', 10)
engineImportTXD(txd, 10)
dff = engineLoadDFF('10.dff', 10)
engineReplaceModel(dff, 10)
---------------------------------------
txd = engineLoadTXD('11.txd', 11)
engineImportTXD(txd, 11)
dff = engineLoadDFF('11.dff', 11)
engineReplaceModel(dff, 11)
---------------------------------------
txd = engineLoadTXD('12.txd', 12)
engineImportTXD(txd, 12)
dff = engineLoadDFF('12.dff', 12)
engineReplaceModel(dff, 12)
---------------------------------------
txd = engineLoadTXD('13.txd', 13)
engineImportTXD(txd, 13)
dff = engineLoadDFF('13.dff', 13)
engineReplaceModel(dff, 13)
---------------------------------------
txd = engineLoadTXD('14.txd', 14)
engineImportTXD(txd, 14)
dff = engineLoadDFF('14.dff', 14)
engineReplaceModel(dff, 14)
---------------------------------------
txd = engineLoadTXD('15.txd', 15)
engineImportTXD(txd, 15)
dff = engineLoadDFF('15.dff', 15)
engineReplaceModel(dff, 15)
---------------------------------------
txd = engineLoadTXD('16.txd', 16)
engineImportTXD(txd, 16)
dff = engineLoadDFF('16.dff', 16)
engineReplaceModel(dff, 16)
---------------------------------------
txd = engineLoadTXD('17.txd', 17)
engineImportTXD(txd, 17)
dff = engineLoadDFF('17.dff', 17)
engineReplaceModel(dff, 17)
---------------------------------------
txd = engineLoadTXD('18.txd', 18)
engineImportTXD(txd, 18)
dff = engineLoadDFF('18.dff', 18)
engineReplaceModel(dff, 18)
---------------------------------------
txd = engineLoadTXD('19.txd', 19)
engineImportTXD(txd, 19)
dff = engineLoadDFF('19.dff', 19)
engineReplaceModel(dff, 19)
---------------------------------------
txd = engineLoadTXD('20.txd', 20)
engineImportTXD(txd, 20)
dff = engineLoadDFF('20.dff', 20)
engineReplaceModel(dff,20)
---------------------------------------
txd = engineLoadTXD('21.txd', 21)
engineImportTXD(txd, 21)
dff = engineLoadDFF('21.dff', 21)
engineReplaceModel(dff,21)
---------------------------------------
txd = engineLoadTXD('22.txd', 22)
engineImportTXD(txd, 22)
dff = engineLoadDFF('22.dff', 22)
engineReplaceModel(dff,22)
---------------------------------------
txd = engineLoadTXD('23.txd', 23)
engineImportTXD(txd, 23)
dff = engineLoadDFF('23.dff', 23)
engineReplaceModel(dff,23)
---------------------------------------
txd = engineLoadTXD('24.txd', 24)
engineImportTXD(txd, 24)
dff = engineLoadDFF('24.dff', 24)
engineReplaceModel(dff,24)
---------------------------------------
txd = engineLoadTXD('25.txd', 25)
engineImportTXD(txd, 25)
dff = engineLoadDFF('25.dff', 25)
engineReplaceModel(dff, 25)
-----------------------------------------]]
end
addEventHandler( 'onClientResourceStart', getResourceRootElement(getThisResource()), ReplaceSkin)