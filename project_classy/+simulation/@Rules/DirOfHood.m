function uv=DirOfHood(bots, n, world, d0)

uv(1,1)=0;
uv(1,2)=0;
for m=1:world.N
    if world.D(n,m)<d0
        uv(1,:)=uv(1,:)+bots(m).v;
    end
end

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
