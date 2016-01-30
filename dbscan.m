function [result, noise] = dbscan(SetOfPoints, eps, minPts) 

    claster = 0;
    sizeOfCell = size(SetOfPoints,1);
    result = zeros(sizeOfCell,1);
  
    Dmatrix = pdist2(SetOfPoints,SetOfPoints);

    visited = false(sizeOfCell,1);
    noise = false(sizeOfCell,1);
    
% DBSCAN(D, eps, MinPts) {
%    C = 0
%    for each point P in dataset D {
%       if P is visited
%          continue next point
%       mark P as visited
%       NeighborPts = regionQuery(P, eps)
%       if sizeof(NeighborPts) < MinPts
%          mark P as NOISE
%       else {
%          C = next cluster
%          expandCluster(P, NeighborPts, C, eps, MinPts)
%       }
%    }
% }
% 
% expandCluster(P, NeighborPts, C, eps, MinPts) {
%    add P to cluster C
%    for each point P' in NeighborPts { 
%       if P' is not visited {
%          mark P' as visited
%          NeighborPts' = regionQuery(P', eps)
%          if sizeof(NeighborPts') >= MinPts
%             NeighborPts = NeighborPts joined with NeighborPts'
%       }
%       if P' is not yet member of any cluster
%          add P' to cluster C
%    }
% }
% 
% regionQuery(P, eps)
%    return all points within P's eps-neighborhood (including P)
    
    
    for index = 1 : sizeOfCell
        if visited(index) == false
            visited(index) = true;
            
            Neighbors = regionQuery(index);
            if numel(Neighbors) < minPts
                noise(index) = true;
            else
                %przeszukać claster
            end
            
        end
    end
    
    function Neighbors = regionQuery(i)
        Neighbors=find(Dmatrix(i,:)<=epsilon);
    end
end