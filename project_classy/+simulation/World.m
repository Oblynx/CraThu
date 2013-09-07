classdef (Sealed = true) World < handle
	%World Simulation environment
	% Created once and initialised with property values
	% Initialise with: World {N, T, Bounds, trailnum, (palette), v0,
	%  CaptureRadius, WaypointCap, framerate}
	%% Properties
	properties (SetAccess = immutable)
		N=2;
		T=300;
		dt=1;
		Bounds=100;
		trailnum=5;				 %Positive integer, usually 4-5, includes current point
		palette=['g', 'r', 'b', 'c', 'm', 'y', 'k', 'w'];
		reflect=1;					% Currently can't be altered by constructor
	end
	properties (SetAccess = private)
		v0=3;
		CaptureRadius=2.0;
		wpcap=2;
		framerate=35;			%fps
		t=-1;
		D;	% Distance matrix
	end
	%% Events
	events							% Currently none used
		collision
		capture
% 		out_of_bounds	% Probably unnecessary
	end
	%% Methods
	methods
		function w=World( pars )		% Constructor
			if nargin==0
				return
			end
			if numel(pars)==9
				w.N=pars{1};
				w.T=pars{2};
				w.Bounds=pars{3};
				w.trailnum=round(pars{4});
				w.palette=pars{5};
				w.v0=pars{6};
				w.CaptureRadius=pars{7};
				w.wpcap=pars{8};
				w.framerate=pars{9};
			elseif numel(pars)==8	%suppose palette not defined
				w.N=pars{1};
				w.T=pars{2};
				w.Bounds=pars{3};
				w.trailnum=pars{4};
				w.v0=pars{5};
				w.CaptureRadius=pars{6};
				w.wpcap=pars{7};
				w.framerate=pars{8};
			end
			w.D=inf(w.N);
		end
		function WorldUpdate( w, bots )
			w.t=w.t+1;
			%pos=cell2mat({bots.x}');
			for i=1:w.N
				for j=i+1:w.N
					w.D(i,j)=norm(bots(i).x-bots(j).x);
				end
			end
		end
		function cap=CapCheck( w )	% TODO: Trigger capture / collision event, display who collided
			cap=0;
			check= (w.D-w.CaptureRadius < 0);
			if any(any(check))	% w.D was initialised to all-inf
				cap=1;
			end
		end
		function WorldPaint( w, p, his )
			if p.noplot
				return
			end
			SetTrailnum( p, w );
			trange= w.t-p.trailnum+1 : w.t ;
			Plot( p, w, his.x( :, :, trange ) )
		end
		function Framerate( w, t )
			frtime=1/w.framerate;
			if t < frtime
				pause( frtime - t )
			end
		end
	end
	
	methods (Access = ?simulation.Bot)
		function b=out_of_bounds( w, b )
			x=b.x;
			v=b.v;
			if w.reflect
				v=-b.v;
				for i=1:length(b.x)
					if b.x(i) > w.Bounds
						x(i) = 2*w.Bounds-b.x(i);
					elseif b.x(i) < -w.Bounds
						x(i) = -2*w.Bounds-b.x(i);
					end
				end
			else
				for i=1:length(b.x)
					if b.x(i) > w.Bounds
						x(i) = b.x-2*w.Bounds;
					elseif b.x(i) < -w.Bounds
						x(i) = b.x+2*w.Bounds;
					end
				end
			end
			b=moveto( b, x, v );
		end
	end
	
	methods (Static)		% Not implemented yet
		function F(x)
		end
	end
	
end

