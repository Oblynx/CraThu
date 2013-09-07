function uv=StayInDisc(n,bots,world,R0)

d0=norm([bots(n).x bots(n).y]);
if d0<R0
    uv(1,1)=bots(n).p;
    uv(1,2)=bots(n).q;
else
    uv(1,1)=-bots(n).x;
    uv(1,2)=-bots(n).y;
end
uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
