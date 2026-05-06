module tb;
  reg clk, rst,write,transfer;
  reg [31:0] addr, wdata;
  wire psel, penable, pwrite,pready;
  wire [31:0] paddr, pwdata,prdata;
  apb_master dut_m(.clk(clk),.rst(rst),.write(write),.transfer(transfer),
                 .addr(addr),.wdata(wdata),.psel(psel),.penable(penable),
                 .pwrite(pwrite),.paddr(paddr),.pwdata(pwdata),
                 .pready(pready));
  apb_slave dut_s(.clk(clk),.rst(rst),.psel(psel),.penable(penable),
               .pwrite(pwrite),.paddr(paddr),.pwdata(pwdata),
               .prdata(prdata),.pready(pready));
  always #5 clk = ~clk;
  initial begin
    clk = 0;rst = 0;transfer = 0;
    #10 rst = 1;
    #10 transfer = 1;write = 1;addr = 4;wdata = 32'hAAAA;
    #20 transfer = 0;
    #20 transfer=1;write=0;addr=4;
    #20 transfer=0;
    #50 $finish;
  end
  initial begin
    $monitor("time=%0t   psel=%b   penable=%b   pwrite=%b   paddr=%h pwdata=%h   pready=%b",$time,psel,penable,pwrite,paddr,pwdata,pready);
  end
  initial begin
    $dumpfile("apb.vcd");
    $dumpvars(0, tb);
  end
endmodule

