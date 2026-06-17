-- name: [CS] N64 Mario
-- description: Mario's Model if he was like the renders. custom model with extras!
-- category: cs

-- Replace Mod Name with your Character/Pack name.
local TEXT_PACK_NAME = "N64 Mario"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not charSelect then
    djui_popup_create(
        "\\#ffffa0\\ heyy! " ..
        TEXT_PACK_NAME .. " requires\nCharacter Select to be enabled!\n\nPlease rehost with it enabled. :D", 4)
    return
end

local pal_mario_cs = {
    [PANTS]  = { r = 0x0b, g = 0x00, b = 0x99 },
    [SHIRT]  = { r = 0xe1, g = 0x00, b = 0x00 },
    [GLOVES] = { r = 0xff, g = 0xff, b = 0xff },
    [SHOES]  = { r = 0x9c, g = 0x2c, b = 0x00 },
    [HAIR]   = { r = 0x59, g = 0x21, b = 0x00 },
    [SHOES]  = { r = 0x9c, g = 0x2c, b = 0x00 },
    [SKIN]   = { r = 0xff, g = 0x98, b = 0x59 },
    [CAP]    = { r = 0xe1, g = 0x00, b = 0x00 },
    [EMBLEM] = { r = 0xe1, g = 0x00, b = 0x00 },
}
local table_anims_cs = {

    [_G.charSelect.CS_ANIM_MENU] = 'n64mar_menupose',
}

local table_eye_cs = {
    [CHAR_ANIM_TWIRL] = 9,
    [CHAR_ANIM_THROW_LIGHT_OBJECT] = 9,
    [CHAR_ANIM_CREDITS_WAVING] = 9,
    [CHAR_ANIM_SUMMON_STAR] = 9,
    [CHAR_ANIM_TRIPLE_JUMP_FLY] = 9,
    [CHAR_ANIM_FLY_FROM_CANNON] = 9,
    [CHAR_ANIM_WING_CAP_FLY] = 9,
    [CHAR_ANIM_CREDITS_PEACE_SIGN] = 9,
    [CHAR_ANIM_FINAL_BOWSER_RAISE_HAND_SPIN] = 9,
    [CHAR_ANIM_FINAL_BOWSER_WING_CAP_TAKE_OFF] = 9,
    [CHAR_ANIM_TAKE_CAP_OFF_THEN_ON] = 9,
    [CHAR_ANIM_PUT_CAP_ON] = 12,

    --[[
            [CHAR_ANIM_FORWARD_KB] = 10,
            [CHAR_ANIM_BACKWARD_KB] = 10,
            [CHAR_ANIM_SOFT_BACK_KB] = 10,
            [CHAR_ANIM_SOFT_FRONT_KB] = 10,
            [CHAR_ANIM_AIR_FORWARD_KB] = 10,
            [CHAR_ANIM_BACKWARD_AIR_KB] = 10,
            [CHAR_ANIM_WATER_FORWARD_KB] = 10,
            [CHAR_ANIM_BACKWARDS_WATER_KB] = 10,
            --]]
    [CHAR_ANIM_BEING_GRABBED] = 10,
    [CHAR_ANIM_HEAD_STUCK_IN_GROUND] = 10,
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = 10,
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = 10,
    [CHAR_ANIM_SHOCKED] = 10,
    [CHAR_ANIM_IDLE_HEAVY_OBJ] = 11,
    [CHAR_ANIM_WALK_WITH_HEAVY_OBJ] = 11,
    [CHAR_ANIM_FALL_OVER_BACKWARDS] = 11,
    [CHAR_ANIM_LAND_ON_STOMACH] = 10,

    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_LEFT
}


E_MODEL_N64MARIO_W20 = smlua_model_util_get_id("n64_mario_geo")

