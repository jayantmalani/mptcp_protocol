set terminal png font 'Verdana,12'
set output 'resource_util.png'
#set xdata time
#set timefmt "%S"
set xlabel "Throughput of A"
set style fill   pattern 2 border
set autoscale
set ylabel "Throughput of B"
set format y "%s"
set title "Efficient Resource Utilization"
set key reverse Left outside
set grid
#f(x) = mean_1
#fit f(x) 'mptcp_on_w_e_ethr_balia.txt' via mean_1
#f(x) = mean_2
#fit f(x) 'mptcp_on_w_e_wifi_balia.txt' via mean_2
#f(x) = mean_3
#fit f(x) 'mptcp_on_w_e_sum_balia.txt' via mean_3
#label1 = gprintf("Mean E= %g", mean_1)
#label2 = gprintf("Mean W= %g", mean_2)
#label3 = gprintf("Mean E+W= %g", mean_3)
#LABEL=label1."\n".label2."\n".label3
#longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
#longlabel = (strlen(longlabel) > strlen(label3)) ? longlabel : label3
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
#set label 10 at 200,4 LABEL front center

plot "aaa.txt" using 1:2 with filledcu x1 ls 2 lt 2 notitle
