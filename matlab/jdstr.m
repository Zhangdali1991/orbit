function str=jdstr(jd)
%% ��������ת��Ϊ ���� �ַ��� ISO-8601
[year,month,day]=JDToDate(jd);
str = sprintf('%d-%d-%d',year,month,day);
end