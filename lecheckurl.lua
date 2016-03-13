local check = function(url, checkfunc)
	-- returns if regex is in le url stuff
	local tmpname = url:match("(%d+)$")
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
			local url
			for match in string.gmatch(part, '<a href=\"([^\"]*)"' ) do 
				matchn=matchn+1
			--	print(match)
				if matchn==2 then 
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
end


return check
