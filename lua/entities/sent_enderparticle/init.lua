AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:Initialize()
  self:SetModel("models/Gibs/HGIBS.mdl")
  self:PhysicsInit(SOLID_NONE);
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then

		phys:Wake()

	end
end
function ENT:Think()
  if(CurTime()-3>self:GetNWFloat("Time")) then
    self:Remove()
  end
end
