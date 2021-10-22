function [] = saveData()
time = clock();
time = string(time(1))+'-'+string(time(2))+'-'+string(time(3))+"--"+...
    string(time(4))+":"+string(time(5))+":"+...
    string(cast(time(6),'uint8'))+".mat";
save(time);
end

