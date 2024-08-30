
# Define options
set val(chan) Channel/WirelessChannel ;# channel type
set val(prop) Propagation/TwoRayGround ;# radio-propagation model
set val(netif) Phy/WirelessPhy ;# network interface type
set val(mac) Mac/802_11 ;# MAC type
set val(ifq) Queue/DropTail/PriQueue ;# interface queue type
set val(ll) LL ;# link layer type
set val(ant) Antenna/OmniAntenna ;# antenna model
set val(ifqlen) 30 ;# max packet in ifq
set val(nn) 180 ;# number of mobilenodes
set val(rp) AODV ;# routing protocol
set val(x) 2200 ;# X dimension of topography
set val(y) 1000 ;# Y dimension of topography
set val(stop) 350 ;# time of simulation end

set ns [new Simulator]
set tracefd [open out.tr w]
set namtrace [open out.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)



# configure the nodes
$ns node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-channelType $val(chan) \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON

for {set i 0} {$i < $val(nn) } { incr i } {
set n($i) [$ns node]
}

source scen_20

for {set i 0} {$i < $val(nn) } { incr i } {
$ns initial_node_pos $n($i) 30
}


set myagent [new Agent/MyAgentOtcl]


$myagent set my_var1_otcl 45
$myagent set my_var2_otcl 3
$myagent set my_var3_otcl 4
$ns at 30.0 "$myagent calling-Ticket"


# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
$ns at $val(stop) "$n($i) reset";
}

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(21) $tcp
$ns attach-agent $n(23) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 73.0 "$ftp start"
$ns at 75.0 "$ftp stop"



set tcp1 [new Agent/TCP/Newreno]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n(15) $tcp1
$ns attach-agent $n(23) $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 77.0 "$ftp1 start"
$ns at 79.0 "$ftp1 stop"


set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 3
set sink33 [new Agent/TCPSink]
$ns attach-agent $n(48) $tcp33
$ns attach-agent $n(23) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 81.0 "$ftp33 start"
$ns at 83.0 "$ftp33 stop"




set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n(9) $tcp3
$ns attach-agent $n(23) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 85.0 "$ftp3 start"
$ns at 87.0 "$ftp3 stop"


set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n(12) $tcp3
$ns attach-agent $n(63) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 89.0 "$ftp3 start"
$ns at 91.0 "$ftp3 stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(62) $tcp
$ns attach-agent $n(63) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 93.0 "$ftp start"
$ns at 95.0 "$ftp stop"



set tcp1 [new Agent/TCP/Newreno]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n(75) $tcp1
$ns attach-agent $n(63) $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 97.0 "$ftp1 start"
$ns at 99.0 "$ftp1 stop"



set tcp1 [new Agent/TCP/Newreno]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n(22) $tcp1
$ns attach-agent $n(63) $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 101.0 "$ftp1 start"
$ns at 103.0 "$ftp1 stop"


set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 3
set sink33 [new Agent/TCPSink]
$ns attach-agent $n(33) $tcp33
$ns attach-agent $n(63) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 105.0 "$ftp33 start"
$ns at 107.0 "$ftp33 stop"




set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n(8) $tcp3
$ns attach-agent $n(78) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 109.0 "$ftp3 start"
$ns at 111.0 "$ftp3 stop"


set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n(8) $tcp3
$ns attach-agent $n(78) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 112.0 "$ftp3 start"
$ns at 114.0 "$ftp3 stop"



set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 3
set sink3 [new Agent/TCPSink]
$ns attach-agent $n(44) $tcp3
$ns attach-agent $n(78) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 116.0 "$ftp3 start"
$ns at 118.0 "$ftp3 stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(16) $tcp
$ns attach-agent $n(78) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 120.0 "$ftp start"
$ns at 122.0 "$ftp stop"




set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(49) $tcp
$ns attach-agent $n(78) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 124.0 "$ftp start"
$ns at 126.0 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(7) $tcp
$ns attach-agent $n(78) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 128.0 "$ftp start"
$ns at 130.0 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(0) $tcp
$ns attach-agent $n(72) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 132.0 "$ftp start"
$ns at 134.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(6) $tcp
$ns attach-agent $n(72) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 136.0 "$ftp start"
$ns at 138.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(41) $tcp
$ns attach-agent $n(72) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 140.0 "$ftp start"
$ns at 142.0 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(51) $tcp
$ns attach-agent $n(72) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 144.0 "$ftp start"
$ns at 146.0 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(58) $tcp
$ns attach-agent $n(72) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 148.0 "$ftp start"
$ns at 150.0 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(76) $tcp
$ns attach-agent $n(35) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 152.0 "$ftp start"
$ns at 154.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(40) $tcp
$ns attach-agent $n(35) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 156.0 "$ftp start"
$ns at 158.0 "$ftp stop"




set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(65) $tcp
$ns attach-agent $n(35) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 160.0 "$ftp start"
$ns at 162.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(54) $tcp
$ns attach-agent $n(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 164.0 "$ftp start"
$ns at 166.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(56) $tcp
$ns attach-agent $n(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 168.0 "$ftp start"
$ns at 170.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(53) $tcp
$ns attach-agent $n(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 172.0 "$ftp start"
$ns at 174.0 "$ftp stop"
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(68) $tcp
$ns attach-agent $n(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 176.0 "$ftp start"
$ns at 178.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(29) $tcp
$ns attach-agent $n(57) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 180.0 "$ftp start"
$ns at 182.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(36) $tcp
$ns attach-agent $n(57) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 184.0 "$ftp start"
$ns at 186.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(79) $tcp
$ns attach-agent $n(57) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 188.0 "$ftp start"
$ns at 190.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(59) $tcp
$ns attach-agent $n(57) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 192.0 "$ftp start"
$ns at 194.0 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(63) $tcp
$ns attach-agent $n(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 200.30 "$ftp start"
$ns at 204.30 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(23) $tcp
$ns attach-agent $n(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 208.30 "$ftp start"
$ns at 212.30 "$ftp stop"



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(1) $tcp
$ns attach-agent $n(61) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 218.30 "$ftp start"
$ns at 222.30 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(61) $tcp
$ns attach-agent $n(31) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 223.30 "$ftp start"
$ns at 225.30 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(78) $tcp
$ns attach-agent $n(73) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 229.30 "$ftp start"
$ns at 233.30 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(72) $tcp
$ns attach-agent $n(73) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 236.30 "$ftp start"
$ns at 239.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(73) $tcp
$ns attach-agent $n(25) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 243.0 "$ftp start"
$ns at 246.50 "$ftp stop"






set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(25) $tcp
$ns attach-agent $n(13) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 247.30 "$ftp start"
$ns at 249.30 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(27) $tcp
$ns attach-agent $n(34) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 253.30 "$ftp start"
$ns at 257.30 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(57) $tcp
$ns attach-agent $n(34) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 263.30 "$ftp start"
$ns at 265.30 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(35) $tcp
$ns attach-agent $n(34) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 267.90 "$ftp start"
$ns at 271.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(34) $tcp
$ns attach-agent $n(28) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 276.50 "$ftp start"
$ns at 279.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(28) $tcp
$ns attach-agent $n(64) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 282.30 "$ftp start"
$ns at 348.30 "$ftp stop"






# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 348.30 "puts \"end simulation\" ; $ns halt"
proc stop {} {
global ns tracefd namtrace
$ns flush-trace
close $tracefd
close $namtrace
#exec nam out.nam &
}

$ns run 



