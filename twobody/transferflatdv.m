function vvec1=transferflatdv(vvec0,rvec0,beta)
%% �ı�����ı��
%   ;Theta ���㵽�����ٶ���ǣ���Զ�����Ϊ��
%   ;beta  �����ת��
% ���ٶ���rvec0 ת��beta��
% v0=norm(vvec0);
% vvec1=vvec0*(v0+dv)/v0;%%����һ��ϵ������
Q=quater_axis(rvec0,beta);%%ת����Ԫ��
vvec1=Rotate_Q(vvec0, Q);
end