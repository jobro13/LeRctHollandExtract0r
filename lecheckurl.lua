local check = function(url, checkfunc)
	-- returns if regex is in le url stuff
	local tmpname = os.tmpname();
	os.execute("curl -o "..tmpname.. " " .. url)
	local file = io.open(tmpname);
	local buff = file:read("*a")
	return checkfunc(buff)
end


return check
