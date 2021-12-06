#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля с перегородками
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы
include("library.jl")
function zakras_with_obstacles(r::Robot)
    sides = moveAndReturnDirections!(r)
    marks!(r)
    moveToStartplace!(r)
    moveToBeginplace!(r, sides)
end