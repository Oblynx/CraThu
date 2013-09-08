function uv=Walker1(bots, n, world)

uv=[0 0 0];
%uv=uv+1.0*StayInDisc(bots, n, world,60);
%uv=uv+0.5*DirOfBot(bots, n, world,3);
%uv=uv+0.5*DirOfBotAvoid(bots, n, world,1);
%uv=uv+0.5*DirOfBotNearest(bots, n, world);
uv=uv+1.5*DirOfBotNearestAvoid(bots, n, world,15);
%uv=uv+1.0*DirOfField(bots, n, world,@Field2);
%uv=uv+0.5*DirOfGroup(bots, n, world,world.G);
%uv=uv+0.5*DirOfHood(bots, n, world,50);
%uv=uv+0.5*DirToBot(bots, n, world,3);
%uv=uv+0.5*DirToBotAvoid(bots, n, world,1);
%uv=uv+0.5*DirToBotNearest(bots, n, world);
%uv=uv+1.5*DirToBotNearestAvoid(bots, n, world,25);
%uv=uv+0.5*DirToGroup(bots, n, world,world.G);
%uv=uv+0.5*DirToHood(bots, n, world,50);
%uv=uv+1.0*DirToMovingPoint(bots, n, world,@Point2);
%uv=uv+1.0*DirToPoint(bots, n, world,[20 30]);
%uv=uv+1.0*DirOfSteepestDescent(bots, n, world,@Func1);
uv=uv+1.0*FollowWayPoints(bots, n, world);

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