-- This function loads and applies Character Data based on the table above, does not need to be touched
local function on_character_select_load()

        CT_N64MARIO_W20 = _G.charSelect.character_add(
        "N64 Mario", 
        "Mario if he was accurate to his renders!", 
        "Wall_E20", 
        { r = 255, g = 10, b = 10 }, 
        E_MODEL_N64MARIO_W20, 
        CT_MARIO, 
        get_texture_info("mario-n64"), 
        1)

        _G.charSelect.character_set_nickname(CT_N64MARIO_W20, "Mario", true)
        -- if caps then character_add_caps(model, caps) end

        _G.charSelect.character_add_palette_preset(E_MODEL_N64MARIO_W20, pal_mario_cs, "Default")

        --charSelect.character_set_category(tablePos, TEXT_PACK_NAME)
        _G.charSelect.character_add_graffiti(CT_N64MARIO_W20, get_texture_info("mario-n64"))

        _G.charSelect.character_add_animations(E_MODEL_N64MARIO_W20, table_anims_cs, table_eye_cs, nil)
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)





local multiplier = 10

local sounds_time_table = {
    [SOUND_MARIO_YAH_WAH_HOO] = 20,
    [SOUND_MARIO_YAH_WAH_HOO + (2 << 16)] = 20, -- WAH
    [SOUND_MARIO_YAH_WAH_HOO + (1 << 16)] = 20, -- HOO
    [SOUND_MARIO_HOOHOO] = 25,
    [SOUND_MARIO_YAHOO] = 50,
    [SOUND_MARIO_UH] = 20,
    [SOUND_MARIO_HRMM] = 20,
    [SOUND_MARIO_WAH2] = 20,
    [SOUND_MARIO_WHOA] = 30,
    [SOUND_MARIO_EEUH] = 40,
    [SOUND_MARIO_ATTACKED] = 40,
    [SOUND_MARIO_OOOF] = 35,
    [SOUND_MARIO_OOOF2] = 35,
    [SOUND_MARIO_HERE_WE_GO] = 70,
    [SOUND_MARIO_YAWNING] = 90,
    [SOUND_MARIO_WAAAOOOW] = 100,
    [SOUND_MARIO_HAHA] = 40,
    [SOUND_MARIO_HAHA_2] = 40,
    [SOUND_MARIO_UH2] = 20,
    [SOUND_MARIO_UH2_2] = 20,
    [SOUND_MARIO_ON_FIRE] = 100,
    --[SOUND_MARIO_DYING] = 30,
    [SOUND_MARIO_PANTING_COLD] = 20,
    [SOUND_MARIO_PANTING] = 20,
    [SOUND_MARIO_PANTING + (1 << 16)] = 20,
    [SOUND_MARIO_PANTING + (2 << 16)] = 20,
    [SOUND_MARIO_COUGHING1] = 20,
    [SOUND_MARIO_COUGHING2] = 20,
    [SOUND_MARIO_COUGHING3] = 20,
    [SOUND_MARIO_PUNCH_YAH] = 20,
    [SOUND_MARIO_PUNCH_HOO] = 20,
    [SOUND_MARIO_MAMA_MIA] = 50,
    [SOUND_MARIO_GROUND_POUND_WAH] = 20,
    --[SOUND_MARIO_DROWNING] = 50,
    [SOUND_MARIO_PUNCH_WAH] = 20,
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE] = 50,             -- YAHOO (1)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (1 << 16)] = 50, -- YAHOO (2)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (2 << 16)] = 50, -- YAHOO (3)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (3 << 16)] = 50, -- WAHA
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (4 << 16)] = 50, -- YIPPEE
    [SOUND_MARIO_DOH] = 20,
    [SOUND_MARIO_GAME_OVER] = 90,
    [SOUND_MARIO_HELLO] = 50,
    [SOUND_MARIO_PRESS_START_TO_PLAY] = 100,
    [SOUND_MARIO_TWIRL_BOUNCE] = 30,
    --[SOUND_MARIO_SNORING3] = 500,
    [SOUND_MARIO_SO_LONGA_BOWSER] = 70,
    [SOUND_MARIO_IMA_TIRED] = 55,
    [SOUND_MARIO_LETS_A_GO] = 40,
    [SOUND_MARIO_OKEY_DOKEY] = 40,
}
local sounds_mouth_id = {
    [SOUND_MARIO_YAH_WAH_HOO] = 9,
    [SOUND_MARIO_YAH_WAH_HOO + (2 << 16)] = 12, -- WAH
    [SOUND_MARIO_YAH_WAH_HOO + (1 << 16)] = 9,  -- HOO
    [SOUND_MARIO_HOOHOO] = 12,
    [SOUND_MARIO_YAHOO] = 12,
    [SOUND_MARIO_UH] = 12,
    [SOUND_MARIO_HRMM] = 11,
    [SOUND_MARIO_WAH2] = 9,
    [SOUND_MARIO_WHOA] = 12,
    [SOUND_MARIO_EEUH] = 12,
    [SOUND_MARIO_ATTACKED] = 10,
    [SOUND_MARIO_OOOF] = 10,
    [SOUND_MARIO_OOOF2] = 10,
    [SOUND_MARIO_HERE_WE_GO] = 12,
    [SOUND_MARIO_YAWNING] = 12,
    [SOUND_MARIO_WAAAOOOW] = 10,
    [SOUND_MARIO_HAHA] = 9,
    [SOUND_MARIO_HAHA_2] = 9,
    [SOUND_MARIO_UH2] = 12,
    [SOUND_MARIO_UH2_2] = 12,
    [SOUND_MARIO_ON_FIRE] = 8,
    --[SOUND_MARIO_DYING] = 30,
    [SOUND_MARIO_PANTING_COLD] = 12,
    [SOUND_MARIO_PANTING] = 10,
    [SOUND_MARIO_PANTING + (1 << 16)] = 10,
    [SOUND_MARIO_PANTING + (2 << 16)] = 10,
    [SOUND_MARIO_COUGHING1] = 10,
    [SOUND_MARIO_COUGHING2] = 10,
    [SOUND_MARIO_COUGHING3] = 10,
    [SOUND_MARIO_PUNCH_YAH] = 9,
    [SOUND_MARIO_PUNCH_HOO] = 12,
    [SOUND_MARIO_MAMA_MIA] = 10,
    [SOUND_MARIO_GROUND_POUND_WAH] = 9,
    --[SOUND_MARIO_DROWNING] = 50,
    [SOUND_MARIO_PUNCH_WAH] = 9,
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE] = 12,             -- YAHOO (1)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (1 << 16)] = 12, -- YAHOO (2)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (2 << 16)] = 12, -- YAHOO (3)
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (3 << 16)] = 9,  -- WAHA
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (4 << 16)] = 9,  -- YIPPEE
    [SOUND_MARIO_DOH] = 10,
    [SOUND_MARIO_GAME_OVER] = 12,
    [SOUND_MARIO_HELLO] = 9,
    [SOUND_MARIO_PRESS_START_TO_PLAY] = 9,
    [SOUND_MARIO_TWIRL_BOUNCE] = 9,
    --[SOUND_MARIO_SNORING3] = 9,
    [SOUND_MARIO_SO_LONGA_BOWSER] = 9,
    [SOUND_MARIO_IMA_TIRED] = 12,
    [SOUND_MARIO_LETS_A_GO] = 9,
    [SOUND_MARIO_OKEY_DOKEY] = 12,
}


