
module top_fifo #(
    parameter DSIZE = 8,  
    parameter ASIZE = 4   
)(
    input              sel_clk,
    input              wclk1,
    input              wclk2,
    input              wrst_n,
    input              winc,
    input  [DSIZE-1:0] wdata,
    output             wfull,
    output             awfull,
    input              rclk,
    input              rrst_n,
    input              rinc,
    output [DSIZE-1:0] rdata,
    output             rempty,
    output             arempty
);


    wire wclk;


    sg13g2_mux2_1 mux_clk (
    .A0(wclk1),
    .A1(wclk2),
    .S(sel_clk),
    .X(wclk)
    );

    async_fifo #(
        .DSIZE(DSIZE),
        .ASIZE(ASIZE),
        .FALLTHROUGH("TRUE")
    ) dut_fifo (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .winc(winc),
        .wdata(wdata),
        .wfull(wfull),
        .awfull(awfull),
        .rclk(rclk),
        .rrst_n(rrst_n),
        .rinc(rinc),
        .rdata(rdata),
        .rempty(rempty),
        .arempty(arempty)
    );

endmodule