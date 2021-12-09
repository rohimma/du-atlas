local output = screen.getScriptOutput()
local shutoff_distance = 50 --export


if #output > 0 then
    screen.clearScriptOutput()
    
    _o = json.decode(output)
    if _o.action == 'clearSearch' then
        search = nil
        sendData()
    end
    if _o.action == '404' then
        system.print("No matches found.")
        search = nil
        sendData()
    end
    if _o.action == 'showOptions' then
        local options = ""
        for i=1, #_o.match do
            local option = _o.match[i][3]
            options = options..option..", "
        end
        if not wait then
            system.print(options)
            wait=true
        end
        
    end
    if _o.action == 'setLocation' then
        system.print("Location Found: "..locations[_o.group].list[_o.location].name)
        system.setWaypoint(locations[_o.group].list[_o.location].location)
        search = nil
        sendData()
    end    
end

local pos = unit.getMasterPlayerPosition()
if vec3(pos):len() > shutoff_distance then
    unit.exit()
end