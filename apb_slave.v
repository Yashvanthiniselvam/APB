module apb_slave(input clk,rst,psel,penable,pwrite,
                 input [31:0] paddr,
                 input [31:0] pwdata,
                 output reg [31:0] prdata,
                 output reg pready);
  reg [31:0] mem [0:15];
  always @(*)
    begin
      if(psel==1 && penable==1)
        pready=1;
      else
        pready=0;
    end
  always @(posedge clk or negedge rst) 
    begin
      if(rst==0) 
        begin
          prdata<=0;
        end
      else 
        begin
          if(psel==1 && penable==1) 
            begin
              if(pwrite==1) 
                  mem[paddr] <= pwdata;   
              else 
                  prdata <= mem[paddr]; 
            end 
        end
    end
endmodule
