clear all

% world initialization
world.N=4;
world.t=0;
world.T=300;
world.v0=3;
world.dt=1;
world.Bounds=100;
world.G=load('G3.txt');
% set 'world.PEGame=0;' iff we are playing a Flocking game
world.CaptureRadius=2.0;
world.framerate=40;				%fps
world.trailnum=6;				 %Positive integer
world.palette=['g', 'r', 'b', 'c', 'm', 'y', 'k', 'w'];

% bots initialization
bots(1).strategy='Evader1(1,bots,world)';
bots(1).v=3.0;
bots(1).c=0.9;
bots(1).x=1*world.Bounds*(rand(1)-0.5);
bots(1).y=1*world.Bounds*(rand(1)-0.5);
   bots(1).x=1*world.Bounds*(-1-0.5);
   bots(1).y=1*world.Bounds*(1-0.5);
a=2*pi*rand(1);
   a=2*pi*0.99;
bots(1).p=cos(a);
bots(1).q=sin(a);
bots(1).WP=[50 50; -50 50; -50 -50; 50 -50];
bots(1).wpc=[1 0 0 0];

bots(2).strategy='Pursuer1(2,bots,world)';
bots(2).v=3.0;
bots(2).c=0.4;
bots(2).x=1*world.Bounds*(rand(1)-0.5);
bots(2).y=1*world.Bounds*(rand(1)-0.5);
  bots(2).x=1*world.Bounds*(1-0.5);
  bots(2).y=1*world.Bounds*(-1-0.5);
a=2*pi*rand(1);
  a=2*pi*0.5;
bots(2).p=cos(a);
bots(2).q=sin(a);
bots(2).WP=[50 50; -50 50; -50 -50; 50 -50];
bots(2).wpc=[1 0 0 0];

bots(3)=bots(2);
bots(3).x=1*world.Bounds*(1-0.5);
bots(3).y=1*world.Bounds*(1-0.5);

bots(4)=bots(1);
bots(4).x=1*world.Bounds*(0.8-0.5);
bots(4).y=1*world.Bounds*(-0.5-0.5);

world=WorldUpdate(bots,world);
[bots,world]=Simulator(bots,world);
