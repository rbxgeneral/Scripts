-- CAR SCRIPT BY ME AND @SPARKLINGSPACCESS
-- ZOMBIE SCRIPT BY RUFUS14

-- you can runover the zombie and shit lol
-- PLEASE USE AUTORIG HATS, THE ZOMBIE WILL SUPPORT ANY AUTORIG HATS LOL.
-- HATS:
-- https://www.roblox.com/catalog/95597497547605/vroom-vroom
-- https://www.roblox.com/catalog/14228925973/Wheel-Head-White
-- https://www.roblox.com/catalog/14228918767/Wheel-Head-Dark-Grey
-- https://www.roblox.com/catalog/14228934270/Wheel-Head-Grey
-- https://www.roblox.com/catalog/14228927962/Wheel-Head-Red
-- FOR RIG USE AUTORIG, CHANGE THE RIG MESH AND TEXTURES IN LINE 1023 TO 1027 IF YOU HAVE YOUR OWN RIG

do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil
	
	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Offset = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end
			
			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}
			
			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				
				tableclear(Tools)
				
				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)
					
					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end
				
				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)
			
			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")
				
				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end
			
			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end
	
	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType
		
		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character
						
						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end
						
						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end
	
	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end
	
	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints
			
			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		--{ MeshId = "", Name = "", Offset = CFrame.identity, TextureId = "" },		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301
		{ MeshId = "97203956188978", Names = { "Right Leg" }, Offset = CFrame.identity, TextureId = "109149147051146" }, -- right leg
		{ MeshId = "86107550707987", Names = { "Left Leg" }, Offset = CFrame.identity, TextureId = "138400772284248" }, -- left leg 
		{ MeshId = "131565220143492", Names = { "Left Arm" }, Offset = CFrame.identity, TextureId = "100046681371506" }, -- left arm   
		{ MeshId = "117384266048516", Names = { "Right Arm" }, Offset = CFrame.identity, TextureId = "133390430807912" }, -- right arm
		{ MeshId = "115704050441795", Name = "Torso", Offset = CFrame.identity, TextureId = "95717705171948" }, -- torso 
		
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301
		{ MeshId = "93907003588020", Names = { "Right Leg" }, Offset = CFrame.identity, TextureId = "132793121910206" }, -- right leg
		{ MeshId = "98951105844212", Names = { "Left Leg" }, Offset = CFrame.identity, TextureId = "136194453687838" }, -- left leg 
		{ MeshId = "112407899921871", Names = { "Left Arm" }, Offset = CFrame.identity, TextureId = "130425659774428" }, -- left arm   
		{ MeshId = "91468403626792", Names = { "Right Arm" }, Offset = CFrame.identity, TextureId = "71595868023404" }, -- right arm
		{ MeshId = "113598814727060", Name = "Torso", Offset = CFrame.identity, TextureId = "114371859575637" }, -- torso 
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = true,--{ MeshId="", TextureId = ""},
		Highlight = true,
		PredictionFling = true,
		Timeout = 1,
		ToolFling = false,--"Boombox",
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, - 30, 0),
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = false,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

wait(1)
--//car script\\
-- bit buggy too btw
local player = game:GetService("Players").LocalPlayer
local user = player.Name
local char = workspace:WaitForChild(user)
local humanoid = char:WaitForChild("Humanoid")
local mouse = player:GetMouse()
local Anim = Instance.new("Animation") 
Anim.AnimationId = "rbxassetid://178130996" 
local track1 = Empyrean.Rig.Humanoid:LoadAnimation(Anim) 
track1.Looped = true
track1.Priority = Enum.AnimationPriority.Action
track1:Play()
local throttle = 0
local steer = 0
local isforwards = false
local isbackwards = false
local isleft = false
local isright = false
local carmodel = game:GetObjects("rbxassetid://106646256700528")[1]:Clone()
carmodel:ScaleTo(0.6)
local hinges = {

}

