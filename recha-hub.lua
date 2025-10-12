-- 🔥 RECHA HUB | Modern UI + Key System + Brainrot Tab
-- ผู้สร้าง: พิชานนท์ อ่อนใจ

-- ✅ ตั้งค่าคีย์และลิงก์
local correctKey = "HkMUpmKEiaSZcGmyKmkIpDkLuMFIaAQu"
local getKeyLink = "https://link-hub.net/1409495/QdVImmebdIO7"

-- โหลด Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ฟังก์ชันแจ้งเตือน
local function Notify(title, content, success)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 3,
        Image = success and 4483362458 or 4483362459
    })
end

------------------------------------------------
-- 🧩 หน้ากรอกคีย์
------------------------------------------------
local KeyWindow = Rayfield:CreateWindow({
    Name = "🔑 RECHA HUB | Key System",
    LoadingTitle = "RECHA HUB",
    LoadingSubtitle = "ใส่คีย์เพื่อเข้าใช้งาน",
    ConfigurationSaving = {Enabled = false},
    Theme = {
        Accent = Color3.fromRGB(0,200,255),
        WindowBackground = Color3.fromRGB(25,25,25)
    },
    IntroText = "โหลดระบบคีย์แล้ว"
})

local KeyTab = KeyWindow:CreateTab("🔐 ระบบคีย์")
local keyInput = ""

KeyTab:CreateInput({
    Name = "ใส่คีย์ของคุณที่นี่",
    PlaceholderText = "เช่น RECHA-9999",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        keyInput = Value
    end
})

KeyTab:CreateButton({
    Name = "🔎 ไปที่ลิงก์เอาคีย์",
    Callback = function()
        setclipboard(getKeyLink)
        Notify("คัดลอกลิงก์แล้ว!", "นำไปวางในเบราว์เซอร์เพื่อรับคีย์", true)
    end
})

KeyTab:CreateButton({
    Name = "✅ ยืนยันคีย์",
    Callback = function()
        if keyInput == correctKey then
            Notify("สำเร็จ!", "คีย์ถูกต้อง กำลังโหลด RECHA HUB...", true)
            task.wait(1)
            Rayfield:Destroy() -- ปิดหน้าคีย์
            task.wait(0.5)

            ------------------------------------------------
            -- 🔥 โหลดเมนูหลัก RECHA HUB
            ------------------------------------------------
            local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

            local function Notify(title, content, success)
                Rayfield:Notify({
                    Title = title,
                    Content = content,
                    Duration = 3,
                    Image = success and 4483362458 or 4483362459
                })
            end

            ------------------------------------------------
            -- 🧑‍💻 แอดมิน
            ------------------------------------------------
            local Tab1 = Window:CreateTab("🧑‍💻 แอดมิน")
            Tab1:CreateSlider({
                Name = "ความเร็ว",
                Range = {16, 200},
                Increment = 1,
                CurrentValue = 50,
                ValueFormat = function(Value) return tostring(Value) end,
                Callback = function(Value)
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.WalkSpeed = Value
                    else
                        player.CharacterAdded:Wait()
                        player.Character:WaitForChild("Humanoid").WalkSpeed = Value
                    end
                    Notify("🏃 ความเร็วอัปเดตแล้ว!", "ตอนนี้ความเร็ว: "..Value, true)
                end
            })

            game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
                local humanoid = char:WaitForChild("Humanoid")
                humanoid.WalkSpeed = Tab1.Sliders[1].CurrentValue
            end)

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

            Tab1:CreateButton({
                Name = "บิน (Fly)",
                Callback = function()
                    task.spawn(function()
                        local success, err = pcall(function()
                            loadstring(game:HttpGet("https://gist.githubusercontent.com/meozoneYT/bf037dff9f0a70017304ddd67fdcd370/raw/fly_obfuscator.lua"))()
                        end)
                        if success then
                            Notify("✅ สำเร็จ", "เปิดโหมดบินแล้ว!", true)
                        else
                            Notify("❌ ล้มเหลว", "โหลดสคริปต์บินไม่สำเร็จ", false)
                        end
                    end)
                end
            })

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
                                if plrchar then Highlight.Adornee = plrchar end
                                connections[plr] = plr.CharacterAdded:Connect(function(char)
                                    Highlight.Adornee = char
                                end)
                            end

                            Players.PlayerAdded:Connect(Highlight)
                            for i,v in next, Players:GetPlayers() do Highlight(v) end
                            Players.PlayerRemoving:Connect(function(plr)
                                if Storage[plr.Name] then Storage[plr.Name]:Destroy() end
                                if connections[plr] then connections[plr]:Disconnect() end
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

            ------------------------------------------------
            -- 🌙 คืน 99
            ------------------------------------------------
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

            ------------------------------------------------
            -- 🍍 บอกฟุต
            ------------------------------------------------
            local Tab3 = Window:CreateTab("🍍 บอกฟุต")
            Tab3:CreateButton({
                Name = "🍍รันสคริปต์บอกฟุต (Sunny Hub)",
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
                Name = "🍍รันสคริปต์บอกฟุต (Zee Hub)",
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

            ------------------------------------------------
            -- 🎃 ขโมย Brainrot
            ------------------------------------------------
            local Tab4 = Window:CreateTab("🎃 ขโมย Brainrot")
            Tab4:CreateButton({
                Name = "รันสคริปต์ขโมย Brainrot",
                Callback = function()
                    task.spawn(function()
                        local success, err = pcall(function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/RECHAHUB/RECHAHUB/refs/heads/main/recha-hub.lua"))()
                        end)
                        if success then
                            Notify("✅ สำเร็จ", "โหลดสคริปต์ Brainrot แล้ว!", true)
                        else
                            Notify("❌ ล้มเหลว", "โหลดสคริปต์ Brainrot ไม่สำเร็จ", false)
                        end
                    end)
                end
            })

        else
            Notify("❌ คีย์ไม่ถูกต้อง!", "กรุณาลองใหม่อีกครั้ง", false)
        end
    end
})
