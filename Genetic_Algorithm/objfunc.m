%c   The simple constrained optimization problem
%c=======================================================================
function  objfunc =objfunc(x,nx)
global fid_21 fid_37 fid_38 fid_39
global ifcall conobj
%
%c --- Fitness function : f(x)=f(x(1),x(2),...,x(nx))
%

ifcall=ifcall+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%objmin = 100.0*(x(1)*x(1)-x(2))^2+(1.0-x(1))^2;
%   if(abs(objmin) < 1.0e-10),
%   objmin=sign(objmin)*1.0e-10; 
%   end
%   objfunc = 1./objmin;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     objmin = in(1) + in(2)*x + in(3)*y + in(4)*x.^2 + in(5)*x.*y + in(6)*y.^2 + in(7)*x.^3 + in(8)*x.^2.*y + in(9)*x.*y.^2 + in(10)*y.^3 + in(11)*x.^4 + in(12)*x.^3.*y + in(13)*x.^2.*y.^2 + in(14)*x.*y.^3 + in(15)*y.^4;
     objfunc = - objmin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fid_21,' %5i  %13.5e %13.5e  \n',  ifcall, objfunc, objmin );

end
%c=======================================================================
