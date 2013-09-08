function uv=DirOfSteepestDescent(n,bots,world,FH)

dx=0.1; x1=bots(n).x;
dy=0.1; x2=dx+bots(n).x;

uv(1,1:2)=FH(x1(1),x1(2),world.t)-FH(x2(1),x2(2),world.t);

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
