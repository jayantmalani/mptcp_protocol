set terminal png
set output 'MPTCP_TCP_brk_ethr_Throughput_vs_Time.png'
#set xdata time
#set timefmt "%S"
set xlabel "time"

set autoscale
set ylabel "throughput MBps"
set format y "%s"
set title "MPTCP/TCP break Ethernet Throughput vs Time"
set key reverse Left outside
set grid
#f(x) = mean_1
#fit f(x) 'mptcp_on_w_e_wifi_olia_brk.txt' using 1 via mean_1
#f(x) = mean_2
#fit f(x) 'mptcp_on_w_e_wifi_olia_brk.txt' using 2 via mean_2
#label1 = gprintf("Mean E= %g", mean_1)
#label2 = gprintf("Mean W= %g", mean_2)
#LABEL=label1."\n".label2
#longlabel = (strlen(label1) > strlen(label2)) ? label1 : label2
##set obj 10 rect at 150,-4 size char strlen(longlabel), char 3
##set obj 10 fillstyle empty border -1 front
#set label 10 at 150,4 LABEL front center

plot "mptcp_on_w_e_ethr_olia_brk_final.txt" using 2 with line title "Wifi", \
"mptcp_on_w_e_ethr_olia_brk_final.txt" using 1 with line title "Ethr" 
