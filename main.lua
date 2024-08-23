local whitelisted = {"w4tvthbrrgrg5", "MacMilski", "MikailWarlock", "jakavictory9835", "baliskad", "arisedonbass345934"}
local Player = game.Players.LocalPlayer
local Players = game.Players

-- Exploit functions --

local SkidFling=function(TargetPlayer)
	local Character=Player.Character
	local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart=Humanoid and Humanoid.RootPart

	local TCharacter=TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid=TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart=THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead=TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory=TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessoy and Accessory:FindFirstChild("Handle") then
		Handle=Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude<50 then
			getgenv().OldPos=RootPart.CFrame
		end
		if THumanoid and THumanoid.Sit and not AllBool then
		end
		if THead then
			workspace.CurrentCamera.CameraSubject=THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject=Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject=THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local FPos=function(BasePart,Pos,Ang)
			RootPart.CFrame=CFrame.new(BasePart.Position)*Pos*Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position)*Pos*Ang)
			RootPart.Velocity=Vector3.new(9e7,9e7*10,9e7)
			RootPart.RotVelocity=Vector3.new(9e8,9e8,9e8)
		end

		local SFBasePart=function(BasePart)
			local TimeToWait=2
			local Time=tick()
			local Angle=0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude<50 then
						Angle=Angle+100

						FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(2.25,1.5,-2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(-2.25,-1.5,2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
					else
						FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,-TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude>500 or BasePart.Parent~=TargetPlayer.Character or TargetPlayer.Parent~=Players or not TargetPlayer.Character==TCharacter or THumanoid.Sit or Humanoid.Health <=0 or tick()>Time+TimeToWait
		end

		workspace.FallenPartsDestroyHeight=0/0

		local BV=Instance.new("BodyVelocity")
		BV.Name="EpixVel"
		BV.Parent=RootPart
		BV.Velocity=Vector3.new(9e8,9e8,9e8)
		BV.MaxForce=Vector3.new(1/0,1/0,1/0)

		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)

		if TRootPart and THead then
			if (TRootPart.CFrame.p-THead.CFrame.p).Magnitude>5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		else
		end

		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		workspace.CurrentCamera.CameraSubject=Humanoid

		repeat
			RootPart.CFrame=getgenv().OldPos*CFrame.new(0,.5,0)
			Character:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,.5,0))
			Humanoid:ChangeState("GettingUp")
			table.foreach(Character:GetChildren(),function(_,x)
				if x:IsA("BasePart") then
					x.Velocity,x.RotVelocity=Vector3.new(),Vector3.new()
				end
			end)
			task.wait()
		until (RootPart.Position-getgenv().OldPos.p).Magnitude<25
		workspace.FallenPartsDestroyHeight=getgenv().FPDH
	else
	end
end

