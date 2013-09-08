classdef (Abstract = true) Rules
	%RULES Contains all rules as static methods
	
	methods (Static)
		uv=DirOfBot(n,bots,world,m)
		uv=DirOfBotAvoid(bots, n, world, m)
		uv=DirOfBotNearest(bots, n, world)
		uv=DirOfBotNearestAvoid(bots, n, world, d0)
		uv=DirOfField(bots, n, world, FH)
		uv=DirOfGroup(bots, n, world, G)
		uv=DirOfHood(bots, n, world, d0)
		uv=DirOfSteepestDescent(n,bots,world,FH)
		uv=DirToBot(bots, n, world, m)
		uv=DirToBotAvoid(bots, n, world, m)
		uv=DirToBotNearest(bots, n, world)
		uv=DirToBotNearestAvoid(bots, n, world, d0)
		uv=DirToGroup(bots, n, world, G)
		uv=DirToHood(bots, n, world, d0)
		uv=DirToMovingPoint(bots, n, world, FH)
		uv=DirToPoint(bots, n, world, r0)
		uv=FollowWayPoints(bots, n, world)
	end
end

