#ДАНО: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля с перегородками
#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, 
#следующий - весь, за исключением одной последней клетки на Востоке, следующий - за исключением двух последних клеток
#на Востоке, и т.д.
include("library.jl")
function putmarker!(robot::CoordsRobot)
    x, y = get_xy(get_coords(robot))
    if x - y <= 0
        putmarker!(get_robot(robot))
    end
end
function lestniza_with_obstacles(r::Robot)
    back_path = BackPath(r)
    R = CoordsRobot(r)
    marks!(R)
    BackPath(R)
    back!(R, back_path)
end