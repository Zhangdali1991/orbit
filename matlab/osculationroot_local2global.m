function transm=osculationroot_local2global(omg,i,w1)
%% ���ܣ������й��Ҫ���� ���ĵ�������ϵ �� ��������ϵ ��ת������
%% ���ã�transm=osculationroot_local2global(omg,i,w1);
%% ���룺
%       omg:������ƾ�
%         i:������
%        w1: ��omg+w ���ĵ�ƾ�
%% �����
%    transm:ת������ �� global_coordinate=local_coordinate*transmatrix;
%    �� ͬһʸ���ڽ��ĵ�������ϵ �еı�ʾ xB�����ڹ�������ϵ�еı�ʾxA ����
%       xA=transm*xB;
%% ���ԣ� ����� 
w=w1-omg;
transm=transm_Z(-omg)*transm_X(-i)*transm_Z(-w);
end
