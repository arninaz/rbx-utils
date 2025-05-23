local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local transparencyValue = 0.5
local vector = Vector3.new(3,3,3)

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(function()
        wait(5)
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("Part") and part.Name:match("_Expanded") then
                part.Transparency = transparencyValue
            end
        end
    end)
end)

local function createAndStabilizePart(part, size, name, transparency)
    local existingClone = part.Parent:FindFirstChild(name)
    if existingClone then
        existingClone:Destroy()
    end

    local clone = Instance.new("Part")
    clone.Size = size
    clone.CanCollide = false
    clone.Transparency = transparency
    clone.Name = name
    clone.Position = part.Position
    clone.Anchored = false
    clone.Parent = part.Parent

    local originalAttachment = Instance.new("Attachment")
    originalAttachment.Name = "OriginalAttachment"
    originalAttachment.Parent = part

    local cloneAttachment = Instance.new("Attachment")
    cloneAttachment.Name = "CloneAttachment"
    cloneAttachment.Parent = clone

    local alignPosition = Instance.new("AlignPosition")
    alignPosition.Attachment0 = cloneAttachment
    alignPosition.Attachment1 = originalAttachment
    alignPosition.RigidityEnabled = true
    alignPosition.Parent = clone

    local alignOrientation = Instance.new("AlignOrientation")
    alignOrientation.Attachment0 = cloneAttachment
    alignOrientation.Attachment1 = originalAttachment
    alignOrientation.RigidityEnabled = true
    alignOrientation.Parent = clone

    return clone
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T then
        local character = LocalPlayer.Character
        if character then
            local lowerTorso = character:FindFirstChild("LowerTorso")
            local upperTorso = character:FindFirstChild("UpperTorso")
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local leftArm = character:FindFirstChild("Left Arm")
            local rightArm = character:FindFirstChild("Right Arm")
            local leftLeg = character:FindFirstChild("Left Leg")
            local rightLeg = character:FindFirstChild("Right Leg")
            local leftHand = character:FindFirstChild("LeftHand")
            local rightHand = character:FindFirstChild("RightHand")
            local leftFoot = character:FindFirstChild("LeftFoot")
            local rightFoot = character:FindFirstChild("RightFoot")

            if lowerTorso then
                local lowerClone1 = createAndStabilizePart(lowerTorso, Vector3.new(12, 12, 12), "LowerTorso_Expanded", 1)
                local lowerClone2 = createAndStabilizePart(lowerClone1, Vector3.new(9, 9, 9), "LowerTorso_MidExpanded1", 1)
                local lowerClone3 = createAndStabilizePart(lowerClone2, Vector3.new(6, 6, 6), "LowerTorso_HalfExpanded", 1)
                createAndStabilizePart(lowerClone3, vector, "LowerTorso_MidExpanded2", 1)
            end

            if upperTorso then
                local upperClone1 = createAndStabilizePart(upperTorso, Vector3.new(12, 12, 12), "UpperTorso_Expanded", 1)
                local upperClone2 = createAndStabilizePart(upperClone1, Vector3.new(9, 9, 9), "UpperTorso_MidExpanded1", 1)
                local upperClone3 = createAndStabilizePart(upperClone2, Vector3.new(6, 6, 6), "UpperTorso_HalfExpanded", 1)
                createAndStabilizePart(upperClone3, vector, "UpperTorso_MidExpanded2", 1)
            end

            if humanoidRootPart then
                local hrpClone1 = createAndStabilizePart(humanoidRootPart, Vector3.new(12, 12, 12), "HumanoidRootPart_Expanded1", 0.9)
                local hrpClone2 = createAndStabilizePart(hrpClone1, Vector3.new(9, 9, 9), "HumanoidRootPart_Expanded2", 1)
                local hrpClone3 = createAndStabilizePart(hrpClone2, Vector3.new(6, 6, 6), "HumanoidRootPart_Expanded3", 1)
                createAndStabilizePart(hrpClone3, vector, "HumanoidRootPart_Expanded4", 1)
            end

            if leftArm then
                local leftArmClone1 = createAndStabilizePart(leftArm, Vector3.new(12, 12, 12), "LeftArm_Expanded", 1)
                local leftArmClone2 = createAndStabilizePart(leftArmClone1, Vector3.new(9, 9, 9), "LeftArm_MidExpanded1", 1)
                local leftArmClone3 = createAndStabilizePart(leftArmClone2, Vector3.new(6, 6, 6), "LeftArm_HalfExpanded", 1)
                createAndStabilizePart(leftArmClone3, vector, "LeftArm_MidExpanded2", 1)
            end

            if rightArm then
                local rightArmClone1 = createAndStabilizePart(rightArm, Vector3.new(12, 12, 12), "RightArm_Expanded", 1)
                local rightArmClone2 = createAndStabilizePart(rightArmClone1, Vector3.new(9, 9, 9), "RightArm_MidExpanded1", 1)
                local rightArmClone3 = createAndStabilizePart(rightArmClone2, Vector3.new(6, 6, 6), "RightArm_HalfExpanded", 1)
                createAndStabilizePart(rightArmClone3, vector, "RightArm_MidExpanded2", 1)
            end

            if leftLeg then
                local leftLegClone1 = createAndStabilizePart(leftLeg, Vector3.new(12, 12, 12), "LeftLeg_Expanded", 1)
                local leftLegClone2 = createAndStabilizePart(leftLegClone1, Vector3.new(9, 9, 9), "LeftLeg_MidExpanded1", 1)
                local leftLegClone3 = createAndStabilizePart(leftLegClone2, Vector3.new(6, 6, 6), "LeftLeg_HalfExpanded", 1)
                createAndStabilizePart(leftLegClone3, vector, "LeftLeg_MidExpanded2", 1)
            end

            if rightLeg then
                local rightLegClone1 = createAndStabilizePart(rightLeg, Vector3.new(12, 12, 12), "RightLeg_Expanded", 1)
                local rightLegClone2 = createAndStabilizePart(rightLegClone1, Vector3.new(9, 9, 9), "RightLeg_MidExpanded1", 1)
                local rightLegClone3 = createAndStabilizePart(rightLegClone2, Vector3.new(6, 6, 6), "RightLeg_HalfExpanded", 1)
                createAndStabilizePart(rightLegClone3, vector, "RightLeg_MidExpanded2", 1)
            end

            if leftHand then
                local leftHandClone1 = createAndStabilizePart(leftHand, Vector3.new(12, 12, 12), "LeftHand_Expanded", 1)
                local leftHandClone2 = createAndStabilizePart(leftHandClone1, Vector3.new(9, 9, 9), "LeftHand_MidExpanded1", 1)
                local leftHandClone3 = createAndStabilizePart(leftHandClone2, Vector3.new(6, 6, 6), "LeftHand_HalfExpanded", 1)
                createAndStabilizePart(leftHandClone3, vector, "LeftHand_MidExpanded2", 1)
            end

            if rightHand then
                local rightHandClone1 = createAndStabilizePart(rightHand, Vector3.new(12, 12, 12), "RightHand_Expanded", 1)
                local rightHandClone2 = createAndStabilizePart(rightHandClone1, Vector3.new(9, 9, 9), "RightHand_MidExpanded1", 1)
                local rightHandClone3 = createAndStabilizePart(rightHandClone2, Vector3.new(6, 6, 6), "RightHand_HalfExpanded", 1)
                createAndStabilizePart(rightHandClone3, vector, "RightHand_MidExpanded2", 1)
            end

            if leftFoot then
                local leftFootClone1 = createAndStabilizePart(leftFoot, Vector3.new(12, 12, 12), "LeftFoot_Expanded", 1)
                local leftFootClone2 = createAndStabilizePart(leftFootClone1, Vector3.new(9, 9, 9), "LeftFoot_MidExpanded1", 1)
                local leftFootClone3 = createAndStabilizePart(leftFootClone2, Vector3.new(6, 6, 6), "LeftFoot_HalfExpanded", 1)
                createAndStabilizePart(leftFootClone3, vector, "LeftFoot_MidExpanded2", 1)
            end

            if rightFoot then
                local rightFootClone1 = createAndStabilizePart(rightFoot, Vector3.new(12, 12, 12), "RightFoot_Expanded", 1)
                local rightFootClone2 = createAndStabilizePart(rightFootClone1, Vector3.new(9, 9, 9), "RightFoot_MidExpanded1", 1)
                local rightFootClone3 = createAndStabilizePart(rightFootClone2, Vector3.new(6, 6, 6), "RightFoot_HalfExpanded", 1)
                createAndStabilizePart(rightFootClone3, vector, "RightFoot_MidExpanded2", 1)
            end
        end
    end
end)
