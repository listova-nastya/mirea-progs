#ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
function crest!(r::Robot)  
    for side in (HorizonSide(i) for i=0:3) 
        putmarkers!(r,side)
        go_by_markers(r,reverse(side))
    end
    putmarker!(r)
end
function putmarkers!(r::Robot,side::HorizonSide) 
while isborder(r,side)==false 
    move!(r,side)
    putmarker!(r)
end
end
function go_by_markers(r::Robot,side::HorizonSide)  
while ismarker(r)==true 
    move!(r,side) 
end
end
function reverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2, 4))
end 

