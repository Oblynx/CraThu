function uv=DirToGroup(bots, n, world, G)

uv(1,1)=0;
uv(1,2)=0;
uv(1,3)=world.v0;
for m=1:min(world.N,length(G(n,:)));
    if G(n,m)>0
        uv=uv+DirToBot(bots, n, world, m);
    elseif G(n,m)<0
        uv=uv-DirToBot(bots, n, world, m);
    end
end

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
