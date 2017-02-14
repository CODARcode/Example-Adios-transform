Using Adios Transform Method (with SZ)
======================================

Adios implemented SZ (v1.4.9) compression as an Adios transform method
of Feb 12th, 2017. Adios also supports ZFP, bzip, szip, etc.

Users can use Adios transform method in three ways:

1. Using XML file
```
<var name="temperature" dimensions="1,NX"
  transform="sz:errorBoundMode=REL,relBoundRatio=1E-3"/>
```

2. C APIs
```
int adios_set_transform (int64_t var_id, const char *transform_type_str);
```

3. Adios Python
```
fw = ad.writer(fname, method='MPI')
fw['temperature'].transform = "sz:errorBoundMode=REL,relBoundRatio=1E-3"
```

To specify various SZ options, users can specify options in
“key=value[,key=value]*” string. The following options are available for now.
```
max_quant_intervals
quantization_intervals
sampleDistance
predThreshold
offset
szMode = [SZ_BEST_COMPRESSION|SZ_BEST_SPEED|SZ_BEST_COMPRESSION]
errorBoundMode = [ABS|REL|ABS_AND_REL|ABS_OR_REL| PW_REL]
absErrBound
relBoundRatio
pw_relBoundRatio
segment_size
```

Build Adios with SZ
-------------------

To use SZ with Adios, we need to configure Adios with SZ and build:
```
$ ./configure --with-sz=/dir/to/sz
```
