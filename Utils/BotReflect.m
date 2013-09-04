function bot=BotReflect(n,bots,world,UV);

bot=bots(n);
if bots(n).x>world.Bounds;  bot.x=2*world.Bounds-bots(n).x;  bot.p=-bots(n).p; end
if bots(n).x<-world.Bounds; bot.x=-2*world.Bounds-bots(n).x; bot.p=-bots(n).p; end
if bots(n).y>world.Bounds;  bot.y=2*world.Bounds-bots(n).y;  bot.q=-bots(n).q; end
if bots(n).y<-world.Bounds; bot.y=-2*world.Bounds-bots(n).y;  bot.q=-bots(n).q; end
    
