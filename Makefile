
.PHONY: clean

all: adios_global adios_global_no_xml


adios_global: adios_global.c
	gpp.py adios_global.xml
	mpicc `adios_config -c` -o adios_global adios_global.c `adios_config -l`

adios_global_no_xml: adios_global_no_xml.c
	mpicc `adios_config -c` -o adios_global_no_xml adios_global_no_xml.c `adios_config -l`

clean:
	rm -f adios_global  adios_global_no_xml *.ch *.bp *.*~
