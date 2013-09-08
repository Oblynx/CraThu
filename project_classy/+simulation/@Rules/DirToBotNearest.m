function uv=DirToBotNearest(bots, n, world)

m=BotNearest(bots, n, world);
uv=DirToBot(bots, n, world,m);
uv=simulation.Tools.VecNorm(uv);

uv(1,3)=world.v0;
end
