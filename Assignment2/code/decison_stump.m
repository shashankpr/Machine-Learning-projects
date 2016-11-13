% decision stump ??
% ????X?y, u) (re-weighted error : u)?(X,y) data set (supervised)
% u(i)??X(i)???????bootstrap??????????????
% ??(feature i, threshold theta, direction s, error, label[n]): 
% label[n]????????????????????1??????0
% ??Hypothesis h = s * sign(X(i) - theta)
% s?direction?s = +1??xi>theta??????+1?s = -1 ??xi<theta??+1
% i???????decision stump???????????????????????
% theta??????
% ????????????????????????h????
% ????????? feature_i?direction s?threshold theta???????
% ??????error < 0.5 (?????????weak classifier)??
%=========================================================================%
function [feature_i, theta, s , error, label] = decison_stump(X, y, u)
while(1)
    if(rand()>0.5) feature_i = 1;else feature_i = 2; end;                                   %????feature i
    if(rand()>0.5) s = 1;else s = -1; end;                                                  %????direction s
    theta = ( max(X(:,feature_i)) - min(X(:,feature_i)) ) * rand() + min(X(:,feature_i));   %????direction s
    
    error = 0;
    
    for n = 1 : length(X(:,feature_i));
        if(s == 1)                                                                          % ???1????0
            label(n) = 1 - ( (X(n,feature_i) >= theta) == y(n) );                           %??????1??????0
            error = error + u(n) * label(n);
        else
            label(n) = 1 - ( (X(n,feature_i) <= theta) == y(n) );
            error = error + u(n) * label(n) ;
        end;
         
    end;
    
    if( error < 0.5 ) 
        break;
    end;
    
end