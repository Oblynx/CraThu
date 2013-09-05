function uv=DirToBotNearest(n,bots,world)

m=BotNearest(n,bots,world);
uv=DirToBot(n,bots,world,m);
uv=VecNorm(uv);

uv(1,3)=world.v0;