local sound_table_different = {
    -- yahoo uses the same thing ofc
    [SOUND_MARIO_YAHOO] = 1,
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE] = 1,
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (1 << 16)] = 1,
    [SOUND_MARIO_YAHOO_WAHA_YIPPEE + (2 << 16)] = 1,

    [SOUND_MARIO_HERE_WE_GO] = 2,
    [SOUND_MARIO_IMA_TIRED] = 5,
    [SOUND_MARIO_LETS_A_GO] = 3,
    [SOUND_MARIO_OKEY_DOKEY] = 4,
}


-- mouth ids:
-- 9  mouth open happy
-- 10 hurt / scared (Not dead)
-- 11 water / conentred
-- 12 mouth open O


gPlayerSyncTable[0].talk_timer = 0
gPlayerSyncTable[0].mouth_id = 9
gPlayerSyncTable[0].last_sound_id = nil


local function mario_talk(m)
    local m = gMarioStates[0]
    local s = gPlayerSyncTable[m.playerIndex]

    for i, char in pairs(characterTable) do
        if s.talk_timer > 0 then
            --djui_chat_message_create(tostring(s.talk_timer))
            s.talk_timer = s.talk_timer - 1
            if _G.charSelect.character_get_current_number(m.playerIndex) == char.tablePos then
                if sound_table_different[s.last_sound_id] == 1 then
                    if s.talk_timer < 250 then
                        m.marioBodyState.eyeState = s.mouth_id
                    else
                        m.marioBodyState.eyeState = 9
                    end
                elseif sound_table_different[s.last_sound_id] == 2 then
                    if s.talk_timer < 430 or (s.talk_timer < 600 and s.talk_timer > 500) then
                        m.marioBodyState.eyeState = s.mouth_id
                    else
                        m.marioBodyState.eyeState = 9
                    end
                elseif sound_table_different[s.last_sound_id] == 3 then
                    if s.talk_timer > 120 then
                        m.marioBodyState.eyeState = s.mouth_id
                    else
                        m.marioBodyState.eyeState = 12
                    end
                elseif sound_table_different[s.last_sound_id] == 4 then
                    if s.talk_timer > 300 or (s.talk_timer < 200 and s.talk_timer > 70) then
                        m.marioBodyState.eyeState = s.mouth_id
                    else
                        m.marioBodyState.eyeState = 9
                    end
                elseif sound_table_different[s.last_sound_id] == 5 then
                    if s.talk_timer < 150 or (s.talk_timer < 425 and s.talk_timer > 345) then
                        m.marioBodyState.eyeState = s.mouth_id
                    else
                        m.marioBodyState.eyeState = 9
                    end
                else
                    m.marioBodyState.eyeState = s.mouth_id
                end
            end
        end
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_talk)

