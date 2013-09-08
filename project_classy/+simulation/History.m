classdef History < handle
	%HISTORY Logs bot position & velocity for each timestep & bot
	% Access to these data locked for bots
	properties (SetAccess = private, GetAccess = {?simulation.World, ?simulation.Plotter})
		x	% n, spacedim, t
		v
	end
	
	methods
		function h=History( w )
			h.x=zeros(w.T, w.N);
			h.v=zeros(w.T, w.N);
		end
		function ClearHistory( h )
			h.x=0;
			h.v=0;
		end
		function LogHistory( h, bots, w )
			for i=1:w.N
				for j=1:length(bots{1}.x)
					h.x(i, j, w.t) = bots{i}.x(j);
					h.v(i, j, w.t) = bots{i}.v(j);
				end
			end
		end
		function SaveHistory( history, file )
			try
				save(file, 'history');
			catch err
				disp(err.identifier)
				disp(err.message)
				disp(err.cause)
				disp(err.stack)
				return
			end
		end
	end
	
	end
