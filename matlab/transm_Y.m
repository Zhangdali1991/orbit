function trm=transm_Y(beta)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm_Y(beta)��
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������Y��ת�� beta�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta);];
end