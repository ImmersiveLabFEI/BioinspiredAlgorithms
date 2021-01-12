

function light=psrAvaliacaoTsallis(histograma, q, elemento)

light = 0;
n = size(elemento,2) + 2;
elemento=[1 elemento 256];    

a = elemento(1);
b = elemento(2);
light = TsallisEntropy(histograma,q,a,b);
if isnan(light) light = 0; end
Plight = light;
T = TsallisEntropy(histograma,q,1,256);

for i=2:n-1
  a = elemento(i)+1;
  b = elemento(i+1);
  ES = TsallisEntropy(histograma,q,a,b);
  if ~isnan(ES)
      light = light + ES;
      Plight = Plight * ES;
  end
end

light = light + (1-q) * Plight;

end


function S = TsallisEntropy(histograma,q,a,b)

  H = histograma(a:b);
  H = H/sum(H);
  L = size(H,2);

  ret = 0;
  for i=1:L
    if H(i) ~= 0
      ret = ret + H(i)^q;
    end
  end  
  S = (1-ret)/(q-1);
 
end









