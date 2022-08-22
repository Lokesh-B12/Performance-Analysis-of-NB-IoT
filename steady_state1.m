
global S;
S = [12,24,12];
global lam;
lam = [0.00000138];
%lam = [0.0000001389,0.000000278,0.000000555,0.00000138,0.0000033];
global UEs;
UEs = 900:30:48000;
[row col] = size(UEs);
[row1 col1] = size(lam);
m = [3,5,2];
global N1;
global N2;
global N3;
global R;
%R = [6,8,10];
R = [10,6,10];
global W;
W = [7,7,7];
global T;
T = [80,160,320];
d1 = zeros(col1,col);
d2 = zeros(col1,col);
d3 = zeros(col1,col);
D = zeros(col1,col);
p_drop1 = zeros(col1,col);
p_drop2 = zeros(col1,col);
p_drop3 = zeros(col1,col);
d_succ1 = zeros(col1,col);
d_succ2 = zeros(col1,col);
d_succ3 = zeros(col1,col);
d_drop1 = zeros(col1,col);
d_drop2 = zeros(col1,col);
d_drop3 = zeros(col1,col);
throughput = zeros(3*col1,col);
psucc = zeros(3*col1,col);
pcoll = zeros(3*col1,col);
a = 0;
for k = 1:1:col1   
    tau11 = zeros(col,101);
    tau12 = zeros(col,101);
    tau13 = zeros(col,101);
    tau22 = zeros(col,101);
    tau23 = zeros(col,101);
    tau33 = zeros(col,101);
    ps11 = zeros(col,101);
    ps12 = zeros(col,101);
    ps13 = zeros(col,101);
    ps22 = zeros(col,101);
    ps23 = zeros(col,101);
    ps33 = zeros(col,101);
    thr1 = zeros(col,101);
    thr2 = zeros(col,101);
    thr3 = zeros(col,101);
    pi100 = zeros(col,101);
    pi200 = zeros(col,101);
    pi300 = zeros(col,101);
     for j= 1:1:col
       tau11(j,1) = 0.01;
       tau12(j,1) = 0.01;
       tau13(j,1) = 0.01;
       tau22(j,1) = 0.01;
       tau23(j,1) = 0.01;
       tau33(j,1) = 0.01;
    end
    for j = 1:1:col
        N1 = UEs(j)*m(1)/(m(1)+m(2)+m(3));
        N2 = UEs(j)*m(2)/(m(1)+m(2)+m(3));
        N3 = UEs(j)*m(3)/(m(1)+m(2)+m(3));
       lambda1 = lam(k)*T(1);
        lambda2 = lam(k)*T(2);
        lambda3 = lam(k)*T(3);
        
        for i=2:1:101
            ps33(j,i) = (1-tau33(j,i-1)/S(3))^(N3-1);
           %ps23(j,i) = (1-tau13(j,i-1)/S(3))^N1*(1-tau23(j,i-1)/S(3))^(N2-1)*(1-tau33(j,i-1)/S(3))^(N3);
           %ps13(j,i) = (1-tau13(j,i-1)/S(3))^(N1-1)*(1-tau23(j,i-1)/S(3))^N2*(1-tau33(j,i-1)/S(3))^(N3);
            p33 = 1-ps33(j,i);
            %p23 = 1-ps23(j,i);
            %p13 = 1-ps13(j,i);
            pi300(j,i) = 2*(1-p33)/(2*(1-p33)+lambda3*(2+(W(3)-1)*p33-(W(3)+1)*p33^R(3)));
            tau33(j,i) = ((1-p33^R(3))/(1-p33))*lambda3*pi300(j,i);
            ps22(j,i) = (1-tau22(j,i-1)/S(2))^(N2-1);
           % ps12(j,i) = (1-tau12(j,i-1)/S(2))^(N1-1)*(1-tau22(j,i-1)/S(2))^N2;
            p22 = 1-ps22(j,i);
           %p12 = 1-ps12(j,i);
            pi200(j,i) = 2*(1-p22)/(2*(1-p22)+lambda2*(2+(W(2)-1)*p22-(W(2)+1)*p22^R(2)));
            tau22(j,i) = (1-p22^R(2))/(1-p22)*lambda2*pi200(j,i);
            %tau23(j,i) = (1-p23^(R(3)-R(2)))/(1-p23)*lambda2*pi200(j,i)*p22^R(2);
            ps11(j,i) = (1-tau11(j,i-1)/S(1))^(N1-1);
            p11 = 1-ps11(j,i);
            pi100(j,i) = 2*(1-p11)/(2*(1-p11)+lambda1*(2+(W(1)-1)*p11-(W(1)+1)*p11^R(1)));
            tau11(j,i) = (1-p11^R(1))/(1-p11)*lambda1*pi100(j,i);
           % tau12(j,i) = (1-p12^(R(2)))/(1-p12)*lambda1*pi100(j,i)*p11^R(1);
            %tau13(j,i) = (1-p13^(R(3)-R(1)-R(2)))/(1-p13)*lambda1*pi100(j,i)*p11^R(1)*p12^(R(2));
            %thr1(j,i) = N1*tau11(j,i)*ps11(j,i);
            %thr2(j,i) = N1*tau12(j,i)*ps12(j,i)+N2*tau22(j,i)*ps22(j,i);
            %thr3(j,i) = N1*tau13(j,i)*ps13(j,i)+N2*tau23(j,i)*ps23(j,i)+N3*tau33(j,i)*ps33(j,i);
            thr1(j,i) = N1*tau11(j,i)*ps11(j,i);
            thr2(j,i) = N2*tau22(j,i)*ps22(j,i);
            thr3(j,i) = N3*tau33(j,i)*ps33(j,i);
        end
        
        throughput(k+a,j) = thr1(j,101);
        throughput(k+a+1,j) = thr2(j,101);
        throughput(k+a+2,j) = thr3(j,101);
        psucc(k+a,j) = ps11(j,101);
        psucc(k+a+1,j) = ps22(j,101);
        psucc(k+a+2,j) = ps33(j,101);
        pcoll(k+a,j) = p11;
        pcoll(k+a+1,j) = p22;
        pcoll(k+a+2,j) = p33;
    end
    a = a+2;
end