local function get_mario_state_on_play_sound(pos)
    for i = 0, MAX_PLAYERS - 1 do
        local m = gMarioStates[i]
        if is_player_active(m) == 1 then
            local mpos = m.marioObj.header.gfx.cameraToObject
            if mpos.x == pos.x and mpos.y == pos.y and mpos.z == pos.z then
                return m
            end
        end
    end
    return nil
end

hook_event(HOOK_ON_PLAY_SOUND, function(sound, pos)
    local m = get_mario_state_on_play_sound(pos)
    if m then
        local s = gPlayerSyncTable[m.playerIndex]
        if sounds_time_table[sound] ~= nil then
            for i, char in pairs(characterTable) do
                s.talk_timer = sounds_time_table[sound] * multiplier
                if _G.charSelect.character_get_current_number(m.playerIndex) == char.tablePos then
                    s.mouth_id = sounds_mouth_id[sound]
                    s.last_sound_id = sound
                end
            end
        end
    end
end)


local function on_mario_update(m)
    for i, char in pairs(characterTable) do
        if _G.charSelect.character_get_current_number(m.playerIndex) == char.tablePos then
            if ((m.action & ACT_FLAG_WATER_OR_TEXT) ~= 0) or ((m.action & ACT_FLAG_METAL_WATER) ~= 0) then
                m.marioBodyState.eyeState = 11
            end

            --idk if i will work more on this but i planned a select animation
            --[[
            if charSelect.is_menu_open() == true then
                if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
                    set_mario_animation(m, MARIO_ANIM_CREDITS_WAVING)
                end
            end
            --]]

            --this code is for testing voice lines
            --[[
            if (m.controller.buttonPressed & D_JPAD) ~= 0 then
                play_mario_sound(m, SOUND_MARIO_HERE_WE_GO, SOUND_MARIO_HERE_WE_GO)
            end
            if (m.controller.buttonPressed & U_JPAD) ~= 0 then
                play_mario_sound(m, SOUND_MARIO_IMA_TIRED, SOUND_MARIO_IMA_TIRED)
            end
            if (m.controller.buttonPressed & L_JPAD) ~= 0 then
                play_mario_sound(m, SOUND_MARIO_LETS_A_GO, SOUND_MARIO_LETS_A_GO)
            end
            if (m.controller.buttonPressed & R_JPAD) ~= 0 then
                play_mario_sound(m, SOUND_MARIO_OKEY_DOKEY, SOUND_MARIO_OKEY_DOKEY)
            end
            --]]
        end
    end
end
hook_event(HOOK_MARIO_UPDATE, on_mario_update)
