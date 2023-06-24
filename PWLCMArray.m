function xn= PWLCMArray(numberOFIteraions,controlParameter,initialCondition)
% y = zeros(numberOFIteraions);
xn(1) = initialCondition;
for i = 2:1:numberOFIteraions
%         if i == 1
%         xn = initialCondition;
%         end
    if ((xn(i-1) >= 0) && (xn(i-1) < 0.5))
        xn(i) = F(xn(i-1),controlParameter);
    else if xn(i-1) >= 0.5 && xn(i-1) <= 1
             xn(i) = F((1-xn(i-1)),controlParameter);
        end
    end
end
% y = xn(numberOFIteraions);
end

            
%     if i == 1
%         x = initialCondition;
%     end
% %     if x >= 0 && x < controlParameter
% %         xn = x/controlParameter;
% %     else if x >= controlParameter && x < 0.5
% %             xn = (x - controlParameter)/(0.5 - controlParameter);
%         else if x >= 0.5 && x < 1
%                 xn = PWLCM((i-1),controlParameter,(1-x));
%             end
%             
%         end
%     end
%     x = xn;
% end


function xn = F(x,controlParameter)
 if x >= 0 && x < controlParameter
        xn = x/controlParameter;
    else if x >= controlParameter && x < 0.5
            xn = (x - controlParameter)/(0.5 - controlParameter);
        end
 end
end