humanoid.HipHeight = 3.5
mouse.KeyDown:Connect(function(key)
	if key:lower() == "a" then
		steer = 30
		isleft = true
	elseif key:lower() == "d" then
		steer = -30
		isright = true
	end
	if key:lower() == "w" then
		throttle = 50
		isforwards = true
	elseif key:lower() == "s" then
		throttle = -20
		isbackwards = true
	end
end)
mouse.KeyUp:Connect(function(key)
	if key:lower() == "w" then
		if isforwards == true and isbackwards == false then
			throttle = 0
		elseif isforwards == true and isbackwards == true then
			throttle = -50
		end
		isforwards = false
	elseif key:lower() == "s" then
		if isbackwards == true and isforwards == false then
			throttle = 0
		elseif isbackwards == true and isforwards == true then
			throttle = 50
		end
		isbackwards = false
	end
	if key:lower() == "a" then
		if isleft == true and isright == false then
			steer = 0
		elseif isleft == true and isright == true then
			steer = -50
		end
		isleft = false
	elseif key:lower() == "d" then
		if isright == true and isleft == false then
			steer = 0
		elseif isright == true and isleft == true then
			steer = 50
		end
		isright = false
	end
end)
for _, hinge in pairs(carmodel:GetDescendants()) do
	if hinge:IsA("HingeConstraint") then
		hinges[hinge.Name] = hinge
	elseif hinge:IsA("BasePart") then
		hinge.Transparency = 1
	end
end
carmodel:SetPrimaryPartCFrame(char.Torso.CFrame)
carmodel.Parent = workspace
local alignp = Instance.new("AlignPosition", char.Torso)
alignp.Attachment0 = Instance.new("Attachment", char.Torso)
alignp.Attachment1 = Instance.new("Attachment", carmodel.chassis)
alignp.Attachment1.CFrame = CFrame.new(0, 2.3, 0)
alignp.Responsiveness = 200
alignp.RigidityEnabled = true
local aligno = Instance.new("AlignOrientation", char.Torso)
aligno.Attachment0 = Instance.new("Attachment", char.Torso)
local bru = Instance.new("Attachment", carmodel.chassis)
bru.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(-90), 0)
aligno.Attachment1 = bru
aligno.Responsiveness = 200
aligno.RigidityEnabled = true
game:GetService("RunService").PreRender:Connect(function()
	humanoid.PlatformStand = true
	humanoid.AutoRotate = false
	for a, e in pairs(char:GetDescendants()) do
		if e:IsA("MeshPart") or e:IsA("BasePart") then
			e.CanCollide = false
			e.CanTouch = false
		end
	end
	hinges.steer.TargetAngle = steer
	hinges.lf.AngularVelocity = throttle
	hinges.rf.AngularVelocity = throttle
	hinges.lb.AngularVelocity = throttle
	hinges.rb.AngularVelocity = throttle
end)
wait(0.7)
local name = game:GetService("Players").LocalPlayer.Name
local e = workspace:WaitForChild(name)
local function AlignHat(character, accessoryName, targetPart, weldName, offsetCFrame) -- mizt type shit aligner
    local accessory = character:FindFirstChild(accessoryName)
    if accessory and accessory:IsA("Accessory") and targetPart then
        local handle = accessory:FindFirstChild("Handle")
        if handle then
            for _, child in pairs(handle:GetChildren()) do
                if child:IsA("Weld") or child:IsA("WeldConstraint") then
                    child:Destroy()
                end
            end
            local weld = Instance.new("Weld")
            weld.Name = weldName or (accessoryName .. "Weld")
            weld.Part0 = handle
            weld.Part1 = targetPart
            weld.C0 = offsetCFrame or CFrame.identity
            weld.Parent = handle
        end
    end
end

local function bruh(character)
    local count = 1
    for _, v in pairs(character:GetChildren()) do
        if v.Name == "CylinderHead" and v:IsA("Accessory") then
            v.Name = "CylinderHead"..count
            count += 1
        end
    end
    repeat task.wait() until count > 1
end

bruh(e)

AlignHat(e, "Accessory (Car)", carmodel.chassis, "SwordWeld", CFrame.new(0, -2.2, 0))
AlignHat(e, "CylinderHead1", carmodel.lbwheel, "Wheel1Weld", CFrame.identity)
AlignHat(e, "CylinderHead2", carmodel.lfwheel, "Wheel2Weld", CFrame.identity)
AlignHat(e, "CylinderHead3", carmodel.rbwheel, "Wheel3Weld", CFrame.identity)
AlignHat(e, "CylinderHead4", carmodel.rfwheel, "Wheel4Weld", CFrame.identity)


