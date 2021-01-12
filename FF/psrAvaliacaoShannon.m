

function light=psrAvaliacaoShannon(histograma, elemento)

light = 0;
n = size(elemento,2) + 2;
elemento=[1 elemento 256];
      
a = elemento(1);
b = elemento(2);
light = ShannonEntropy(histograma,a,b);

for i=2:n-1
  a = elemento(i)+1;
  b = elemento(i+1);
  ES = ShannonEntropy(histograma,a,b);
  light = light + ES;
end

end


function S = ShannonEntropy(histograma,a,b)
 
  H = zeros(1,b-a+1);
  H = histograma(a:b);
  H = H/sum(H);
  
  L = size(H,2);
  S = 0;
  ret = 0;
  for i=1:L
    if H(i) ~= 0
      ret = ret + H(i) * log(H(i));
    end
  end  
  S = -ret;
  
end

