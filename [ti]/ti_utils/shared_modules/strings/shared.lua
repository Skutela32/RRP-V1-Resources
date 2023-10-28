local alphaNumericChars = {}

for i=48,57,1  do table.insert(alphaNumericChars, string.char(i)) end
for i=65,90,1  do table.insert(alphaNumericChars, string.char(i)) end
for i=97,122,1 do table.insert(alphaNumericChars, string.char(i)) end

local module = {}

function module.random(length, chars)
    length = length or 10

    local charsList

    if type(chars) == "string" then
        charsList = {}

        for i=1,#chars,1 do
            table.insert(charsList, string.sub(chars, i, i))
        end
    elseif type(chars) == "table" then
        charsList = chars
    else
        charsList = alphaNumericChars
    end

    local str = ""

    for i=1,length,1 do
        str = str .. charsList[math.random(#charsList)]
    end

    return str
end

return module