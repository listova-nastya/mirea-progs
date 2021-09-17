#ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы
function granica(r::Robot)
    q = 0
    while isborder(r,HorizonSide(0)) == false
        move!(r,HorizonSide(0))
        q = q+1
    end
    for side in (HorizonSide(mod(i,4)) for i=1:4)
        putmarkers(r,side)
    end
    move!(r,HorizonSide(1))
    while ismarker(r) == false
        putmarker!(r)
        move!(r,HorizonSide(1))
    end
    move!(r,HorizonSide(3))
    for i in 1:q
        move!(r,HorizonSide(2))
    end
end
function putmarkers(r::Robot,side::HorizonSide) 
    while isborder(r,side)==false 
        move!(r,side)
        putmarker!(r)
    end
end
