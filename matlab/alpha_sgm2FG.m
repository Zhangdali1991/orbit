function [F,G]=alpha_sgm2FG(alpha,sgm0,r,dt,mu,err)
%% ���ܣ���alpha��sgm0��r,dt���� ��������ϵ��F��G
%% ���ã�[F,G]=alpha_sgm2FG(alpha,sgm0,r,dt,mu,err);
%% ���룺
%      alpha: �볤��ĵ���
%      sgm0: r0vec*v0vec/sqrt(mu)
%      r: norm(r0vec)
%      dt: ʱ����
%      mu: ������������
%      err:Ҫ������
%% �����
%     ��������ϵ�� F,G
%% ����:ͨ��
%% ���� ����忪���շ��� 
X=kepler_newton_solver(alpha,sgm0,r,dt,mu,err/10);
%% ���������������u
u=alphaX2u(alpha,X,err/10);
%% �������ʺ�����ֵ
U1=2*u/(1+alpha*u^2);
U2=2*u^2/(1+alpha*u^2);
%% ������������ϵ�� F,G
F=1-U2/r;
G=r*U1/sqrt(mu)+sgm0*U2/sqrt(mu);
end