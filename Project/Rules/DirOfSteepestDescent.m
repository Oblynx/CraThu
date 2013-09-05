function uv=DirOfSteepestDescent(n,bots,world,FH);

dx=0.1; x1=bots(n).x;    y1=bots(n).y;
dy=0.1; x2=dx+bots(n).x; y2=dy+bots(n).y;

uv(1,1:2)=FH(x1,y1,world.t)-FH(x2,y2,world.t);

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
