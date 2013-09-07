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
% 			tx=[bots.x];
% 			tv=[bots.v];
% 			tx=reshape(tx, 2, length(bots(1).x))';
% 			tv=reshape(tv, 2, length(bots(1).x))';
% 			for i=1:w.N
% 				h.x(w.t,i,:)=tx(i,:);
% 				h.v(w.t,i,:)=tv(i,:);
% 			end
% 			h.x(w.t,:) = simulation.History.logger( [bots.x], w.N, length(bots(1).x) );
% 			h.v(w.t,:) = simulation.History.logger( [bots.v], w.N, length(bots(1).v) );
			for i=1:w.N
				for j=1:length(bots(1).x)
					h.x(i, j, w.t) = bots(i).x(j);
					h.v(i, j, w.t) = bots(i).v(j);
				end
			end
		end
	end
	
	methods (Static)
		function SaveHistory( history, file )
			try
				save(file, 'history');
			catch
				return
			end
		end
		%function [hx, hv]=LogHistory( hx hv, bots, w )
		function h = logger( s, l1, l2 )
			h=s;
			h=reshape(h, l1, l2)';
% 			for i=1:w.N
% 				hx(:,i)=[bots(i).x];
% 				hv(:,i)=[bots(i).v];
% 			end
		end
	end
	
	end
