function x=fitinterval(x0,step,minx,maxx)
%% ���ܣ��������Ǻ�����ֵ�任�����ʵ�����
  if(x0>=maxx)
      %disp('do');
      n=ceil((x0-maxx)/step);
      x=x0-n*step;
  elseif(x0<minx)
     % disp('do');
      n=ceil((minx-x0)/step);
      x=x0+n*step;
  else
      x=x0;
  end
end