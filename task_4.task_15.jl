#ДАНО: Робот - в произвольной клетке поля с внутренними перегородками(могут быть прямоугольники)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы
include("library.jl")
function moveAroundAndPut!(r::Robot)
    for side in instances(HorizonSide)
        putmarker!(r)
        marksLine!(r, side)
    end
end
function perimetr_with_obstacles(r::Robot)
    sides = moveAndReturnDirections!(r)
    moveAroundAndPut!(r)
    moveToStartplace!(r)
    moveToBeginplace!(r, sides)
end