local player = game.Players.LocalPlayer
local char = char
local rig = game:GetObjects("rbxassetid://5195737219")[1]
rig.Parent = workspace
rig:SetPrimaryPartCFrame(char.Torso.CFrame * CFrame.new(0,0,35))
rig.Name = "dingus"
rig.HumanoidRootPart.Anchored = false
rig.Animate.Disabled = true

local bot = rig
local humanoid = bot:FindFirstChildOfClass("Humanoid")
local attachments, constraints, colliders = {}, {}, {}
local WL = {"Accessory (autorig_LeftArm)","Accessory (autorig_RightLeg)","Accessory (autorig_RightArm)","Accessory (autorig_LeftLeg)","Accessory (autorig_Torso)","Accessory (autorig_Head)"}
local ragdolled = false

for _, hatName in pairs(WL) do
    local hat = bot:FindFirstChild(hatName)
    if hat and hat:FindFirstChild("Handle") then
        for _, mesh in pairs(hat.Handle:GetDescendants()) do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Destroy()
            end
        end
    end
end

function pos(part, parent, p)
    Instance.new("Attachment",part)
    Instance.new("AlignPosition",part)
    Instance.new("Attachment",parent)
    part.Attachment.Name = part.Name
    parent.Attachment.Name = part.Name
    part.AlignPosition.Attachment0 = part[part.Name]
    part.AlignPosition.Attachment1 = parent[part.Name]
    parent[part.Name].Position = p or Vector3.new()
    part.AlignPosition.MaxForce = 999999999*10
    part.AlignPosition.MaxVelocity = math.huge
    part.AlignPosition.ReactionForceEnabled = false
    part.AlignPosition.Responsiveness = math.huge
    part.AlignPosition.RigidityEnabled = false
end

function create(part, parent, p, r)
    Instance.new("Attachment",part)
    Instance.new("AlignPosition",part)
    Instance.new("AlignOrientation",part)
    Instance.new("Attachment",parent)
    part.Attachment.Name = part.Name
    parent.Attachment.Name = part.Name
    part.AlignPosition.Attachment0 = part[part.Name]
    part.AlignOrientation.Attachment0 = part[part.Name]
    part.AlignPosition.Attachment1 = parent[part.Name]
    part.AlignOrientation.Attachment1 = parent[part.Name]
    parent[part.Name].Position = p or Vector3.new()
    part[part.Name].Orientation = r or Vector3.new()
    part.AlignPosition.MaxForce = 999999999
    part.AlignPosition.MaxVelocity = math.huge
    part.AlignPosition.ReactionForceEnabled = false
    part.AlignPosition.Responsiveness = math.huge
    part.AlignOrientation.Responsiveness = math.huge
    part.AlignPosition.RigidityEnabled = false
    part.AlignOrientation.MaxTorque = 999999999
end

for i,v in next, char:GetDescendants() do
    if v:IsA("Accessory") and table.find(WL,v.Name) then
        v.Handle:BreakJoints()
        local clone = v:Clone()
        clone.Parent = bot
        create(v.Handle, clone.Handle)
    end
end

for i,v in pairs(bot:GetDescendants()) do
    if v:IsA("BasePart") and v.Name == "Handle" then
        v.Transparency = 1
        v.CanCollide = false
    end
end
local hats = {
    LA = bot:FindFirstChild('Accessory (autorig_LeftArm)') and bot['Accessory (autorig_LeftArm)'].Handle or nil,
    RA = bot:FindFirstChild('Accessory (autorig_RightArm)') and bot['Accessory (autorig_RightArm)'].Handle or nil,
    LL = bot:FindFirstChild('Accessory (autorig_LeftLeg)') and bot['Accessory (autorig_LeftLeg)'].Handle or nil,
    RL = bot:FindFirstChild('Accessory (autorig_RightLeg)') and bot['Accessory (autorig_RightLeg)'].Handle or nil,
    T  = bot:FindFirstChild('Accessory (autorig_Torso)') and bot['Accessory (autorig_Torso)'].Handle or nil,
    H  = bot:FindFirstChild('Accessory (autorig_Head)') and bot['Accessory (autorig_Head)'].Handle or nil
}

