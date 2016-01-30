clc;
clear;

iris = load('iris');
SetOfPoints = iris.data;

eps = 0.5;
minPts = 10;

result = dbscan(SetOfPoints, eps, minPts);

max = max(result);
Colors = hsv(max);

Legends = {};
for index = 0 : max
    Xi = SetOfPoints(result == index, :);
    if index ~= 0
        Style = '.';
        MarkerSize = 12;
        Color = Colors(index, :);
        Legends{end+1} = ['Klaster nr' num2str(index)];
    else 
        Style = 'x';
        MarkerSize = 6;
        Color = [0 0 0];
        if ~isempty(Xi)
            Legends{end+1} = 'Szum';
        end
    end
    if ~isempty(Xi)
        plot(Xi(:,1), Xi(:,2),Style,'MarkerSize',MarkerSize,'Color',Color);
    end
    hold on;
end
hold off;
axis equal;
grid on;
legend(Legends);
legend('Location', 'NorthEastOutside');
