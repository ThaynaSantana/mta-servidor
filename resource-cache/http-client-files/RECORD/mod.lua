function replaceModel()

   local txd = engineLoadTXD ( "record.txd")
   engineImportTXD ( txd, 6490 )
 end
 addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()),
     function()
         replaceModel()
         setTimer (replaceModel, 1000, 1)
     end
)

-- Col dont load? use this command =)
addCommandHandler("reloadmod", replaceModel)