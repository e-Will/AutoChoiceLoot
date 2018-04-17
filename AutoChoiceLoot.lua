-- Author      : e-Will
-- Create Date : 20/04/2015
AutoChoiceLoot_TEXTADDONNAME = "Auto Choice Loot"

-- для создания пространства имен
AutoChoiceLoot = {};

-- функции для работы с главной вкладкой
AutoChoiceLoot.FrameGeneral = {};

-- функции для работы с кнопокой возле миникарты

AutoChoiceLoot.NumBrowseToDisplay = 5; -- сколько в списке и темов? durgeons,
-- faction reputation, proffession, reagent's, consumable


-- инициализация массива настроек после загрузки
-- вызывается из OnEvent -> PLAYER_LOGIN
function AutoChoiceLoot.LoadDefaults()
	AutoChoiceLootOptions = AutoChoiceLootOptions or {
		IconPos 				= -100,				-- angle of initial minimap icon position
		ShowIcon 				= "ON",				-- whether to show the minimap button
		SquareMinimap 			= "OFF",			-- whether the minimap is square instead of circular
		AutoPickMoney			= "ON",				-- 
		ShortLog				= "ON",				--
		RollBind				= "OFF",
		ShowStatistics			= "OFF",
		StoreHistory			= "OFF",
		StoreHistoryRare		= "OFF",
		ShowPrice				= "OFF",
		ShowPriceStack			= "OFF"
	}
end

function AutoChoiceLoot.Initialize()

	local option = AutoChoiceLootOptions
	
	AutoChoiceLoot.Timer.Init();
	AutoChoiceLoot.Timer.Create("DragMinimapButton",AutoChoiceLoot.DragMinimapButton,0,1);
	
	AutoChoiceLoot.MoveMinimapButton();
	
	
	-- Player texture portrain
	local playerTexture = AutoChoiceLootFrame:CreateTexture(nil, "BACKGROUND");
	playerTexture:SetHeight(58);
	playerTexture:SetWidth(58);
	playerTexture:SetPoint("TOPLEFT", 10, -8);
	SetPortraitTexture(playerTexture, "player");
	
end

function AutoChoiceLoot.OnLoad()

	SlashCmdList["AutoChoiceLootCOMMAND"] = AutoChoiceLoot.SlashHandler
	SLASH_AutoChoiceLootCOMMAND1 = "/autochoiceloot";
	SLASH_AutoChoiceLootCOMMAND2 = "/acl";
	
	this:RegisterEvent("PLAYER_LOGIN")
end

function AutoChoiceLoot.OnEvent()
	if event=="BAG_UPDATE" then
		-- bagID 
	elseif event=="PLAYER_LOGIN" then
		-- no args
		AutoChoiceLoot.LoadDefaults()
		AutoChoiceLoot.Initialize()
		this:RegisterEvent("ZONE_CHANGED_NEW_AREA");
		this:RegisterEvent("CHAT_MSG_LOOT");
	elseif event=="CHAT_MSG_LOOT" then
		-- "message", "sender", "language", "channelString", "target", "flags", unknown, channelNumber, "channelName", unknown, counter

	elseif event=="START_LOOT_ROLL" then
		-- arg1 - id | arg2 - time
	
	elseif event=="CONFIRM_LOOT_ROLL" then
		-- id, rolltype
	elseif event=="LOOT_OPENED" then
		-- autoLoot 
	elseif event=="PARTY_LOOT_METHOD_CHANGED" then
		-- no args
	end

end
















-- инициализация списка фильтра
function AutoChoiceLoot.FrameGeneral.InitClasses(...)
--[[	
	for i=1, arg.n do
		AutoChoiceLoot.FrameGeneral.ClassFilters[i] = arg[i];
	end
]]--
end

-- событие при показе главной вкладке на панеле
function AutoChoiceLoot.FrameGeneral.OnShow()
	AutoChoiceLoot.FrameGeneral.FiltersUpdate();
end

-- событие при загрузке главной панели
function AutoChoiceLoot.FrameGeneral.OnLoad()
	-- инициализация массива с классами
	-- AutoChoiceLoot.FrameGeneral.InitClasses("Raids", "Quest", "Trade Goods", "Profession", "Consumable");
end

-- обновление панели с фильрами
function AutoChoiceLoot.FrameGeneral.FiltersUpdate()
	-- AutoChoiceLoot.FrameGeneral.UpdateClasses();
	-- update frame scroll
	--[[
	FauxScrollFrame_Update(
		AutoChoiceLootFilterScrollFrame,-- стандартная функция
		getn(AutoChoiceLoot.FrameGeneral.ClassFiltersOpenList), -- список подкласов
		NUM_FILTERS_TO_DISPLAY, -- число по дефолту пока что хз ? 
		BROWSE_FILTER_HEIGHT -- высота фильтра
		);]]--
end

function AutoChoiceLoot.FrameGeneral.UpdateClasses()
end

-- ON / OFF move
function AutoChoiceLoot.FrameGeneral.ToogleLock()
	
end

--[[  ]]--

AutoChoiceLoot.Tab = {};

function AutoChoiceLoot.Tab.OnClick(index)
	if ( not index ) then
		index = this:GetID();
	end
end













--[[
function TrinketMenu.TimerDebug()
	local on = "|cFF00FF00On"
	local off = "|cFFFF0000Off"
	DEFAULT_CHAT_FRAME:AddMessage("|cFF44AAFFTrinketMenu_TimersFrame is "..(TrinketMenu_TimersFrame:IsVisible() and on or off))
	for i in TrinketMenu.TimerPool do
		DEFAULT_CHAT_FRAME:AddMessage(i.." is "..(TrinketMenu.IsTimerActive(i) and on or off))
	end
end
]]--