for i,v in next, hats do
    if v then
        local weld = Instance.new("Weld")
        weld.Part0 = v
        if i == "LA" then weld.Part1 = bot['Left Arm'] weld.C1 = CFrame.new() * CFrame.Angles(math.rad(0),0,0)
        elseif i == "RA" then weld.Part1 = bot['Right Arm'] weld.C1 = CFrame.new() * CFrame.Angles(math.rad(0),0,0)
        elseif i == "LL" then weld.Part1 = bot['Left Leg'] weld.C1 = CFrame.new() * CFrame.Angles(math.rad(0),0,0)
        elseif i == "RL" then weld.Part1 = bot['Right Leg'] weld.C1 = CFrame.new() * CFrame.Angles(math.rad(0),0,0)
        elseif i == "T" then weld.Part1 = bot['Torso'] weld.C1 = CFrame.new()
        elseif i == "H" then weld.Part1 = bot['Head'] weld.C1 = CFrame.new() end
        weld.C0 = CFrame.new()
        weld.Parent = v
    end
end

local function ragdoll(Character)
    if ragdolled then return end
    ragdolled = true
    humanoid.PlatformStand = true
    humanoid.Sit = true
    for _, motor in pairs(Character:GetDescendants()) do
        if motor:IsA("Motor6D") then motor.Enabled = false end
    end
    local head = Character:FindFirstChild("Head")
    local leftarm = Character:FindFirstChild("Left Arm")
    local rightarm = Character:FindFirstChild("Right Arm")
    local leftleg = Character:FindFirstChild("Left Leg")
    local rightleg = Character:FindFirstChild("Right Leg")
    local torso = Character:FindFirstChild("Torso")
    local hrp = Character:FindFirstChild("HumanoidRootPart")
    head.CanCollide=false leftarm.CanCollide=false rightarm.CanCollide=false
    leftleg.CanCollide=false rightleg.CanCollide=false torso.CanCollide=true
    local function attachm(part, name, pos, axis, secAxis)
        local att = Instance.new("Attachment")
        att.Name = name att.Parent = part att.Position = pos or Vector3.new()
        att.Axis = axis or Vector3.new(1,0,0) att.SecondaryAxis = secAxis or Vector3.new(0,1,0)
        table.insert(attachments, att)
        return att
    end
    local HeadA = attachm(head, "HeadA", Vector3.new(0,-0.5,0))
    local LeftArmA = attachm(leftarm, "LeftArmA", Vector3.new(0,1.5,0))
    local RightArmA = attachm(rightarm, "RightArmA", Vector3.new(0,1.5,0))
    local LeftLegA = attachm(leftleg, "LeftLegA", Vector3.new(0,1,0), Vector3.new(1,0,0), Vector3.new(1,1,0))
    local RightLegA = attachm(rightleg, "RightLegA", Vector3.new(0,1,0))
    local TorsoA1 = attachm(torso, "TorsoA1", Vector3.new(-0.5,-1,0))
    local TorsoA2 = attachm(torso, "TorsoA2", Vector3.new(-1.5, 0.7, 0))
    local TorsoA3 = attachm(torso, "TorsoA3", Vector3.new(1.5,0.7,0))
    local TorsoA4 = attachm(torso, "TorsoA4", Vector3.new(0,1,0))
    local TorsoA5 = attachm(torso, "TorsoA5", Vector3.new(0.5,-1,0))
    local function ball(part0, att0, part1, att1)
        local ball = Instance.new("BallSocketConstraint")
        ball.Attachment0=att0 
		ball.Attachment1=att1 
		ball.LimitsEnabled=true 
		ball.UpperAngle=95
		ball.TwistLowerAngle = -45
		ball.TwistUpperAngle = 170
		ball.Parent=part0
        table.insert(constraints, ball)
    end
    ball(head, HeadA, torso, TorsoA4)
    ball(leftarm, LeftArmA, torso, TorsoA2)
    ball(rightarm, RightArmA, torso, TorsoA3)
    ball(leftleg, LeftLegA, torso, TorsoA1)
    ball(rightleg, RightLegA, torso, TorsoA5)

	local NCC_Head = Instance.new("NoCollisionConstraint")
    NCC_Head.Part0 = neck
    NCC_Head.Part1 = torso
    NCC_Head.Parent = head

    local NCC_LeftLeg = Instance.new("NoCollisionConstraint")
    NCC_LeftLeg.Part0 = leftleg
    NCC_LeftLeg.Part1 = torso
    NCC_LeftLeg.Parent = leftleg
    local NCC_RightLeg = Instance.new("NoCollisionConstraint")
    NCC_RightLeg.Part0 = rightleg
    NCC_RightLeg.Part1 = torso
    NCC_RightLeg.Parent = rightleg

    local function colliderr(part, name)
        local col=Instance.new("Part")
        col.Size=Vector3.new(1,1,1) col.Shape=Enum.PartType.Cylinder col.CanCollide=true col.Anchored=false
        col.Name=name col.CFrame=part.CFrame col.Parent=Character
        local weld=Instance.new("Weld") weld.Part0=part weld.Part1=col weld.C0=CFrame.new() weld.Parent=part
        table.insert(colliders, col)
        return col
    end

	    local function yes(part, name)
        local col=Instance.new("Part")
        col.Size=Vector3.new(1,0.5,1) col.Shape=Enum.PartType.Ball col.CanCollide=true col.Anchored=false
        col.Name=name col.CFrame=part.CFrame col.Parent=Character
        local weld=Instance.new("Weld") weld.Part0=part weld.Part1=col weld.C0=CFrame.new() weld.Parent=part
        table.insert(colliders, col)
        return col
    end

    yes(head,"Neck")
    colliderr(rightarm,"RHand")
    colliderr(leftarm,"LHand")
    colliderr(rightleg,"Foot1")
    colliderr(leftleg,"Foot2")
    end

