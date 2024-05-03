#!/bin/awk -f

BEGIN {
    RS = ">" # Set the record separator to ">"
}

{
    if (NR > 1) { # Ignore the first record (empty)
        seq = $0 # Save the sequence
        gsub("\n", "", seq) # Remove line breaks
        if (seq in seen) { # Check if sequence has been seen before
            if (seen[seq] != $1) { # If the headers are different, print a warning
                print "Warning: Sequence data of '" seen[seq] "' is identical to '" $1 "'"
            }
        } else {
            seen[seq] = $1 # Mark sequence as seen
        }
    }
}