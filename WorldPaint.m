function ln=WorldPaint(bots,ln) %Bottom feeder!

%% 290% speed gain - 0.538sec if TrailNum==0
delete(ln);
ln=line([bots.x;bots.x], [bots.y;bots.y], 'Marker','o', 'MarkerSize',5, 'MarkerEdgeColor','k', 'MarkerFaceColor','g');
set(ln(2), 'MarkerFaceColor', 'r');

%% Old Implementation - 2.1sec
% for n=1:world.N  %VECTORIZE
% 	axis([-world.Bounds world.Bounds -world.Bounds world.Bounds])
% 	plot(bots(n).x,bots(n).y,'.');
% 	hold on
% end
% figure(1); hold off
