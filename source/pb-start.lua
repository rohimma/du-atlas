screen.activate()
system.print("Starting DU Destinations.  Type a search term.")
local r = 225 --export: red between 0 and 1
local g = 0 --export: green between 0 and 1
local b = 0 --export: blue between 0 and 1
search = nil
wait = false
function handleTextCommand(t) 
    wait = false
    if t == "clear" then
        search = nil
        sendData()
        return
    end
    search = t   
    system.print("Searching for: \""..t.."\"")
    sendData()
end



unit.hide()
system.createWidgetPanel('DU-Atlas v1.2')



screen.setRenderScript([[



function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


local json = require('dkjson')    
    local rslib=require('rslib')

    local speed = 3 --export
    local cornerRadius = 5 --export
    local rd = cornerRadius
    
    rslib.drawQuickImage("assets.prod.novaquark.com/74927/4caa44d4-757f-4fe8-b52e-f0021ae4693d.png")
    
    local l = createLayer()
    local l2 = createLayer()
local l4 = createLayer()
    local rx, ry = getResolution()

    
    setNextFillColor(l,0,0,0,0.5)
    addBox(l,0,0,rx,ry)

    setDefaultShadow(l2,Shape_BoxRounded,10,0,0,0,0.5)
    setDefaultShadow(l2,Shape_Box,10,0,0,0,0.5)
    

    local fontSize = 20 --export: List font size
    local font = loadFont("Montserrat-Light", fontSize)
    local fontB = loadFont("Montserrat-Bold", fontSize)
    local fontC = loadFont("Play",25)
    local fma, fmd = getFontMetrics(font)
    local params = json.decode(getInput()) or {}
    local cx, ch = getCursor()


    local r = params[1]
    local g = params[2]
    local b = params[3]
    local list = params[4]
    local search = params[5]
    

    if not iteration then
        iteration = 0
    end

    if not tab then
        tab = 1
    end
    
    

    headerH = (ry / 100) * 10
    
  
    aantalHeaders = #list
    headerW = rx / aantalHeaders

    for i=1, #list do
        local locationgroup = list[i]
        local name = locationgroup.n
        
        local x = (i-1)*headerW
        local y = 0
        local nextFont = font
        if cx > x and cx < x + headerW and ch > y and ch < y + headerH then
            setNextFillColor(l2, r, g, b, 1)
        
            if getCursorDown() then
                tab = i
                iteration = 0
            end
            nextFont = fontB
        elseif tab == i then
            setNextFillColor(l2, r, g, b, 1)
            nextFont = fontB
        else 
            setNextFillColor(l2, r/500, g/500, b/500, 1)
        end
        setNextStrokeWidth(l2,3)
        setNextStrokeColor(l2,0,0,0,0.7)
        addBox(l2, x, y, headerW, headerH)
        local tbw, tbh = getTextBounds(font, name)
        addText(l2, nextFont, name, x + (headerW / 2) - (tbw / 2), headerH/2 + tbh/2)
    end

    --
    -- End top
    --
	
	
	function displayList(list, tab )
		for y=1, #list do
			local item = list[y]
		
			local boxStartH = listOffset

			if ch > boxStartH-animationOffset and ch < boxStartH + boxH - animationOffset and cx < boxW then
				setNextFillColor(l, r, g, b, 0.5)
			     if tab  then
                    specialTab = tab
                    else
                       specialTab = list[y].tab
                    end
				if getCursorDown() then
					setOutput(json.encode({
						action = "setLocation",
						group = specialTab,
						location = y
					}))
					setNextFillColor(l, r, g, b, 0.7)
				end
			
				setNextStrokeColor(l, 1, 1, 1, 1)
			else
				setNextFillColor(l,0,0,0,0.8)
				setNextStrokeColor(l, r, g, b, 0.3)
			end
			
			setNextStrokeWidth(l, 2)
			
			addBoxRounded(l, 10, boxStartH - animationOffset, boxW-20, boxH, rd)
			
			local text = item
			local tbw, tbh = getTextBounds(font, text)
			addText(l, font, text, boxW/2-tbw/2, boxStartH + boxH/2 + tbh/2 - animationOffset)
			
			listOffset = listOffset + boxH + padding	
		end
	end
	
	
	--
	-- Search
	-- 
	
	

	function displayMatches(matches,s) 
		
		setNextFillColor(l4,1,1,1,0.8)
		addBoxRounded(l4, rx* 8/10, ry * 8/10, rx*1/5, ry * 1/5,5)
		fontSearchTitle = loadFont("Monserrat-Light", 30)
          setNextTextAlign(l4, AlignH_Center, AlignV_middle)
		addText(l4,fontSearchTitle,"Searching for: \""..s.."\"", rx/2,headerH*2)
		
		for j=1, matches do
			--
		end
	end
	
	function findMatches(list, s)
		local matches = {}
		for x=1, #list do
			for y=1, #list[x].l do
				local item = list[x].l[y]
				local i = 0
				while true do
					i = string.find(item:lower(), s:lower(), i+1)
					
					if i == nil then 
						break 
                          end
						
					table.insert(matches,{x,y,item})
					
				end
			end 
	    end
        return matches
	end

    if search then
        matches = findMatches(list, search)
    
         if #matches == 1 then 
			--found
			 setOutput(json.encode({
						action = "setLocation",
						group = matches[1][1],
						location = matches[1][2]
					}))		
                search = nil
                
                
		elseif #matches > 1 then	
			--display them
			setOutput(json.encode({
						action = "showOptions",
						match = matches
					}))
			requestAnimationFrame(1)
			
		else
                setOutput(json.encode({
						action = "404"
					}))		
           end
        
	end
	
	
	        
    
    
	--
	--End Search
	--


    boxH = (ry / 100) * 8
    boxW = rx * 9/10
    padding = (ry / 100) * 2
    listOffset = headerH + padding 
    
    setNextFillColor(l2,r/500,g/500,b/500,1)
    buttonH = headerH
    buttonW = rx/10-padding*2
    buttonX = rx-(rx/10)+padding
    buttonY = headerH+padding
    if ch > buttonY and ch < buttonY+buttonH and cx > buttonX and cx < buttonX+buttonW then
        if getCursorDown() then
            iteration = iteration -1
            setNextFillColor(l2,1,1,1,0.5)
        end
        setNextStrokeColor(l2,1,1,1,0.5)
        setNextStrokeWidth(l2,2)
    end
    addBoxRounded(l2,buttonX,buttonY,buttonW,buttonH,rd)
    setNextTextAlign(l2,AlignH_Center, AlignV_Middle)
    addText(l2, fontC, "UP",buttonX+buttonW/2,buttonY+buttonH/2)
    
    buttonY = buttonY+headerH+padding

    setNextFillColor(l2,r/500,g/500,b/500,1)
    if ch > buttonY and ch < buttonY+buttonH and cx > buttonX and cx < buttonX+buttonW then
        if getCursorDown() then
            iteration = iteration +1
            setNextFillColor(l2,1,1,1,0.5)
        end
        setNextStrokeColor(l2,1,1,1,0.5)
        setNextStrokeWidth(l2,2)
    end

    
    addBoxRounded(l2,buttonX,buttonY,buttonW,buttonH,rd)
    setNextTextAlign(l2,AlignH_Center, AlignV_Middle)
    addText(l2, fontC, "DOWN",buttonX+buttonW/2,buttonY+buttonH/2)
    
    
    
    allBoxes = boxH * #list[tab].l
    
    animationOffset = speed * iteration
    if animationOffset < 0 then
        animationOffset = 0
        iteration = 0
    end
    -- list
    displayList(list[tab].l,tab)
        
    
    requestAnimationFrame(1)




]])

function sendData()
local screenInput = {};
for i=1, #locations do
    local _loc = {}
    for y=1, #locations[i].list do
        table.insert(_loc, locations[i].list[y].name)
    end    
    table.insert(screenInput, {
        n = locations[i].name,
        l = _loc
    })
end    

screen.setScriptInput(json.encode({r,g,b,screenInput,search}))
    end
sendData()