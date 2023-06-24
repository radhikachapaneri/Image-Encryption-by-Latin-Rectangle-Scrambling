% This function implements PWLCM
% PWLCM is 1D piecewise linear chaotic map

% Input to the function is :
% n - number of values in a PWLCM generated chaotic sequence
% p - control parameter of PWLCM. The value of p(control parameter) lies
%     between 0 and 0.5
% initialCondition - initial condition of PWLCM. The value of initial
%                    condition lies between 0 and 1.

% The PWLCM gives a sequence of xn ( value between 0 and 1) chaotic values
% which depends on p and the intial condtion where n is numberofIterations
%  PWLCM is very sensitive to control parameter and intial condition. Even a
% small change in these parameter produce totally different chaotic
% sequence.

% The output of the function is 
% y - this is the final value(last value) of xn sequence.

function y = PWLCM(n,p,initialCondition)
xn = zeros(n);
xn(1) = initialCondition;
for i = 2:1:n
% Formula for PWLCM
    if ((xn(i-1) >= 0) && (xn(i-1) < 0.5))
        xn(i) = F(xn(i-1),p);
    else if xn(i-1) >= 0.5 && xn(i-1) <= 1
             xn(i) = F((1-xn(i-1)),p);
        end
    end
end
y = xn(n);
end


function xn = F(x,p)
 if x >= 0 && x < p
        xn = x/p;
    else if x >= p && x < 0.5
            xn = (x - p)/(0.5 - p);
        end
 end
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
