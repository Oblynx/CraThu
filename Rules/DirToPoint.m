function uv=DirToPoint(n,bots,world,r0);

uv(1,1:2)=[r0(1)-bots(n).x,r0(2)-bots(n).y];

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
