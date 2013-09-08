function uv=DirToBotAvoid(bots, n, world, m)

if 0<n && n<=world.N && n~=m
    uv=-DirToBot(bots, n, world, m);
else
    uv=[0 0];
end
uv=simulation.Tools.VecNorm(uv);

uv(1,3)=world.v0;
end
