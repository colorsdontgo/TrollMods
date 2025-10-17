---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- this file will be reloaded if it changes during gameplay,
-- 	so only assign to values or define things here.

function post_SetupUnit(unit, currentRun, args)
	local randomSpeedModifier = RandomFloat(0.25, 3.0) - 1.0
	unit.SpeedMultiplier = unit.SpeedMultiplier + randomSpeedModifier

	if unit.AIThreadName then
		SetElapsedTimeMultiplier( (unit.SpeedMultiplier + randomSpeedModifier) / unit.SpeedMultiplier, unit.AIThreadName )
    end

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = unit.SpeedMultiplier, ValueChangeType = "Multiply", DataValue = false, DestinationId = unit.ObjectId })
end
