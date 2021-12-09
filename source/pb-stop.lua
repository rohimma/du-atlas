screen.setRenderScript([[
local rx, ry = getResolution()
local dt = 100 * getDeltaTime()
local l = createLayer()
local font = loadFont("FiraMono-Bold", 85)

if not init then    
    init = true
    text = {}
    text.header = "DU-Atlas"
   
    local tbw, tbh = getTextBounds(font, text.header)
    
    text.w = tbw
    text.h = tbh
    
    text.x = math.random(tbw, rx-tbw)
    text.y = math.random(tbh, ry-tbh)
    text.vx = 0.75
    text.vy = 0.5
end

    
    
text.x = text.x + text.vx * dt
text.y = text.y + text.vy * dt

if text.x < 0 or text.x > rx - text.w then
    text.x = text.x - text.vx * dt
    text.vx = -text.vx
end

if text.y < text.h or text.y > ry then
    text.y = text.y - text.vy * dt
    text.vy = -text.vy
end

addText(l, font, text.header, text.x, text.y)

requestAnimationFrame(1)
]])