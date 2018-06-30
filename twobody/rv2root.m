function [a,e,i,omg,w,f,u]=rv2root(rvec,vvec,mu)
%% ���ܣ���λ�ã��ٶȼ��㾭��������
%% ���ã�[a,e,i,omg,w,f]=rv2root(rvec,vvec,mu);
%% e<1,e>1e-3
%% ���룺
%     rvec:λ��
%     vvec:�ٶ�
%       mu:����������������
%% �����
%   a,e,i,omg,w,f������������
%% ���ԣ�ͨ�����ϸ����
r=norm(rvec);
v=norm(vvec);
a=rv2a(r,v,mu);
hvec=cross(rvec,vvec);
h=norm(hvec);
p=h2p(h,mu);
e=ap2e(a,p);
i=acos(hvec(3)/h);%% ����û������
omg=atan2(hvec(1),-hvec(2));% sin(i)>0
nodeup=[cos(omg);sin(omg);0];
u=angvec(nodeup,rvec,hvec);
evec=cross(vvec,hvec)/mu-rvec/norm(rvec);
%  e=norm(evec);
%  a=h^2/(mu*(1-e^2));
%  i=acos(hvec(3)/h);
%  omg=atan2(hvec(1),-hvec(2));%%%
%  omg=fitinterval(omg,2*pi,0,2*pi);
if(e<1e-15)
    w=0;
else
w=atan2(evec(3),(sin(i)*(evec(2)*sin(omg)+evec(1)*cos(omg))));%%%
end
%  w=fitinterval(w,2*pi,0,2*pi);
%  u=fitinterval(atan2(rvec(3),(sin(i)*(rvec(2)*sin(omg)+rvec(1)*cos(omg)))),2*pi,0,2*pi);%%%
f=u-w;
%  f=fitinterval(f,2*pi,0,2*pi)*180/pi;
%  omg=omg*180/pi;
%  w=w*180/pi;
%  i=i*180/pi;
end