local addon_dir = "Interface\\AddOns\\ComBoss\\Sounds\\"
local crit_1_file = addon_dir.."crit.mp3";

function ComBoss_OnEvent(self, event, ...)
  local timestamp, combatevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...;
    if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
		if (combatevent == "SPELL_DAMAGE") then
			local _, spellname, _, _, _, _, _, _, _, critical = select(12, ...);
			if critical then
				PlaySoundFile(crit_1_file, "Master");
			end
		end
	end
end

local cs = CreateFrame("Frame");
cs:RegisterEvent("ADDON_LOADED");
cs:RegisterEvent("VARIABLES_LOADED");
cs:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
cs:SetScript("OnEvent", function(self, event, ...)
    if event == "VARIABLES_LOADED" then
		print("Com|cFF00FF00Boss|R sounds loaded.");
		print("Happy |cFFFF0000Rampaging|R!");
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        ComBoss_OnEvent(self, event, ...);
    end
end)
