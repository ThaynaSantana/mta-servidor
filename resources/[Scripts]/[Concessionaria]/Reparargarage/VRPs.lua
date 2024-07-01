local Garagem1 = createColSphere (1779.731, -1769.535, 13.6, 30 )
function showVehicleName ( thePlayer )
   local theVehicle = getPedOccupiedVehicle ( thePlayer )
   if theVehicle then
      exports["fipi_infobox"]:addBox ( "Name of the Vehicle: " .. getVehicleName ( theVehicle ), thePlayer )
   else
      exports["fipi_infobox"]:addBox(source, "Se Precisar De Reparar Faz /reparar dentro da garagem | 7500€  ", "info")
   end
end
addCommandHandler ( "getcarname", showVehicleName )


function reparar(source)
   local vehicle = getPedOccupiedVehicle(source)
   
   if not vehicle then
       exports["fipi_infobox"]:addBox("You are not in a vehicle.", source)
       return
   end
   
   local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
   
   if playerMoney < 7500 then
       exports["fipi_infobox"]:addBox("Você não tem dinheiro suficiente para consertar o veículo.", source)
       return
   end
   
   if isElementWithinColShape(source, Garagem1) then
       exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
       
       setElementFrozen(vehicle, true)
       exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
       
       setTimer(function()
           fixVehicle(vehicle)
           setElementFrozen(vehicle, false)
           toggleAllControls(source, true)
       end, 10000, 1)
   else
       exports["fipi_infobox"]:addBox("Você não está na área de reparo.", source)
   end
end

addCommandHandler("reparar", reparar)



----------- GARAGEM 2
local Garagem2 = createColSphere(2857.017, -2020.107, 10.945, 10)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem2) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)



----------- GARAGEM 3
local Garagem3 = createColSphere(1084.554, -1755.482, 13.367, 25)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem3) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)



----------- GARAGEM 4
local Garagem4 = createColSphere(335.475, -1799.579, 4.798, 25)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem4) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)


----------- GARAGEM5
local x = 1500.0
local y = -1500.0
local z = 10.0
local radius = 5.0

local Garagem5 = createColSphere(x, y, z, radius)


function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if exports["fipi_inventory"]:getItem(source, "Dinheiro") >= 7500 then 
        if isElementWithinColShape(source, Garagem5) then
            exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000) 
            setElementFrozen(vehicle, true)
            
            exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
            
            setTimer(function()
                fixVehicle(vehicle)
                setElementFrozen(vehicle, false)
                toggleAllControls(source, true)
                setVehicleDamageProof(vehicle, false)
            end, 10000, 1)
        else
            exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
        end
    end
end
addCommandHandler("reparar", reparar)


----------- GARAGEM6
local Garagem6 = createColSphere(768.938, -1025.505, 24.088, 15)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€","info" )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem6) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)


----------- GARAGEM7
local Garagem7 = createColSphere(706.688, -1357.429, -5, 20)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem7) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)



----------- GARAGEM8
local Garagem8 = createColSphere(732.582, -1529.176, -0.55, 20)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem8) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)


----------- GARAGEM9
local Garagem9 = createColSphere(706.688, -1357.429, -5, 20)

function showVehicleName(thePlayer)
    local theVehicle = getPedOccupiedVehicle(thePlayer)
    if theVehicle then
        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
    else
        exports["fipi_infobox"]:addBox(
            source,
            "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€",
            "info"
        )
    end
end

addCommandHandler("getcarname", showVehicleName)

function reparar(source)
    local vehicle = getPedOccupiedVehicle(source)
    
    if not vehicle then
        exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
        return
    end
    
    local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
    
    if playerMoney < 7500 then
        exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
        return
    end
    
    if isElementWithinColShape(source, Garagem9) then
        exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
        
        setElementFrozen(vehicle, true)
        exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
        
        setTimer(function()
            fixVehicle(vehicle)
            setElementFrozen(vehicle, false)
            toggleAllControls(source, true)
            setVehicleDamageProof(vehicle, false)
        end, 10000, 1)
    else
        exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
    end
