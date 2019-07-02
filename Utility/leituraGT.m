%fun��o de leitura da imagem de ground-truth
function [V,individuo] = leituraGT(path)
%nome do individuo, come�ando sempre a partir da �ltima \ 
%do caminho da pasta
split = strsplit(path,'\');
individuo = split(size(split, 2));
%caminho do arquivo da segmenta��o manual
arquivoGT = char((strcat('\', strcat(individuo, '_seg.nii'))));
groundtruth = char(strcat(path, arquivoGT));
%cabe�alho das imagens nii
info = nii_read_header(groundtruth);
%matriz contendo todas as imagens do arquivo nii
V = nii_read_volume(info);
end
