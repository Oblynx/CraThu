function uv=DirToMovingPoint(bots, n, world, FH)

uv(1,1:2)=FH(bots(n).x(1),bots(n).x(2),world.t);

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
