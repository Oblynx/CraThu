function uv=DirOfBotNearest(bots, n, world)

m=BotNearest(n,bots,world);
uv=DirOfBot(n,bots,world,m);
uv=simulation.Tools.VecNorm(uv);

uv(1,3)=world.v0;
end
