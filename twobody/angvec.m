function ang=angvec(v1,v2,n)
%% n��������
%% ��v1ת����v2�ĽǶ�
v1=v1/norm(v1);
v2=v2/norm(v2);
cosf=dot(v1,v2);
ang=acos(cosf);
n1=cross(v1,v2);
if(dot(n1,n)<0)
    ang=2*pi-ang;
end
end