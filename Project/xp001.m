clear all

% world initialization
world.N=5;
world.t=0;
world.T=300;
world.v0=3;
world.dt=1;
world.Bounds=100;
world.G=load('G3.txt');
% set 'world.PEGame=0;' iff we are playing a Flocking game
world.CaptureRadius=0;

% bots initialization
for n=1:world.N
    bots(n).strategy='Walker1(n,bots,world)';
    bots(n).v=world.v0;
    bots(n).c=0.8;
    bots(n).x=0.1*world.Bounds*(rand(1)-0.5);
    bots(n).y=0.1*world.Bounds*(rand(1)-0.5);
    a=2*pi*rand(1);
    bots(n).p=cos(a);
    bots(n).q=sin(a);
    bots(n).WP=[50 50; -50 50; -50 -50; 50 -50];
    bots(n).wpc=[1 0 0 0];
end

world=WorldUpdate(bots,world);
[bots,world]=PEFSim(bots,world);