if hrp then hrp.CanCollide=true if hrp:FindFirstChild("RootJoint") then hrp.RootJoint.Enabled=true end end

local function moveBot()
    while true do
        if humanoid and bot.PrimaryPart then
            local x = math.random(-20,20)
            local z = math.random(-20,20)
            humanoid:MoveTo(bot.PrimaryPart.Position + Vector3.new(x,0,z))
        end
        wait(1)
    end
end



local function checkCarCollision()
    local wheels = {"lbwheel","lfwheel","rbwheel","rfwheel"}
    for _, wname in pairs(wheels) do
        local wheel = carmodel:FindFirstChild(wname)
        if wheel then
            wheel.Touched:Connect(function(hit)
                if hit.Parent == bot then
                    if ragdolled then
                        local dir = (bot.Torso.CFrame.LookVector * 140) + Vector3.new(0,10,30)
                        bot.Torso.Velocity = dir
                        wait(1)
                        bot.Torso.Velocity = Vector3.new(0,0,0)
                    else
                        ragdoll(bot)
                    end
                end
            end)
        end
    end
end
wait(0.1)
rig.Animate.Disabled = false
spawn(checkCarCollision)
wait(0.1)
-- THE THING I GUESS LOL
local npc = rig
local torso = npc.Torso
local head = npc.Head
local leftarm = npc["Left Arm"]
local rightarm = npc["Right Arm"]
local leftleg = npc["Left Leg"]
local rightleg = npc["Right Leg"]

for i,v in pairs(npc:GetDescendants()) do
    if v:IsA("BasePart") or v:IsA("Decal") then
        v.Transparency = 1
    end
    if v:IsA("BasePart") then
        v.CanCollide = false
        -- local constraint = Instance.new("NoCollisionConstraint")
        -- constraint.Part0 = v
        -- constraint.Part1 = char.HumanoidRootPart
        -- constraint.Enabled = true
        -- constraint.Parent = v
    end
end


local npchumanoid = npc:findFirstChildOfClass("Humanoid")
npcws = 13
sine = 0
npc:findFirstChildOfClass("Humanoid").MaxHealth = math.random(100,400)
npc:findFirstChildOfClass("Humanoid").Health = npc:findFirstChildOfClass("Humanoid").MaxHealth
local footstep = Instance.new("Sound", head)
footstep.Name = "footstep"
footstep.SoundId = "rbxassetid://4113577407"
footstep.Looped = true
footstep.Volume = 0
footstep:Play()
--Motor6D's
local neck = torso.Neck
neck.C1 = CFrame.new(0,0,0)
local leftshoulder = torso["Left Shoulder"]
leftshoulder.C1 = CFrame.new(0,0,0)
local rightshoulder = torso["Right Shoulder"]
rightshoulder.C1 = CFrame.new(0,0,0)
local lefthip = torso["Left Hip"]
lefthip.C1 = CFrame.new(0,0,0)
local righthip = torso["Right Hip"]
righthip.C1 = CFrame.new(0,0,0)
step = game:GetService("RunService").Stepped
if npc:findFirstChild("HumanoidRootPart") then
	if npc.HumanoidRootPart:findFirstChild("RootJoint") then
		root = npc.HumanoidRootPart.RootJoint
		root.C1 = CFrame.new(0,0,0)
	elseif npc.HumanoidRootPart:findFirstChild("Root Hip") then
		root = npc.HumanoidRootPart["Root Hip"]
		root.C1 = CFrame.new(0,0,0)
	end
