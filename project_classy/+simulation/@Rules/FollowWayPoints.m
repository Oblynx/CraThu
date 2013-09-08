function uv=FollowWayPoints(bots, n, world)

r1=bots(n).x;
i=find(bots(n).wpc==1);
if length(i)~=1
	uv(1:2)=[0,0];
else
	r2=bots(n).WP(i,:);
	uv=DirToPoint(bots, n, world, r2);
end

uv(1:2)=simulation.Tools.VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
