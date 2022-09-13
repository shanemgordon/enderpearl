AddCSLuaFile()

SWEP.PrintName = "Enderpearl"
SWEP.Author = "Cowskier"
SWEP.Purpose = "Flex on those Endermen with your own authentic enderpearls!"
SWEP.Spawnable = true
SWEP.Slot = 0
SWEP.ViewModel = Model( "models/weapons/c_bugbait.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_bugbait.mdl" )
SWEP.ViewModelFOV = 15
SWEP.UseHands = false;
local SwingSound = Sound( "sound/teleport.mp3" )
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false
function SWEP:Initialize()

	self:SetHoldType( "grenade" )
end

function SWEP:PrimaryAttack()
self:SetNextPrimaryFire( CurTime() + .5 )
sound.Play("bow.mp3",self.Owner:GetPos())
self:EmitSound( SwingSound )
self:ShootEffects( self )
if ( !SERVER ) then return end
local Forward = self.Owner:EyeAngles():Forward()
local ent = ents.Create( "sent_enderpearl" )
	if ( IsValid( ent ) ) then

	  ent:SetPos( self.Owner:GetShootPos() + Forward * 32 )
	  ent:SetAngles( self.Owner:EyeAngles() )
	  ent:Spawn()
		ent:SetNWString("id",self.Owner:SteamID())
	  ent:GetPhysicsObject():SetVelocity( Forward*1000 )

	end

end

function SWEP:ViewModelDrawn()

local Forward = self.Owner:EyeAngles():Forward()
local Right = self.Owner:EyeAngles():Right();
local Up = self.Owner:EyeAngles():Up();
local pearl = Material("endpearl/endpearl.png", "smooth mips")
render.SetMaterial( pearl )
render.DrawSprite(self.Owner:GetViewModel():GetPos()+Forward*40+Right*3.5+Up*-2, 4,4)

end
function SWEP:DrawWorldModel()
	//self:DrawModel()
end
