start_point=1;
end_point=604;
f=polyfit(X(start_point:end_point),Y(start_point:end_point),1);
yfit=polyval(f,X);
Y_sub=Y-yfit;

plot(Y)
hold on; plot(yfit);hold off;

figure
plot(Y_sub);grid on;
%mean(Y_sub(1:))-mean(Y_sub(start_point:end_point))