local WideSkidFling=function(TargetPlayer)
	local Character=Player.Character
	local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart=Humanoid and Humanoid.RootPart

	local TCharacter=TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid=TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart=THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead=TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory=TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessoy and Accessory:FindFirstChild("Handle") then
		Handle=Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude<50 then
			getgenv().OldPos=RootPart.CFrame
		end
		if THumanoid and THumanoid.Sit and not AllBool then
		end
		if THead then
			workspace.CurrentCamera.CameraSubject=THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject=Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject=THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local FPos=function(BasePart,Pos,Ang)
			RootPart.CFrame=CFrame.new(BasePart.Position)*Pos*Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position)*Pos*Ang)
			RootPart.Velocity=Vector3.new(9e7,9e7*10,9e7)
			RootPart.RotVelocity=Vector3.new(9e8,9e8,9e8)
		end

		local SFBasePart=function(BasePart)
			local TimeToWait=2
			local Time=tick()
			local Angle=0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude<50 then
						Angle=Angle+100

						FPos(BasePart,CFrame.new(0,3,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(4.5,3,-4.5)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(-4.45,-3,4.45)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,3,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
					else
						FPos(BasePart,CFrame.new(0,3,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,3,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,3,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,-TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,3,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0),CFrame.Angles(math.rad(90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0),CFrame.Angles(0,0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0),CFrame.Angles(math.rad(-90),0,0))
						task.wait()

						FPos(BasePart,CFrame.new(0,-3,0),CFrame.Angles(0,0,0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude>500 or BasePart.Parent~=TargetPlayer.Character or TargetPlayer.Parent~=Players or not TargetPlayer.Character==TCharacter or THumanoid.Sit or Humanoid.Health <=0 or tick()>Time+TimeToWait
		end

		workspace.FallenPartsDestroyHeight=0/0

		local BV=Instance.new("BodyVelocity")
		BV.Name="EpixVel"
		BV.Parent=RootPart
		BV.Velocity=Vector3.new(9e8,9e8,9e8)
		BV.MaxForce=Vector3.new(1/0,1/0,1/0)

		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)

		if TRootPart and THead then
			if (TRootPart.CFrame.p-THead.CFrame.p).Magnitude>5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		else
		end

		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		workspace.CurrentCamera.CameraSubject=Humanoid

		repeat
			RootPart.CFrame=getgenv().OldPos*CFrame.new(0,.5,0)
			Character:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,.5,0))
			Humanoid:ChangeState("GettingUp")
			table.foreach(Character:GetChildren(),function(_,x)
				if x:IsA("BasePart") then
					x.Velocity,x.RotVelocity=Vector3.new(),Vector3.new()
				end
			end)
			task.wait()
		until (RootPart.Position-getgenv().OldPos.p).Magnitude<25
		workspace.FallenPartsDestroyHeight=getgenv().FPDH
	else
	end
end

local LocalPlayer = game.Players.LocalPlayer

local getPlr=function(Name)
	if Name:lower()=="random" then
		return Players:GetPlayers()[math.random(#Players:GetPlayers())]
	elseif Name:lower()=="me" then
		return game.Players:FindFirstChild(Name)
	elseif not Name then
		return game.Players:FindFirstChild(Name)
	elseif Name:lower()=="friends" then
		local friends={}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr:IsFriendsWith(LocalPlayer.UserId) and plr~=LocalPlayer then
				table.insert(friends,plr)
			end
		end
		return friends
	elseif Name:lower()=="nonfriends" then
		local noFriends={}
		for _,plr in pairs(Players:GetPlayers()) do
			if not plr:IsFriendsWith(LocalPlayer.UserId) and plr~=LocalPlayer then
				table.insert(noFriends,plr)
			end
		end
		return noFriends
	elseif Name:lower()=="enemies" then
		local nonTeam={}
		local team=LocalPlayer.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team~=team then
				table.insert(nonTeam,plr)
			end
		end
		return nonTeam
	elseif Name:lower()=="allies" then
		local teamBuddies={}
		local team=LocalPlayer.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team==team then
				table.insert(teamBuddies,plr)
			end
		end
		return teamBuddies
	elseif Name:lower()=="all" then
		return game.Players:GetPlayers()
	else
		Name=Name:lower():gsub("%s","")
		for _,x in next,Players:GetPlayers() do
			if x.Name:lower():match(Name) then
				return x
			elseif x.DisplayName:lower():match("^"..Name) then
				return x
			end
		end
	end
end

function bypassMessage(str)
	str = tostring(str)
	print(str)
	if str:match("capitalonly") then
		str = string.gsub(string.upper(str), "CAPITALONLY", " ")
		str = string.gsub(string.upper(str), "NIGGER", "Νіğğеr")
		str = string.gsub(string.upper(str), "NIGGA", "ΝІĠĠА")
		str = string.gsub(string.upper(str), "FUCK", "Ḟµск")
		str = string.gsub(string.upper(str), "FUCKING", "Ḟµскіng")
		str = string.gsub(string.upper(str), "SHIT", "SНІТ")
		str = string.gsub(string.upper(str), "SLAVE", "S̜LА̗̮̟̄VЕ")
		str = string.gsub(string.upper(str), "ASS", "а̜̞̇S̮̗͗S")
		str = string.gsub(string.upper(str), "BITCH", "ВІТСН")
		str = string.gsub(string.upper(str), "STFU", "SТḞÙ")
		str = string.gsub(string.upper(str), "PUSSY", "рü̜̞̇s̮̗͗sу")
		str = string.gsub(string.lower(str), "WHORE", "WНО̓̀́͘ŔЕ")
		str = string.gsub(string.upper(str), "CUM", "С͘UM")
		str = string.gsub(string.upper(str), "VODKA", "v̜оḍk̜а")
		str = string.gsub(string.upper(str), "ALCOHOL", "АІСОНОІ")
		str = string.gsub(string.upper(str), "BEER", "ВЕЕŔ")
		str = string.gsub(string.upper(str), "DICK", "ĎІСК")
		str = string.gsub(string.upper(str), "BOOBS", "ВООВȘ")
		--
		str = string.gsub(string.upper(str), "WEED", "ԜЕЕḌ")
		str = string.gsub(string.lower(str), "COCAINE", "СОСАІNE")
		str = string.gsub(string.upper(str), "METH", "МЕТН")
		str = string.gsub(string.upper(str), "HEROIN", "НЕRОІN")
		str = string.gsub(string.upper(str), "COCK", "ϹОϹΚ")
		str = string.gsub(string.upper(str), "RAPE", "ŖАРЕ")
		str = string.gsub(string.upper(str), "SEX", "ŚЕХ")
		str = string.gsub(string.upper(str), "CUNT", "ϾŬNТ")
		-- codes
		str = string.gsub(string.lower(str), [[n_1]], "Νіğğеr")
		str = string.gsub(string.lower(str), [[n_2]], "Νіğğегs")
		str = string.gsub(str, [[n_3]], "Νіğğа")
		str = string.gsub(str, [[n_4]], "Νіğğа")
		str = string.gsub(str, [[n_5]], "ΝІĠĠА")
		str = string.gsub(string.lower(str), [[f_1]], "Ḟµск")
		str = string.gsub(string.lower(str), [[f_2]], "Ḟµскіng")
		str = string.gsub(string.lower(str), [[s_1]], "SНІТ")
		str = string.gsub(string.lower(str), [[s_2]], "S̜LА̗̮̟̄VЕ")
		str = string.gsub(string.lower(str), [[a_1]], "а̜̞̇S̮̗͗S")
		str = string.gsub(string.lower(str), [[b_1]], "ВІТСН")
		str = string.gsub(string.lower(str), [[s_3]], "SТḞÙ")
		str = string.gsub(string.lower(str), [[p_1]], "рü̜̞̇s̮̗͗sу")
		str = string.gsub(string.lower(str), [[w_1]], "WНО̓̀́͘ŔЕ")
		str = string.gsub(string.lower(str), [[c_1]], "С͘UM")
		str = string.gsub(string.lower(str), [[v_1]], "v̜оḍk̜а")
		str = string.gsub(string.lower(str), [[a_2]], "АІСОНОІ")
		str = string.gsub(string.lower(str), [[b_2]], "ВЕЕŔ")
		str = string.gsub(string.lower(str), [[d_1]], "ĎІСК")
		str = string.gsub(string.lower(str), [[b_3]], "ВООВȘ")
		--
		str = string.gsub(string.lower(str), [[w_2]], "ԜЕЕḌ")
		str = string.gsub(string.lower(str), [[c_2]], "сосаіne")
		str = string.gsub(string.lower(str), [[m_1]], "МЕТН")
		str = string.gsub(string.lower(str), [[h_1]], "НЕRОІN")
		str = string.gsub(string.lower(str), [[h_2]], "Ное")
		str = string.gsub(string.lower(str), [[c_3]], "ϹОϹΚ")
		str = string.gsub(string.lower(str), [[r_1]], "ŖАРЕ")
		str = string.gsub(string.lower(str), [[s_4]], "ŚЕХ")
		str = string.gsub(string.lower(str), [[c_4]], "ϾŬNТ")
		str = string.gsub(string.lower(str), [[p_2]], "рогп")
		-- letter bypass
		str = string.gsub(string.upper(str), "I", "І")
		str = string.gsub(string.upper(str), "A", "А")
		str = string.gsub(string.upper(str), "C", "С")
		str = string.gsub(string.upper(str), "X", "Х")
		str = string.gsub(string.upper(str), "3", "З")
		str = string.gsub(string.upper(str), "O", "О")
		str = string.gsub(string.upper(str), "P", "Р")
		str = string.gsub(string.upper(str), "W", "Ԝ")
	else
		str = string.gsub(string.lower(str), "nigger", "Νіğğеr")
		str = string.gsub(string.lower(str), "Νіğğеrs", "Νіğğегs")
		str = string.gsub(str, "nigga", "Νіğğа")
		str = string.gsub(str, "Nigga", "Νіğğа")
		str = string.gsub(str, "NIGGA", "ΝІĠĠА")
		str = string.gsub(string.lower(str), "fuck", "Ḟµск")
		str = string.gsub(string.lower(str), "fucking", "Ḟµскіng")
		str = string.gsub(string.lower(str), "shit", "SНІТ")
		str = string.gsub(string.lower(str), "slave", "śІа̝v̞e")
		str = string.gsub(string.lower(str), "ass", "а̜̞̇s̮̗͗s")
		str = string.gsub(string.lower(str), "bitch", "ВІТСН")
		str = string.gsub(string.lower(str), "stfu", "SТḞÙ")
		str = string.gsub(string.lower(str), "pussy", "рü̜̞̇s̮̗͗sу")
		str = string.gsub(string.lower(str), "whore", "wноге")
		str = string.gsub(string.lower(str), "cum", "с͘um")
		str = string.gsub(string.lower(str), "vodka", "v̜оḍk̜а")
		str = string.gsub(string.lower(str), "alcohol", "аІсоhоІ")
		str = string.gsub(string.lower(str), "beer", "Веег")
		str = string.gsub(string.lower(str), "dick", "d͘іск")
		str = string.gsub(string.lower(str), "boobs", "ВООВȘ")
		--
		str = string.gsub(string.lower(str), "weed", "ẃееď")
		str = string.gsub(string.lower(str), "cocaine", "сосаіne")
		str = string.gsub(string.lower(str), "meth", "Μеtḥ")
		str = string.gsub(string.lower(str), "heroin", "Негоіn")
		str = string.gsub(string.lower(str), "cock", "Ϲοсκ")
		str = string.gsub(string.lower(str), "rape", "гаре")
		str = string.gsub(string.lower(str), "sex", "ș͘ех")
		str = string.gsub(string.lower(str), "cunt", "сυпт")
		str = string.gsub(string.lower(str), "porn", "рогп")
		--
		str = string.gsub(string.lower(str), [[n_1]], "Νіğğеr")
		str = string.gsub(string.lower(str), [[n_2]], "Νіğğегs")
		str = string.gsub(str, [[n_3]], "Νіğğа")
		str = string.gsub(str, [[n_4]], "Νіğğа")
		str = string.gsub(str, [[n_5]], "ΝІĠĠА")
		str = string.gsub(string.lower(str), [[f_1]], "Ḟµск")
		str = string.gsub(string.lower(str), [[f_2]], "Ḟµскіng")
		str = string.gsub(string.lower(str), [[s_1]], "SНІТ")
		str = string.gsub(string.lower(str), [[s_2]], "śІа̝v̞e")
		str = string.gsub(string.lower(str), [[a_1]], "а̜̞̇s̮̗͗s")
		str = string.gsub(string.lower(str), [[b_1]], "ВІТСН")
		str = string.gsub(string.lower(str), [[s_3]], "SТḞÙ")
		str = string.gsub(string.lower(str), [[p_1]], "рü̜̞̇s̮̗͗sу")
		str = string.gsub(string.lower(str), [[w_1]], "wноге")
		str = string.gsub(string.lower(str), [[c_1]], "с͘um")
		str = string.gsub(string.lower(str), [[v_1]], "v̜оḍk̜а")
		str = string.gsub(string.lower(str), [[a_2]], "аІсоhоІ")
		str = string.gsub(string.lower(str), [[b_2]], "Веег")
		str = string.gsub(string.lower(str), [[d_1]], "d͘іск")
		str = string.gsub(string.lower(str), [[b_3]], "ВООВȘ")
		--
		str = string.gsub(string.lower(str), [[w_2]], "ẃееď")
		str = string.gsub(string.lower(str), [[c_2]], "сосаіne")
		str = string.gsub(string.lower(str), [[m_1]], "Μеtḥ")
		str = string.gsub(string.lower(str), [[h_1]], "Негоіn")
		str = string.gsub(string.lower(str), [[h_2]], "Ное")
		str = string.gsub(string.lower(str), [[c_3]], "Ϲοсκ")
		str = string.gsub(string.lower(str), [[r_1]], "гаре")
		str = string.gsub(string.lower(str), [[s_4]], "ș͘ех")
		str = string.gsub(string.lower(str), [[c_4]], "сυпт")
		str = string.gsub(string.lower(str), [[p_2]], "рогп")
		-- letter bypass
		str = string.gsub(string.lower(str), "i", "і")
		str = string.gsub(string.lower(str), "a", "а")
		str = string.gsub(string.lower(str), "c", "с")
		str = string.gsub(string.lower(str), "x", "х")
		str = string.gsub(string.lower(str), "3", "З")
		str = string.gsub(string.lower(str), "o", "о")
		str = string.gsub(string.lower(str), "y", "у")
		str = string.gsub(string.lower(str), "p", "р")
		str = string.gsub(string.lower(str), "r", "г")
		str = string.gsub(string.lower(str), "e", "е")
		str = string.gsub(string.lower(str), "n", "п")
		str = string.gsub(string.lower(str), "w", "ԝ")
	end
	return str
end

function chatMessage(msg)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

function loadAdmin(username: string)
	task.spawn(function()
		game.Players:WaitForChild(username, 9999999).Chatted:Connect(function(msg)
			print(msg)
			local message = string.lower(msg)
			print(message)
			if message:match("/") then
				print("first check passed match")
				local splitMessage = string.split(message, " ")
				print(splitMessage[2])
				if message:match("fling") then
					print("second check passed match")
					local player = getPlr(splitMessage[2])
					print("got player or smth")
					if player and player.Character then
						print("found char")
						SkidFling(player)
					end
				elseif message:match("massfling") then
					print("second check passed match")
					for i, v in ipairs(game.Players:GetPlayers()) do
						if v.Character then
							SkidFling(v)
						end
					end
				elseif message:match("widefling") then
					print("second check passed match")
					print("second check passed match")
					local player = getPlr(splitMessage[2])
					print("got player or smth")
					if player and player.Character then
						print("found char")
						WideSkidFling(player)
					end
				end
			end
		end)
		chatMessage("Succesfully loaded admin for ".. username)
	end)
end

function loadHeadAdmin(username: string)
	task.spawn(function()
		game.Players:WaitForChild(username, 9999999).Chatted:Connect(function(msg)
			print(msg)
			local message = string.lower(msg)
			print(message)
			if message:match("/") then
				print("first check passed match")
				local splitMessage = string.split(message, " ")
				print(splitMessage[2])
				if message:match("fling") then
					print("second check passed match")
					local player = getPlr(splitMessage[2])
					print("got player or smth")
					if player and player.Character then
						print("found char")
						SkidFling(player)
					end
				elseif message:match("massfling") then
					print("second check passed match")
					for i, v in ipairs(game.Players:GetPlayers()) do
						if v.Character then
							SkidFling(v)
						end
					end
				elseif message:match("widefling") then
					print("second check passed match")
					print("second check passed match")
					local player = getPlr(splitMessage[2])
					print("got player or smth")
					if player and player.Character then
						print("found char")
						WideSkidFling(player)
					end
				elseif message:match("announcement") then
					chatMessage("Announcement from ".. game.Players:WaitForChild(username, 99999999).DisplayName .. ": " .. bypassMessage(string.gsub(msg, "/announcement ", "")))
				elseif message:match("admin") then
					loadAdmin(getPlr(string.gsub(msg, "/admin ", "")).Name)
				end
			end
		end)
	end)
end

for i, admin in pairs(whitelisted) do
	loadHeadAdmin(tostring(admin))
end
