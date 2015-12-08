set terminal png  font 'Verdana,10'
set output 'MPTCP_vs_TCP_Flows.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "5 MPTCP Sub Flows vs 5 TCP Sub Flows"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_5_flows_1_conn.txt' via mean_1
f(x) = mean_2
fit f(x) 'tcp_5_independent_conn.txt' via mean_2
f(x) = mean_3
fit f(x) 'mptcp_10_flows_5_conn_sum.txt' via mean_3
label1 = gprintf("5 MPTCP Flow= %g kBps", mean_1)
label2 = gprintf("5 TCP Flow= %g kBps", mean_2)
label3 = gprintf("5 MPTCP 10 Flow= %g kBps", mean_3)
LABEL=label1."\n".label2."\n".label3
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
longlabel = (strlen(longlabel) > strlen(label3)) ? longlabel : label3
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
#set label 10 at 50,2000 LABEL front center

plot "mptcp_5_flows_1_conn.txt" with line title "5 MPTCP Flow", \
"tcp_5_independent_conn.txt" with line title "5 TCP Flow", \
"mptcp_10_flows_5_conn_sum.txt" with line title "5 MPTCP 10 Flow"
