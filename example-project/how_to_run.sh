quartus_sh -t prj.tcl

quartus_pgm -l

quartus_pgm --auto

quartus_pgm -m JTAG -o "p;output_files/example-project.sof@1"
