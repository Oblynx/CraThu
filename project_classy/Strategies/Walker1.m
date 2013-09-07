function uv=Walker1(n,bots,world);

uv=[0 0 0];
%uv=uv+1.0*StayInDisc(n,bots,world,60);
%uv=uv+0.5*DirOfBot(n,bots,world,3);
%uv=uv+0.5*DirOfBotAvoid(n,bots,world,1);
%uv=uv+0.5*DirOfBotNearest(n,bots,world);
uv=uv+1.5*DirOfBotNearestAvoid(n,bots,world,15);
%uv=uv+1.0*DirOfField(n,bots,world,@Field2);
%uv=uv+0.5*DirOfGroup(n,bots,world,world.G);
%uv=uv+0.5*DirOfHood(n,bots,world,50);
%uv=uv+0.5*DirToBot(n,bots,world,3);
%uv=uv+0.5*DirToBotAvoid(n,bots,world,1);
%uv=uv+0.5*DirToBotNearest(n,bots,world);
%uv=uv+1.5*DirToBotNearestAvoid(n,bots,world,25);
%uv=uv+0.5*DirToGroup(n,bots,world,world.G);
%uv=uv+0.5*DirToHood(n,bots,world,50);
%uv=uv+1.0*DirToMovingPoint(n,bots,world,@Point2);
%uv=uv+1.0*DirToPoint(n,bots,world,[20 30]);
%uv=uv+1.0*DirOfSteepestDescent(n,bots,world,@Func1);
uv=uv+1.0*FollowWayPoints(n,bots,world);

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;

