function world=WorldUpdate(bots,world);
world.t=world.t+1;
world.D=zeros(world.N,world.N);
for m=1:world.N
    for n=m+1:world.N
        world.D(m,n)=sqrt((bots(m).x-bots(n).x)^2+(bots(m).y-bots(n).y)^2);
        world.D(n,m)=world.D(m,n);
    end
end
