function trm=transm_X(alpha)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm(alpha,beta,gamma);
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������X��ת�� alpha�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[1,0,0;0,cos(alpha),sin(alpha);0,-sin(alpha),cos(alpha);];
end