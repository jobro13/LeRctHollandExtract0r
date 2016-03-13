local URL = {}

for line in io.lines('test.html') do
	if line:match('<a href') then
		-- woo many url!
		local le_url = line:match("<a href=[^>]*>([^<]*)</a>")
		if le_url and le_url:match("rctholland") then
			local le_act_url = "web.archive.org/web/*/"..le_url
			table.insert(URL, le_act_url)
		end
	end
end

return URL
