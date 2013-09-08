function uv=DirOfGroup(bots, n, world, G)

uv(1,1)=0;
uv(1,2)=0;
for m=1:min(world.N,length(G(n,:)));
    if G(n,m)>0
        uv(1,:)=uv(1,:)+bots(m).v;
    elseif G(n,m)<0
        uv(1,:)=uv(1,:)-bots(m).v;
    end
end

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
