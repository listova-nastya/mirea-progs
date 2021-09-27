#ДАНО: Робот - рядом с горизонтальной перегородкой (под ней), бесконечно продолжающейся в обе стороны, 
#в которой имеется проход шириной в одну клетку.
#РЕЗУЛЬТАТ: Робот - в клетке под проходом
function peregorodka(r::Robot)
    side = 3
    counter = 1

    while true
        if !isborder(r, HorizonSide(0))
            break
        end
        for _ in 1:counter
            move!(r, HorizonSide(side))
        end
        side = (side+2)%4
        counter += 1
    end
end