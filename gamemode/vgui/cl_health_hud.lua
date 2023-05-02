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

local function DrawBarNoRadius(x, y, w, h, color, tw, th, text, font)
	local colors = unpack(color)
    draw_RoundedBox(0, x, y, w, h, Color(colors))
    draw_SimpleTextOutlined(text, font, tw, th, Color(color[1], color[2], color[3], 255), 0, 0, 1, Color(25, 25, 25, 200))
end

local function Hud()
    local client = LocalPlayer()
    if not client:Alive() then return end
	local screen_width = ScrW()
	local screen_height = ScrH()

	local x = screen_width * 0.25
	local y = screen_height * 0.95
	local w = screen_width * 0.5
	local h = screen_height * 0.02

	local health = client:Health()
    local health_mod = health / 100

	local colors = {2 / health_mod, 255 * health_mod, 0, 200}
	local gray = Color(50, 50, 50, 255)

	local text_width = w * 0.5
	local text_height = h * 0.8

    draw_RoundedBox(4, x, y, w, h * 2, gray)
    DrawBarNoRadius(x + 8, y, (w * health_mod) - 8, h, colors, text_width, text_height, "Health: "..health, "DermaDefaultBold")

	if client:HasArmor() then
		x = x + (screen_width * 0.05)
		y = y + (screen_height * 0.025)
		w = w - (screen_width * 0.1)
		h = h - (screen_height * 0.01)
		text_width = w * 0.5
		text_height = h * 0.8

		local armor = client:Armor()
		local armor_mod = armor / 50
		local armor_color = 255 * armor_mod
		colors = {0, armor_color, armor_color, 200}

		draw_RoundedBox(4, x, y, w, h*2, gray)
		DrawBarNoRadius(x + 8, y, w * armor_mod, h, colors, w * 0.5, h * 0.8, "Armor: "..armor, "DermaDefaultBold")
	end
end

hook_Add("HUDPaint", "HealthHud", Hud)

local function HideDefaultHud(name)
    if name == nil then return end
    for k, v in pairs(hud_elements) do
        if name == v then
            return false
        end
    end
end

hook_Add("HUDShouldDraw", "HideDefaultHud", HideDefaultHud)