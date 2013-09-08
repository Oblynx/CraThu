classdef Evader1 < simulation.Bot
	%Evader is a bot with a special evading strategy
	%% Properties
	properties (SetAccess = immutable)
		evade= true;
	end
	%% Methods
	methods
		function e = Evader1( id, pars )
			if nargin==0
			end
			e=e@simulation.Bot( id, pars );
		end
		function uv=strat( b, bots, n, w )
			% For compatibility, tmp(end) must be the norm of the tmp(1:end-1)
			% vector
			D=0;			%New direction:= weighted mean of pursuers' by distance + attraction to center
			for i=1:n-1
				if ~bots{i}.evade
					D=D+w.D(i,n);
				end
			end
			for i=n+1:w.N
				if ~bots{i}.evade
					D=D+w.D(n,i);
				end
			end
			uv=0;
			for i=1:n-1
				uv=uv+w.D(i,n)*bots{i}.v;
			end
			for i=n+1:w.N
				uv=uv+w.D(n,i)*bots{i}.v;
			end
			uv=uv/D;
			uv=uv-norm(bots{n}.x)*bots{n}.x;		%Attraction to center
			vel=norm(uv);
			if vel~=0
				uv=uv/vel;
			end
			uv(end+1)=vel;
		end
	end
end

