function y=current_millisecond()
%% ��ȡ��ǰϵͳʱ�䣬������
t=datetime('now','TimeZone','Etc/GMT');
y=floor(posixtime(t)*1000);
end