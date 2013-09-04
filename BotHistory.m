function history=BotHistory(bots,world)

% for n=1:world.N
%     x(1,n)=bots(n).x;
%     y(1,n)=bots(n).y;
%     p(1,n)=bots(n).p;
%     q(1,n)=bots(n).q;
%     v(1,n)=bots(n).v;
% end
history(:,1)=[bots.x];
history(:,2)=[bots.y];
history(:,3)=[bots.p];
history(:,4)=[bots.q];
history(:,5)=[bots.v];
end
