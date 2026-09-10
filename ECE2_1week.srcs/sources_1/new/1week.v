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
module week_1_tb_logic_gate;
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

module week_1_half_adder_case(A, B, C, S);
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
module week_1_tb_FA;
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

// 4비트 비교기 모듈 (Design Source)
module comparator_4bit(a, b, x, y, z);
    input [3:0] a, b;
    output x, y, z;

    // x = A>B case
    assign x = (a > b) ? 1'b1 : 1'b0;
    // y = A=B case
    assign y = (a == b) ? 1'b1 : 1'b0;
    // z = A<B case
    assign z = (a < b) ? 1'b1 : 1'b0;
endmodule

// 시뮬레이션용 테스트벤치 모듈 (Simulation Source)
module week_2_tb_comparator_4bit;
    reg [3:0] a, b;
    wire x, y, z;

    comparator_4bit uut (
        .a(a), .b(b), .x(x), .y(y), .z(z)
    );

    initial begin
        // 6.2.1: A = 3, B = 8
        a = 4'b0011; b = 4'b1000; #10;
        // 6.2.2: A = 7, B = 1
        a = 4'b0111; b = 4'b0001; #10;
        // 6.2.3: A = 9, B = 9
        a = 4'b1001; b = 4'b1001; #10;
        // 6.2.4: A = 11, B = 15
        a = 4'b1011; b = 4'b1111; #10;
        
        $finish;
    end
endmodule

module decoder_3X8(x, y, z, D);
    input x, y, z;
    output reg [7:0] D;

    always @({x, y, z}) begin
        case({x, y, z})
            3'b000: D = 8'b00000001;
            3'b001: D = 8'b00000010;
            3'b010: D = 8'b00000100;
            3'b011: D = 8'b00001000;
            3'b100: D = 8'b00010000;
            3'b101: D = 8'b00100000;
            3'b110: D = 8'b01000000;
            3'b111: D = 8'b10000000;
            default: D = 8'b00000000;
        endcase
    end
endmodule

module week_2_tb_decoder_3X8;
    reg x, y, z;
    wire [7:0] D;

    // 디코더 모듈 호출
    decoder_3X8 uut(
        .x(x), .y(y), .z(z), .D(D)
    );

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

module priority_encoder_4to3(
    input [3:0] D,
    output x, y, v
);
    // 6.5에서 구한 K-map 논리식 적용
    assign x = D[3] | D[2];
    assign y = D[3] | (~D[2] & D[1]);
    assign v = D[3] | D[2] | D[1] | D[0];
endmodule

module week_2_tb_priority_encoder_4to3;
    reg [3:0] D;
    wire x, y, v;

    // 모듈 호출
    priority_encoder_4to3 uut(
        .D(D), .x(x), .y(y), .v(v)
    );

    initial begin
        // 6.6.1 케이스
        D = 4'b0000; #10;
        
        // 6.6.2 케이스
        D = 4'b1000; #10;
        
        // 6.6.3 케이스
        D = 4'b1011; #10;
        
        // 6.6.4 케이스
        D = 4'b0101; #10;
        
        // 6.6.5 케이스
        D = 4'b0001; #10;
        
        $finish;
    end
endmodule

module mux_8to1_4bit(
    input [3:0] I0, I1, I2, I3, I4, I5, I6, I7,
    input [2:0] S,
    output reg [3:0] Y
);
    always @(*) begin
        case(S)
            3'b000: Y = I0;
            3'b001: Y = I1;
            3'b010: Y = I2;
            3'b011: Y = I3;
            3'b100: Y = I4;
            3'b101: Y = I5;
            3'b110: Y = I6;
            3'b111: Y = I7;
            default: Y = 4'b0000;
        endcase
    end
endmodule

module week_2_tb_mux_8to1_4bit;
    reg [3:0] I0, I1, I2, I3, I4, I5, I6, I7;
    reg [2:0] S;
    wire [3:0] Y;

    mux_8to1_4bit uut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .I4(I4), .I5(I5), .I6(I6), .I7(I7),
        .S(S), .Y(Y)
    );

    initial begin
        // 임의의 4비트 입력 데이터 설정
        I0 = 4'b0000; // 0
        I1 = 4'b0011; // 3
        I2 = 4'b0101; // 5
        I3 = 4'b0111; // 7
        I4 = 4'b1001; // 9
        I5 = 4'b1011; // 11
        I6 = 4'b1101; // 13
        I7 = 4'b1111; // 15

        // 선택 신호(S) 000 ~ 111 순차 인가
        S = 3'b000; #10;
        S = 3'b001; #10;
        S = 3'b010; #10;
        S = 3'b011; #10;
        S = 3'b100; #10;
        S = 3'b101; #10;
        S = 3'b110; #10;
        S = 3'b111; #10;
        
        $finish;
    end
endmodule