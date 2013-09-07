function uv=DirToBot(n,bots,world,m)

if 0<n & n<=world.N
    uv=[bots(m).x-bots(n).x,bots(m).y-bots(n).y];
else
    uv=[0 0];
end
uv=VecNorm(uv);

uv(1,3)=world.v0;

