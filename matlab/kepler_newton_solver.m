function X=kepler_newton_solver(alpha,sgm0,r0,dt,mu,err)
%% ���ܣ� ţ�ٵ��� ����忪���շ���
%% ���ã�X=kepler_newton_solver(alpha,sgm0,r0,dt,mu,err);
%% ���룺
%      alpha: �볤��ĵ���
%      sgm0: r0vec*v0vec/sqrt(mu)
%      r: norm(r0vec)
%      dt: ʱ����
%      mu: ������������
%      err:Ҫ������
%% �����
%       X�����ʱ���
%% ���ԣ�ͨ��
%% ע�⣺�����˿��ܲ������ļ��� alphaX2u
X0=sqrt(mu)*dt/r0;%ѡȡ��ֵ
u=alphaX2u(alpha,X0,err/10);
U0=(1-alpha*u)/(1+alpha*u^2);
U1=2*u/(1+alpha*u^2);
U2=2*u^2/(1+alpha*u^2);
U3=(X0-U1)/alpha;
X1=X0-(r0*U1+sgm0*U2+U3-sqrt(mu)*dt)/(r0*U0+sgm0*U1+U2);
for i=1:100
    if(abs(X1-X0)<err)
        break;
    else
        X0=X1;
        u=alphaX2u(alpha,X0,err/10);
        U0=(1-alpha*u)/(1+alpha*u^2);
        U1=2*u/(1+alpha*u^2);
        U2=2*u^2/(1+alpha*u^2);
        U3=(X0-U1)/alpha;
        X1=X0-(r0*U1+sgm0*U2+U3-sqrt(mu)*dt)/(r0*U0+sgm0*U1+U2);
    end
end
X=X1;
end