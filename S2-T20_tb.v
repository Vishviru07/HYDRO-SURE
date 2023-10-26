module ddsproject_tb;
	wire o1,o2,o3;
	reg [3:0]ms;
    reg [3:0]ts;
    reg [3:0]ct;
	circuit C1(ms,ts,ct,o1,o2,o3); 

    initial 
       begin 
        $dumpfile("ddsproject.vcd");
        $dumpvars(0,ddsproject_tb);
       end
		
	initial begin
    $display("|   Crop    |tp_sensor  | M_sensor  | Outputs|");
    $display("----------------------------------------------");
    $display("|c3|c2|c1|c0|t3|t2|t1|t0|m3|m2|m1|m0|o1|o2|o3|");
    $display("----------------------------------------------");
    
    ct = 4'b0000;
    ts = 4'b0000;
    ms = 4'b0000;
    
    $monitor("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|",ct[3],ct[2],ct[1],ct[0],ts[3],ts[2],ts[1],ts[0],ms[3],ms[2],ms[1],ms[0],o1,o2,o3);
    
    repeat(5) begin
        ts = 4'b0000;
        repeat(5) begin
        ms = 4'b0000;
            repeat(15) begin
                #10 ms = ms + 4'b0001;
            end
         #10 ts = ts + 4'b0001;
        end
    #10 ct = ct + 4'b0001;
    end
end

        
	initial #10000 $finish;
endmodule