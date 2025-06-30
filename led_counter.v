module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);

localparam ONE_SECOND = CLK_FREQ / 2; // Define o número de ciclos de clock para 1 segundo
reg [31:0] counter; // Contador de tempo
reg [7:0] reg_leds; // Registrador para LEDs
assign leds = reg_leds;

always @(posedge clk) begin
    if(!rst_n) begin
        counter <= 0;
        reg_leds <= 0;
    end else begin
        if(counter >= ONE_SECOND - 1) begin // Contador incrementa a cada ciclo de clock, quando chegar a CLK_FREQ, significa que passou 1 segundo
            counter <= 0;
            reg_leds <= reg_leds + 1; 
        end else begin
            counter <= counter + 1; 
        end
    end
end

endmodule
