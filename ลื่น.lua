-- ตรวจสอบว่าผู้เล่นโหลดเสร็จแล้วก่อนที่จะเริ่มสคริปต์
repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- ลดปิงทางเครือข่าย
pcall(function()
    local NetworkSettings = settings().Network
    NetworkSettings.IncomingReplicationLag = 0
end)

-- ทำให้วัตถุในเกมโปร่งใสแค่บางส่วนเพื่อไม่ให้ขาวจนมองไม่เห็น
pcall(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("Decal") then
            v.Transparency = 0.01 -- ปรับให้โปร่งใส 1% เพื่อให้เห็นวัตถุชัดขึ้น
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic -- เปลี่ยนวัสดุเพื่อให้เกมลื่นขึ้น
            end
        end
    end
end)

-- ทำให้ตัวละครของผู้เล่นโปร่งใส
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

pcall(function()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 0.7 -- ทำให้ตัวละครโปร่งใส 70%
        elseif part:IsA("Accessory") then
            part.Handle.Transparency = 0.7 -- ทำให้สิ่งของต่าง ๆ บนตัวละครโปร่งใส 70%
        end
    end
end)