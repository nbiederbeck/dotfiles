# Defined in - @ line 1
function gpu-fanspeed --wraps='nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits' --description 'alias gpu-fanspeed=nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits'
  nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits $argv;
end
