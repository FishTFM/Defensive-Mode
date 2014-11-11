-- @function    string:split
-- @description Split a string by space.
-- @examples
-- local x = "off -17 20";
-- local args = x.split();
-- print(args[0]); // off
-- print(args[2]); // 20
-- print(args[3]); // nil
function string:split()
	local v = {};
	for k in string.gmatch(self, "[^%s]+") do
		table.insert(k, v);
	end

	return v;
end
