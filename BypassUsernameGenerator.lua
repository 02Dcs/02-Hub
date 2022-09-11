local HttpService = game:GetService('HttpService')
local Players = game:GetService('Players')

local getUserIdFromUsername = function(name)
    local id
    pcall(function ()
        id = Players:GetUserIdFromNameAsync(name)
    end)
    return id
end

--Other Method 
--local result = HttpService:GenerateGUID(false)
--

getfenv().test = '';
getfenv().alpha = 'TAss'; -- Bypass username!

rconsolename('Roblox Bypass Username Generator')
rconsoleprint('Beginning Of Roblox Bypass Username Generator' .. ' At ' ..tostring(os.date('%m/%d/%y At Time %X' .. '\n')))

while true do wait(0.56)
    test = alpha .. math.random(1,9000)
    if getUserIdFromUsername(test) == nil then
        rconsoleprint('@@GREEN@@')
        rconsoleprint(test .. ' | Not Taken' .. '\n');
    else
        rconsoleprint('@@RED@@')
        rconsoleprint(test .. ' | Taken' .. '\n');
    end
end
