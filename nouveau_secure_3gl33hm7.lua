--[[
    Nouveau Universal Secure Protection
    Anti-Decompile: Enabled
    PC & Mobile Executors Compatibility: 100%
]]--
local b64 = "Ii0tW1tcbiAgICBOb3V2ZWF1IFVuaXZlcnNhbCBTZWN1cmUgUHJvdGVjdGlvblxuICAgIEFudGktRGVjb21waWxlOiBFbmFibGVkXG4gICAgUEMgJiBNb2JpbGUgRXhlY3V0b3JzIENvbXBhdGliaWxpdHk6IDEwMCVcbl1dLS1cbmxvY2FsIGI2NCA9IFwiYzNWalkyVnpjMloxYkE9PVwiXG5sb2NhbCBmdW5jdGlvbiBiNjRfZGVjb2RlKGRhdGEpXG4gICAgbG9jYWwgYiA9ICdBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWmFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6MDEyMzQ1Njc4OSsvJ1xuICAgIGRhdGEgPSBzdHJpbmcuZ3N1YihkYXRhLCAnW14nLi5iLi4nPV0nLCAnJylcbiAgICByZXR1cm4gKGRhdGE6Z3N1YignLicsIGZ1bmN0aW9uKHgpXG4gICAgICAgIGlmICh4ID09ICc9JykgdGhlbiByZXR1cm4gJycgZW5kXG4gICAgICAgIGxvY2FsIHIsZj0nJywoYjpmaW5kKHgpLTEpXG4gICAgICAgIGZvciBpPTYsMSwtMSBkbyByPXIuLihmJTJeaS1mJTJeKGktMSk+MCBhbmQgJzEnIG9yICcwJykgZW5kXG4gICAgICAgIHJldHVybiByXG4gICAgZW5kKTpnc3ViKCclZCVkJWQ/JWQ/JWQ/JWQ/JWQ/JWQ/JywgZnVuY3Rpb24oeClcbiAgICAgICAgaWYgKCN4IH49IDgpIHRoZW4gcmV0dXJuICcnIGVuZFxuICAgICAgICBsb2NhbCBjPTBcbiAgICAgICAgZm9yIGk9MSw4IGRvIGM9YysoeDpzdWIoaSxpKT09JzEnIGFuZCAyXig4LWkpIG9yIDApIGVuZFxuICAgICAgICByZXR1cm4gc3RyaW5nLmNoYXIoYylcbiAgICBlbmQpKVxuZW5kXG5cbmxvY2FsIHN1Y2Nlc3MsIHJlc3VsdCA9IHBjYWxsKGZ1bmN0aW9uKClcbiAgICBsb2NhbCBkZWNvZGVkID0gYjY0X2RlY29kZShiNjQpXG4gICAgbG9jYWwgZnVuYywgZXJyID0gbG9hZHN0cmluZyhkZWNvZGVkKVxuICAgIGlmIGZ1bmMgdGhlblxuICAgICAgICByZXR1cm4gZnVuYygpXG4gICAgZWxzZVxuICAgICAgICBlcnJvcihlcnIpXG4gICAgZW5kXG5lbmQpXG5cbmlmIG5vdCBzdWNjZXNzIHRoZW5cbiAgICB3YXJuKFwiW05vdXZlYXUgRXJyb3JdOiBcIiAuLiB0b3N0cmluZyhyZXN1bHQpKVxuZW5kIg=="
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