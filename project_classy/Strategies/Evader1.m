function uv=Evader1(bots, n, world)

uv=[0 0 0];

uv=uv+50.0*DirOfBotAvoid(bots, n, world,2)/world.D(1,2);
uv=uv+0.5*DirToPoint(bots, n, world,[0 0]);

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
end

