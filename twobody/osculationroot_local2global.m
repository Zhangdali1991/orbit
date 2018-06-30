function transm=osculationroot_local2global(omg,i,w)
%% ���ܣ������й��Ҫ���� ���ĵ�������ϵ �� ��������ϵ ��ת������
%% ���ã�transm=osculationroot_local2global(omg,i,w1);
%% ���룺
%       omg:������ྭ
%         i:������
%        w: ��w ���ĵ�Ǿ�
%% �����
%    transm:ת������ �� global_coordinate=local_coordinate*transmatrix;
%    �� ͬһʸ���ڽ��ĵ�������ϵ �еı�ʾ xB�����ڹ�������ϵ�еı�ʾxA ����
%       xA=transm*xB;
%% ���ԣ� ����� 
transm=transm_Z(-omg)*transm_X(-i)*transm_Z(-w);
end

function trm=transm_Z(gamma)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm_Z(gamma)
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������Z��ת�� gamma�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[cos(gamma),sin(gamma),0;-sin(gamma),cos(gamma),0;0,0,1;];
end

function trm=transm_Y(beta)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm_Y(beta)��
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������Y��ת�� beta�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta);];
end

function trm=transm_X(alpha)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm(alpha,beta,gamma);
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������X��ת�� alpha�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[1,0,0;0,cos(alpha),sin(alpha);0,-sin(alpha),cos(alpha);];
end