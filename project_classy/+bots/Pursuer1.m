classdef Pursuer1 < simulation.Bot
	%Pursuer is a bot with a special pursuing strategy
	%   Detailed explanation goes here
	%% Properties
	properties (SetAccess = immutable)
		evade = false;
	end
	%% Methods
	methods
		function p = Pursuer1( id, pars )
			p=p@simulation.Bot( id, pars );
			if nargin==0
				return
			end
		end
		function uv=strat( b, bots, n, world )
			import bots.*;
			inv1=Pursuer1.Invar3( bots{n}.x-bots{1}.x );
			J=10;
			lin=linspace(0,1,J);
			a=2*pi*lin(1:end);
			phibst=a(1);
			thetabst=a(1);
			dbst=Inf;
			for j=1:J
				for k=1:J
					dv = world.v0* [cos(a(j))*sin(a(k)), sin(a(j))*sin(a(k)), cos(a(k))];
					uv=(1-bots{n}.c)*bots{n}.v+bots{n}.c*dv;
			% 		if any(uv~=0)
			% 			uv=uv/norm(uv);
			% 		else uv=[0 0 0];
			% 		end
					xp=bots{n}.x+uv*world.dt;
					xe=bots{1}.x+bots{1}.v*world.dt/2;
					dd=norm(xp-xe)+0.5*norm(xp);
					inv2=Pursuer1.Invar3(xp-xe);
					if inv1==inv2
						if dd<dbst
							phibst=a(j);
							thetabst=a(k);
							dbst=dd;
						end
					end
				end
			end
			uv = [cos(phibst)*sin(thetabst), sin(phibst)*sin(thetabst), cos(thetabst)];
			% if any(uv~=0)
			% 	uv=uv/norm(uv);
			% else uv=[0 0 0];
			% end
			uv(1,4)=world.v0;
		end
	end
	
	methods (Static)
		function inv=Invar( x )
			l= num2str(x>0, '%d %d');
			switch l
				case '1 1'
					inv=1;
				case '1 0'
					inv=2;
				case '0 1'
					inv=3;
				case '0 0'
					inv=4;
			end
% 			if xp(1)>=xe(1) && xp(2)>=xe(2); inv=1;  end
% 			if xp(1)>=xe(1) && xp(2)<=xe(2); inv=2;  end
% 			if xp(1)<=xe(1) && xp(2)>=xe(2); inv=3;  end
% 			if xp(1)<=xe(1) && xp(2)<=xe(2); inv=4;  end
		end
		function i=Invar3( x )	%Position difference
			l= num2str(x>0, '%d %d %d');
			switch l
				case '1 1 1'
					i=1;
				case '1 1 0'
					i=2;
				case '1 0 1'
					i=3;
				case '1 0 0'
					i=4;
				case '0 1 1'
					i=5;
				case '0 1 0'
					i=6;
				case '0 0 1'
					i=7;
				case '0 0 0'
					i=8;
			end
		end
	end
end

