function uv=DirToPoint(bots, n, world, r0)

uv(1,1:2)=r0-bots(n).x;

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
