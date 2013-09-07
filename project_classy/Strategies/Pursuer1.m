function uv=Pursuer1(bots, n, world)

uv=[0 0 0];

inv1=Invar( bots(n).x, bots(1).x );
J=100;a=2*pi*[0:J-1]/J;
abst=a(1);
dbst=1e9;
for j=1:J
	dp=cos(a(j));
	dq=sin(a(j));
	uv=(1-bots(n).c)*bots(n).v+bots(n).c*[dp, dq];
	uv(1:2)=VecNorm(uv(1:2));
	xp=bots(n).x+uv*norm(bots(n).v)*world.dt;
	xe=bots(1).x+bots(1).v*norm(bots(1).v)*world.dt/2;
	%dd=sqrt((xp-xe)^2+(yp-ye)^2)+0.5*sqrt((xp)^2+(yp)^2);
	dd=norm(xp-xe)+0.5*norm(xp);
	inv2=Invar(xp, xe);
	if inv1==inv2
		if dd<dbst
		abst=a(j);
		dbst=dd;
		end
	end
end

uv(1:2)=[cos(abst) sin(abst)];

uv(1:2)=VecNorm(uv(1:2));

uv(1,3)=world.v0;
end
%%-----------------------------------------------------
function inv=Invar( xp, xe )

if xp(1)>=xe(1) && xp(2)>=xe(2); inv=1;  end
if xp(1)>=xe(1) && xp(2)<=xe(2); inv=2;  end
if xp(1)<=xe(1) && xp(2)>=xe(2); inv=3;  end
if xp(1)<=xe(1) && xp(2)<=xe(2); inv=4;  end
end
