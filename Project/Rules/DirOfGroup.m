function uv=DirOfGroup(n,bots,world,G);

uv(1,1)=0;
uv(1,2)=0;
for m=1:min(world.N,length(G(n,:)));
    if G(n,m)>0
        uv(1,1)=uv(1,1)+bots(m).p;
        uv(1,2)=uv(1,2)+bots(m).q;  
    elseif G(n,m)<0
        uv(1,1)=uv(1,1)-bots(m).p;
        uv(1,2)=uv(1,2)-bots(m).q;  
    end
end

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
