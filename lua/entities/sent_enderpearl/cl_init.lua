include("shared.lua")
local pearl = Material("endpearl/endpearl.png", "smooth mips")
function ENT:Draw()
render.SetMaterial( pearl )
render.DrawSprite(self:GetPos(), 16, 16)
end
