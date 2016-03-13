local check = function(url, checkfunc)
	-- returns if regex is in le url stuff
	local tmpname = url:match("(%d+)$")
	if tmpname then
		local file = io.open('data/'..tmpname)
		if not file then 
			os.execute("curl -o data/"..tmpname.. " " .. url)
		end
		local file = io.open('data/'..tmpname);
		local buff = file:read("*a")
		return checkfunc(buff)
	end
end


return check
