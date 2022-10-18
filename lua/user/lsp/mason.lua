local ok, mason = pcall(require, "mason")
if not ok then
    print("Error: Could not find mason (mason.lua)")
    return
end

mason.setup()
