local URLS = require('legeturls');
local CHECK = require('lecheckurl');

local dennis = {}
local jobro  = {}
local both = {}

--URLS = {"http://web.archive.org/web/20080323111510/http://www.rctholland.nl/forum/viewtopic/20964"}

for _, url in pairs(URLS) do
	CHECK(url, function(buff)
		print(buff)
		local dennis_yes, jobro_yes
		if buff:match("Dennisvdz") then
			table.insert(dennis, url)
			dennis_yes=true
		end
		if buff:match("jobro") then
			table.insert(jobro, url)
			jobro_yes=true
		end	
		if dennis_yes and jobro_yes then
			table.insert(both, url)
		end
	end)
	break
end

file = io.open('lefile', 'w+')

file:write("dennis:\n")
for i,v in pairs(dennis) do
	file:write(v.."\n")
end

file:write("\n\n\njobro:\n")
for i,v in pairs(jobro) do
	file:write(v.."\n")
end

file:write("\n\n\nboth:\n")
for i,v in pairs(both) do
	file:write(v,"\n")
end

file:flush()
file:close()

