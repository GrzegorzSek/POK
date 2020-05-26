close all;
clear;
clc;
format long;

Pn = [];
eps = 10^-6; % Dokladnosc obliczen
n_max = 100000; % Maksymalna ilosc podzialu na figury

for n = 1:100000
    sum = 0;
    xp = 2; % Poczatek przedzialu
    xk = 5; % Koniec przedzialu
    dx = (xk-xp)/n;
    x = [];
    P = [];
   
    for i=1:n
        x(i) = xp+i*dx;
        if i==1
            P(i) = ((f(xp)+f(x(i)))/2)*dx; 
        else
            P(i) = ((f(x(i-1))+f(x(i)))/2)*dx; 
        end
        sum = sum+P(i);
    end
    
    Pn(n) = sum;  
    
    if n == 1
        continue;
    elseif abs(Pn(n-1)-Pn(n))<eps
        fprintf('Dla n = %d wartosc calki wynosi: %.9f\n',n,sum);
        break;
    end
end

function y = f(x)
    y = (x^2)+3; % Funkcja
end