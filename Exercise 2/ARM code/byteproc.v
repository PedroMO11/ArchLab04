module byteproc(
    Result,
    BytePosition,
    ByteResult
);
    input wire [31:0] Result;
    input wire [31:0] BytePosition;
    output reg [31:0] ByteResult;

    wire reg [7:0] byte;

    always @(*)
        case (BytePosition[1:0])
            2'b00: byte = Result[7:0];
            2'b01: byte = Result[15:8];
            2'b10: byte = Result[23:16];
            2'b11: byte = Result[31:24];
            default: ByteResult = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        endcase
    
    ByteResult = {24'b000000000000000000000000, byte[7:0]};
    //ByteResult = 32'b00000000000000000000000000000000;

endmodule