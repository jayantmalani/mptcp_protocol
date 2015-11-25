set terminal png
set output 'MPTCP_Throughput_vs_Time_diff_Sub_Flows.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP Diff Sub Flows Throughput vs Time"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_on_sum_olia_4_sub_flows.txt' via mean_1
f(x) = mean_2
fit f(x) 'mptcp_on_sum_olia_8_sub_flows.txt' via mean_2
f(x) = mean_3
fit f(x) 'mptcp_on_sum_olia_10_sub_flows.txt' via mean_3
f(x) = mean_4
fit f(x) 'mptcp_on_sum_olia_16_sub_flows.txt' via mean_4
f(x) = mean_5
fit f(x) 'mptcp_on_sum_olia_20_sub_flows.txt' via mean_5
label1 = gprintf("Mean 4= %g", mean_1)
label2 = gprintf("Mean 8= %g", mean_2)
label3 = gprintf("Mean 10= %g", mean_3)
label4 = gprintf("Mean 16= %g", mean_4)
label5 = gprintf("Mean 20= %g", mean_5)
LABEL=label1."\n".label2."\n".label3."\n".label4."\n".label5
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
longlabel = (strlen(longlabel) > strlen(label3)) ? longlabel : label3
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
set label 10 at 150,2000 LABEL front center

plot "mptcp_on_sum_olia_4_sub_flows.txt" with line title "4 Flows", \
"mptcp_on_sum_olia_8_sub_flows.txt" with line title "8 Flows", \
"mptcp_on_sum_olia_10_sub_flows.txt" with line title "10 Flows", \
"mptcp_on_sum_olia_16_sub_flows.txt" with line title "16 Flows", \
"mptcp_on_sum_olia_20_sub_flows.txt" with line title "20 Flows"
