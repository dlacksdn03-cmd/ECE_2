`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/21 19:38:16
// Design Name: 
// Module Name: ECE2_4week
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DFF(
    input clk,
    input D,
    output reg Q
);
    // Clk이 posedge일 때 동작
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

`timescale 1ns / 1ps
module tb_DFF();
    reg clk, D;
    wire Q;

    DFF uut(.clk(clk), .D(D), .Q(Q));

    initial begin
        clk = 0; D = 0;
        // D를 0에서 1로 3회 변화
        #40 D = 1; #20 D = 0; // 1회
        #40 D = 1; #20 D = 0; // 2회
        #40 D = 1; #20 D = 0; // 3회
        #40 $finish;
    end

    // 클럭은 5ns마다 반전 (주기 10ns)
    always #5 clk = ~clk;
endmodule

module JKFF(
    input clk,
    input rst, // 초기화를 위한 리셋 추가
    input J,
    input K,
    output reg Q
);
    always @(posedge clk or negedge rst) begin
        if (!rst) 
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;       // No change
                2'b01: Q <= 1'b0;    // Reset[cite: 4]
                2'b10: Q <= 1'b1;    // Set[cite: 4]
                2'b11: Q <= ~Q;      // Complement (Toggle)[cite: 4]
            endcase
        end
    end
endmodule

`timescale 1ns / 1ps
module tb_JKFF();
    reg clk, rst, J, K;
    wire Q;

    JKFF uut(.clk(clk), .rst(rst), .J(J), .K(K), .Q(Q));

    initial begin
        clk = 0; rst = 1; J = 0; K = 0;
        #5 rst = 0; #5 rst = 1; // 초기화

        // 요구된 입력 순서 적용[cite: 4]
        #30 J = 0; K = 0;
        #30 J = 0; K = 1;
        #30 J = 0; K = 0;
        #30 J = 1; K = 0;
        #30 J = 0; K = 0;
        #30 J = 1; K = 1;
        #30 J = 0; K = 0;
        #30 $finish;
    end

    always #5 clk = ~clk;
endmodule

module TFF_basic(
    input clk,
    input rst,
    input T,
    output reg Q
);
    always @(posedge clk or negedge rst) begin
        if (!rst) 
            Q <= 1'b0;
        else if (T) 
            Q <= ~Q; // T가 1일 때 토글[cite: 4]
    end
endmodule

`timescale 1ns / 1ps
module tb_TFF_basic();
    reg clk, rst, T;
    wire Q;

    TFF_basic uut(.clk(clk), .rst(rst), .T(T), .Q(Q));

    initial begin
        clk = 0; rst = 1; T = 0;
        #5 rst = 0; #5 rst = 1;

        // T를 0에서 1로 3회 길게 변화 (비정상 다중 토글 관찰용)[cite: 4]
        #30 T = 1; #40 T = 0; // 1회
        #30 T = 1; #40 T = 0; // 2회
        #30 T = 1; #40 T = 0; // 3회
        #30 $finish;
    end

    always #5 clk = ~clk;
endmodule

module TFF_oneshot(
    input clk,
    input rst,
    input T,
    output reg Q
);
    reg T_reg, T_trig;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            Q <= 1'b0;
            T_reg <= 1'b0;
            T_trig <= 1'b0;
        end else begin
            T_reg <= T;
            T_trig <= T & ~T_reg; // 이전 값이 0이고 현재 값이 1일 때만 트리거 발생[cite: 4]
            if (T_trig) 
                Q <= ~Q;
        end
    end
endmodule

`timescale 1ns / 1ps
module tb_TFF_oneshot();
    reg clk, rst, T;
    wire Q;

    // 시뮬레이션 코드에는 내부 reg를 선언하지 않고 입출력만 기재합니다[cite: 4].
    TFF_oneshot uut(.clk(clk), .rst(rst), .T(T), .Q(Q));

    initial begin
        clk = 0; rst = 1; T = 0;
        #5 rst = 0; #5 rst = 1;

        // T를 0에서 1로 3회 길게 변화 (단일 토글 관찰용)[cite: 4]
        #30 T = 1; #40 T = 0; 
        #30 T = 1; #40 T = 0; 
        #30 T = 1; #40 T = 0; 
        #30 $finish;
    end

    always #5 clk = ~clk;
endmodule

