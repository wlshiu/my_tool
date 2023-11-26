#!/bin/bash


# '--inplace ' auto replace the original *.v files
./verible-verilog-format.exe --indentation_spaces=4 \
    --named_port_alignment=align \
    --port_declarations_alignment=align \
    --module_net_variable_alignment=flush-left \
    --assignment_statement_alignment=align \
    --try_wrap_long_lines \
    --wrap_end_else_clauses \
    --expand_coverpoints \
    $@
