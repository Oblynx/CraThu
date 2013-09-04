function [bots,world]=PEFSim(bots,world)
% SIMULATOR Underlying simulator platform

%Initialization
Capture=0;
figure(1);
clf;
ln=zeros(2,4);
history=zeros(world.T,world.N,5); %X,Y,P,Q,V

for i=1:4
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
    history(t,:,:)=BotHistory(bots,world);
	
	ln(:,1)=WorldPaint(bots,ln(:,1));
	%% Comment these lines to remove trail and increase performance
	% Probably have to generalize WorldPaint & BotHistory so that this might be
	%   ln=WorldPaint(history,ln,TrailNum)
	if t>1
		delete(ln(:,2));
		ln(:,2)=line([history(t-1,:,1);history(t-1,:,1)], [history(t-1,:,2);history(t-1,:,2)], 'Marker','d', 'MarkerSize',4, 'MarkerEdgeColor','k', 'MarkerFaceColor','g');
		set(ln(2,2), 'MarkerFaceColor', 'r');
	end	
	if t>2
		delete(ln(:,3));
		ln(:,3)=line([history(t-2,:,1);history(t-2,:,1)], [history(t-2,:,2);history(t-2,:,2)], 'Marker','d', 'MarkerSize',2, 'MarkerEdgeColor','k', 'MarkerFaceColor','g');
		set(ln(2,3), 'MarkerFaceColor', 'r');
	end
	if t>3
		delete(ln(:,4));
		ln(:,4)=line([history(t-3,:,1);history(t-3,:,1)], [history(t-3,:,2);history(t-3,:,2)], 'Marker','d', 'MarkerSize',1, 'MarkerEdgeColor','k', 'MarkerFaceColor','g');
		set(ln(2,4), 'MarkerFaceColor', 'r');
	end
	%%
	world.time=toc;
	framerate(world);
end
delete(ln(:,2:end));
