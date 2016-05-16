function checkNoises()
%%
noise_name = {'Gaussian Noise' 'Rayleigh Noise' 'Erlang(Gamma) Noise' 'Exponential Noise' 'Uniform Noise' 'Impuse Noise'};

figure('units','normalized','outerposition',[0 0 1 1]);

for i=97:102
    var = sprintf('%c.tif',i);
    image = imread(var);
    subplot(2,6,i-96),imshow(image);
    subplot(2,6,(i-96)+6),imhist(image);
    title(noise_name(i-96));
end

end