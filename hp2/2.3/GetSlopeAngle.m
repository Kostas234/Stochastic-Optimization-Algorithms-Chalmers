function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1)                            
 if (iSlope == 1) 
   alpha = 4 + sin(x/100) + cos(sqrt(2)*x/50);
 elseif (iSlope == 2)
   alpha = 5 + sin(x/120) + cos(sqrt(3)*x/40);
 elseif (iSlope == 3)
   alpha = 6 + sin(x/130) + cos(sqrt(4)*x/30);
 elseif (iSlope == 4)
   alpha = 7 + sin(x/140) + cos(sqrt(5)*x/20);
 elseif (iSlope == 5)
   alpha = 9 + sin(x/110) + cos(sqrt(6)*x/2);
 elseif (iSlope == 6)
   alpha = 9 + sin(x/160) + cos(sqrt(7)*x/5);
 elseif (iSlope == 7)
   alpha = 1 + sin(x/170) + cos(sqrt(8)*x/4);
 elseif (iSlope == 8)
   alpha = 2 + sin(x/180) + cos(sqrt(9)*x/3);
 elseif (iSlope == 9)
   alpha = 3 + sin(x/170) + cos(sqrt(10)*x/2);
 elseif (iSlope== 10)
   alpha = 5 + 2*sin(x/250) + cos(sqrt(11)*x/1);
 end 
elseif (iDataSet == 2)                          
 if (iSlope == 1) 
   alpha = 7 - sin(x/10) + cos(sqrt(3)*x/50);   
 elseif (iSlope == 2) 
   alpha = 1 + sin(x/150) + cos(sqrt(6)*x/20);
 elseif (iSlope == 3) 
   alpha = 2 + sin(x/15) + cos(sqrt(9)*x/150);
 elseif (iSlope == 4) 
   alpha = 10 - sin(x/5) - cos(sqrt(6)*x/14);
 elseif (iSlope == 5) 
   alpha = 5 + sin(x/50) + cos(sqrt(5)*x/50);    
 end 
elseif (iDataSet == 3)                           
 if (iSlope == 1) 
   alpha = 6 - sin(x/100) - cos(sqrt(7)*x/50);   
 elseif (iSlope == 2)
   alpha = 1 + (x/6000) + sin(x/70) + cos(sqrt(7)*x/2);
 elseif (iSlope == 3)
   alpha = 3 + (x/8000) + sin(x/70) + cos(sqrt(9)*x/110);
 elseif (iSlope == 4)
   alpha = 5 - (x/2000) + sin(x/70) + cos(sqrt(4)*x/200);
 elseif (iSlope == 5)
   alpha = 9 - (x/1000) + sin(x/70) + cos(sqrt(3)*x/150);
 end
end
