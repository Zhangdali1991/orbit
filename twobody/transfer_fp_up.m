function dv=transfer_fp_up(v0,p0,f0,f1,mu)
%%    ����Զ�ص�
%   ;v0 ���ص��ٶ�
%   ;p0 ���ص����
%   ;f0 Զ�ص����
%   ;f1 �����Զ�ص����
%   ;mu ������������
a20=p0+f0;
a21=p0+f1;
eg0=a2energy(a20/2,mu);
eg1=a2energy(a21/2,mu);
denergy=eg1-eg0;%���ܸı�
v1=sqrt(v0^2+2*denergy);
dv=v1-v0;
end