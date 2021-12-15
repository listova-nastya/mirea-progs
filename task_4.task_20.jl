#Посчитать число всех горизонтальных прямолинейных перегородок (вертикальных - нет)
include("library.jl")
function count_gorizont_obstacles(r)
    back_path = BackPath(r, (Sud, West))
    print(counterPartition!(r))
    BackPath(r, (Sud, West))
    back!(r, back_path)
end