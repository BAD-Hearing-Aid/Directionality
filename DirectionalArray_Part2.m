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
N = 10;
%d = L/N;
d = 0.1;
c = 330;
f = 1000;

factor = (2*pi*f)/c;

sigma_top = (N-1)/2;
sigma_bot = -sigma_top;
range = (sigma_bot:1:sigma_top);

phi = (0:1:180);
sum = zeros(1,length(phi));

r = 1;
d_0 = sqrt((r^2) + (0*d)^2);
for n = sigma_bot:sigma_top
    d_n = sqrt((r^2) + 2*r*n*d*cosd(phi) + (n*d)^2);
    wave = (d_0./d_n) .* exp(j * factor * (d_n - d_0));
    sum = sum + wave;
end

sum_far = zeros(1,length(phi));

for n = sigma_bot:sigma_top
    wave_far = exp(j * factor * n * d * cosd(phi));
    sum_far = sum_far + wave_far;
end


figure(2)
hold on;
plot(abs(sum));
plot(abs(sum_far));
xlim([0 181])