function dcvec=alpha_delta2directional_cosine(alpha,delta)
%% ���ܣ� �ɳྭ,��γ��������
%% ���ã� dcvec=alpha_delta2directional_cosine(alpha,delta);
%% ���룺
%       alpha:�ྭ
%       delta:��γ
%% �����
%       dcvec=[x;y;z] ������������
%% ���ԣ���ͨ��
%         ����: norm(alpha_delta2directional_cosine(pi/3,pi/4));
%         ���: 1
%%
dcvec=[cos(delta)*cos(alpha);cos(delta)*sin(alpha);sin(delta)];
end