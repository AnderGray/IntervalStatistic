%%%%
%  This is a script for estimating descriptive statistics from interval
%  data sets, as outlined by S. Ferson (2007)
%%%%


% Skinny Data
skinny = [1.00,1.51; 2.68, 2.98; 7.52, 7.67; 7.52, 8.35; 9.44, 9.99; 3.66, 4.58];
[skinMean, skinVar] = IntervalStatistics(skinny);

% Puffy Data
puffy = [3.5, 6.4; 6.9, 8.8; 6.1, 8.4; 2.8 ,6.7; 3.5, 9.7; 6.5, 9.9; 0.15, 3.8; 4.5, 4.9; 7.1, 7.9];

[pufMean, pufVar] = IntervalStatistics(puffy);


figure(1)
ecdf(skinny(:,1 ))
hold on
ecdf(skinny(:,2))
%rectangle('Position',[skinMean(1),0,skinMean(2)-skinMean(1),1])
range = skinMean(1)-2*sqrt(skinVar(2)):0.01:skinMean(2)+2*sqrt(skinVar(2));

cdfupper = zeros(numel(range),1);
cdflower = zeros(numel(range),1);

for i=1:numel(range)
   upperVal1 = normcdf(range(i),skinMean(1),sqrt(skinVar(1)));
   upperVal2 = normcdf(range(i),skinMean(1),sqrt(skinVar(2)));
   cdfupper(i) = max(upperVal1,upperVal2);
   
   lowerVal1 = normcdf(range(i),skinMean(2),sqrt(skinVar(1)));
   lowerVal2 = normcdf(range(i),skinMean(2),sqrt(skinVar(2)));
   cdflower(i) = min(lowerVal1,lowerVal2);
end

plot(range,cdflower);
plot(range,cdfupper);


hold off

figure(2)
ecdf(puffy(:,1))
hold on
ecdf(puffy(:,2))
%rectangle('Position',[pufMean(1),0,pufMean(2)-pufMean(1),1])
range = pufMean(1)-4*sqrt(pufVar(2)):0.01:pufMean(2)+4*sqrt(pufVar(2));

cdfupper = zeros(numel(range),1);
cdflower = zeros(numel(range),1);

for i=1:numel(range)
   upperVal1 = normcdf(range(i),pufMean(1),sqrt(pufVar(1)));
   upperVal2 = normcdf(range(i),pufMean(1),sqrt(pufVar(2)));
   cdfupper(i) = max(upperVal1,upperVal2);
   
   lowerVal1 = normcdf(range(i),pufMean(2),sqrt(pufVar(1)));
   lowerVal2 = normcdf(range(i),pufMean(2),sqrt(pufVar(2)));
   cdflower(i) = min(lowerVal1,lowerVal2);
end


plot(range,cdflower);
plot(range,cdfupper);
hold off





