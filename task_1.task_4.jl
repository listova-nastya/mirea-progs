#ДАНО: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, следующий - весь, 
#за исключением одной последней клетки на Востоке, следующий - за исключением двух последних клеток на Востоке, и т.д.
function lestnica(r::Robot)
    v = 0
    q = 0
    while isborder(r,HorizonSide(2)) == false
        move!(r,HorizonSide(2))
        v = v+1
    end
    while isborder(r,HorizonSide(3)) == false
        move!(r,HorizonSide(3))
        q = q+1
    end
    while isborder(r,HorizonSide(0)) == false
        crashy(r)
        move!(r, HorizonSide(1))
        move!(r, HorizonSide(0))
    end
    crashy(r)
    ugol(r)
    for i in 1:v
        move!(r, HorizonSide(0))
    end
    for i in 1:q
        move!(r, HorizonSide(1))
    end
end
function crashy(r::Robot)
    putmarker!(r)
    while isborder(r, HorizonSide(1)) == false
        move!(r,HorizonSide(1))
    end
    while ismarker(r) == false
        putmarker!(r)
        move!(r, HorizonSide(3))
    end
end
function ugol(r)
    while isborder(r, HorizonSide(2)) == false
        move!(r,HorizonSide(2))
    end
    while isborder(r, HorizonSide(3)) == false
        move!(r,HorizonSide(3))
    end
end
