function history=CSimulator( world, bots, history, plotter )
% SIMULATOR Underlying simulator platform
%% Initialization
ClearHistory( history );
%Capture=0;
trailnum=world.trailnum;
%trteam=reshape([1:world.N*trailnum], [world.N, trailnum]);	%TrailTeam
% figure(1);
% clf;
%history=zeros(world.T,world.N,5);	%X,Y,P,Q,V
%% SimSteps
for t=1:world.T
    tic;
	WorldUpdate(world, bots);
    for i=1:world.N
		% Implement a try/catch block
		tmp=strat(bots, i, world);	%Calc new velocities
		bots(i).tmpv=tmp(1:2)*tmp(3);
	end
% 	bots(1)=strat(bots, 1, world);
% 	bots(2)=strat(bots, 2, world);
	for i=1:world.N
		bots(i)=move(bots(i), world);	%Calc new positions, including reflection / Speed normalization imposed internally
	end
	%bots=PostProcess(bots,world,UV);
% 	for n=1:world.N
% 		bots(n)=BotUpdate(n,bots,world,UV);
% 		bots(n)=BotReflect(n,bots,world,UV);
% 	end
    
	if world.CaptureRadius>0
%         for n=2:world.N
%             if world.D(1,n)<world.CaptureRadius
%                 Capture=1;
%             end
% 		end
% 		if Capture
%             break
% 		end
		capture = CapCheck( world );
		if capture
			break
		end
	end
    %[history.x(:,:,w.t), history.v(:,:,w.t)]= history.LogHistory( history.x(:,:,w.t), history.v(:,:,w.t), bots, world );
	LogHistory( history, bots, world );
	
% 	trailnum=t*heaviside(-t+world.trailnum+0.5)+world.trailnum*heaviside(t-world.trailnum-0.5);	
% 	ln=WorldPaint( history(t-trailnum+1:t, :, 1:2), ln, trailnum, world.N, world.palette, trteam(:,1:trailnum) );
	%WorldPaint( world, plotter, history );
	
	%plotter=WorldPaint( plotter, world, history );
	WorldPaint( world, plotter, history );
	
	simtime=toc;
	Framerate( world, simtime );
end
%% Closing actions
ClosePlot( plotter, world.N );
end
