set terminal png font 'Verdana,12'
set output 'MPTCP_Congestion_Controls_Throughput_vs_Time.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP Congestion Throughput vs Time"
set key reverse Left outside
set grid
f(x) = mean_1
fit f(x) 'mptcp_on_w_e_sum_olia.txt' via mean_1
f(x) = mean_2
fit f(x) 'mptcp_on_w_e_sum_lia.txt' via mean_2
f(x) = mean_3
fit f(x) 'mptcp_on_w_e_sum_balia.txt' via mean_3
f(x) = mean_4
fit f(x) 'mptcp_on_w_e_sum_wvegas.txt' via mean_4
f(x) = mean_5
fit f(x) 'mptcp_on_w_e_sum_cubic.txt' via mean_5
label1 = gprintf("Mean O= %g", mean_1)
label2 = gprintf("Mean L= %g", mean_2)
label3 = gprintf("Mean B= %g", mean_3)
label4 = gprintf("Mean W= %g", mean_4)
label5 = gprintf("Mean C= %g", mean_5)
LABEL=label1."\n".label2."\n".label3."\n".label4."\n".label5
longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
longlabel = (strlen(longlabel) > strlen(label3)) ? longlabel : label3
#set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
#set obj 10 fillstyle empty border -1 front
set label 10 at 150,4000 LABEL front center
plot "mptcp_on_w_e_sum_olia.txt" with line title "OLIA", \
"mptcp_on_w_e_sum_lia.txt" with line title "LIA", \
"mptcp_on_w_e_sum_balia.txt" with line title "BALIA", \
"mptcp_on_w_e_sum_wvegas.txt" with line title "WVEGAS", \
"mptcp_on_w_e_sum_cubic.txt" with line title "CUBIC"
