function [ u ] = heaviside( t )
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

