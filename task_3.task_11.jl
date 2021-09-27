#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние
#прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и в 4-х приграничных клетках, две из которых имеют ту же широту, 
#а две - ту же долготу, что и Робот, стоят маркеры.
function move_to_startplace!(r::Robot)
    x = 0
    y = 0
    while !(isborder(r, HorizonSide(2)) && isborder(r, HorizonSide(3)))
        while !isborder(r, HorizonSide(2))
            move!(r, HorizonSide(2))
            y+=1
        end
        while !isborder(r, HorizonSide(3))
            move!(r, HorizonSide(3))
            x+=1
        end
    end
    return (x, y)
end

function move_to_beginplace!(r::Robot, X, Y)
    x = X
    y = Y
    
    while x != 0 || y != 0
        while x != 0 
            if x > 0
                if isborder(r, HorizonSide(1))
                    move!(r, HorizonSide(0))
                    y-=1
                end
                if !isborder(r, HorizonSide(1))
                    move!(r, HorizonSide(1))
                    x -= 1
                end
            elseif x < 0
                if isborder(r, HorizonSide(3))
                    move!(r, HorizonSide(0))
                    y-=1
                end
                if !isborder(r, HorizonSide(3))
                    move!(r, HorizonSide(3))
                    x += 1
                end
            end
        end
        while y != 0
            
            if y > 0
                if isborder(r, HorizonSide(0))
                    move!(r, HorizonSide(1))
                    x-=1
                end
                if !isborder(r, HorizonSide(0))
                    move!(r, HorizonSide(0))
                    y -= 1
                end
            elseif y < 0
                if isborder(r, HorizonSide(2))
                    move!(r, HorizonSide(1))
                    x-=1
                end
                if !isborder(r, HorizonSide(2))
                    move!(r, HorizonSide(2))
                    y += 1
                end
            end
        end
    end
end

function move_and_put!(r::Robot, X, Y)
    x = X
    y = Y
    n = 0 # n(x)
    m = 0 # m(y)
    
    for side in 0:3
        if side == 0
            while !isborder(r, HorizonSide(side))  
                while y > 0
                    move!(r, HorizonSide(side))
                    y-=1
                end
                if y == 0
                    putmarker!(r)
                end
                if isborder(r, HorizonSide(side))
                    break
                end
                move!(r, HorizonSide(side))
                y-=1
            end
        end
        if side == 1
            while !isborder(r, HorizonSide(side))  
                while x > 0
                    move!(r, HorizonSide(side))
                    x-=1
                end
                if x == 0
                    putmarker!(r)
                end
                if isborder(r, HorizonSide(side))
                    break
                end
                move!(r, HorizonSide(side))
                x-=1
            end
        end
        if side == 2
            while !isborder(r, HorizonSide(side))  
                while y < 0
                    move!(r, HorizonSide(side))
                    y += 1
                end
                if y == 0
                    putmarker!(r)
                end
                if isborder(r, HorizonSide(side))
                    break
                end
                y+=1
                move!(r, HorizonSide(side))
            end
        end
        if side == 3
            while !isborder(r, HorizonSide(side))  
                while x < 0
                    move!(r, HorizonSide(side))
                    x+=1
                end
                if x == 0
                    putmarker!(r)
                end
                if isborder(r, HorizonSide(side))
                    break
                end
                x+=1
                move!(r, HorizonSide(side))
            end
        end
    end
end

function naprotiv(r::Robot)
    x, y = move_to_startplace!(r)
    move_and_put!(r, x, y)
    move_to_startplace!(r)
    move_to_beginplace!(r, x, y)
end
