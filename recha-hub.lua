-- 🔥 RECHA HUB V8 | Modern UI 4 แท็บ + Key System (เวอร์ชันรวม)
-- ผู้สร้าง: พิชานนท์ อ่อนใจ (ปรับปรุงโดย ChatGPT)
-- ฟีเจอร์: Key UI ใหม่ (เล็ก, ทึบ, กากบาท, เลื่อนได้) + Fly/ESP เปิดปิด + 4 แท็บ

local correctKey = "RECHAV14VtyUHKl"
local getKeyLink = "https://link-hub.net/1409495/iq28HOx18ksL"
local discordLink = "https://discord.gg/yv75SeE3"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- =========================
-- Key System GUI (ใหม่: ขนาดเล็ก, ทึบ, กากบาท, เลื่อนได้)
-- =========================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "RECHA_KeySystem"
KeyGui.Parent = PlayerGui
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyFrame.BackgroundTransparency = 0.05
KeyFrame.BorderSizePixel = 0
KeyFrame.ClipsDescendants = true
KeyFrame.Parent = KeyGui

-- แสงขอบ
local KeyGlow = Instance.new("UIStroke")
KeyGlow.Thickness = 5
KeyGlow.Color = Color3.fromRGB(0, 170, 255)
KeyGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
KeyGlow.Parent = KeyFrame

-- เงา
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10,10,118,118)
Shadow.Parent = KeyFrame

-- กากบาทปิด
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = KeyFrame
CloseBtn.MouseButton1Click:Connect(function() KeyGui:Destroy() end)

-- ชื่อหัวข้อ
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "🔑 RECHA HUB Key System"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = KeyFrame

-- กล่องกรอกคีย์
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 40)
KeyBox.Position = UDim2.new(0.075, 0, 0.3, 0)
KeyBox.PlaceholderText = "กรอกคีย์ของคุณ"
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 20
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.BorderSizePixel = 0
KeyBox.Parent = KeyFrame

-- ปุ่มยืนยันคีย์
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.075, 0, 0.52, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
SubmitBtn.TextColor3 = Color3.fromRGB(255,255,255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 20
SubmitBtn.Text = "✅ ยืนยันคีย์"
SubmitBtn.Parent = KeyFrame

-- ปุ่ม Get Key
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.42,0,0,35)
GetKeyBtn.Position = UDim2.new(0.06,0,0.78,0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
GetKeyBtn.TextColor3 = Color3.fromRGB(255,255,255)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 18
GetKeyBtn.Text = "รับคีย์"
GetKeyBtn.Parent = KeyFrame
GetKeyBtn.MouseButton1Click:Connect(function()
	setclipboard(getKeyLink)
	KeyBox.PlaceholderText = "คัดลอกลิงก์คีย์แล้ว!"
end)

-- ปุ่ม Discord
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0.42,0,0,35)
DiscordBtn.Position = UDim2.new(0.52,0,0.78,0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(170,0,255)
DiscordBtn.TextColor3 = Color3.fromRGB(255,255,255)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 18
DiscordBtn.Text = "Discord"
DiscordBtn.Parent = KeyFrame
DiscordBtn.MouseButton1Click:Connect(function()
	setclipboard(discordLink)
	KeyBox.PlaceholderText = "คัดลอกลิงก์ Discord แล้ว!"
end)

-- ทำให้ลากได้
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

KeyFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = KeyFrame.Position
	end
end)

KeyFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		KeyFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- =========================
-- โหลด Main UI
-- =========================
local function LoadMainUI()
	KeyGui:Destroy()
	local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
	local function Notify(title, content, success)
		Rayfield:Notify({Title = title, Content = content, Duration = 3, Image = success and 4483362458 or 4483362459})
	end

	local Window = Rayfield:CreateWindow({
		Name = "🔥 RECHA HUB | All maps",
		LoadingTitle = "RECHA HUB",
		LoadingSubtitle = "Blox Fruits",
		ConfigurationSaving = {Enabled = true, FolderName = "RECHA HUB"},
		Theme = {Accent = Color3.fromRGB(25,150,25), WindowBackground = Color3.fromRGB(25,25,25)},
		IntroText = "โหลดเสร็จสิ้น",
		KeySystem = false
	})

	-- ===================
	-- แท็บ 1: Admin (Fly/ESP toggle)
	-- ===================
	local TabAdmin = Window:CreateTab("🧑‍💻 Admin")
	local currentWalkSpeed = 50

	-- ความเร็ว
	TabAdmin:CreateSlider({
		Name="ความเร็ว",
		Range={16,200},
		Increment=1,
		CurrentValue=currentWalkSpeed,
		ValueFormat=function(v)return tostring(v)end,
		Callback=function(Value)
			currentWalkSpeed=Value
			local p=game.Players.LocalPlayer
			if p.Character and p.Character:FindFirstChild("Humanoid") then
				p.Character.Humanoid.WalkSpeed=Value
			else
				p.CharacterAdded:Wait(); p.Character:WaitForChild("Humanoid").WalkSpeed=Value
			end
			Notify("🏃 ความเร็วอัปเดตแล้ว!","ตอนนี้ความเร็ว: "..Value,true)
		end
	})
	game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
		local humanoid = char:WaitForChild("Humanoid")
		humanoid.WalkSpeed = currentWalkSpeed
	end)

	-- กระโดดสูง
	TabAdmin:CreateSlider({
		Name = "กระโดดสูง",
		Range = {50, 300},
		Increment = 1,
		CurrentValue = 200,
		ValueFormat = function(Value) return tostring(Value) end,
		Callback = function(Value)
			local player = game.Players.LocalPlayer
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				player.Character.Humanoid.JumpPower = Value
				Notify("🦘 กระโดดอัปเดตแล้ว!", "JumpPower: "..Value, true)
			end
		end
	})

	-- Fly toggle
	local flyEnabled = false
	local flyConnection
	TabAdmin:CreateButton({
		Name = "✈️ เปิด/ปิดโหมดบิน",
		Callback = function()
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
			local speed = 3
			local uis = game:GetService("UserInputService")
			flyEnabled = not flyEnabled
			if flyEnabled then
				Notify("✅ เปิดบิน", "ตอนนี้คุณสามารถบินได้", true)
				flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
					if uis:IsKeyDown(Enum.KeyCode.W) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * speed
					elseif uis:IsKeyDown(Enum.KeyCode.S) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame - humanoidRootPart.CFrame.LookVector * speed
					end
					if uis:IsKeyDown(Enum.KeyCode.A) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(-speed, 0, 0)
					elseif uis:IsKeyDown(Enum.KeyCode.D) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(speed, 0, 0)
					end
					if uis:IsKeyDown(Enum.KeyCode.Space) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0,speed,0)
					elseif uis:IsKeyDown(Enum.KeyCode.LeftControl) then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame - Vector3.new(0,speed,0)
					end
				end)
			else
				if flyConnection then flyConnection:Disconnect() end
				Notify("🛑 ปิดบินแล้ว", "กลับสู่สภาพปกติ", false)
			end
		end
	})

	-- ESP toggle
	local espEnabled = false
	local espFolder = Instance.new("Folder")
	espFolder.Name = "Highlight_Storage"
	espFolder.Parent = game:GetService("CoreGui")

	TabAdmin:CreateButton({
		Name = "👁 เปิด/ปิด ESP ผู้เล่น",
		Callback = function()
			espEnabled = not espEnabled
			if espEnabled then
				for _, player in pairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer then
						local highlight = Instance.new("Highlight")
						highlight.Name = player.Name
						highlight.FillColor = Color3.fromRGB(175,25,255)
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.5
						highlight.OutlineColor = Color3.fromRGB(255,255,255)
						highlight.OutlineTransparency = 0
						highlight.Parent = espFolder
						if player.Character then highlight.Adornee = player.Character end
						player.CharacterAdded:Connect(function(char)
							highlight.Adornee = char
						end)
					end
				end
				Notify("✅ เปิด ESP แล้ว!", "เห็นผู้เล่นทั้งหมด", true)
			else
				for _, v in pairs(espFolder:GetChildren()) do
					v:Destroy()
				end
				Notify("🛑 ปิด ESP แล้ว!", "ลบ Highlight ทั้งหมด", false)
			end
		end
	})

	-- Discord
	TabAdmin:CreateButton({
		Name="💬 เข้าดิสคอร์ด RECHA HUB",
		Callback=function()
			setclipboard(discordLink)
			Notify("คัดลอกลิงก์ Discord แล้ว!","นำไปวางในเบราว์เซอร์เพื่อเข้าร่วมเซิร์ฟเวอร์", true)
		end
	})

	-- ===================
	-- แท็บ 2: บอกฟุต
	-- ===================
	local TabFoot = Window:CreateTab("📏 บอกฟุต")
	TabFoot:CreateButton({Name="บอกฟุต Zee-Hub ไม่มีคีย์", Callback=function()
		loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub"))()
		Notify("บอกฟุต","บอกฟุตเรียบร้อย!",true)
	end})
	TabFoot:CreateButton({Name="บอกฟุต NutHub มีคีย์", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
		Notify("บอกฟุต","บอกฟุตเรียบร้อย!",true)
	end})
	TabFoot:CreateButton({Name="บอกฟุตSpeed Hub มีคีย์", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
		Notify("บอกฟุต","บอกฟุตเรียบร้อย!",true)
	end})
	TabFoot:CreateButton({Name="บอกฟุตSolix Hub มีคีย์", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/a/a/a"))()
		Notify("บอกฟุต","บอกฟุตเรียบร้อย!",true)
	end})

	-- ===================
	-- แท็บ 3: Brainrot
	-- ===================
	local TabBrainrot = Window:CreateTab("💀 Brainrot")
	TabBrainrot:CreateButton({Name="เปิด Brainrot", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua", true))()
		Notify("Brainrot","เปิด Brainrot เรียบร้อย!",true)
	end})

	-- ===================
	-- แท็บ 4: 99 คืนในป่า
	-- ===================
	local Tab99 = Window:CreateTab("🌲 99 คืนในป่า")
	Tab99:CreateButton({Name="คืน 99 (ChuHub)", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ChuScriptsOfficial/ChuHUB/main/Loader"))()
		Notify("คืน 99 (ChuHub)","คืน 99 เรียบร้อย!",true)
	end})
	Tab99:CreateButton({Name="คืน 99 (Elude)", Callback=function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkenedEssence/Elude/refs/heads/main/Loader.lua"))()
		Notify("คืน 99 (Elude)","คืน 99 เรียบร้อย!",true)
	end})
end

-- =========================
-- Key Submit
-- =========================
SubmitBtn.MouseButton1Click:Connect(function()
	if KeyBox.Text == correctKey then
		LoadMainUI()
	else
		KeyBox.Text = ""
		KeyBox.PlaceholderText = "คีย์ไม่ถูกต้อง!"
	end
end)
