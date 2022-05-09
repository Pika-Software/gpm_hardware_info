if (CLIENT) then
    return
end

game_ready.wait(function()
    local success, result = pcall( require, "serverstat" )
    if (success) then

        local isfunction = isfunction
        local pairs = pairs

        for name, func in pairs( serverstat ) do
            if isfunction( func ) then
                if (system[ name ] ~= nil) then
                    continue
                end

                system[ name ] = func
            end
        end

    else

        local system = "Unsupported"
        if system.IsWindows() then
            system = "Windows"
        end

        if system.IsLinux() then
            system = "Linux"
        end

        if (system == "Unsupported") then
            error( "Your system is not compatible with this package & module, how could you start the server at all!?" )
            return
        end

        error( "For the correct operation of this package, you need C++ binary module for " .. system .." ".. (jit.arch == "x64" and "x86-64" or "x86") .. ",\nyou can download it here: https://github.com/WilliamVenner/gmsv_serverstat/releases" )

    end
end)