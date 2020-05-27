----------------------------------------------------------------------
-- Logic Core Addon Tools.
--
-- v1.2.0
-- Created by LogicallyUnfit 2020
----------------------------------------------------------------------
-- v1.2.0
----------------------------------------------------------------------
-- +explode(seperator, str) Splits 'str' by 'seperator'
----------------------------------------------------------------------
-- v1.1.0
----------------------------------------------------------------------
-- +checkclub() returns nil or clubid
----------------------------------------------------------------------
-- v1.0.0
----------------------------------------------------------------------
-- First Version
-- 
--
----------------------------------------------------------------------


----------------------------------------------------------------------
-- Function: explode()
--    Input: seperator - char to split str with. 
--                 str - string to be split
--    Usage: Splits str by seperator, php style
--   Source: Lance Li - http://lua-users.org/wiki/SplitJoin
----------------------------------------------------------------------
function explode(seperator, str)
    local t, ll
    t={}
    ll=0
    if(#str == 1) then
        return {str}
    end
    while true do
        l = string.find(str, seperator, ll, true) -- find the next d in the string
        if l ~= nil then -- if "not not" found then..
            table.insert(t, string.sub(str,ll,l-1)) -- Save it in our array.
            ll = l + 1 -- save just after where we found it for searching next time.
        else
            table.insert(t, string.sub(str,ll)) -- Save what's left in our array.
            break -- Break at end, as it should be, according to the lua manual.
        end
    end
    return t
end

----------------------------------------------------------------------
function GetTerranClubId()
    return C_Club.GetGuildClubId()
end

function checkclub()
    -- ToDo: 
    -- No Need to loop now, Wow Has a function.
    --[[
    clubid = nil
    guilds = {"Terran Empire","Terran Gamer"}
    clubs = C_Club.GetSubscribedClubs()

    for guildcount, curguild in ipairs(guilds) do
        for cloop=1, table.getn(clubs) do
            if clubs[cloop]["name"] == curguild then
                clubid = clubs[cloop]["clubId"]
            end
        end
    end
    --]]

    clubid = C_Club.GetGuildClubId()

    return clubid
end

function dump(rawdata)
    if type(rawdata) == 'table' then
       local stringd = '{ '
       for key,value in pairs(rawdata) do
          if type(key) ~= 'number' then key = '"'..key..'"' end
          stringd = stringd .. "\n" .. '['..key..'] = ' .. dump(value) .. ','
       end
       return stringd .. '} '
    else
       return tostring(rawdata)
    end
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


function print_r(output,prefix,error)
    prefix = prefix or "LogicCore"
    error = error or false
    if output == nil then
        error = true
        output = "No Data Passed to print_r"
    end
    data = dump(output)
    if error == true then
        print("|cffa335ee"..prefix..":|r |cff000000[|r|cffff0000Error|r|cff000000]|r "..data)
    else
        print("|cffa335ee"..prefix..":|r "..data)
    end
    return true
end

----------------------------------------------------------------------
-- isTerranOfficer - 1.2.0
----------------------------------------------------------------------
-- Use: Check if User is a Terran Officer
----------------------------------------------------------------------
function isTerranOfficer()
    if checkclub() ~= nil then
        if C_GuildInfo.IsGuildOfficer() == true then
            return true
        end
    end
    return false
end

SLASH_LOGICCORE = "/lc"
SlashCmdList["LOGICCORE"] = function(msg)
    print_r(msg)
end

print_r("Loaded.")