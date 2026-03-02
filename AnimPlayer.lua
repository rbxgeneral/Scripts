-- anim player
-- i dont know who made it it's cool


local Rig = game.Players.LocalPlayer.Character
local AnimatorModule = {}

local function Contains(Table, Check)
	for Index, Value in next, Table do
		if rawequal(Check, Index) or rawequal(Check, Value) then
			return true
		end
	end
	return false
end

local AnimDefaults = {
	["Neck"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["RootJoint"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["Right Shoulder"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["Left Shoulder"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["Right Hip"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["Left Hip"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["Head"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["Torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["Right Arm"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["Left Arm"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["Right Leg"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["Left Leg"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
}

local function Edit(Joint, Change, Duration, Style, Direction)
	if not Style or not table.find(Enum.EasingStyle:GetEnumItems(), Style) then
		Style = Enum.EasingStyle.Cubic
	end
	Direction = Enum.EasingDirection[string.split(tostring(Direction), ".")[3]]
	local Anim = game:GetService("TweenService"):Create(Joint, TweenInfo.new(Duration, Style, Direction), {C0 = Change})
	Anim:Play()
	return Anim
end

function AnimatorModule:ResetJoints(Rig)
	local RigHumanoid = Rig:FindFirstChildOfClass("Humanoid")
	assert(RigHumanoid and RigHumanoid:IsA("Humanoid"), "Rig Humanoid Missing!")
	if RigHumanoid.RigType ~= Enum.HumanoidRigType.R6 then
		return error("Not R6 rig.")
	end
	local Joints = {
		["Torso"] = Rig.HumanoidRootPart:FindFirstChild("RootJoint") or Rig.HumanoidRootPart:FindFirstChild("Root Joint"),
		["Left Arm"] = Rig.Torso["Left Shoulder"],
		["Right Arm"] = Rig.Torso["Right Shoulder"],
		["Left Leg"] = Rig.Torso["Left Hip"],
		["Right Leg"] = Rig.Torso["Right Hip"],
		["Head"] = Rig.Torso["Neck"]
	}
	for Limb, Joint in next, Joints do
		Edit(Joint, AnimDefaults[Limb], 0.01, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
	end
end

function AnimatorModule:LoadAnimation(Rig, Sequence)
	if not Rig or not Rig.Parent then
		return error("Invalid Rig provided")
	end
	local RigHumanoid = Rig:FindFirstChildOfClass("Humanoid")
	if not RigHumanoid or RigHumanoid.RigType ~= Enum.HumanoidRigType.R6 then
		return error("Rig Humanoid is not R6 or missing")
	end

	local Joints = {
		["Torso"] = Rig.HumanoidRootPart:FindFirstChild("RootJoint") or Rig.HumanoidRootPart:FindFirstChild("Root Joint"),
		["Left Arm"] = Rig.Torso["Left Shoulder"],
		["Right Arm"] = Rig.Torso["Right Shoulder"],
		["Left Leg"] = Rig.Torso["Left Hip"],
		["Right Leg"] = Rig.Torso["Right Hip"],
		["Head"] = Rig.Torso["Neck"]
	}
	local Class = {Speed = 1, KeepLast = 0, Stopped = true, IsPlaying = false, TimePosition = 0, Looped = Sequence.Loop}
	local Keyframes = Sequence:GetKeyframes()
	table.sort(Keyframes, function(a, b) return a.Time < b.Time end)
	Class.Length = Keyframes[#Keyframes].Time
	local Completion = Instance.new("BindableEvent")
	local Reached = Instance.new("BindableEvent")
	Class.Completed = Completion.Event
	Class.KeyframeReached = Reached.Event
	local function Yield(Seconds)
		task.wait(Seconds / Class.Speed)
	end
	for _, v in ipairs(Sequence:GetDescendants()) do
		if v:IsA("IntValue") or v:IsA("StringValue") or v:IsA("Folder") then
			v:Destroy()
		elseif v:IsA("Pose") and not Rig:FindFirstChild(v.Name, true) then
			v:Destroy()
		end
	end
	function Class:Play(FadeIn, Speed)
		if Speed and Speed < 0 then Speed = math.abs(Speed) end
		Class.Speed = math.clamp(Speed or 180, 1, 180)
		Class.Stopped = false
		Class.IsPlaying = true
		task.spawn(function()
			if FadeIn then Class.TimePosition -= FadeIn end
			Class.Completed:Connect(function()
				if Class.Looped then Class.TimePosition = 0 end
			end)
			local connection
			connection = game:GetService("RunService").Stepped:Connect(function(_, dt)
				if Class.IsPlaying and not Class.Stopped and RigHumanoid.Health > 0 then
					Class.TimePosition += math.min(dt * Class.Speed, 1)
				else
					connection:Disconnect()
				end
			end)
		end)
		task.spawn(function()
			if FadeIn then Yield(FadeIn) end
			repeat
				for K = 1, #Keyframes do
					local K0, K1, K2 = Keyframes[K-1], Keyframes[K], Keyframes[K+1]
					if not Class.Stopped and RigHumanoid.Health > 0 then
						if K0 then Yield(K1.Time - K0.Time) end
						task.spawn(function()
							for _, Pose in ipairs(K1:GetDescendants()) do
								if Joints[Pose.Name] then
									local Duration = K2 and (K2.Time - K1.Time) / Class.Speed or 0.5
									Edit(Joints[Pose.Name], AnimDefaults[Pose.Name] * Pose.CFrame, Duration, Pose.EasingStyle, Pose.EasingDirection)
								end
							end
						end)
						if K == #Keyframes and Class.KeepLast > 0 then Yield(Class.KeepLast) end
						Reached:Fire(K1.Name)
					else
						break
					end
				end
				Completion:Fire()
			until not Class.Looped or Class.Stopped or RigHumanoid.Health == 0
			Class.IsPlaying = false
		end)
	end
	function Class:Stop()
		Class.Stopped = true
	end
	function Class:AdjustSpeed(Speed)
		if Speed < 0 then Speed = math.abs(Speed) end
		Class.Speed = math.clamp(Speed or Class.Speed, 1, 180)
	end
	return Class
end

function PlayAnim(Rig, Animation, AnimFade, AnimSpeed)
	return AnimatorModule:LoadAnimation(Rig, Animation)
end

function StopAnim(Rig, Anim)
	if Anim then
		Anim:Stop()
	end
end
-- EXAMPLES:
-- your animation must contain a model, via doing Model.KeyFrameSequence (or any animation man it just checks the class name really but you need to have a model with a animation lol)
local asset = game:GetObjects("rbxassetid://110720822555629")[1] -- electro shuffle one
local Sequence = asset:FindFirstChildOfClass("KeyframeSequence")
local AnimObject = PlayAnim(Rig, Sequence, 1.2, 1.2)
AnimObject:Play(1.2, 1.2)
AnimObject.Looped = true 

