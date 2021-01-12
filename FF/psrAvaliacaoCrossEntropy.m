
function light=psrAvaliacaoCrossEntropy(histograma, elemento, p)

n = size(elemento,2) + 2;
elemento=[1 elemento 256];
      
a = elemento(1);
b = elemento(2);

m0=mzero(histograma, a, b);
m1=mum(histograma, a, b);
light = m1*log(m1/m0)^p;

for i=2:n-1
  a = elemento(i)+1;
  b = elemento(i+1);  
  m0=mzero(histograma, a, b);
  m1=mum(histograma, a, b);
  light = light + m1*log(m1/m0)^p;
end

end


function ret=mzero(histograma,a,b)
    ret = 0;
    for i=a:b
        ret=ret+histograma(i);
    end
end

function ret=mum(histograma,a,b)
    ret = 0;
    for i=a:b
        ret=ret+i*histograma(i);
    end
end
