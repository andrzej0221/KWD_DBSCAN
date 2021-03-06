clc;
clear;

%data=load('example');
%SetOfPoints = data.data;

data = load('localization');
SetOfPoints = data.localization;

%eps = 20;
%minPts = 80;
eps = 0.1;
minPts = 25;

result = dbscan(SetOfPoints, eps, minPts);

max = max(result);
Colors = hsv(max);

Keys = {};
for index = 0 : max
    Xi = SetOfPoints(result == index, :);
    if index ~= 0
        Style = '.';
        MarkerSize = 12;
        Color = Colors(index, :);
        Keys{end+1} = ['Klaster nr' num2str(index)];
    else 
        Style = '.';
        MarkerSize = 6;
        Color = [0 0 0];
        if  isempty(Xi) == false
            Keys{end+1} = 'Szum';
        end
    end
    if  isempty(Xi) == false
        plot(Xi(:,2), Xi(:,1),Style,'MarkerSize',MarkerSize,'Color',Color);
    end
    hold on;
end
hold off;
axis equal;
grid on;
legend(Keys);
legend('Location', 'NorthEastOutside');
