----------------------------------------------------------------------
-- Logic Core Addon Tools.
--
-- v1.1.0
-- Created by LogicallyUnfit 2020
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

function checkclub()
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

SLASH_LOGICCORE = "/lc"
SlashCmdList["LOGICCORE"] = function(msg)
    print_r(msg)
end

print_r("Loaded.")