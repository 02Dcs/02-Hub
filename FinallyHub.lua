--print(game.PlaceId)

local url = 'https://raw.githubusercontent.com/02Dcs/02-Hub/main';
local b = game:GetService('Players')

local gameswht = {
    [9498006165] = 'Tapping Simulator',
    [7267631004] = 'carry people simulator 3',
    [8542259458] = 'SkyWars', [8542275097] = 'SkyWars',
    [2990100290] = 'RPG Simulator',
    [5490351219] = 'Clicker Madness', -- Coming Soon (Today Maybe?!?!)
    [1240123653] = 'Zombie Attack', -- Takes 2 days.
}

for z,k in next, gameswht do
    gameswht[z] = table.concat(k:split(' '), '_')
end

local n = gameswht[game.PlaceId] or gameswht[game.GameId]

if not n then
     b.LocalPlayer:Kick('Wrong Game!')
end

return loadstring(game:HttpGet(url.. '/' ..n ..'.lua'))()
--
