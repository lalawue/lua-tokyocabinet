local cabinet = require("cabinet.tokyo")

-- create the object
local adb = cabinet.adbnew()
local ecode = 0

-- open the database
if not adb:open("casket.tch") then
   ecode = adb:ecode()
   print("open error: " .. adb:errmsg(ecode))
end

-- store records
if not adb:put("foo", "hop")
   or not adb:put("bar", "step")
   or not adb:put("baz", "jump") then
   ecode = adb:ecode()
   print("put error: " .. adb:errmsg(ecode))
end

-- retrieve records
local value = adb:get("foo")
if value then
   print(value)
else
   ecode = adb:ecode()
   print("get error: " .. adb:errmsg(ecode))
end

-- traverse records
adb:iterinit()
while true do
   local key = adb:iternext()
   if not key then break end
   value = adb:get(key)
   if value then
      print(key .. ":" .. value)
   end
end

-- table-like usage
adb["quux"] = "touchdown"
print(adb["quux"])
for key, value in adb:pairs() do
   print(key .. ":" .. value)
end

-- close the database
if not adb:close() then
   ecode = adb:ecode()
   print("close error: " .. adb:errmsg(ecode))
end