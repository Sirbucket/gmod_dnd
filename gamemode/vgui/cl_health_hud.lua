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

local function drawBarNoRadius(x, y, w, h, red, green, blue, alpha, tw, th, text, font)
    draw_RoundedBox(0, x, y, w, h, Color(red, green, blue, alpha))
    draw_SimpleTextOutlined(text, font, tw, th, Color( red, green, blue, 255), 0, 0, 1, Color(25, 25, 25, 200))
end

function Hud(health)
    local client = LocalPlayer()
    if not client:Alive() then return end

    local healthMod = client:Health()/100
    local colorMod = client:Health()*10
    draw_RoundedBox(4, ScrW()/4.05, ScrH() - ScrH()/19.5, ScrW()/1.95, ScrH()/25, Color(50, 50, 50, 255))
    if client:Health() > 60 then
        drawBarNoRadius(ScrW()/4, ScrH() - ScrH()/25, ScrW()/2*healthMod, ScrH()/ 50, 0, 255*healthMod, 0, 200, ScrW()/2, ScrH() - ScrH()/25.5, "Health: "..client:Health(), "DermaDefaultBold")
    else 
        drawBarNoRadius(ScrW()/4, ScrH() - ScrH()/25, ScrW()/2*healthMod, ScrH()/ 50, 5*colorMod, 255*healthMod, 0, 200, ScrW()/2, ScrH() - ScrH()/25.5, "Health: "..client:Health(), "DermaDefaultBold")
    end
end

hook_Add("HUDPaint", "TestHud", Hud)

function HideHud(name)
    if name == nil then return end
    for k, v in pairs(hud_elements) do
        if name == v then
            return false
        end 
    end
end

hook_Add("HUDShouldDraw", "HideDefaultHud", HideHud)