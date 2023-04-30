local draw_RoundedBox = draw.RoundedBox
local hook_Add = hook.Add
local draw_SimpleText = draw.SimpleText
local draw_SimpleTextOutlined = draw.SimpleTextOutlined

local hud_elements = {
    "CHudHealth",
    "CHudBattery",
    "CHudAmmo",
    "CHudSecondaryAmmo",
}

local function drawBarNoRadius(x, y, w, h, color, tw, th, text, font)
	local colors = unpack(color)
    draw_RoundedBox(0, x, y, w, h, Color(colors))
    draw_SimpleTextOutlined(text, font, tw, th, Color(color[1], color[2], color[3], 255), 0, 0, 1, Color(25, 25, 25, 200))
end

local function hud(health)
    local client = LocalPlayer()
    if not client:Alive() then return end
	local screen_width = ScrW()
	local screen_height = ScrH()

	local x = screen_width * 0.25
	local y = screen_height * 0.95
	local w = screen_width * 0.5
	local h = screen_height * 0.02

    local healthMod = client:Health()/100

    draw_RoundedBox(4, x, y, ScrW()/1.95, ScrH()/25, Color(50, 50, 50, 255))
    drawBarNoRadius(x + 8, y, w*healthMod, h, {2/healthMod, 255*healthMod, 0, 200}, w * 0.5, h*0.8, "Health: "..client:Health(), "DermaDefaultBold")
end

hook_Add("HUDPaint", "TestHud", hud)

local function HideDefaultHud(name)
    if name == nil then return end
    for k, v in pairs(hud_elements) do
        if name == v then
            return false
        end
    end
end

hook_Add("HUDShouldDraw", "HideDefaultHud", HideDefaultHud)