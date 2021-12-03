`timescale 1ns/1ns

module TB ();
    reg clk = 0, start = 0, CLR = 0;
    reg [2:0] n = 3'b11;
    reg [4:0] first = 4'b1, second = 4'b1, temp = 4'b1;
    wire [4:0] result;

    Fib UUT(clk, start, CLR, n, result);

    always #4.5 clk = ~clk;
    integer f, i;

    initial begin
        f = $fopen("./output.txt", "w");

        CLR = 1'b1;
        #20 CLR = 1'b0;
        for(i = 0; i <= 7; i = i + 1) begin
            n = i;
            start = 1'b1;
            #20 start = 1'b0;
            #900;
            if(result == first)
                $fwrite(f, "%h, %h, %h, true\n", i, result, first);
            else
                $fwrite(f, "%h, %h, %h, false\n", i, result, first);
            
            first <= second;
            second <= first + second;
        end
        $fclose(f);
        $stop;
    end
endmodule