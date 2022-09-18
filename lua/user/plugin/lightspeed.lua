local ok, lightspeed = pcall(require, "lightspeed")
if not ok then
    print("Error: Could not find lightspeed (lightspeed.lua)")
    return
end

lightspeed.setup{}
