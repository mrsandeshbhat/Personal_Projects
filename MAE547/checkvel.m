for  i = 1:7
    for j = 1:25
        diff(j,i) = trajectory(j+1,i) - trajectory(j,i);
        diff(j,i) = abs(diff(j,i));
    end
end

velM = [max(diff(:,1)) max(diff(:,2)) max(diff(:,3)) max(diff(:,4)) max(diff(:,5)) max(diff(:,6)) max(diff(:,7)) ];

velm = [min(diff(:,1)) min(diff(:,2)) min(diff(:,3)) min(diff(:,4)) min(diff(:,5)) min(diff(:,6)) min(diff(:,7)) ];