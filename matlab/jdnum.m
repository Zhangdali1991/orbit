function num=jdnum(jd)
%% ���ܣ���������ת��Ϊ��ֵ ����matlab��ͼ
%% ���ã�jdnum(jd)
%% ����
%    jd: ������
%% ���
%   num ��ֵ
[year,month,day]=JDToDate(jd);
num=datanum(year,month,day);
end