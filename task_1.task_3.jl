#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы
function zacras(r::Robot)
    v = 0
    q = 0
    while isborder(r,HorizonSide(0)) == false
        move!(r,HorizonSide(0))
        v = v+1
    end
    while isborder(r,HorizonSide(1)) == false
        move!(r,HorizonSide(1))
        q = q+1
    end
    while isborder(r,HorizonSide(2)) == false
        if isborder(r,HorizonSide(1)) == true
            idyvpravo(r)
        end
        if isborder(r,HorizonSide(3)) == true
            idyvlevo(r)
        end
    end
    if isborder(r,HorizonSide(1))
        idyvpravo(r)
    else
        idyvlevo(r)
    end
    ugol(r)
    for i in 1:v
        move!(r, HorizonSide(2))
    end
    for i in 1:q
        move!(r, HorizonSide(3))
    end
end    
function idyvpravo(r::Robot)
    putmarker!(r)
    while isborder(r,HorizonSide(3))==false 
        move!(r,HorizonSide(3))
        putmarker!(r)
    end
    if isborder(r,HorizonSide(2)) == false
        move!(r, HorizonSide(2))
    end
end
function idyvlevo(r::Robot)
    putmarker!(r)
    while isborder(r,HorizonSide(1) )==false 
        move!(r,HorizonSide(1))
        putmarker!(r)
    end
    if isborder(r,HorizonSide(2)) == false
        move!(r, HorizonSide(2))
    end
end
function ugol(r)
    while isborder(r, HorizonSide(0)) == false
        move!(r,HorizonSide(0))
    end
    while isborder(r, HorizonSide(1)) == false
        move!(r,HorizonSide(1))
    end
end

    
    
