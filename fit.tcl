# Define the fitness function
proc evaluate_fitness {chromosome} {
    # Convert chromosome to configuration parameters
    set param1 [lindex $chromosome 0]
    set param2 [lindex $chromosome 1]
    set param3 [lindex $chromosome 2]
    # Set the configuration parameters for the node
    $node set param1 $param1
    $node set param2 $param2
    $node set param3 $param3
    # Run the simulation
    $ns_ run $sim_time
    # Calculate the network lifetime based on the trace file
    set tracefile "$out_file.tr"
    set lifetime [calculate_lifetime $tracefile]
    # Return the fitness value (network lifetime)
    return $lifetime
}

# Calculate the network lifetime based on the trace file
proc calculate_lifetime {tracefile} {
    set start_time 0.0
    set end_time [expr $sim_time - $warmup_time]
    set num_nodes [llength [lsort -unique [get_nodes $tracefile]]]
    set lifetime [expr $end_time * $num_nodes]
    set events [parse_trace_file $tracefile $start_time $end_time]
    foreach event $events {
        set time [lindex $event 0]
        set node [lindex $event 1]
        set type [lindex $event 2]
        set energy [lindex $event 3]
        if {$type == "DEAD"} {
            set lifetime [expr $lifetime - ($end_time - $time)]
        }
    }
    return $lifetime
}

