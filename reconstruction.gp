set terminal pngcairo
set samples 500
set output 'plot.png'

# input signal
N = 3
t = 1
array S[N]
array T[N]
do for [i=1:N]{
    S[i] = sin(2*pi/(t*2.05)*(i - (N+1)/2.0))
    T[i] = t*(i-(N+1)/2.0)
}

# reconstruction
g(x,n) = sin(pi*(x-T[n])/t)/(pi*(x-T[n])/t)
f(x,n) = n > 0 ? f(x,n-1)+S[n]*g(x,n) : 0

# plot
set title sprintf('N = %d', N)
set key below
set xrange[-t*2.05*5:t*2.05*5]
set yrange[-1.5:1.5]
plot sin(2*pi/2.05*x) lc rgb 'black', S u (T[$1]):(S[$1]) t 'sample' pt 6 ps 2 lc rgb 'black', f(x,N) lw 3 lc rgb 'black'

