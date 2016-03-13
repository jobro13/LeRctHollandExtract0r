local URLS = require('legeturls');
local CHECK = require('lecheckurl');

local intr_file = io.open('intr_log', 'w+')

local dennis = {}
local jobro  = {}
local both = {}

--URLS = {"http://web.archive.org/web/20080323111510/http://www.rctholland.nl/forum/viewtopic/20964"}
--URLS = {URLS[1]}

local nUrl = #URLS;

for _, url in pairs(URLS) do
	local urstr = _.."/"..nUrl;
	local r = _/nUrl;
	local r_round = r*100;
	local lepercent = math.floor(r_round*100 + 0.5)/100;
	print(urstr.."   ("..lepercent.."%)")
	CHECK(url, function(buff)
--		print(buff)
		local dennis_yes, jobro_yes
		if buff:match("Dennisvdz") then
			table.insert(dennis, url)
			intr_file:write("Dennis: \n");
			intr_file:write(url.."\n")
			intr_file:flush()
			dennis_yes=true
			print("DENNIS", url)
		end
		if buff:match("jobro") then
			table.insert(jobro, url)
			jobro_yes=true
			print("JOBRO", url)
			intr_file:write("jobro:\n"..url.."\n") intr_file:flush()
		end	
		if dennis_yes and jobro_yes then
			table.insert(both, url)
			print("BOTH", url)
			intr_file:write("both:\n"..url.."\n") intr_file:flush()
		end
	end)
--	break
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

