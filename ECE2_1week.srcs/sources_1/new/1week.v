module logic_gate (a, b, x, y, z, w, v);

input a, b;

output x, y, z, w, v;

wire x, y, z, w, v;

//and gate
assign x = a & b;

//or gate
assign y = a | b;

//xor gate
assign z = a ^ b;

//nor gate
assign w = ~(a | b);

//nand gate
assign v = ~(a & b);

endmodule

// 2. 가상의 입력 신호를 발생시키는 테스트벤치 모듈 (추가된 부분)
module tb_logic_gate;
    // 테스트용 변수 선언
    reg a, b;
    wire x, y, z, w, v;

    // 위의 logic_gate 모듈을 불러와서 포트 연결
    logic_gate uut (
        .a(a), .b(b), .x(x), .y(y), .z(z), .w(w), .v(v)
    );

    // a, b 값을 순차적으로 변화시킴
    initial begin
        a = 0; b = 0; #10; // 00 인가 후 10ns 대기
        a = 0; b = 1; #10; // 01 인가 후 10ns 대기
        a = 1; b = 0; #10; // 10 인가 후 10ns 대기
        a = 1; b = 1; #10; // 11 인가 후 10ns 대기
        $finish;           // 시뮬레이션 종료
    end
endmodule

module half_adder(A, B, C, S);
    input A, B;
    output C, S;
    
    //4에서 구한 논리식을 이용한 구현
    assign C = A & B;
    assign S = A ^ B;
endmodule

module half_adder_case(A, B, C, S);
    input A, B;
    output reg C, S;

    always @(A, B) begin
        case({A, B})
            2'b00: begin 
                C = 1'b0; 
                S = 1'b0; 
            end
            2'b01: begin 
                C = 1'b0; 
                S = 1'b1; 
            end
            2'b10: begin 
                C = 1'b0; 
                S = 1'b1; 
            end
            2'b11: begin 
                C = 1'b1; 
                S = 1'b0; 
            end
            default: begin 
                C = 1'b0; 
                S = 1'b0; 
            end
        endcase
    end
endmodule

// 전가산기 모듈 (FA)
module FA(x, y, z, s, c);
    input x, y, z;
    output s, c;
    wire s1, c1, c2;

    // 이미 작성된 half_adder 모듈 2개를 호출하여 연결
    half_adder u1 (.A(x), .B(y), .C(c1), .S(s1));
    half_adder u2 (.A(z), .B(s1), .C(c2), .S(s));

    assign c = c1 | c2;
endmodule

// 전가산기 시뮬레이션용 테스트벤치 모듈 (tb_FA)
module tb_FA;
    reg x, y, z;
    wire s, c;

    // FA 모듈 연결
    FA uut(
        .x(x), .y(y), .z(z), .s(s), .c(c)
    );

    // 3'b000 부터 3'b111 까지 순차적으로 인가
    initial begin
        x = 0; y = 0; z = 0; #10;
        x = 0; y = 0; z = 1; #10;
        x = 0; y = 1; z = 0; #10;
        x = 0; y = 1; z = 1; #10;
        x = 1; y = 0; z = 0; #10;
        x = 1; y = 0; z = 1; #10;
        x = 1; y = 1; z = 0; #10;
        x = 1; y = 1; z = 1; #10;
        $finish;
    end
endmodule