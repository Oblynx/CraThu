classdef Bot
	%Bot Simulation actor
	% Allows for specialised bot subclasses
	% Initialize with: Bots (first ID, {x (pos), v (vel), c, strategy,  WP, wpc}, ...)
	%% Properties
	properties (SetAccess = immutable)
		id
	end
	properties (SetAccess = protected)
		x
		v
		c
		strategy
		WP
		wpc
		% Advanced properties, physical simulation / currently not being
		% initialised by constructor
		a
		mass
	end
	properties (Dependent = true, SetAccess = private)
		kenergy
		momentum
	end
	properties (Transient = true)
		tmpv=[];
	end
	%% Methods
	methods		
		% CONSTRUCTOR: First input = first ID. Accepts any number of cell arrays as input, where each cell
		% describes the properties of 1 bot. Also accepts cell arrays followed by a
		% number which implies that many bots with identical properties.
		% Example: bots = bot(1,{b1},{b2},3,{b3}) constructs a 5x1 bots vector with bot
		% kinds: b1,b2,b2,b2,b3
		function b = Bot(id, varargin)
			if nargin==0
				return
			end
			ID=id;
			l=0;
			for i=1:nargin-2
				if iscell(varargin{i})
					if isnumeric(varargin{i+1}) && size(varargin{i+1})==1
						l=l+round(varargin{i+1});
					else
						l=l+1;
					end
				end
			end
			if iscell(varargin{nargin-1})
				l=l+1;
			end
			%b(l,1) = simulation.Bot;		% Preallocate array
			c1=1;
			for j=1:nargin-2
				if iscell(varargin{j})
					if isnumeric(varargin{j+1}) && size(varargin{j+1})==1
						n=round(varargin{j+1});
					else
						n=1;
					end
					for i=c1:c1+n-1
						b(i).id=ID;
						b(i).x=varargin{j}{1};
						b(i).v=varargin{j}{2};
						b(i).c=varargin{j}{3};
						b(i).strategy=varargin{j}{4};
						b(i).WP=varargin{j}{5};
						b(i).wpc=varargin{j}{6};
						ID=ID+1;
					end
					c1=c1+n;
				end
			end
			if iscell(varargin{nargin-1})
				b(l).x=varargin{nargin-1}{1};
				b(l).v=varargin{nargin-1}{2};
				b(l).c=varargin{nargin-1}{3};
				b(l).strategy=varargin{nargin-1}{4};
				b(l).WP=varargin{nargin-1}{5};
				b(l).wpc=varargin{nargin-1}{6};
			end
		end
		function kenergy = get.kenergy(b)
			kenergy = b.mass/2*b.v^2;
		end
		function momentum = get.momentum(b)
			momentum = b.mass*b.v;
		end
		function tmp=strat( b, bots, n, world )
			try
				tmp=eval(bots(n).strategy);
			catch err
				tmp=[1, 1, 1];
				rethrow(err);
			end
		end
	end
	
	methods (Sealed = true)		%Subclasses are required to use these same methods
		function b=waypoints( b, w, way )
			r=b.WP(way,:);
			if norm(b.x-r)<w.wpcap
				b.wpc(way)=0;
				way=way+1;
			end
			if way>length(b.WP)
				way=way-length(b.WP);
			end
			b.wpc(way)=1;
		end
		function b=move( b, w )
			if size(b.tmpv)>0	%If strategy has been played before, update v
				b.v=(1-b.c)*b.v+b.c*b.tmpv;
				b.v=w.v0*b.v/norm(b.v);		%Speed normalisation
				b.x=b.x+b.v*w.dt;
				b.tmpv=[];
			else
				b.x=b.x+b.v*w.dt;
			end
			way=find(b.wpc~=0);
			if ~isempty(way)
				b=waypoints(b, w, way);
			end
			if any(abs(b.x) > w.Bounds)
					b=out_of_bounds( w, b );
			end
		end
		function b=pmove(b, w)	%Physical move., evaluates forcefield at current position
			b.a=w.F(b.x)/b.mass;
			b.v=b.v+b.a*w.dt;
			b.x=b.x+b.v*w.dt;
			if any(abs(b.x) > w.Bounds)
					b=out_of_bounds( b,w );
			end
		end
	end
	
	methods (Sealed = true, Hidden = true, Access = ?simulation.World)
		function b=moveto( b, x, v )
			b.x=x;
			b.v=v;
		end
	end
end

