function history=CSimulator( world, bots, history, plotter, runID )
% SIMULATOR Underlying simulator platform
% Input: <runID> must be a number and is simply appended to the log file's name
%% Initialization
capture=0;
ClearHistory( history );
figure(1);
%% SimSteps
for t=1:world.T
    tic;
	WorldUpdate(world, bots);
    for i=1:world.N
		tmp=strat( bots{i}, bots, i, world);	%Calc new velocities
		bots{i}.tmpv=tmp(1:end-1)*tmp(end);
	end
	for i=1:world.N
		bots{i}=move(bots{i}, world);	%Calc new positions, including reflection / Speed normalization imposed internally
	end
	if world.CaptureRadius>0
		capture=CapCheck( world );
		if capture
			disp('Gotcha!');
			break
		end
	end
	
	LogHistory( history, bots, world );
	WorldPaint( world, plotter, history );
	simtime=toc;
	Framerate( world, simtime );
end
%% Closing actions
if ~capture
	disp('Time"s up');
end
ClosePlot( plotter, world.N );
filename= ['C:\Users\Konstantinos\Documents\MATLAB\CraThu_classy\logs\history', num2str(runID),'.mat'];
SaveHistory( history, filename );
end
