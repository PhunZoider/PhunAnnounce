if isServer() then
    return
end

local Core = PhunAnnounce

function Core:queueAnnouncements()

    local data = {{
        type = "repeat",
        frequency = 10,
        tile = "Repeating",
        message = "This is the message"
    }, {
        type = "countdown",
        frequency = "daily",
        hour = 5,
        minute = 30,
        start = 180 -- 3 mins
    }}

    local results = {}

    for _, v in ipairs(data) do

        -- when is this going to next run?
        if v.type == "repeat" then
            local lastRun = v.lastRun or 0
            local nextRun = v.nextRun or 0
            local now = os.time()
            if now - lastRun >= v.frequency then
                v.lastRun = now
                v.nextRun = now + v.frequency
                table.insert(results, v)
            end
        elseif v.type == "countdown" then
            local current_time = os.date("*t")
            local target = os.time({
                year = current_time.year,
                month = current_time.month,
                day = current_time.day,
                hour = v.hour,
                min = v.minute,
                sec = 0
            })
            local start_time = target - v.start
            local countdown_duration = v.start
        end

    end

end
