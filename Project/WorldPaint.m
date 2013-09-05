function ln=WorldPaint(history, ln, TN, N, palette, trteam)
% WORLDPAINT Produces screen output

%% 290% speed gain if TrailNum==1
X=zeros(1,TN*N); Y=zeros(1,TN*N);
c=0;
for i=1:TN  % Create X,Y arrays of point data: each column gives a new point
	for j=1:N
		c=c+1;
		X(c)=history(TN-i+1, j, 1);
		Y(c)=history(TN-i+1, j, 2);
	end
end
delete(ln);
ln=line([X; X], [Y; Y], 'Marker','o', 'MarkerSize',5, 'MarkerEdgeColor','k', 'MarkerFaceColor', palette(1));
for i=2:TN
	s=3*exp(-0.5*i+1)+0.1;
	set(ln(trteam(:,i)), 'Marker', 'd', 'MarkerSize', s);
end
for i=2:N
	set(ln(trteam(i,:)), 'MarkerFaceColor', palette(i));
end
end
