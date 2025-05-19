return function(what)
    function load(l)
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/veryz-sillyz-boyz/rbx-utils/refs/heads/main/"..l))
    end

    if what == "util" then
        return load("rbxUtility.lua")()
    end
end
