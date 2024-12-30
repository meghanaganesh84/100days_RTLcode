module mealy_seq_detector_1011(
    input clk,
    input rst,
    input seq_in,
    output reg seq_detected
);

    // State Encoding
  parameter  
        A=3'b00, 
        B=3'b01, 
        C=3'b10,
        D=3'b11;
        
    reg [1:0]current_state, next_state;

    // Sequential Logic: State Transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // Combinational Logic: Next State and Output Logic
    always @(*) begin
        // Default values
        next_state = current_state;
        seq_detected = 1'b0;

        case (current_state)
            A: begin
                if (seq_in == 1'b1)
                    next_state = B;
                    else
                    next_state = A;
            end

            B: begin
                if (seq_in == 1'b0)
                    next_state = C;
                else
                    next_state = B;
            end

            C: begin
                if (seq_in)
                    next_state = D; 
                else begin
                    next_state = C;  
                    seq_detected = 1'b1;      
                end
            end
             D: begin
                if (seq_in)
                 begin
                    next_state = B; 
                    seq_detected = 1'b1; 
                  end
                else
                   begin
                    next_state = C;  
                   end
                end
        endcase
    end
endmodule
