function uv=Pursuer1(n,bots,world)

uv=[0 0 0];

inv1=Invar(bots(n).x,bots(n).y,bots(1).x,bots(1).y);
J=100;a=2*pi*[0:J-1]/J;
abst=a(1);
dbst=1e9;
for j=1:J
	dp=cos(a(j));
	dq=sin(a(j));
	uv(1)=(1-bots(n).c)*bots(n).p+bots(n).c*dp;
	uv(2)=(1-bots(n).c)*bots(n).q+bots(n).c*dq;
	uv(1:2)=VecNorm(uv(1:2));
	xp=bots(n).x+uv(1)*bots(n).v*world.dt;
	yp=bots(n).y+uv(2)*bots(n).v*world.dt;
	xe=bots(1).x+bots(1).p*bots(1).v*world.dt/2;
	ye=bots(1).y+bots(1).q*bots(1).v*world.dt/2;
	dd=sqrt((xp-xe)^2+(yp-ye)^2)+0.5*sqrt((xp)^2+(yp)^2);
	inv2=Invar(xp,yp,xe,ye);
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

%%-----------------------------------------------------
function inv=Invar(xp,yp,xe,ye);

if xp>=xe & yp>=ye; inv=1;  end
if xp>=xe & yp<=ye; inv=2;  end
if xp<=xe & yp>=ye; inv=3;  end
if xp<=xe & yp<=ye; inv=4;  end