else
	npchumanoid.Health = 0
end
--
local sight = 80
local walking = false
local attacking = false
local cansay = true
local ragdolldeath = true
local caninfect = true
local canrandomwalk = true
local saycooldown = 0
local function walkanim(walkspeed)
	if walkspeed > 2 then
		walking = true
	else
		walking = false
	end
end
npchumanoid.Running:connect(walkanim)
local function walkrandomly()
	while wait(math.random(3,6)) do
		if not walking and canrandomwalk then
			npchumanoid.WalkSpeed = 10
			local function createwalkpart()
				local walkpart = Instance.new("Part", npc)
				walkpart.Size = Vector3.new(1,1,1)
				walkpart.Anchored = true
				walkpart.Material = "Neon"
				walkpart.Transparency = 1
				walkpart.CanCollide = false
				walkpart.BrickColor = BrickColor.new("Maroon")
				walkpart.CFrame = torso.CFrame * CFrame.new(math.random(-60,60),math.random(-30,30),math.random(-60,60))
				local path = game:GetService("PathfindingService"):FindPathAsync(torso.Position, walkpart.Position)
				local waypoints = path:GetWaypoints()
				if path.Status == Enum.PathStatus.Success then
					for i,v in pairs(waypoints) do
						if canrandomwalk then
							npchumanoid:MoveTo(v.Position)
							local allow = 0
							while (torso.Position - v.Position).magnitude > 4 and allow < 25 do
								allow = allow + 1
								wait()
							end
							if v.Action == Enum.PathWaypointAction.Jump then
								npchumanoid.Jump = true
							end
						end
					end
					for i,v in pairs(npc:GetChildren()) do
						if v.Name == "pospart" then
							v:destroy()
						end
					end
				else
					createwalkpart()
					wait()
				end
			end
			createwalkpart()
		end
	end
end
local function chase()
	while true do
		if not walking then
			for i,v in pairs(workspace:GetChildren()) do
				if not v:findFirstChild("dingus") and v:findFirstChildOfClass("Humanoid") and v:findFirstChild("Head") then
					if (v:findFirstChild("Head").Position - npc.Head.Position).magnitude < sight then
						canrandomwalk = false
						local thehumanoid = v:findFirstChildOfClass("Humanoid")
						local pathfinding = false
						local thehead = v:findFirstChild("Head")
						while (thehead.Position - npc.Head.Position).magnitude < sight and thehumanoid.Health > 0 and not v:findFirstChild("dingus") do
							npchumanoid.WalkSpeed = npcws
							npchumanoid:MoveTo(thehead.Position, thehead)
							local path = game:GetService("PathfindingService"):FindPathAsync(torso.Position, thehead.Position) --find the path from scp's torso to victims head
							local waypoints = path:GetWaypoints() --get the every point of the path
							if path.Status == Enum.PathStatus.Success then
								for q,w in pairs(waypoints) do --for every point existing..
									if q ~= 1 then
										local allow = 0
										npchumanoid:MoveTo(w.Position, thehead) --...walk to it
										while (torso.Position - w.Position).magnitude > 3.8 and allow < 20 do
											allow = allow + 1
											game:GetService("RunService").Heartbeat:wait()
										end
										if w.Action == Enum.PathWaypointAction.Jump then
											npchumanoid.Jump = true
										end
										if thehumanoid.Health <= 0 then
											break
										end
										if v:findFirstChild("dingus") then
											break
										end
									end
								end
								for q,w in pairs(npc:GetChildren()) do
									if w.Name == "pospart" then
										w:destroy()
									end
								end
							else
								npchumanoid:MoveTo(thehead.Position, thehead)
							end
							wait()
						end
						canrandomwalk = true
					else
						canrandomwalk = true
					end
				end
			end
		end
		wait()
	end
