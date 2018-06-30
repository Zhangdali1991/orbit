function state=root2rv(obj,mu)
a=obj.a;
e=obj.e;
i=obj.i;
Omega=obj.Omega;
omega=obj.omega;
f=obj.f;
%% 
p=a2p(a,e);
h=p2h(p,mu);
r=f2r(p,e,f);
%% ���ĵ�������ϵ
x=r*cos(f);
y=r*sin(f);
z=0;
vx=-mu/h*sin(f);
vy=mu/h*(e+cos(f));
vz=0;
%% ת�ƾ���
transM=osculationroot_local2global(Omega,i,omega);
XA=transM*[x;y;z];
VA=transM*[vx;vy;vz];
%% ���Ĺ���ϵ
state=[XA;VA];
end
%% 