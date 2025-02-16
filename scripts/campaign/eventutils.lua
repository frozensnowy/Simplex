-- scripts/campaign/eventutils.lua

function EnableSkip(enable)
    return { "Universe_EnableSkip(" .. enable .. ")", "", }
end

function MuteActor(actor)
    return { "Sound_SetMuteActor('" .. actor .. "')", "", }
end

function EnterIntelEvent()
    return { "Sound_EnterIntelEvent()", "", }
end

function ExitIntelEvent()
    return { "Sound_ExitIntelEvent()", "", }
end

function Letterbox(enable)
    return { "HW2_Letterbox(" .. enable .. ")", "", }
end

function ToggleSensors(enable)
    return { "Sensors_Toggle(" .. enable .. ")", "", }
end

function InterpolateCamera(location, target, time)
    return { "Camera_Interpolate( '" .. location .. "', '" .. target .. "', " .. time .. ")", "", }
end

function SubTitleEvent(actor, textID, duration)
    return HW2_SubTitleEvent(actor, textID, duration)
end

function CreateEventPointerSobGroup(sobGroup)
    return { "g_pointer_default = HW2_CreateEventPointerSobGroup('" .. sobGroup .. "')", "", }
end

function CreateEventPointerVolume(volume)
    return { "g_pointer_default = HW2_CreateEventPointerVolume('" .. volume .. "')", "", }
end

function AddObjective(obj, objType)
    return { "obj_prim_" .. obj .. "_id = Objective_Add( obj_prim_" .. obj .. ", " .. objType .. " )", "", }
end

function AddObjectiveDescription(obj, description)
    return { "Objective_AddDescription( obj_prim_" .. obj .. "_id, '" .. description .. "')", "", }
end

function CreatePingWithLabelPoint(ping, volume)
    return { "ping_" .. ping .. "_id = HW2_PingCreateWithLabelPoint ( ping_" .. ping .. ", '" .. volume .. "' )", "", }
end

function AddPingDescription(ping, index, description)
    return { "Ping_AddDescription(ping_" .. ping .. "_id, " .. index .. ", '" .. description .. "')", "", }
end

function RemoveEventPointer()
    return { "EventPointer_Remove(g_pointer_default)", "", }
end

function FlashButton(ui, button, flash)
    return { "UI_FlashButton('" .. ui .. "', '" .. button .. "', " .. flash .. ")", "", }
end

function AddRule(rule)
    return { "Rule_Add( '" .. rule .. "' )", "", }
end

function AddRuleInterval(rule, interval)
    return { "Rule_AddInterval( '" .. rule .. "', " .. interval .. " )", "", }
end

function CreateEventPointerSobGroupWithVolume(sobGroup, volume)
    return { "g_pointer_default = HW2_CreateEventPointerSobGroup('" .. sobGroup .. "', '" .. volume .. "')", "", }
end

function CreateEventPointerSubSystem(subSystem, mothership)
    return { "g_pointer_default = HW2_CreateEventPointerSubSystem('" .. subSystem .. "', '" .. mothership .. "')", "", }
end
