function trm=transm_Z(gamma)
%% ���ܣ�����ZYX����ת������
%% ���ã�trm=transm_Z(gamma)
%         subject to XA=trm*XB;
%         ������ Bϵ�ֱ�������Z��ת�� gamma�ǵõ��� Aϵ
%         ��ͬһʸ��x,��A,B�µ��������㣺XA=trm*XB;
%%
trm=[cos(gamma),sin(gamma),0;-sin(gamma),cos(gamma),0;0,0,1;];
end