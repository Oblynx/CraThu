function uv=FollowWayPoints(n,bots,world);

r1=[bots(n).x bots(n).y];
i=find(bots(n).wpc==1);
if length(i)~=1
	uv(1:2)=[0,0];
else
	r2=bots(n).WP(i,:);
	uv=DirToPoint(n,bots,world,r2);
end

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
		