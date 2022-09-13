include("shared.lua")
local pearl
function ENT:Initialize()



end
function ENT:Draw()
  pearl = Material("endpearl/enddust"..self:GetNWInt("skin")..".png", "smooth mips")
  render.SetMaterial( pearl )
  render.DrawSprite(self:GetPos(), 16, 16)
end
