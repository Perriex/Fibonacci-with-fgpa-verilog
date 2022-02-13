# Fibonacci with verilog (Fgpa)

```

Int fib(int n){
  If( n <= 1) return 1;
  return fib(n-1) + fib(n-2);
}


```

### Fpga
- C1
- C2
- S1
- S2
 
Fibonacci code implemented with Stack and Fpga, with minimum area and execution time in Verilog language.

Open project and run "do ./sim_top.tcl" in console(Modelsim)


## Test runs:
```
00000000, 01, 01, true
00000001, 01, 01, true
00000002, 02, 02, true
00000003, 03, 03, true
00000004, 05, 05, true
00000005, 08, 08, true
00000006, 0d, 0d, true
00000007, 15, 15, true
```
