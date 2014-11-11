--------------------------------
--	Defensive Mode - Version 0.1
--	Code by Fish (ThanosS)
--------------------------------

-- Players object.
Players = {
	players = {},
	init = function(self, name)
		self.players[name] = { 
			offsets = { 
				x = 0,
				y = 10; 
			},
			stats = {
				cheese = 0,
				hole = 0,
				first = 0,
				death = 0,
				points = 0;
			};
		};
	end,

	-- Offsets.
	setOffsets = function(self, name, values)
		self.players[name].offsets = values;
	end,
	getOffsets = function(self, name)
		return self.players[name].offsets;
	end,

	-- Stats.
	setStats = function(self, name, values)
		self.players[name].stats = values;
	end,
	getStats = function(self, name)
		return self.players[name].stats;
	end,
	setStat = function(self, name, statName, value)
		self.players[name].stats[statName] = value;
	end,
	getStat = function(self, name, statName)
		return self.players[name].stats[statName];
	end,
	incrementStat = function(self, name, statName, value)
		self.players[name].stats[statName] = self.players[name].stats[statName] + value;
	end,
	decrementStat = function(self, name, statName, value)
		self.players[name].stats[statName] = self.players[name].stats[statName] - value;
	end;
}

Scoreboard = {
	scores = {},
	logs = {
		cannons = 0,
		cheeses = 0,
		firsts = 0,
		holes = 0,
		death = 0,
		points = 0,
		time = 0;
	},
	places = {},
	placeCounter = 0,
	getPlace = function(self, name)
		return self.places[name];
	end,
	playerEnter = function(self, name)
		self.placeCounter = self.placeCounter + 1;
		self.places[name] = self.placeCounter;
    end
}

Profilboard = {
}

Defensers = {
}

FFA = {
}


-- TODO:
---- Scoreboard ;
---- FFA System ;
---- Profilboard ;
---- Defensers.

-- Events.
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
