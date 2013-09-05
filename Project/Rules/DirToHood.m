function uv=DirToHood(n,bots,world,d0);

uv(1,1)=0;
uv(1,2)=0;
uv(1,3)=world.v0;
for m=1:world.N
    if world.D(n,m)<d0
        uv=uv+DirToBot(n,bots,world,m);
    end
end

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;

