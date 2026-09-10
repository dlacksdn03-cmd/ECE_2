#=====================================================
#4비트 비교기
# Input A (DIP 1~4)
set_property PACKAGE_PIN Y1 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN W3 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN U2 [get_ports {a[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property PACKAGE_PIN T1 [get_ports {a[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]

# Input B (DIP 5~8)
set_property PACKAGE_PIN W4 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN W1 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN V4 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN U4 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

# Outputs (LED 1~3)
set_property PACKAGE_PIN L4 [get_ports x]
set_property IOSTANDARD LVCMOS33 [get_ports x]
set_property PACKAGE_PIN M4 [get_ports y]
set_property IOSTANDARD LVCMOS33 [get_ports y]
set_property PACKAGE_PIN M2 [get_ports z]
set_property IOSTANDARD LVCMOS33 [get_ports z]
#=========================================================
##3to 8 디코더
## Inputs (DIP 1~3에 x, y, z 연결)
#set_property PACKAGE_PIN Y1 [get_ports x]
#set_property IOSTANDARD LVCMOS33 [get_ports x]
#set_property PACKAGE_PIN W3 [get_ports y]
#set_property IOSTANDARD LVCMOS33 [get_ports y]
#set_property PACKAGE_PIN U2 [get_ports z]
#set_property IOSTANDARD LVCMOS33 [get_ports z]

## Outputs (LED 1~8에 디코더 출력 D[0]~D[7] 연결)
#set_property PACKAGE_PIN L4 [get_ports {D[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[0]}]
#set_property PACKAGE_PIN M4 [get_ports {D[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
#set_property PACKAGE_PIN M2 [get_ports {D[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
#set_property PACKAGE_PIN N7 [get_ports {D[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]
#set_property PACKAGE_PIN M7 [get_ports {D[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[4]}]
#set_property PACKAGE_PIN M3 [get_ports {D[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[5]}]
#set_property PACKAGE_PIN M1 [get_ports {D[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[6]}]
#set_property PACKAGE_PIN N5 [get_ports {D[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[7]}]

#===============================================
##4 to 3 우선순위 인코더
## Inputs (DIP 1~4에 인코더 입력 D[0]~D[3] 연결)
#set_property PACKAGE_PIN Y1 [get_ports {D[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[0]}]
#set_property PACKAGE_PIN W3 [get_ports {D[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
#set_property PACKAGE_PIN U2 [get_ports {D[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
#set_property PACKAGE_PIN T1 [get_ports {D[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]

## Outputs (LED 1~3에 x, y, v 연결)
#set_property PACKAGE_PIN L4 [get_ports x]
#set_property IOSTANDARD LVCMOS33 [get_ports x]
#set_property PACKAGE_PIN M4 [get_ports y]
#set_property IOSTANDARD LVCMOS33 [get_ports y]
#set_property PACKAGE_PIN M2 [get_ports v]
#set_property IOSTANDARD LVCMOS33 [get_ports v]

#============================================
##8 to 1 4비트 MUX
## 선택 신호 S[2:0] (DIP 스위치 1 ~ 3 연결)
#set_property PACKAGE_PIN Y1 [get_ports {S[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
#set_property PACKAGE_PIN W3 [get_ports {S[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
#set_property PACKAGE_PIN U2 [get_ports {S[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]

## 출력 Y[3:0] (LED 1 ~ 4 연결)
#set_property PACKAGE_PIN L4 [get_ports {Y[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Y[0]}]
#set_property PACKAGE_PIN M4 [get_ports {Y[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Y[1]}]
#set_property PACKAGE_PIN M2 [get_ports {Y[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Y[2]}]
#set_property PACKAGE_PIN N7 [get_ports {Y[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Y[3]}]