function replaceModel()

   local txd = engineLoadTXD ( "bustopm.txd")
   engineImportTXD ( txd, 5521 )

 end
 addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()),
     function()
         replaceModel()
         setTimer (replaceModel, 1000, 1)
     end
)
