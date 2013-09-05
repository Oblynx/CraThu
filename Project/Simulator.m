function [bots,world]=Simulator(bots,world)
% SIMULATOR Underlying simulator platform

%Initialization
Capture=0;
world.trailnum=round(world.trailnum);
trailnum=world.trailnum;
trteam=reshape([1:world.N*trailnum], [world.N, trailnum]);  %TrailTeam
figure(1);
clf;
ln=zeros(2,trailnum);
history=zeros(world.T,world.N,5);      %%%%% X,Y,P,Q,V
for i=1:trailnum
	ln(:,i)=line(1e8,1e8);
end
axis([-world.Bounds world.Bounds -world.Bounds world.Bounds]);

for t=1:world.T
    tic;
	world=WorldUpdate(bots,world);
    for n=1:world.N
        UV(n,:)=UVCompute(n,bots,world);
    end
    for n=1:world.N
        bots(n)=BotUpdate(n,bots,world,UV);
        bots(n)=BotReflect(n,bots,world,UV);
    end
    
    %%%%% in this loop uncomment 'Capture=1;' if we are playing PurEv
	if world.CaptureRadius>0
        for n=2:world.N
            if world.D(1,n)<world.CaptureRadius
                Capture=1;
            end
		end
		if Capture
            break
		end
	end
    history(t,:,:)=BotHistory(bots);
	
	trailnum=t*heaviside(-t+world.trailnum+0.5)+world.trailnum*heaviside(t-world.trailnum-0.5);	
	ln=WorldPaint( history(t-trailnum+1:t, :, 1:2), ln, trailnum, world.N, world.palette, trteam(:,1:trailnum) );
	
	world.time=toc;
	framerate(world);
end
%% 
if size(ln,1)>world.N
	delete(ln(world.N+1:end));
end
end
