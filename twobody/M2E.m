function E=M2E(M,e)
%% ���ܣ������Բ�����շ���
%% ���ã�E=kepler_solver_ellipse(M,e); subject to: M>0 and 0<=e<1
%% ���룺
%     M:ƽ�����
%     e:ƫ���� [0,1)
%% �����
%       E:ƫ�����
%% ���ԣ�pass
%       E=kepler_solver_ellipse(pi/2,0.2);
%       E-0.2*sin(E)-pi/2;
err=1e-13;
E0=M;
E=E0-(E0-e*sin(E0)-M)/(1-e*cos(E0));
for i=1:100
    if(abs(E-E0)<err)
        break;
    else
        E0=E;
        E=E0-(E0-e*sin(E0)-M)/(1-e*cos(E0));
    end
end
end