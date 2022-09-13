AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:Initialize()
  self:SetModel("models/Gibs/HGIBS.mdl")
  self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then

		phys:Wake()

	end
end
function ENT:Think()
  if /*self.NextEffect<CurTime()*/true then
    self.NextEffect = CurTime()+.5;
    local ent = ents.Create( "sent_enderparticle" )
    if (( IsValid( ent ) )) then
      ent:SetPos( self:GetPos() )
      ent:Spawn()
    end
  end

end
function ENT:PhysicsCollide( data, phys )
  local ply = player.GetBySteamID( self:GetNWString("id") )
  ply:SetPos(self:GetPos())
  sound.Play("teleport.mp3",data.HitPos)
  self:Remove();
end
