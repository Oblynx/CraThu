function bot=BotUpdate(n,bots,world,UV);

bot=bots(n);
bot.v=UV(n,3);
bot.p=(1-bots(n).c)*bots(n).p+bots(n).c*UV(n,1);
bot.q=(1-bots(n).c)*bots(n).q+bots(n).c*UV(n,2);
uv=VecNorm([bot.p,bot.q]);
bot.p=uv(1);,bot.q=uv(2);
bot.x=bots(n).x+bots(n).v*bots(n).p*world.dt;
bot.y=bots(n).y+bots(n).v*bots(n).q*world.dt;

% update WayPoints state
i=find(bot.wpc==1);
r1=[bot.x bot.y];
r2=bot.WP(i,:);
if norm(r1-r2)<4
    bot.wpc(i)=0;
    i=i+1;
end
if i>size(bot.WP,1)
    i=i-size(bot.WP,1);
end
bot.wpc(i)=1;
