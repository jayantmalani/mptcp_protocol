set terminal png
set output 'MPTCP_UDP_Throughput_vs_Time.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP/UDP Throughput vs Time"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_udp_on_both_mptcp_sum.txt' via mean_1
f(x) = mean_2
fit f(x) 'mptcp_udp_on_both_udp.txt' via mean_2
label1 = gprintf("Mean M= %g", mean_1)
label2 = gprintf("Mean U= %g", mean_2)
LABEL=label1."\n".label2
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
set label 10 at 200,4 LABEL front center
plot "mptcp_udp_on_both_mptcp_sum.txt" with line title "MPTCP", \
"mptcp_udp_on_both_udp.txt" with line title "UDP" 
