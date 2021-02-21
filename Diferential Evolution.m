%% Estudiante
%Omar Baruch Moron Lopez 213605572
%% Algoritmo
clear;
close;
clc;
%% SELECCIONA UNA FUNCION
%%f=@(x,y)((x.^2./4000)+(y.^2./4000))-((cos(x./sqrt(1))).*cos(y./sqrt(2)))+1;
%%f=@(x,y)(20+((x.^2-10.*cos(2*pi.*x))+(y.^2-10.*cos(2*pi.*y))));
f=@(x,y)(x.^2+y.^2);
%%
%Límite inferior
xl=[deg2rad(-160); deg2rad(-150); deg2rad(-135)];
%Límite superior
xu=[deg2rad(160); deg2rad(150); deg2rad(135)];
G=500;

N=50;
D=3;

F=0.6;
CR=0.9;

x=zeros(D,N);
counter=0;
for i=1:N
    x(:,i)=xl+(xu-xl).*rand(D,1);
end
%%
for g=1:G%%while counter~=G
    for i=1:N
        r=randi(N,2);
        r=r(1:end-1);
        r1=r(1);
        r2=r(2);
        r3=r(3);
        if i~=r1 && i~=r2 && i~=r3
            continue;
        else
            r=randi(N,2);
            r=r(1:end-1);
            r1=r(1);
            r2=r(2);
            r3=r(3);
        end
        v=x(:,r1)+F*(x(:,r2)-x(:,r3));
        u=zeros(1,D);
        for j=1:D
            ra=rand;
            if ra<=CR
                u(j)=v(j);
            else
                u(j)=x(j,i);
            end
        end
        if f(u(1),u(2))<f(x(1),x(2))
            x(:,i)=u;
        end
    end
    fitness=zeros(1,N);
    for k=1:N
        fitness(i)=f(x(1,i),x(2,i));
    end
    [~,ind]=max(fitness(:)); 
%%    
    cla;
    [X,Y]=meshgrid(-15:.5:15);
    Z=f(X,Y);
    surf(X,Y,Z);
    hold on;
    for l=1:N
        plot3(x(1,l),x(2,l),f(x(1,l),x(2,l)),'k*'); 
    end
    %%axis([-8 10 -8 10 -1 2.5]);
    pause(0.1);
end


