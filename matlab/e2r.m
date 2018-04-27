function [rvec,vvec]=e2r(a,e,E,n)
%% ���� ��ƫ����Ǽ���λ�ú��ٶȣ����ĵ�������ϵ��
%% ���ã�rvec=e2r(a,e,E,n);
%% ���룺
%       a: �볤��
%       e: ƫ����
%       E: ƫ�����
%       n:ƽ�����ٶ�
%% �����
%       rvec:λ��ʸ�������ĵ�������ϵ��
%       vvec:�ٶ�ʸ�������ĵ�������ϵ��
b=a*sqrt(1-e^2);
x=a*cos(E)-a*e;
y=b*sin(E);%% ���ĵ�������ϵ
rvec=[x;y;0];
vvec=[-a*sin(E)*n/(1-e*cos(E));b*cos(E)*n/(1-e*cos(E));0];
end