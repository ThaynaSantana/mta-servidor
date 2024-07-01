-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter )

addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),function () 
txd = engineLoadTXD ( 'dft30.txd' ) 
engineImportTXD ( txd, 578 ) 
dff = engineLoadDFF('dft30.dff', 578) 
engineReplaceModel ( dff, 578 )
end)