end
addCommandHandler("reparar", reparar)


    ----------- GARAGEM10
    local Garagem10 = createColSphere(627.294, -601.609, 16.624, 15)

    function showVehicleName(thePlayer)
        local theVehicle = getPedOccupiedVehicle(thePlayer)
        if theVehicle then
            exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
        else
            exports["fipi_infobox"]:addBox(source, "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€", "info")
        end
    end
    addCommandHandler("getcarname", showVehicleName)
    
    function reparar(source)
        local vehicle = getPedOccupiedVehicle(source)
        
        if not vehicle then
            exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
            return
        end
        
        local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
        
        if playerMoney < 7500 then
            exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
            return
        end
        
        if isElementWithinColShape(source, Garagem10) then
            exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
            
            setElementFrozen(vehicle, true)
            exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
            
            setTimer(function()
                fixVehicle(vehicle)
                setElementFrozen(vehicle, false)
                toggleAllControls(source, true)
                setVehicleDamageProof(vehicle, false)
            end, 10000, 1)
        else
            exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
        end
    end
    addCommandHandler("reparar", reparar)
    

        ----------- GARAGEM11
        local Garagem11 = createColSphere(1202.174, 143.882, 22.922, 7)

        function showVehicleName(thePlayer)
            local theVehicle = getPedOccupiedVehicle(thePlayer)
            if theVehicle then
                exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
            else
                exports["fipi_infobox"]:addBox(source, "Se precisar de reparos, use /reparar dentro da garagem | Custo: 7500€", "info")
            end
        end
        addCommandHandler("getcarname", showVehicleName)
        
        function reparar(source)
            local vehicle = getPedOccupiedVehicle(source)
            
            if not vehicle then
                exports["fipi_infobox"]:addBox(source, "Você deve estar em um veículo para usar este comando.", "error")
                return
            end
            
            local playerMoney = exports["fipi_inventory"]:getItem(source, "Dinheiro")
            
            if playerMoney < 7500 then
                exports["fipi_infobox"]:addBox(source, "Você não tem dinheiro suficiente para consertar o veículo.", "error")
                return
            end
            
            if isElementWithinColShape(source, Garagem11) then
                exports["fipi_progressbar"]:createProgress(source, "Reparando...", 10000)
                
                setElementFrozen(vehicle, true)
                exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
                
                setTimer(function()
                    fixVehicle(vehicle)
                    setElementFrozen(vehicle, false)
                    toggleAllControls(source, true)
                    setVehicleDamageProof(vehicle, false)
                end, 10000, 1)
            else
                exports["fipi_infobox"]:addBox(source, "Vocé está Reparando o Seu Veiculo", "success")
            end
        end
        addCommandHandler("reparar", reparar)
        

            ----------- GARAGEM12
            local GARAGEM12 = createColSphere(1942.068, -2085.338, 13.556, 10)

            function showVehicleName(thePlayer)
                local theVehicle = getPedOccupiedVehicle(thePlayer)
                if theVehicle then
                    exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
                else
                    exports["fipi_infobox"]:addBox(source, "Se Precisar De Reparar Faz /reparar dentro da garagem | 7500€", "info")
                end
            end
            addCommandHandler("getcarname", showVehicleName)
            
            function reparar(source)
                local vehicle = getPedOccupiedVehicle(source)
                if vehicle then
                    local money = exports["fipi_inventory"]:getItem(source, "Dinheiro")
                    if money >= 7500 then
                        if isElementWithinColShape(source, GARAGEM12) then
                            exports["fipi_progressbar"]:createProgress(source, "A Reparar...", 10000)
                            setElementFrozen(vehicle, true)
                            exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
                            setTimer(function()
                                fixVehicle(vehicle)
                                setElementFrozen(vehicle, false)
                                toggleAllControls(source, true)
                                setVehicleDamageProof(vehicle, false)
                            end, 10000, 1)
                        end
                    else
                        exports["fipi_infobox"]:addBox("Não tens dinheiro suficiente para reparar o veículo.", source)
                    end
                else
                    exports["fipi_infobox"]:addBox("Tens de estar dentro de um veículo para o reparar.", source)
                end
            end
            addCommandHandler("reparar", reparar)
            

                ----------- GARAGEM13
                local GARAGEM13 = createColSphere(1661.074, 993.782, 10.82, 10)

                function showVehicleName(thePlayer)
                    local theVehicle = getPedOccupiedVehicle(thePlayer)
                    if theVehicle then
                        exports["fipi_infobox"]:addBox("Name of the Vehicle: " .. getVehicleName(theVehicle), thePlayer)
                    else
                        exports["fipi_infobox"]:addBox(thePlayer, "Se Precisar De Reparar Faz /reparar dentro da garagem | 7500€", "info")
                    end
                end
                addCommandHandler("getcarname", showVehicleName)
                
                function reparar(source)
                    local vehicle = getPedOccupiedVehicle(source)
                    if vehicle then
                        local money = exports["fipi_inventory"]:getItem(source, "Dinheiro")
                        if money >= 7500 then
                            if isElementWithinColShape(source, GARAGEM13) then
                                exports["fipi_progressbar"]:createProgress(source, "A Reparar...", 10000) 
                                setElementFrozen(vehicle, true)
                                exports["fipi_inventory"]:takeItem(source, "Dinheiro", 7500)
                                setTimer(function()
                                    fixVehicle(vehicle)
                                    setElementFrozen(vehicle, false)
                                    toggleAllControls(source, true)
                                    setVehicleDamageProof(vehicle, false)
                                end, 10000, 1)
                            end
                        else
                            exports["fipi_infobox"]:addBox("Não tens dinheiro suficiente para reparar o veículo.", source)
                        end
                    else
                        exports["fipi_infobox"]:addBox("Tens de estar dentro de um veículo para o reparar.", source)
                    end
                end
                addCommandHandler("reparar", reparar)
                

    
                local mec1 = createMarker(1495.311, -1481.876, 12.56, "cylinder", 1.1, 75, 0, 130, 0)

                function repararmec(hitElement)
                    if getElementType(hitElement) == "player" and getPedOccupiedVehicle(hitElement) then
                        local vehicle = getPedOccupiedVehicle(hitElement)
                        if getElementData(hitElement, "MecanicoVRP") then
                            fixVehicle(vehicle)
                        end
                    end
                end
                addEventHandler("onMarkerHit", mec1, repararmec)
                
                local mec2 = createMarker(1487.911, -1482.023, 12.56, "cylinder", 1.1, 75, 0, 130, 0)
                -- You can add a similar function for mec2 if needed
                


                function repararmec2(hitElement)
                  if getElementType(hitElement) == "player" and getPedOccupiedVehicle(hitElement) then
                      local vehicle = getPedOccupiedVehicle(hitElement)
                      if getElementData(hitElement, "MecanicoVRP") then
                          fixVehicle(vehicle)
                      end
                  end
              end
              addEventHandler("onMarkerHit", mec2, repararmec2)
              
  