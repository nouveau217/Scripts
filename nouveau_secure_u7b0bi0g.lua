--[[
    Nouveau Universal Secure Protection
    Anti-Decompile: Enabled
    PC & Mobile Executors Compatibility: 100%
]]--
local b64 = "CiAgICAgICAgICAgICAgICBwcmludCgiVGVzdCBjZDFoaTciKQogICAgICAgICAgICAgICAgbG9jYWwgUGxheWVycyA9IGdhbWU6R2V0U2VydmljZSgiUGxheWVycyIpCiAgICAgICAgICAgICAgICBsb2NhbCBwbGF5ZXIgPSBQbGF5ZXJzLkxvY2FsUGxheWVyCiAgICAgICAgICAgICAgICBwcmludCgiSGVsbG8gZnJvbSB0ZXN0IDE3ODczNzgwNTk4MTciKQogICAgICAgICAgICA="
local function b64_decode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local success, result = pcall(function()
    local decoded = b64_decode(b64)
    local func, err = loadstring(decoded)
    if func then
        return func()
    else
        error(err)
    end
end)

if not success then
    warn("[Nouveau Error]: " .. tostring(result))
end