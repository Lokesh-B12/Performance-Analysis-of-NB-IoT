plot(UEs,throughput7(16,:),'d');
hold on;
plot(UEs,throughput7(1,:),'r');
hold on;
plot(UEs,throughput7(19,:),'o');
hold on;
plot(UEs,throughput7(4,:),'b');
hold on;
plot(UEs,throughput7(22,:),'x');
hold on;
plot(UEs,throughput7(7,:),'m');
hold on;
plot(UEs,throughput7(25,:),'s');
hold on;
plot(UEs,throughput7(10,:),'k');
hold on;
plot(UEs,throughput7(28,:),'*');
hold on;
plot(UEs,throughput7(13,:),'g');
xlabel('N');
ylabel('throughput(packets/slot)');
legend({'sim inter-arrival time = 120min','ana inter-arrival time = 120min','sim inter-arrival time = 60min','ana inter-arrival time = 60min','sim inter-arrival time = 30min','ana inter-arrival time = 30min','sim inter-arrival time = 12min','ana inter-arrival time = 12min','sim inter-arrival time = 5min','ana inter-arrival time = 5min'},'Location','northwest');
%{
xlabel('N');
ylabel('throughput(packets/slot)');
legend({'sim inter-arrival time = 3min','ana inter-arrival time =
3min'},'Location','northwest');
%}
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
