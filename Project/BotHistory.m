function history=BotHistory(bots)
% BOTHISTORY Saves current bot attributes into "history" record
history(:,1)=[bots.x];
history(:,2)=[bots.y];
history(:,3)=[bots.p];
history(:,4)=[bots.q];
history(:,5)=[bots.v];
end
