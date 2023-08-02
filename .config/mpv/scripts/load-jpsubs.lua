local msg = require 'mp.msg'
local utils = require 'mp.utils'

-- splitbynum and alnumcomp from alphanum.lua (C) Andre Bogus
-- Released under the MIT License
-- http://www.davekoelle.com/files/alphanum.lua

-- split a string into a table of number and string values
local function splitbynum(s)
    local result = {}
    for x, y in (s or ""):gmatch("(%d*)(%D*)") do
        if x ~= "" then table.insert(result, tonumber(x)) end
        if y ~= "" then table.insert(result, y) end
    end
    return result
end

local function clean_key(k)
    k = (' ' .. k .. ' '):gsub("%s+", " "):sub(2, -2):lower()
    return splitbynum(k)
end

-- compare two strings
local function alnumcomp(x, y)
    local xt, yt = clean_key(x), clean_key(y)
    for i = 1, math.min(#xt, #yt) do
        local xe, ye = xt[i], yt[i]
        if type(xe) == "string" then
            ye = tostring(ye)
        elseif type(ye) == "string" then
            xe = tostring(xe)
        end
        if xe ~= ye then return xe < ye end
    end
    return #xt < #yt
end

-- Taken from autoload.lua
table.filter = function(t, iter)
    for i = #t, 1, -1 do
        if not iter(t[i]) then
            table.remove(t, i)
        end
    end
end

local last_tracks = {
    video = -1,
    audio = -1,
    sub = -1,
    sub2 = -1
}

function table.contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

local function load_jpsub(asd)
    local path = mp.get_property("path", "")
    local dir, _ = utils.split_path(path)
    local subdir = utils.join_path(dir, "jpsubs")

    local subfiles = utils.readdir(subdir, "files")
    if not subfiles then
        msg.info("No jpsubs directory to load...")
        return
    end

    -- Filter out subtitles which have a retimed version (courtesy of autosubsync-mpv)
    table.filter(subfiles, function(item)
        local filename, extension = string.match(item, "(.+)(%..+)")
        for _, x in ipairs(subfiles) do
            if x == filename .. "_retimed" .. extension then
                return false
            end
        end
        return true
    end)
    table.sort(subfiles, alnumcomp)

    local playlist_count = mp.get_property_native("playlist-count")
    local playlist_pos = mp.get_property("playlist-pos")

    if playlist_count ~= #subfiles then
        msg.warn("Number of files in jpsubs didn't match number of playlist entries.")
    else
        local subfile_name = subfiles[playlist_pos + 1]
        local subfile = utils.join_path(subdir, subfile_name)
        msg.info("Loading subtitles " .. subfile)
        mp.commandv("sub-add", subfile, "auto")

        -- Restore previously selected tracks
        for trackname, trackid in pairs(last_tracks) do
            if trackid ~= -1 then
                mp.set_property(trackname, trackid)
            end
        end
    end
end

local function remember_active_tracks(asd)
    for trackname, _ in pairs(last_tracks) do
        local cur_track = mp.get_property_native("current-tracks/" .. trackname .. "/id")
        if cur_track then
            last_tracks[trackname] = cur_track
        end
    end
end

-- This happens after track selection so mpv forgets the previously selected tracks since the number
-- of tracks changedI
-- NOTE: We can't use `start-file` (which would handle this properly) since that's the same event
-- autoload.lua uses and then the playlist isn't populated yet when we reach our code. Since events
-- are asynchronous we have no way to express that we want to execute after autoload.lua. (Could
-- modify both scripts to use hooks which  are run synchronously but then we need to modify
-- autoload.lua.)
mp.register_event("file-loaded", load_jpsub)
-- As a workaround we remember which tracks were last selected and restore them when loading new
-- files.
mp.observe_property("track-list", "native", remember_active_tracks)
