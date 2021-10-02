#ДАНО: Робот - в произвольной клетке ограниченного прямоугольной рамкой поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот - в исходном положении в центре косого креста (в форме X) из маркеров.
function kosoykrest(r::Robot)
    for i in 0:3

        while !isborder(r, HorizonSide(i)) && !isborder(r, HorizonSide((i+1)%4))
            move!(r, HorizonSide(i))
            move!(r, HorizonSide((i+1)%4))
            putmarker!(r)
        end

        while ismarker(r)
            move!(r, HorizonSide((i+2)%4))
            move!(r, HorizonSide((i+2+1)%4))
        end

        if i == 3
            putmarker!(r)
            break
        end
    end    
end  