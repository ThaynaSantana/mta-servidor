
function _call(_called, ...)
    local co = coroutine.create(_called);
    coroutine.resume(co, ...);
end

function sleep(time)
    local co = coroutine.running();
    local function resumeThisCoroutine()
        coroutine.resume(co);
    end
    setTimer(resumeThisCoroutine, time, 1);
    coroutine.yield();
end




