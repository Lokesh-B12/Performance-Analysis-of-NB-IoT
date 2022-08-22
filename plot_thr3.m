UEs = 900:30:48000;
plot(UEs,throughput(1,:),'r');
hold on;
plot(UEs,throughput(2,:),'b');
hold on;
plot(UEs,throughput(3,:),'k');
hold on;

UEs = [900,3000,6000,9000,12000,15000,18000,21000,24000,27000,30000,33000,36000,39000,42000,45000,48000];
plot(UEs,throughput(4,1:17),'rd');
hold on;
plot(UEs,throughput(5,1:17),'bo');
hold on;
plot(UEs,throughput(6,1:17),'k^');

%hold on;
xlabel('N');
ylabel('throughput(packets/slot)');
%ylim([0,11])
legend({'CE level 0 ana 1/\lambda = 5min','CE level 1 ana 1/\lambda = 5min','CE level 2 ana 1/\lambda = 5min','CE level 0 sim 1/\lambda = 5min','CE level 1 sim 1/\lambda = 5min','CE level 2 sim 1/\lambda = 5min'},'Location','northwest');
%{
xlabel('N');
ylabel('throughput_111_101010(packets/slot)');
legend({'sim inter-arrival time = 3min','ana inter-arrival time =
3min'},'Location','northwest');
%}
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
