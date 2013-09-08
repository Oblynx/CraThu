classdef (Abstract = true) Strat
	%Strat Contains all bot strategies as static methods
	methods (Static)
		uv=Evader1(bots, n, world)
		uv=Pursuer1(bots, n, world)
		uv=Walker1(bots, n, world)
	end
	
end

