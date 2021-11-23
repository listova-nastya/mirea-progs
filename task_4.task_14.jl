#ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля с внутренними перегородками.
#РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
include("library.jl")
function krest_with_obstacles(r, dx::Integer = 0, dy::Integer = 0)

    R = CrossRobot(r, Coords(0, 0), true, dx, dy)
    back_path = BackPath(R)
    marks!(R)
    BackPath(r)
    back!(R, back_path)
end