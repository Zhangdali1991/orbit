function [alpha,sgm0,r0,E,M,e,f]=rv2_alpha_sgm_r02(r0vec,v0vec,mu)
%% ���ܣ����ݻ�����ʽ �� ��ض��� �� alpha=1/a,sgm,r0,n
%% ���ã�[alpha,sgm,r0,n]=rv2_alpha_sgm_r0(r0vec,v0vec,mu);
%% ���룺
% r0vec: ���Ĺ���ϵλ��
% v0vec: ���Ĺ���ϵ�ٶ�
% mu: ������������
%% ���:
% alpha: �볤��ĵ���
% sgm: r0vec*v0vec/sqrt(mu)
% r0: norm(r0vec)
% n: ƽ�����ٶ�
%% ����: ��ͨ��
% r0vec=[4330.155;6245.241;4387.607]*1000;
% v0vec=[-5670.051;1686.977;3524.511];
% mu=398600500000000;
% [a,s,r0,n]=rv2_alpha_sgm_r0(r0vec,v0vec,mu);
%%
r0=norm(r0vec);
alpha=2/r0-dot(v0vec,v0vec)/mu;
rr1=dot(r0vec,v0vec);
sgm0=rr1/sqrt(mu);
h=norm(cross(r0vec,v0vec));
p=h^2/mu;
e=sqrt(1-p*alpha);
ecosf=(p/r0-1);
esinf=rr1/h*(1+ecosf);
f=atan2(esinf,ecosf);
ecosE=(e^2+ecosf)/(1+ecosf);
esinE=sqrt(1-e^2)*esinf/(1+esinf);
E=atan2(esinE,ecosE);
E=fitinterval(E,2*pi,0,2*pi);
M=E-esinE;
% n=sqrt(mu*alpha^3);
end