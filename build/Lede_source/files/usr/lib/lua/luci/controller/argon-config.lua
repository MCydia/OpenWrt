--[[
luci-app-argon-config
]]--

module("luci.controller.argon-config", package.seeall)

function index()
	if not nixio.fs.access('/www/luci-static/argon/css/cascade.css') then
		return
	end

	entry({"admin", "system", "argon-config"}, form("argon-config"), _("Argon设置"), 90)
end
