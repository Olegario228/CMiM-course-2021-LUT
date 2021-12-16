Y = [4.4 2 11 21.5 7.5];
y_2p5 = linear_interpolation(Y, 2.5);
y_3p1 = linear_interpolation(Y, 3.1);
y = [y_2p5 y_3p1];

plot(t, Y, '--ob')
xlim([-1, 5])
ylim([0, 23])
hold on
plot(3.1, y_3p1, '--or');
hold on
plot(2.5, y_2p5, '--or');
saveas(gcf, 'interpolation.png');