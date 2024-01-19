//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: 
// Email: 
// 
// Assignment name: 
// Lab section: 
// TA: 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

module gen_tick # ( parameter SRC_FREQ = 5000, parameter TICK_FREQ = 1) (
    input src_clk,
    input enable,
    output tick
);

// Declare registers and wires here
reg[31:0] limit = SRC_FREQ/TICK_FREQ /2 -1;
reg[31:0] acc = 0;
reg tick_out = 0;

always @(posedge src_clk) begin
    // put your code for the multiplier here
    if(enable) begin
        acc <= acc+1;
        if(acc == limit) begin
            acc <= 0;
            tick_out <= ~tick_out;
        end
    end
end

// Change this assign statement to the actual tick value
assign tick = tick_out;

endmodule
