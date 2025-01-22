longest common prexix
function LCP (array of strings strs) return string
    shortest = strs[0]  
    common <---- ""
    i= 0
    for each string in strs:
        if string.length < shortest.length
            shortest = string
        end
    end
    while i < shortest.lenght
        for each string =! shortest in strs 
             if string[i] = shortest[i] then
                 common <---- common + shortest[i]
                  i = i+1
             else
                common <--- common
             end
        end
     end
return common