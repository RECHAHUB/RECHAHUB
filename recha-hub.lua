-- โหลด Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- สร้าง Window
local Window = Rayfield:CreateWindow({
    Name = "🔥 RECHA HUB | Modern UI",
    LoadingTitle = "RECHA HUB",
    LoadingSubtitle = "Blox Fruits",
    ConfigurationSaving = {Enabled = true, FolderName = "RECHA HUB"},
    Theme = {
        Accent = Color3.fromRGB(0, 200, 255),
        WindowBackground = Color3.fromRGB(25, 25, 25),
        SliderFill = Color3.fromRGB(0, 200, 255),
        SliderBackground = Color3.fromRGB(40, 40, 40),
        Toggle = Color3.fromRGB(0, 200, 255)
    },
    IntroText = "โหลดเสร็จสิ้น",
    KeySystem = false
})

-- ฟังก์ชันแจ้งเตือนสวย
local function Notify(title, content, success)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 3,
        Image = success and 4483362458 or 4483362459
    })
end

-- 🧑‍💻 แอดมิน
local Tab1 = Window:CreateTab("🧑‍💻 แอดมิน")

-- Slider ความเร็วแก้ไข
Tab1:CreateSlider({
    Name = "ความเร็ว",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 50,
    ValueFormat = function(Value) return tostring(Value) end,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        -- รอให้ Character พร้อม
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        else
            player.CharacterAdded:Wait()
            player.Character:WaitForChild("Humanoid").WalkSpeed = Value
        end

        Notify("🏃 ความเร็วอัปเดตแล้ว!", "ตอนนี้ความเร็ว: "..Value, true)
    end
})

-- เพิ่ม listener เวลา Respawn
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.WalkSpeed = Tab1.Sliders[1].CurrentValue -- ใช้ค่า Slider ปัจจุบัน
end)


-- Slider กระโดดสูง
Tab1:CreateSlider({
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

-- ปุ่มบิน
Tab1:CreateButton({
    Name = "บิน (Fly)",
    Callback = function()
        task.spawn(function()
            local success, err = pcall(function()
                loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
            end)
            if success then
                Notify("✅ สำเร็จ", "เปิดโหมดบินแล้ว!", true)
            else
                Notify("❌ ล้มเหลว", "โหลดสคริปต์บินไม่สำเร็จ", false)
            end
        end)
    end
})

-- ปุ่ม ESP
Tab1:CreateButton({
    Name = "ESP (เห็นผู้เล่น)",
    Callback = function()
        task.spawn(function()
            local success, err = pcall(function()
                local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
            end)
            if success then
                Notify("✅ สำเร็จ", "เปิด ESP แล้ว!", true)
            else
                Notify("❌ ล้มเหลว", "โหลด ESP ไม่สำเร็จ", false)
            end
        end)
    end
})


-- 🌙 คืน 99
local Tab2 = Window:CreateTab("🌙 คืน 99")
Tab2:CreateButton({
    Name = "เปิดสคริปต์ คืน 99",
    Callback = function()
        task.spawn(function()
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/your_script_link"))()
            end)
            if success then
                Notify("✅ สำเร็จ", "รันสคริปต์ คืน 99 สำเร็จ!", true)
            else
                Notify("❌ ล้มเหลว", "โหลดสคริปต์ คืน 99 ไม่สำเร็จ", false)
            end
        end)
    end
})

-- 🍍 บอกฟุต
local Tab3 = Window:CreateTab("🍍 บอกฟุต")
Tab3:CreateButton({
    Name = "🍍รันสคริปต์บอกฟุต",
    Callback = function()
        task.spawn(function()
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xNaos/Sunny-Hub/refs/heads/main/Loader"))()
            end)
            if success then
                Notify("✅ สำเร็จ", "โหลดสคริปต์บอกฟุตแล้ว!", true)
            else
                Notify("❌ ล้มเหลว", "โหลดสคริปต์บอกฟุตไม่สำเร็จ", false)
            end
        end)
    end
})

Tab3:CreateButton({
    Name = "🍍รันสคริปต์บอกฟุต",
    Callback = function()
        task.spawn(function()
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub"))()
            end)
            if success then
                Notify("✅ สำเร็จ", "โหลดสคริปต์บอกฟุตแล้ว!", true)
            else
                Notify("❌ ล้มเหลว", "โหลดสคริปต์บอกฟุตไม่สำเร็จ", false)
            end
        end)
    end
})
