function m=BotNearest(n,bots,world)

Dn=world.D(n,:); Dn(n)=1e10;
[d m]=min(Dn);