end
candmg = true
local function damage(part)
	if part.Parent:findFirstChildOfClass("Humanoid") and not part:IsDescendantOf(npc) then
		if part.Parent:findFirstChildOfClass("Humanoid").Health > 99 and part.Parent ~= char then
		    local hit = part.Parent:FindFirstChild("Torso") or part.Parent:FindFirstChild("UpperTorso") or part.Parent:FindFirstChild("HumanoidRootPart")
		    if hit == nil then return end
			local deathrandom = 6--math.random(1,5)
			local deathsound = Instance.new("Sound", part.Parent.Head)
			deathsound.Volume = 0.5
			if deathrandom == 1 then
				deathsound.SoundId = "rbxassetid://566988981"
			end
			if deathrandom == 2 then
				deathsound.SoundId = "rbxassetid://884349060"
			end
			if deathrandom == 3 then
				deathsound.SoundId = "rbxassetid://170399891"
			end
			if deathrandom == 4 then
				deathsound.SoundId = "rbxassetid://402192395"
			end
			if deathrandom == 5 then
				deathsound.SoundId = "rbxassetid://1835338424"
			end
			deathsound:Play()
		end
	end
end
torso.Touched:connect(damage)

spawn(walkrandomly)
spawn(chase)

ti(cons,step:Connect(function()--check animations and other things
	sine = sine + 1
	if not walking then
		footstep.Volume = 0
		neck.C0 = neck.C0:lerp(CFrame.new(0,1.2,0) * CFrame.Angles(math.sin(sine/30)/10,0,0) * CFrame.new(0,0.25,0),0.1)
		righthip.C0 = righthip.C0:lerp(CFrame.new(0.5,-1-math.cos(sine/30)/15,0) * CFrame.Angles(math.rad(10+(2*math.sin(-sine/30))),0,-math.sin(sine/60)/10) * CFrame.new(0,-1,0),0.1)
		lefthip.C0 = lefthip.C0:lerp(CFrame.new(-0.5,-1-math.cos(sine/30)/15,0) * CFrame.Angles(math.rad(10+(2*math.sin(-sine/30))),0,-math.sin(sine/60)/10) * CFrame.new(0,-1,0),0.1)
		root.C0 = root.C0:lerp(CFrame.new(0,math.cos(sine/30)/15,0) * CFrame.Angles(math.rad(-10+(2*math.sin(sine/30))),0,math.sin(sine/60)/15),0.1)
		rightshoulder.C0 = rightshoulder.C0:lerp(CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(20)+math.rad(5*math.sin(sine/30)),0,math.rad(5*math.cos(sine/30)/2)) * CFrame.new(0,-0.5,0),0.1)
		leftshoulder.C0 = leftshoulder.C0:lerp(CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(20)-math.rad(5*math.sin(sine/30)),0,-math.rad(5*math.cos(sine/30)/2)) * CFrame.new(0,-0.5,0),0.1)
	end
	if walking then --this is the walking animation
		footstep.Volume = 0.5
		leftshoulder.C0 = leftshoulder.C0:lerp(CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(100-math.cos(sine/5)*10),0,math.rad(math.sin(sine/10)*10)) * CFrame.new(0,-0.5,0),0.1)
		rightshoulder.C0 = rightshoulder.C0:lerp(CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(100-math.cos(sine/5)*10),0,math.rad(math.sin(sine/10)*10)) * CFrame.new(0,-0.5,0),0.1)
		neck.C0 = neck.C0:lerp(CFrame.new(0,1.2,0) * CFrame.Angles(math.rad(10+math.cos(sine/5)*6),0,0) * CFrame.new(0,0.25,0),0.1)
		root.C0 = root.C0:lerp(CFrame.new(0,math.sin(sine/5)/9,0) * CFrame.Angles(math.rad(-15),0,math.cos(sine/10)/6),0.1)
		righthip.C0 = righthip.C0:lerp(CFrame.new(0.5,-1+math.cos(sine/10)/3,-math.cos(sine/10)/3) * CFrame.Angles(math.sin(sine/10),0,0) * CFrame.new(0,-1,0),0.1)
		lefthip.C0 = lefthip.C0:lerp(CFrame.new(-0.5,-1-math.cos(sine/10)/3,math.cos(sine/10)/3) * CFrame.Angles(-math.sin(sine/10),0,0) * CFrame.new(0,-1,0),0.1)
	end
end))


