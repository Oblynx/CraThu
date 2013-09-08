function uv=DirOfBotNearestAvoid(bots, n, world, d0)

m=BotNearest(bots, n, world);
dmn=world.D(n,m);
if dmn<d0 && n~=m
    uv=-DirOfBot(bots, n, world, m);
else
    uv=bots(n).v;
end
uv=simulation.Tools.VecNorm(uv);

uv(1,3)=world.v0;

