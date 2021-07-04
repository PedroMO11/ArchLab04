module byteController(
    Result,
    BytePosition,
    ByteResult,
    enable
);
    input wire [31:0] Result;
    input wire [31:0] BytePosition;
    input wire enable;
    output reg [31:0] ByteResult;

    always @(*)
        if (enable)
        case (BytePosition[1:0])
            2'b00: ByteResult = {24'b000000000000000000000000, Result[7:0]};
            2'b01: ByteResult = {24'b000000000000000000000000, Result[15:8]};
            2'b10: ByteResult = {24'b000000000000000000000000, Result[23:16]};
            2'b11: ByteResult = {24'b000000000000000000000000, Result[31:24]};
            default: ByteResult = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        endcase
endmodule