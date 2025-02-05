# Verilog_Learning

## Test Code by IVerilog

```bash
iverilog -o simv testbench.v dut.v
```

- `simv` is the output file name;
- `testbench.v` is test bench;
- `dut.v` is DUT

And then it output `simv` file:

```bash
vvp simv
```

terminal will output the result.

If you need wave, add

```Verilog
initial begin
    $dumpfile("waveform.vcd"); // file name
    $dumpvars(0, testbench); // `testbench` is the top module name
```

after running `vvp simv`, you'll find the wave. You can open it by

```bash
gtkwave waveform.vcd
```


## Output Netlists and Vector Diagrams

1. Transfer `.v` file to `.json` file by **Yosys**.

Create a script named `script.ys`:

```
// Name: script.ys
read_verilog dut.v
proc; opt
write_json test.json
```

- `dut.v` is the DUT file;
- `test.json` is the output json file;

Then input 

```bash
yosys script.ys
```

it will output the `.json` file.

2. Transfer `.json` file to `.svg` file by **NetlistSVG**.

```bash
netlistsvg script.ys
```
it will generate the `.svg` file. You can open it on softwares like Inkscape.