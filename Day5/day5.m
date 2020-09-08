
k_A_on = 10;
k_A_off = 10;
k_I_on = 10;
k_I_off = 10;
k_I_cat = 10;
k_A_cat = 100;
P_tot = 1;
I_tot = 100;

figure;
K_tot = logspace(-3,2,100);

A = K_tot;
for i = 1:length(K_tot)
    dAdt =@(A,I,AP,IK) -k_A_on * (P_tot-AP) * A + k_A_off * AP + k_A_cat * IK; 
    dAPdt =@(A,I,AP,IK) k_A_on * (P_tot-AP) * A - k_A_off * AP - k_I_cat * AP;
    dIdt =@(A,I,AP,IK) -k_I_on * (K_tot(i)-IK) * I + k_I_off * IK + k_I_cat * AP;
    dIKdt =@(A,I,AP,IK) k_I_on * (K_tot(i)-IK) * I - k_I_off * IK - k_A_cat * IK;
    [T, X] = ode45(@(t,x)[dAdt(x(1),x(2),x(3),x(4));
                      dIdt(x(1),x(2),x(3),x(4));
                      dAPdt(x(1),x(2),x(3),x(4));
                      dIKdt(x(1),x(2),x(3),x(4))], [0,1], [0,I_tot,0,0]);
    A(i) = X(end,1);
end


plot(K_tot, A, '+');
set(gca, 'XScale', 'log');

