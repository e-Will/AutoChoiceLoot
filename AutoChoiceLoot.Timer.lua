-- для движения иконки у миникарты по кругу
AutoChoiceLoot.Timer = {};

function AutoChoiceLoot.Timer.Init()
	AutoChoiceLoot.Timer.Pool = {};
	AutoChoiceLoot.Timer.Timers = {};
end

function AutoChoiceLoot.Timer.Create(name,func,delay,rep)
	AutoChoiceLoot.Timer.Pool[name] = {func=func,delay=delay,rep=rep,elapsed=delay};
end

function AutoChoiceLoot.Timer.Start(name, delay)
	AutoChoiceLoot.Timer.Pool[name].elapsed = delay or AutoChoiceLoot.Timer.Pool[name].delay
	if not AutoChoiceLoot.Timer.IsActive(name) then
		table.insert(AutoChoiceLoot.Timer.Timers,name)
		AutoChoiceLoot_TimersFrame:Show()
	end
end

function AutoChoiceLoot.Timer.Stop(name)
	local idx = AutoChoiceLoot.Timer.IsActive(name)
	if idx then
		table.remove(AutoChoiceLoot.Timer.Timers,idx)
		if table.getn(AutoChoiceLoot.Timer.Timers)<1 then
			AutoChoiceLoot_TimersFrame:Hide()
		end
	end
end

function AutoChoiceLoot.Timer.IsActive(name)
	for i,j in ipairs(AutoChoiceLoot.Timer.Timers) do
		if j==name then
			return i
		end
	end
	return nil
end

function AutoChoiceLoot.TimersFrame_OnUpdate()
	local timerPool
	for _,name in ipairs(AutoChoiceLoot.Timer.Timers) do
		timerPool = AutoChoiceLoot.Timer.Pool[name]
		timerPool.elapsed = timerPool.elapsed - arg1
		if timerPool.elapsed < 0 then
			timerPool.func()
			if timerPool.rep then
				timerPool.elapsed = timerPool.delay
			else
				AutoChoiceLoot.Timer.Stop(name)
			end
		end
	end
end