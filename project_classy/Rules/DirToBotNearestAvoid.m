function uv=DirToBotNearestAvoid(n,bots,world,d0)

m=BotNearest(n,bots,world);
dmn=world.D(n,m);
if dmn<d0 & n~=m
    uv=-DirToBot(n,bots,world,m);
else
    uv=[bots(n).p,bots(n).q];
end
uv=VecNorm(uv);

uv(1,3)=world.v0;

