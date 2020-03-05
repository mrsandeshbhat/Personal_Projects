cfilename = 'D:\tethered_exo_system\9_16\sandesh\tethered_exo_9_1601_wo_exo.csv';

global x y z;

r1 = 89848; % woexo
r2 = 98811;

m = 6;
cang = csvread(cfilename,r1-1,m-1,[r1-1,m-1,r2-1,m-1]);
m = 2*26+14;
kang = csvread(cfilename,r1-1,m-1,[r1-1,m-1,r2-1,m-1]);

s1 = 8268;
s2 = 8368;
s3 = 8470;
s4 = 8573;

R_dat1c = [[[0:100/(s2-s1):100]'] cang(s1:s2) kang(s1:s2)/1000];
R_dat2c = [[[0:100/(s3-s2):100]'] cang(s2:s3) kang(s2:s3)/1000];
R_dat3c = [[[0:100/(s4-s3):100]'] cang(s3:s4) kang(s3:s4)/1000];

R_dat1c = R_dat1c - R_dat1c(1,:);
R_dat2c = R_dat2c - R_dat2c(1,:);
R_dat3c = R_dat3c - R_dat3c(1,:);

x = R_dat1c(:,1);
y = R_dat1c(:,3);
z = R_dat1c(:,2);

% %% Plot
% hold on;grid on
% zlabel('Ankle Angle in Degrees');
% ylabel('Knee Angle in Degrees');
% xlabel('Gait Percentage');
% plot3([R_dat1c(:,1)],[R_dat1c(:,3)],[R_dat1c(:,2)],'k-');
% % 
% % plot([R_dat2c(:,1)],[R_dat2c(:,2)],'k--');
% % plot([R_dat3c(:,1)],[R_dat3c(:,2)],'k-.');
