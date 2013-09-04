function un=VecNorm(u)
% function un=vecnorm(u)
% normalizes the vector u tp have unit length

if norm(u)>0
    un=u/norm(u);;
else
    un=[0 0];
end
