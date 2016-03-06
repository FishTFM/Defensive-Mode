--@include  twf.lua
--@include  helpers.lua
--@include  defensive.lua

function eventChatCommand(name, command)
	--local args = string.gmatch(command, "[^%s]+");
	--print(unpack(args));
end;

function eventNewPlayer(name)
	Player:init(name);
end;

function eventPlayerDied(name)
	Player:incrementStat(name, "death", 1);
end;

function eventPlayerGetCheese(name)
	Player:incrementStat(name, "cheese", 1);
end;

function eventPlayerWon(name)
	Scoreboard:playerEnter(name);
	Player:incrementStat(name, "hole", 1);

	-- TODO: Check firsts.
	local playerPlace = Scoreboard:getPlace(name);
	if playerPlace < 4 then
		Player:incrementStat(name, "points", 4 - playerPlace);
	end
end;
