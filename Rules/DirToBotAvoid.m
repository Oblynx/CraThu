function uv=DirToBotAvoid(n,bots,world,m)

if 0<n & n<=world.N & n~=m
    uv=-DirToBot(n,bots,world,m);
else
    uv=[0 0];
end
uv=VecNorm(uv);

uv(1,3)=world.v0;

