function Q=quater_axis(axis,ang)
%% �������ᣨ���֣�ת��4Ԫ��
half=ang/2;
shalf=sin(half);
axis=axis/norm(axis);
Q=[cos(half);shalf*axis];
end