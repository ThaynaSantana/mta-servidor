screen = {guiGetScreenSize ()}
local resolution = {1920, 1080}
local x, y = screen[1] / resolution[1], screen[2] / resolution[2]

function aToR (X, Y, sX, sY)
    local Px = (Global and (Global.PosX or resolution[1]) or resolution[1])
    local Falta = resolution[1] - X
    local X = Px - Falta
    local xd = X/resolution[1] or X
    local yd = Y/resolution[2] or Y
    local xsd = sX/resolution[1] or sX
    local ysd = sY/resolution[2] or sY
    return xd*screen[1], yd*screen[2], xsd*screen[1], ysd*screen[2]
end

function isCursorOnElement (x, y, w, h)
    if (not isCursorShowing()) then
        return false
    end
    local mx, my = getCursorPosition()
    local fullx, fully = guiGetScreenSize()
    local cursorx, cursory = mx*fullx, my*fully
    if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
        return true
    else
        return false
    end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

local fontsDB = {}

_dxCreateFont = dxCreateFont
function dxCreateFont (path, size, ...)
    if not fontsDB[path] then
        fontsDB[path] = { }
    end
    if fontsDB[path][size] then
        return fontsDB[path][size]
    end
    local _, size, _, _ = aToR(0, size, 0, 0)
    fontsDB[path][size] = _dxCreateFont (path, size, ...)
    return fontsDB[path][size]
end

_isCursorOnElement = isCursorOnElement
function isCursorOnElement (x, y, w, h)
    local x, y, w, h = aToR (x, y, w, h)
    return _isCursorOnElement (x, y, w, h)
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawRectangle(x, y, w, h, ...)
end

