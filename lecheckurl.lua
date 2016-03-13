local check = function(url, checkfunc)
	-- returns if regex is in le url stuff
	local tmpname = url:match("viewtopic/(.*)$")
	tmpname = string.gsub(tmpname, "/", "u")
	if tmpname then
		local file = io.open('data/'..tmpname)
		if not file then 
			os.execute("curl -s -o data/"..tmpname.. " " .. url)
		else
			print('\texists')
		end
		local file = io.open('data/'..tmpname);
	
		local buff = file:read("*a")
		
		local part = buff:match("<p>Saved <strong>.-</p>")
		if part then
			local matchn=0 
			local lastmatch
			local url
			for match in string.gmatch(part, '<a href=\"([^\"]*)"' ) do 
				lastmatch=match
				matchn=matchn+1
			--	print(match)
				if matchn==2 then 
					
				end
			end
			local match=lastmatch
			if matchn > 0 then
				url = 'http://web.archive.org'..match
					local fname = "data/"..tmpname.."t"
					local file = io.open(fname)
					if  not file then
					 	os.execute('curl -s -o '..fname..' ' .. url)
					else
						print('\t\talso exists')
					end 
					local f = io.open(fname)
					local buff = f:read("*a")
					return checkfunc(buff)
			end
		end
	end
end


return check
