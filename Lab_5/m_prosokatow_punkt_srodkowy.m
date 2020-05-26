close all;
clear;
clc;
format long;

P = [];
eps = 10^-6; % Dokladnosc obliczen
n_max = 100000; % Maksymalna ilosc podzialu na figury

for n = 1:n_max
    sum = 0;
    mid = 0;
    xp = 2; % Poczatek przedzialu
    xk = 5; % Koniec przedzialu
    dx = (xk-xp)/n;
    x = [];
   
    for i=1:n
        x(i) = xp+i*dx;
        if i==1
            mid = (xp+x(i))/2;
        else
            mid = (x(i-1)+x(i))/2;
        end
        sum = sum+dx*f(mid);
    end
    P(n) = sum;  
    
    if n == 1
        continue;
    elseif abs(P(n-1)-P(n))<eps
        fprintf('Dla n = %d wartosc calki wynosi: %.9f\n',n,sum);
        break;
    end
end

function y = f(x)
    y = (x^2)+3; % Funkcja
end