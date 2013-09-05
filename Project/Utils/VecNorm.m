function un=VecNorm(u)
% function un=vecnorm(u)
% normalizes the vector u to have unit length
n=norm(u);
if n>0
    un=u/n;
else
    un=[0 0];
end
