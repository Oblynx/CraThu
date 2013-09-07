function uv=DirOfBotAvoid(bots, n, world, m)

if 0<n && n<=world.N && n~=m
    uv=-bots(m).v;
else
    uv=[0 0];
end
uv=VecNorm(uv);

uv(1,3)=world.v0;
end

