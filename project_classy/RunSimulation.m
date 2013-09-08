%RUNSIMULATION Completes the input script and runs the simulation
WorldUpdate(w, bots);
h=History( w );
plotter=Plotter( w, length(bots{1}.x), 1 );
if exist('runtimes', 'var')
	for runID=0:runtimes-1
		CSimulator( w, bots, h, plotter, runID );
	end
else
	CSimulator( w, bots, h, plotter, 0 );
end
