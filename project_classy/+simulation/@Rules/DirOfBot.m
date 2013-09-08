function uv=DirOfBot(bots, n, world, m)

if 0<n && n<=world.N
    uv=bots(m).v;
else
    uv=[0 0];
end
uv=simulation.Tools.VecNorm(uv);

uv(1,3)=world.v0;
end

