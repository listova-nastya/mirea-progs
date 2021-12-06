#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние
#прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
#РЕЗУЛЬТАТ: Робот - в исходном положении и в углах поля стоят маркеры
include("library.jl")
function putmarkerInCorner!(r::Robot)
    for side in instances(HorizonSide)
        putmarker!(r)
        while !isborder(r, side)
            move!(r, side)
        end
    end
end
function ugly_with_obstacles(r::Robot)
    sides = moveAndReturnDirections!(r)
    putmarkerInCorner!(r)
    moveToStartplace!(r)
    moveToBeginplace!(r, sides)
    
end