-- 🔥 RECHA HUB | Modern UI 4 แท็บ + Key System
-- ผู้สร้าง: พิชานนท์ อ่อนใจ

local correctKey = "HkMUpLKGiaSZcGmyKmkIpDkLuDFIaAQd"
local getKeyLink = "https://link-hub.net/1409495/iq28HOx18ksL"
local discordLink = "https://discord.gg/yv75SeE3"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- =========================
-- Key System GUI (หน้าใส)
-- =========================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "RECHA_KeySystem"
KeyGui.Parent = PlayerGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0,400,0,300)
KeyFrame.Position = UDim2.new(0.5,0,0.5,0)
KeyFrame.AnchorPoint = Vector2.new(0.5,0.5)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
KeyFrame.BackgroundTransparency = 0.3 -- ทำหน้าใส
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = KeyGui

local KeyGlow = Instance.new("UIStroke")
KeyGlow.Thickness = 6
KeyGlow.Color = Color3.fromRGB(0,170,255)
KeyGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
KeyGlow.Parent = KeyFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "RECHA HUB Key System"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8,0,0,50)
KeyBox.Position = UDim2.new(0.1,0,0.25,0)
KeyBox.PlaceholderText = "กรอกคีย์ของคุณ"
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 24
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.BorderSizePixel = 0
KeyBox.Parent = KeyFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8,0,0,50)
SubmitBtn.Position = UDim2.new(0.1,0,0.45,0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
SubmitBtn.TextColor3 = Color3.fromRGB(255,255,255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 24
SubmitBtn.Text = "ยืนยันคีย์"
SubmitBtn.Parent = KeyFrame

-- ปุ่ม Get Key
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.38,0,0,40)
GetKeyBtn.Position = UDim2.new(0.05,0,0.75,0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
GetKeyBtn.TextColor3 = Color3.fromRGB(255,255,255)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 20
GetKeyBtn.Text = "รับคีย์"
GetKeyBtn.Parent = KeyFrame
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(getKeyLink)
    KeyBox.PlaceholderText = "คัดลอกลิงก์คีย์แล้ว!"
end)

-- ปุ่ม Discord
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0.38,0,0,40)
DiscordBtn.Position = UDim2.new(0.57,0,0.75,0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(170,0,255)
DiscordBtn.TextColor3 = Color3.fromRGB(255,255,255)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 20
DiscordBtn.Text = "Discord"
DiscordBtn.Parent = KeyFrame
DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard(discordLink)
    KeyBox.PlaceholderText = "คัดลอกลิงก์ Discord แล้ว!"
end)

-- =========================
-- Load Main UI
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
    -- แท็บ 1: ฟังก์ชันแอดมิน
    -- ===================
    local TabAdmin = Window:CreateTab("🧑‍💻 Admin")
    local currentWalkSpeed = 50

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

    TabAdmin:CreateButton({
        Name = "บิน (Fly)",
        Callback = function()
            task.spawn(function()
                local success = pcall(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
                end)
                if success then Notify("✅ สำเร็จ", "เปิดโหมดบินแล้ว!", true)
                else Notify("❌ ล้มเหลว", "โหลดสคริปต์บินไม่สำเร็จ", false) end
            end)
        end
    })

    TabAdmin:CreateButton({
        Name = "ESP (เห็นผู้เล่น)",
        Callback = function()
            task.spawn(function()
                local success = pcall(function()
                    local CoreGui = game:FindService("CoreGui")
                    local Players = game:FindService("Players")
                    local Storage = Instance.new("Folder")
                    Storage.Parent = CoreGui
                    Storage.Name = "Highlight_Storage"
                    for i,v in next, Players:GetPlayers() do
                        local Highlight = Instance.new("Highlight")
                        Highlight.Name = v.Name
                        Highlight.FillColor = Color3.fromRGB(175,25,255)
                        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        Highlight.FillTransparency = 0.5
                        Highlight.OutlineColor = Color3.fromRGB(255,255,255)
                        Highlight.OutlineTransparency = 0
                        Highlight.Parent = Storage
                        if v.Character then Highlight.Adornee = v.Character end
                        v.CharacterAdded:Connect(function(char) Highlight.Adornee = char end)
                    end
                end)
                if success then Notify("✅ สำเร็จ","เปิด ESP แล้ว!",true)
                else Notify("❌ ล้มเหลว","โหลด ESP ไม่สำเร็จ",false) end
            end)
        end
    })

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
    TabFoot:CreateButton({
        Name="บอกฟุต",
        Callback=function()
            loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub"))()
            Notify("บอกฟุต","บอกฟุตเรียบร้อย!",true)
        end
    })

    -- ===================
    -- แท็บ 3: Brainrot
    -- ===================
    local TabBrainrot = Window:CreateTab("💀 Brainrot")
    TabBrainrot:CreateButton({
        Name="เปิด Brainrot", 
        Callback=function()
            loadstring(game:HttpGet("URL_โค้ด_Brainrot"))()
            Notify("Brainrot","เปิด Brainrot เรียบร้อย!",true)
        end
    })

    -- ===================
    -- แท็บ 4: 99 คืนในป่า
    -- ===================
    local Tab99 = Window:CreateTab("🌲 99 คืนในป่า")
    Tab99:CreateButton({
        Name="คืน 99", 
        Callback=function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/your_script_link"))()
            Notify("คืน 99","คืน 99 เรียบร้อย!",true)
        end
    })
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
