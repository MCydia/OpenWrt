
module("luci.controller.cpufreq", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/cpufreq") then
		return
	end

	entry({"admin", "services", "cpufreq"}, cbi("cpufreq"), _("CPU 调节"), 900).dependent = false
end
