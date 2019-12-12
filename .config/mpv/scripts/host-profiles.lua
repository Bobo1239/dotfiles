-- Applies a profile if its description begins with `hosts:<host1>,<host2>,<...>` and `hostname`
-- matches any of the hostnames in the list.
-- Inspired by "auto-profiles.lua"

local msg = require 'mp.msg'

local hostname = mp.command_native({
    name = "subprocess",
    args = {"hostname"},
    capture_stdout = true,
    playback_only = false,
})
hostname = hostname["stdout"]:sub(1, -2)

for i, profile in pairs(mp.get_property_native("profile-list")) do
    local desc = profile["profile-desc"]
    if desc and desc:sub(1, 6) == "hosts:" then
        for host in string.gmatch(desc:sub(7), '[^,]+') do
            if host == hostname then
                msg.info("Applying profile " .. profile.name)
                mp.commandv("apply-profile", profile.name)
            end
        end
    end
end
