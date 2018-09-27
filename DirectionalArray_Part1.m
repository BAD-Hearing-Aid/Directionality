clear all;

% step = 1/32000;           
% time_axis = (0:step:0.1-step)'; 
% f = 1000;
% wave = sin(2*pi*f*time_axis);
% figure(1);
% plot(time_axis,wave);
% xlabel("Time");
% ylabel("Amplitude");
% title("Sin wave");
% grid on;
% xlim([0 0.01]);
% ylim([-2 2]);

L = 0.5;
N = 5;
%d = L/N;
d = 0.2;
c = 330;
f = 1000;

factor = (2*pi*f)/c;

sigma_top = (N-1)/2;
sigma_bot = -sigma_top;
range = (sigma_bot:1:sigma_top);

phi = (0:1:180);
sum = zeros(1,length(phi));

for n = sigma_bot:sigma_top
    wave = exp(j * factor * n * d * cosd(phi));
    sum = sum + wave;
end

figure(2)
plot(abs(sum));
xlim([0 181])