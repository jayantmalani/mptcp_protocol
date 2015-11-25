set terminal png
set output 'MPTCP_Throughput_vs_Time_wvegas.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP Congestion Control Throughput vs Time"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_on_w_e_ethr_wvegas.txt' via mean_1
f(x) = mean_2
fit f(x) 'mptcp_on_w_e_wifi_wvegas.txt' via mean_2
f(x) = mean_3
fit f(x) 'mptcp_on_w_e_sum_wvegas.txt' via mean_3
label1 = gprintf("Mean E= %g", mean_1)
label2 = gprintf("Mean W= %g", mean_2)
label3 = gprintf("Mean E+W= %g", mean_3)
LABEL=label1."\n".label2."\n".label3
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
longlabel = (strlen(longlabel) > strlen(label3)) ? longlabel : label3
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
set label 10 at 180,4 LABEL front center
plot "mptcp_on_w_e_wifi_wvegas.txt" with line title "WIFI", \
"mptcp_on_w_e_ethr_wvegas.txt" with line title "ETHR", \
 "mptcp_on_w_e_sum_wvegas.txt" with line title "WIFI+ETHR" 
