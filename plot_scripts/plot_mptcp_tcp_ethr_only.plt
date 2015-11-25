set terminal png
set output 'MPTCP_TCP_on_only_ethernet_Throughput_vs_Time.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP/TCP on only ethernet Throughput vs Time"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_on_ethernet.txt' via mean_1
f(x) = mean_2
fit f(x) 'tcp_on_ethernet.txt' via mean_2
label1 = gprintf("Mean M= %g", mean_1)
label2 = gprintf("Mean T= %g", mean_2)
LABEL=label1."\n".label2
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
set label 10 at 150,4 LABEL front center

plot "mptcp_on_ethernet.txt" with line title "MPTCP", \
"tcp_on_ethernet.txt" with line title "TCP" 
