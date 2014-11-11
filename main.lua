--@include  twf.lua
--@include  helpers.lua
--@include  defensive.lua

function eventChatCommand(name, command)
	--local args = string.gmatch(command, "[^%s]+");
	--print(unpack(args));
end;

function eventNewPlayer(name)
	Players:init(name);
end;

function eventPlayerDied(name)
	Players:incrementStat(name, "death", 1);
end;

function eventPlayerGetCheese(name)
	Players:incrementStat(name, "cheese", 1);
end;

function eventPlayerWon(name)
	Scoreboard:playerEnter(name);
	Players:incrementStat(name, "hole", 1);

	-- TODO: Check firsts.
	if Scoreboard:getPlace(name) < 4 then
		Players:incrementStat(name, "points", 4 - Scoreboard:getPlace(name));
	end
end;
