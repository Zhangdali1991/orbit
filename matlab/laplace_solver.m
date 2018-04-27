function [rvec,vvec,t]=laplace_solver(B,H,we,ae,ee,mu,data_m)
%% ���ܣ� ������˹�������ǵ�λ�ú��ٶ�
%% ���ã�[rvec,vvec,t]=laplace_solver(B,H,we,ae,ee,mu,data_m);
%% ����:
%     B����վ�Ĵ��γ��
%     H����վ�߳�
%     we:������ת���ٶ�
%     ae������볤��
%     ee:ƫ����
%     mu:������������
%     data_m(������3��)��    ��һ�� ʱ��
%                           �ڶ��� ���غ���ʱ
%                           ������ ��γ
%                           ������ �ྭ
%% �����
%        rvec:���ǵ�λ��
%        vvec:���ǵ��ٶ�
%% ���ԣ�ͨ�� 
%% ʱ���� pass
t1=data_m(1,1)-data_m(2,1);
t3=data_m(3,1)-data_m(2,1);
%% �������� pass
rou10vec=alpha_delta2directional_cosine(data_m(1,4),data_m(1,3));
rou20vec=alpha_delta2directional_cosine(data_m(2,4),data_m(2,3));
rou30vec=alpha_delta2directional_cosine(data_m(3,4),data_m(3,3));
%  disp(rou10vec);
%  disp(rou20vec);
%  disp(rou30vec);
%% R2 ������1,2�׵��� pass
R2vec=BHs2R(B,H,data_m(2,2),ae,ee);
% disp(R2vec/ae);
wevec=[0;0;we];
R2vec_d1=cross(wevec,R2vec);
R2vec_d2=cross(wevec,R2vec_d1);
%  disp(R2vec);
% disp(norm(R2vec)/ae);
% disp(R2vec_d1);
% disp(R2vec_d2);
%% rou20vec ��1,2�׵����Ĺ���ֵ pass
rou20vec_d1=t3*rou10vec/(t1*(t3-t1))-(t1+t3)*rou20vec/(t1*t3)-t1*rou30vec/(t3*(t3-t1));
rou20vec_d2=-2*rou10vec/(t1*(t3-t1))+2*rou20vec/(t1*t3)+2*rou30vec/(t3*(t3-t1));
% disp(rou20vec_d1);
% disp(rou20vec_d2);
%% ���� pass
tmp1=cross(rou20vec,rou20vec_d1);
tmp2=cross(rou20vec,rou20vec_d2);
L=dot(tmp1,rou20vec_d2);
F1=dot(tmp1,R2vec_d2);
G1=dot(tmp1,R2vec);
F2=dot(tmp2,R2vec_d2);
G2=dot(tmp2,R2vec);
% disp(L);
% disp(F1);
% disp(G1);
% disp(F2);
% disp(G2);
%% ����r2�ķ��� r2^8+A1*r2^6+B1*r2^3+C1=0;
tmp3=dot(rou20vec,R2vec);
R2=norm(R2vec);
A1=-(R2^2+(F1/L)^2-2*(F1/L)*tmp3);
B1=-2*(mu*G1/L)*(F1/L-tmp3);
C1=-(mu*G1/L)^2;
f = @(r2) r2^8+A1*r2^6+B1*r2^3+C1;
r2=fzero(f,ae);
%r21=newton_solver(f,f1,ae);
% disp(r2/ae);
% disp(r21);
% disp(f(r2));
%% rou2 rou2_d1
rou2=-(F1+mu*G1/r2^3)/L;
rou2_d1=(F2+mu*G2/r2^3)/(2*L);
rvec=rou2*rou20vec+R2vec;
vvec=rou2_d1*rou20vec+rou2*rou20vec_d1+R2vec_d1;
t=data_m(2,1);
end