function [a,e,i,omg,w,f]=rv2root2(rvec,vvec,mu)
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
 hvec=cross(rvec,vvec);
 h=norm(hvec);
 evec=cross(vvec,hvec)/mu-rvec/norm(rvec);
 e=norm(evec);
 a=h^2/(mu*(1-e^2));
 i=acos(hvec(3)/h);
 omg=atan2(hvec(1),-hvec(2));%%%
 omg=fitinterval(omg,2*pi,0,2*pi);
 w=atan2(evec(3),(sin(i)*(evec(2)*sin(omg)+evec(1)*cos(omg))));%%%
 w=fitinterval(w,2*pi,0,2*pi);
 u=fitinterval(atan2(rvec(3),(sin(i)*(rvec(2)*sin(omg)+rvec(1)*cos(omg)))),2*pi,0,2*pi);%%%
 f=u-w;
%  f=fitinterval(f,2*pi,0,2*pi)*180/pi;
%  omg=omg*180/pi;
%  w=w*180/pi;
%  i=i*180/pi;
end