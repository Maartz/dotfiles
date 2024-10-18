local utils = {}
 
local wezterm = require "wezterm"
 
function utils.merge_tables(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            utils.merge_tables(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
    return t1
end
 
function utils.font_with_fallback(name, params)
    -- return wezterm.font_with_fallback(
    --     { name, "FiraCode Nerd Font Mono", "Blobmoji" },
    --     params
    -- )
end
 
function utils.auto_reloading(time)
    wezterm.time.call_after(time, function()
        wezterm.reload_configuration()
    end)
end
 
return utils
