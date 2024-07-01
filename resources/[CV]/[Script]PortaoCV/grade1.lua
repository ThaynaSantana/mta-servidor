function createTheGate ()
    myGate1 = createObject ( 16773, 2529.6999511719,-1532.0999755859 ,27.10000038147 , 0, 0, 0 )
end
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
function openMyGate ( )
    moveObject ( myGate1, 1000, 2529.6999511719,-1532.0999755859 ,27.10000038147 )
end
addCommandHandler("CV02",openMyGate)


function movingMyGateBack ()
    moveObject ( myGate1, 1000, 2529.6999511719,-1532.0999755859 ,19 )
end
addCommandHandler("CV01",movingMyGateBack)