function julianb --wraps=julia\ -e\ \'using\ IJulia\;\ notebook\(\)\' --description alias\ julianb=julia\ -e\ \'using\ IJulia\;\ notebook\(\)\'
  julia -e 'using IJulia; notebook()' $argv; 
end
