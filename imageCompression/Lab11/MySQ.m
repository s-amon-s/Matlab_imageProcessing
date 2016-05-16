function Tsq = MySQ(QF)
%1,QF = 100
%200-2 *QF , 50<=Qf<=99
%5000/QF, 1<=QF<=49
%Tsq  = floor[(Tq x ScFactor + 50)/100]     Tq = standard quantization
% table
%Tsq = scaled quantization table

%1 poorest --> 100(best quality)
scaleFactor  = 1;
Tq = [
            16 11 10 16  24  40  51  61
            12 12 14 19  26  58  60  55
            14 13 16 24  40  57  69  56
            14 17 22 29  51  87  80  62
            18 22 37 56  68 109 103  77
            24 35 55 64  81 104 113  92
            49 64 78 87 103 121 120 101
            72 92 95 98 112 100 103 99];
        
if ~exist('QF','var')
    QF = 50;
end

if QF == 100
    scaleFactor = 1;
elseif QF>=50 && QF<=99
    scaleFactor = 200 - 2*QF;
elseif QF>=1 && QF<=49
    scaleFactor = 5000/QF;
end

Tsq = floor((Tq .* scaleFactor + 50)./100);
disp(Tsq);
disp(['Displaying table with QF = ',num2str(QF)]);

end