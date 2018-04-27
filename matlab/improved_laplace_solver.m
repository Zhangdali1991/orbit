function [rvec,vvec,t]=improved_laplace_solver(B,H,we,ae,ee,mu,data_m,choose,eps)
%% ���ܣ� �Ľ�������˹�������ǵ�λ�ú��ٶ�
%% ���ã� [rvec,vvec,t]=improved_laplace_solver(B,H,we,ae,ee,mu,data_m,choose,err)��
%% ���룺
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
%     choose�� ѡ��ʱ����data_m������ (1<choose<n)
%% ���:
%           rvec:ѡ��ʱ�̵�λ��
%           vvec:ѡ��ʱ�̵��ٶ�
%           t:ѡ��ʱ��
%% ����: ͨ��  �������� ���ڲ�ͬ��ѡ���� alpha �����ȶ�
%% ������˹�����ֵ
%w=0.1;
[rvec0,vvec0,t]=laplace_solver(B,H,we,ae,ee,mu,data_m(choose-1:choose+1,:));
X0=[rvec0;vvec0];
n=size(data_m,1);%data_m ����
%% ���㷽�����ҺͲ�վ���ꡢFG ��ֵ
Rs=zeros(3,n);
RHOs=zeros(3,n);
B1s=zeros(n,1);
B2s=zeros(n,1);
% disp(1/alpha0-a);
%% ������վ���꣬�������ң�F,G�ĳ�ֵ
for i=1:n
    Rs(:,i)=BHs2R(B,H,data_m(i,2),ae,ee);
    RHOs(:,i)=alpha_delta2directional_cosine(data_m(i,4),data_m(i,3));%��������
    B1s(i,:)=RHOs(2,i)*Rs(1,i)-RHOs(1,i)*Rs(2,i);
    B2s(i,:)=RHOs(3,i)*Rs(2,i)-RHOs(2,i)*Rs(3,i);
end
Bs=[B1s;B2s];
DTs=data_m(:,1)-t;
X1=improved_laplace_repeat(n,X0,RHOs,Bs,DTs,1);
X1=0.5*X1+0.5*X0;
%% �ж����ս��������
maxstep=10000;
for k=1:maxstep
  %   disp(norm(X1-X0));
  %   disp(norm(X1));
    if(norm(X1-X0)<eps)
        rvec=X1(1:3,:);
        vvec=X1(4:6,:);
        break;
    else
        X0=X1;
        X1=improved_laplace_repeat(n,X0,RHOs,Bs,DTs,0);
        X1=X1*0.5+0.5*X0;
%         disp(X0);
%         disp(X1);
%          fprintf('ang %5.10f\n',acos(dot(X0,X1)/(norm(X0)*norm(X1)))*180/pi);
% %          X1=X1-2*(X1-X0);
%          disp(X1-X0);
    end
end
if(norm(X1-X0)>eps)
%% ������ʾ
     error('imporved_laplace_solver:exceed_max_loop',...
       'Error:exceed_max_loop: \n The solver try its best but can not find required answer.\n Required err<=%s \n at the last loop err=%s , you may should try a bigger one.',eps,norm(X1-X0));
end
end
