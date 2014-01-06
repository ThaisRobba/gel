xmlstart = "<?xml version='1.0' encoding='utf-8'?>\n<snippets language=\"lua\">\n"
xmlend = "</snippets>"

local file = io.open("love.CALLBACKS.xml", "r")
callbacks = file:read("*a")
file:close()

local file = io.open("love.GENERIC.xml", "r")
generic = file:read("*a")
file:close()

local file = io.open("love.graphics.COORDINATE.xml", "r")
coordinate = file:read("*a")
file:close()

local file = io.open("love.graphics.DRAWING.xml", "r")
drawing = file:read("*a")
file:close()

local file = io.open("love.graphics.OCREATION.xml", "r")
ocreation = file:read("*a")
file:close()

local file = io.open("love.graphics.STATE.xml", "r")
state = file:read("*a")
file:close()

local file = io.open("love.graphics.WINDOW.xml", "r")
window = file:read("*a")
file:close()

local file = io.open("love.JOYSTICK.xml", "r")
joystick = file:read("*a")
file:close()



local file = io.open("../compiled.xml", "w")
file:write(xmlstart)
file:write(callbacks)
file:write(generic)
file:write(ocreation)
file:write(coordinate)
file:write(drawing)
file:write(state)
file:write(joystick)
file:write(window)
file:write(xmlend)
file:close()
