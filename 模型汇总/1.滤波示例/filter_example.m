x=[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,...
    2010,2011,2012,2013,2014,2015,2016,2017,2018,2019];
A=[0,0,1,2,0,0,0,8,1,1,3,5,7,0,3,0,3,2,1,9];
B=smoothdata(A);
plot(x,A,'g-');
hold on
plot(x,B,'b-');
legend('before denoising','after denoising');
xlabel('year');
ylabel('number of fires per year');
grid on
