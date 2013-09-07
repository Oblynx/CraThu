classdef Plotter < handle
	%Plotter Displays screen output
	%   Detailed explanation goes here
	
	properties (SetAccess = immutable)
		noplot= false;
		fID
		trteam
	end
	properties (SetAccess = private)
		ln
		trailnum
	end
	
	methods
		function p=Plotter( w, dim, fID )
			if nargin==0
				return
			end
			figure(fID);
			clf;
			p.fID=fID;
			p.trteam=reshape([1:w.N*w.trailnum], [w.N, w.trailnum]);	%TrailTeam
			p.trailnum=w.trailnum;
			p.ln=zeros(2,w.trailnum);			
			for i=1:w.trailnum
				p.ln(:,i)=line(1e8,1e8);
			end
			if dim==2
				axis([-1, 1, -1, 1]*w.Bounds);
			elseif dim==3
				axis([-1, 1, -1, 1, -1, 1]*w.Bounds);
			else
				p.noplot= true;
			end
		end
		function Plot( p, w, his )
			trailteam=p.trteam(:, 1:p.trailnum);
			
			X=zeros( 1, p.trailnum*w.N ); Y=zeros( 1, p.trailnum*w.N );
			c=0;
			for i=1:p.trailnum  % Create X,Y arrays of point data: each column gives a new point
				for j=1:w.N
					c=c+1;
					X(c)=his( j, 1, p.trailnum-i+1 );
					Y(c)=his( j, 2, p.trailnum-i+1 );
				end
			end
			delete(p.ln);
			p.ln=line([X; X], [Y; Y], 'Marker','o', 'MarkerSize',5, 'MarkerEdgeColor','k', 'MarkerFaceColor', w.palette(1));
			for i=2:p.trailnum
				s=3*exp(-0.5*i+1)+0.1;
				set(p.ln(trailteam(:,i)), 'Marker', 'd', 'MarkerSize', s);
			end
			for i=2:w.N
				set(p.ln(trailteam(i,:)), 'MarkerFaceColor', w.palette(i));
			end
		end		
		%p.ln=WorldPaint( his.x( w.t-p.trailnum+1 : w.t, : ), p.ln, p.trailnum, world.N, world.palette, trteam(:,1:trailnum) );
		function ClosePlot( p, N )
			if size(p.ln,1)>N
				delete(p.ln(N+1:end));
			end
		end
		function SetTrailnum( p, w )
			p.trailnum= w.t*simulation.Plotter.heaviside( -w.t+w.trailnum+0.5 ) + w.trailnum*simulation.Plotter.heaviside( w.t-w.trailnum-0.5 );
		end
	end
	
	methods (Static)
		function u = heaviside( t )
			%HEAVISIDE Heaviside step function u(c,t)
			%  u_c(t)=0, t<c & u_c(t)=1, t>c & u_c(t)=0.5, t=c
			if t<0
				u=0;
			elseif t>0
				u=1;
			else
				u=0.5;
			end
		end
	end
	
end

