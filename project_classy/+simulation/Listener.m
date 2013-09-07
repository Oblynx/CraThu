classdef Listener < handle
	%LISTENER Listens for events coming from Bots
	properties
		hbounds
	end
	methods
		function lis=Listener(b)
			lis.hbounds=addlistener(b, 'out_of_bounds', @World.Boundcheck);
		end
	end
	
end

