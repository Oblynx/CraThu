function uv=DirOfField(n,bots,world,FH);

uv(1,1:2)=FH(bots(n).x,bots(n).y,world.t);

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
