function vvec1=transferdv(vvec0,dv)
%% ƽ�б��
v0=norm(vvec0);
vvec1=vvec0*(v0+dv)/v0;%%����һ��ϵ������
end