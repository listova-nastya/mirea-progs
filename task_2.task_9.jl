#ДАНО: Где-то на неограниченном со всех сторон поле и без внутренних перегородок имеется единственный маркер.
#Робот - в произвольной клетке поля.
#РЕЗУЛЬТАТ: Робот - в клетке с тем маркером.
function poisk_markera(r::Robot)
    check = false
    side = 0
    counter = 1
    c = 0
    
    while !check
        for _ in 1:counter
            if ismarker(r)
                check = true
                break
            end
            move!(r, HorizonSide(side)) 
        end
        c+=1
        side = (side+1) % 4
        if c == 2
            counter+=1
            c = 0
        end
    end
end