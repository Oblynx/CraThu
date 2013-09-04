function framerate(world)
%FRAMERATE Locks simulation framerate into world.framerate if the computation time is less
pause(1/world.framerate-world.time);  %Framerate
end

