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

-- Scoreboard object.
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

-- Profilboard object.
Profilboard = {
}

-- Defensers object.
Defensers = {
}

-- FFA object.
FFA = {
}