_dxDrawText = dxDrawText
function dxDrawText (text, x, y, w, h, color, scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
    local x, y, w, h = aToR (x, y, w, h)
    return _dxDrawText (text, x, y, (w + x), (h + y) , color, scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawImageSection(x, y, w, h, ...)
end

_dxDrawImage = dxDrawImage
function dxDrawImage(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawImage(x, y, w, h, ...)
end

-- Svgs

svgsRectangle = {};
function dxDrawRoundedRectangle(x, y, w, h, radius, color, post)
    if not svgsRectangle[radius] then
        svgsRectangle[radius] = {}
    end
    if not svgsRectangle[radius][w] then
        svgsRectangle[radius][w] = {}
    end
    if not svgsRectangle[radius][w][h] then
        local path = string.format([[
        <svg width="%s" height="%s" viewBox="0 0 %s %s" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect opacity="1" width="%s" height="%s" rx="%s" fill="#FFFFFF"/>
        </svg>
        ]], w, h, w, h, w, h, radius)
        svgsRectangle[radius][w][h] = svgCreate(w, h, path)
    end
    if svgsRectangle[radius][w][h] then
        dxDrawImage(x, y, w, h, svgsRectangle[radius][w][h], 0, 0, 0, color, post or false)
    end
end

-------

svg = {}

function createVector (width, height, raw)
    local data = svgCreate (width, height, raw, function (element)
        if not element or not isElement (element) then
            return false
        end
        dxSetTextureEdge (element, 'clamp')
    end)
    return {
        element = data;
    }
end

function createSVG (identify, width, height, raw)
    if not svg[identify] then
        local data = createVector (width, height, raw)
        svg[identify] = data.element
    end
    return svg[identify]
end

function loadSVG ( )
    createSVG ('background_Card', 124, 156, [[
        <svg width="124" height="156" viewBox="0 0 124 156" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="1.5" y="1.5" width="121" height="153" rx="13.5" fill="#313131" stroke="url(#paint0_linear_0_1)" stroke-width="3"/>
        <rect y="129" width="124" height="27" rx="5" fill="url(#paint1_linear_0_1)"/>
        <defs>
            <linearGradient id="paint0_linear_0_1" x1="62" y1="1.18567e-08" x2="62" y2="190.5" gradientUnits="userSpaceOnUse">
                <stop stop-color="#4B7EFF"/>
                <stop offset="1" stop-opacity="0"/>
            </linearGradient>
            <linearGradient id="paint1_linear_0_1" x1="-2.05939e-08" y1="143" x2="124" y2="143" gradientUnits="userSpaceOnUse">
                <stop stop-color="#4672E3"/>
                <stop offset="1" stop-color="#313131"/>
            </linearGradient>
        </defs>
    </svg>
    ]])
    createSVG ('Icon_Clothes', 80, 80, [[
        <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M40 13.3333C36.9058 13.3333 33.9383 14.5625 31.7504 16.7504C29.5625 18.9384 28.3333 21.9058 28.3333 25H35C35 23.6739 35.5268 22.4022 36.4645 21.4645C37.4021 20.5268 38.6739 20 40 20C41.3261 20 42.5978 20.5268 43.5355 21.4645C44.4732 22.4022 45 23.6739 45 25C45 26.3261 44.4732 27.5979 43.5355 28.5355C42.5978 29.4732 41.3261 30 40 30C38.1667 30 36.6667 31.5 36.6667 33.3333V39.1667L7.99999 60.6667C7.4403 61.0864 7.02688 61.6717 6.81828 62.3394C6.60968 63.0072 6.61648 63.7237 6.83771 64.3874C7.05895 65.0511 7.4834 65.6284 8.05096 66.0375C8.61851 66.4466 9.30038 66.6667 9.99999 66.6667H70C70.6996 66.6667 71.3815 66.4466 71.949 66.0375C72.5166 65.6284 72.941 65.0511 73.1623 64.3874C73.3835 63.7237 73.3903 63.0072 73.1817 62.3394C72.9731 61.6717 72.5597 61.0864 72 60.6667L43.3333 39.1667V36.1667C45.7388 35.4495 47.8488 33.9757 49.3501 31.964C50.8513 29.9523 51.6637 27.5101 51.6667 25C51.6667 21.9058 50.4375 18.9384 48.2496 16.7504C46.0616 14.5625 43.0942 13.3333 40 13.3333ZM40 45L60 60H20L40 45Z" fill="#F8F8F8"/>
        </svg>
    ]])
    createSVG ('Icon_CarPolice', 80, 80, [[
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" version="1.1" id="Capa_1" width="800px" height="800px" viewBox="0 0 406.55 406.55" xml:space="preserve">
            <g>
                <g>
                    <polygon points="293.548,181.031 275.398,181.031 275.398,203.801 253.097,203.801 253.097,221.939 275.398,221.939     275.398,244.708 293.548,244.708 293.548,221.939 316.775,221.939 316.775,203.801 293.548,203.801   "/>
                    <path d="M69.539,299.125c19.694,0,35.656,15.962,35.656,35.654c0,19.696-15.961,35.658-35.656,35.658    c-19.69,0-35.656-15.962-35.656-35.658C33.883,315.087,49.849,299.125,69.539,299.125z"/>
                    <path d="M320.594,299.125c19.693,0,35.654,15.962,35.654,35.654c0,19.696-15.961,35.658-35.654,35.658    c-19.688,0-35.658-15.962-35.658-35.658C284.936,315.087,300.905,299.125,320.594,299.125z"/>
                    <path d="M106.82,61.615c-1.978-0.892-4.3-0.014-5.194,1.956c-0.898,1.97-0.018,4.304,1.956,5.19l33.029,14.981    c0.529,0.233,1.078,0.353,1.619,0.353c1.495,0,2.919-0.856,3.581-2.309c0.896-1.97,0.022-4.302-1.956-5.189L106.82,61.615z"/>
                    <path d="M161.099,70.708c0.95,0,1.901-0.337,2.653-1.034c1.601-1.469,1.705-3.941,0.245-5.544l-24.51-26.739    c-1.46-1.591-3.947-1.717-5.55-0.235c-1.604,1.469-1.701,3.941-0.241,5.542l24.505,26.738    C158.979,70.279,160.041,70.708,161.099,70.708z"/>
                    <path d="M206.535,37.148c-1.611-1.475-4.08-1.356-5.549,0.234l-24.501,26.742c-1.461,1.601-1.357,4.082,0.244,5.542    c0.751,0.697,1.703,1.034,2.653,1.034c1.058,0,2.12-0.429,2.897-1.272l24.5-26.735C208.25,41.089,208.142,38.617,206.535,37.148z"/>
                    <path d="M195.067,84.095c0.541,0,1.094-0.12,1.619-0.353l33.031-14.981c1.976-0.886,2.85-3.22,1.96-5.19    c-0.902-1.97-3.219-2.847-5.198-1.956l-33.037,14.982c-1.978,0.888-2.847,3.22-1.954,5.189    C192.154,83.239,193.577,84.095,195.067,84.095z"/>
                    <path d="M375.14,102.627H190.932c-3.594-10.744-13.631-18.541-25.593-18.541c-11.956,0-21.995,7.796-25.591,18.541    c0,0-5.895,0-13.174,0c-7.276,0-13.17,10.223-13.17,22.822v22.828c0,0-6.869,0-15.341,0s-24.533,10.628-35.886,23.742    l-41.621,48.087C9.201,233.223,0,257.901,0,275.246v14.21c0,17.344,6.51,31.402,14.541,31.402H29.08    c5.446-17.349,21.664-29.943,40.823-29.943c19.154,0,35.364,12.595,40.82,29.943h2.687h21.396h145.325    c5.459-17.349,21.673-29.943,40.832-29.943c19.155,0,35.369,12.595,40.823,29.943c0,0,10.019,0,22.378,0    c12.371,0,22.386-14.059,22.386-31.402V134.014C406.541,116.688,392.479,102.627,375.14,102.627z M114.616,213.959    c0,8.66-7.033,15.701-15.701,15.701H63.59c-8.668,0-10.864-5.102-4.891-11.393l24.509-25.848    c5.965-6.294,15.417-11.389,21.109-11.389s10.299,7.035,10.299,15.701V213.959z M340.267,221.029h0.017l-54.51,53.479    l-56.172-53.479h0.016c-8.548-7.27-14.006-18.086-14.006-30.192c0-21.88,17.737-39.616,39.617-39.616    c11.839,0,22.442,5.228,29.699,13.473c7.27-8.245,17.865-13.473,29.707-13.473c21.889,0,39.613,17.735,39.613,39.616    C354.257,202.952,348.807,213.767,340.267,221.029z"/>
                </g>
            </g>
        </svg>
    ]])
    createSVG ('Icon_Gun', 80, 80, [[
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" height="800px" width="800px" version="1.1" id="Layer_1" viewBox="0 0 489.347 489.347" xml:space="preserve">
            <g>
                <path d="M412.642,345.939l-59.523-14.229l-66.352-66.352l51.12-51.055c11.874,4.167,24.216,6.203,36.499,6.202   c28.736-0.002,57.122-11.149,78.233-32.221c32.686-32.626,41.544-82.646,22.043-124.466l-9.042-19.391l-53.807,53.682   l-24.986-24.941l53.822-53.696L421.17,10.42C379.3-9.036,329.218-0.195,296.546,32.417   c-30.131,30.078-40.012,74.943-26.092,114.534l-20.111,20.086L102.13,18.837C91.061,7.731,76.32,1.605,60.621,1.587   c-0.023,0-0.044,0-0.067,0c-15.696,0-30.45,6.104-41.553,17.195C7.886,29.897,1.77,44.669,1.778,60.378   c0.008,15.697,6.129,30.456,17.233,41.553L167.18,250.094l-20.155,20.129c-39.652-13.917-84.597-4.061-114.733,26.02   C-0.393,328.869-9.252,378.888,10.25,420.708l9.042,19.391l53.806-53.681l24.986,24.94l-53.822,53.697l19.48,9.051   c14.814,6.883,30.652,10.224,46.388,10.224c28.738-0.001,57.124-11.148,78.235-32.221c30.132-30.078,40.013-74.943,26.093-114.534   l51.082-51.018l66.366,66.366l14.229,59.523l76.705,76.706l66.507-66.507L412.642,345.939z M301.691,144.194   c-14.181-30.419-7.73-66.807,16.05-90.545c18.28-18.246,44.036-26.278,68.827-22.6l-42.211,42.113l67.451,67.328l42.24-42.142   c3.697,24.738-4.343,50.456-22.622,68.702c-23.802,23.759-60.288,30.197-90.793,16.02l-9.505-4.417l-34.603,34.559l-24.968-24.965   l34.573-34.529L301.691,144.194z M31.778,60.362c-0.004-7.69,2.992-14.923,8.43-20.362c5.433-5.426,12.657-8.414,20.347-8.414   c7.711,0.009,14.918,3.002,20.345,8.446l194.398,194.38l-40.711,40.659L40.221,80.714C34.781,75.277,31.782,68.049,31.778,60.362z    M167.171,430.877c-18.28,18.246-44.038,26.278-68.827,22.6l42.211-42.112l-67.451-67.329l-42.24,42.142   c-3.698-24.737,4.343-50.455,22.623-68.702c23.801-23.758,60.288-30.197,90.792-16.021l9.505,4.417l34.609-34.565l24.967,24.966   l-34.578,34.534l4.44,9.525C197.403,370.751,190.952,407.138,167.171,430.877z M373.342,397.227l-7.564-31.645l31.646,7.564   l49.498,49.499l-24.081,24.081L373.342,397.227z"/>
            </g>
        </svg>
    ]])
    createSVG ('Icon_Select', 35, 35, [[
        <svg width="35" height="35" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M17.5 29.1667C11.0687 29.1667 5.83329 23.9312 5.83329 17.5C5.83329 11.0687 11.0687 5.83332 17.5 5.83332C23.9312 5.83332 29.1666 11.0687 29.1666 17.5C29.1666 23.9312 23.9312 29.1667 17.5 29.1667ZM17.5 2.91666C15.5848 2.91666 13.6885 3.29387 11.9192 4.02675C10.1498 4.75963 8.54217 5.83383 7.18799 7.18802C4.45308 9.92292 2.91663 13.6322 2.91663 17.5C2.91663 21.3677 4.45308 25.0771 7.18799 27.812C8.54217 29.1661 10.1498 30.2404 11.9192 30.9732C13.6885 31.7061 15.5848 32.0833 17.5 32.0833C21.3677 32.0833 25.077 30.5469 27.8119 27.812C30.5468 25.0771 32.0833 21.3677 32.0833 17.5C32.0833 15.5849 31.7061 13.6885 30.9732 11.9192C30.2403 10.1499 29.1661 8.5422 27.8119 7.18802C26.4577 5.83383 24.8501 4.75963 23.0808 4.02675C21.3114 3.29387 19.4151 2.91666 17.5 2.91666ZM18.9583 10.2083H16.0416V16.0417H10.2083V18.9583H16.0416V24.7917H18.9583V18.9583H24.7916V16.0417H18.9583V10.2083Z" fill="#F8F8F8"/>
        </svg>
    ]])
    createSVG('Icon_Close', 15, 15, [[
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M0.365615 0.381611C0.599789 0.147272 0.917355 0.0156273 1.24848 0.0156273C1.5796 0.0156273 1.89716 0.147272 2.13134 0.381611L7.49219 5.74786L12.853 0.381611C12.9682 0.262223 13.106 0.166995 13.2584 0.101484C13.4107 0.0359723 13.5746 0.00148947 13.7404 4.71963e-05C13.9062 -0.00139507 14.0706 0.0302318 14.2241 0.0930829C14.3776 0.155934 14.517 0.24875 14.6343 0.366116C14.7515 0.483482 14.8442 0.623047 14.907 0.776668C14.9698 0.930288 15.0014 1.09489 15 1.26086C14.9985 1.42684 14.9641 1.59086 14.8986 1.74337C14.8332 1.89587 14.738 2.0338 14.6188 2.14911L9.25792 7.51536L14.6188 12.8816C14.8462 13.1174 14.9721 13.4331 14.9693 13.7609C14.9664 14.0886 14.8351 14.4021 14.6036 14.6339C14.372 14.8656 14.0588 14.9971 13.7314 15C13.404 15.0028 13.0886 14.8768 12.853 14.6491L7.49219 9.28286L2.13134 14.6491C1.89582 14.8768 1.58039 15.0028 1.25297 15C0.925554 14.9971 0.612354 14.8656 0.380827 14.6339C0.149299 14.4021 0.0179701 14.0886 0.015125 13.7609C0.0122798 13.4331 0.138147 13.1174 0.365615 12.8816L5.72647 7.51536L0.365615 2.14911C0.131512 1.9147 0 1.59682 0 1.26536C0 0.933905 0.131512 0.61602 0.365615 0.381611Z" fill="#F8F8F8"/>
        </svg>  
    ]])
    
end

function destroySVG ()
    if not next (svg) then
        return false
    end
    for i, v in pairs (svg) do
        if v and isElement (v) then
            destroyElement (v)
        end
    end
    svg = { }
    return true
end