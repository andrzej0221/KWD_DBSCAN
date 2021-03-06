function [result, noise] = dbscan(SetOfPoints, eps, minPts) 

    cluster = 0;
    sizeOfCell = size(SetOfPoints,1);
    result = zeros(sizeOfCell,1);
  
    Dmatrix = pdist2(SetOfPoints,SetOfPoints);

    visited = false(sizeOfCell,1);
    noise = false(sizeOfCell,1);
 
    
    for index = 1 : sizeOfCell
        if visited(index) == false
            visited(index) = true;
            
            Neighbors = regionQuery(index, eps);
            if numel(Neighbors) < minPts
                noise(index) = true;
            else
                cluster = cluster + 1;
                ExpandCluster(index, Neighbors, cluster, eps, minPts)
            end  
        end
    end
    
    function ExpandCluster(index, Neighbors, cluster, eps, minPts)
        result(index) = cluster;
        temp = 1;
        
        while true
            neighbor = Neighbors(temp); 
            if visited(neighbor) == false
                visited(neighbor) = true;
                NeighborsSecond = regionQuery(neighbor, eps);
                if numel(NeighborsSecond) >= minPts
                   Neighbors = [Neighbors NeighborsSecond]; %#ok<AGROW>
                end
            end
            
            if result(neighbor) == 0
                result(neighbor) = cluster;
            end
            
            temp = temp + 1;
            if temp > numel(Neighbors)
                break;
            end
        end
    end

    function Neighbors = regionQuery(i, eps)
        Neighbors = find(Dmatrix(i,:)<=eps);
    end
end