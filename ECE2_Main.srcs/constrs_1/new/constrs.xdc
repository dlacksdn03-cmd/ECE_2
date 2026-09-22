# =========================================================
# 6.1 D flip-flop (D = DIP1, clock = SM_1, Q = LED1)
# =========================================================
# set_property PACKAGE_PIN Y1 [get_ports D]
# set_property IOSTANDARD LVCMOS33 [get_ports D]
# set_property PACKAGE_PIN K4 [get_ports clk]
# set_property IOSTANDARD LVCMOS33 [get_ports clk]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
# set_property PACKAGE_PIN L4 [get_ports Q]
# set_property IOSTANDARD LVCMOS33 [get_ports Q]


# =========================================================
# 6.2 J-K flip-flop (J = DIP1, K = DIP2, clock = SM_1, reset = SM_2, Q = LED1)
# =========================================================
# set_property PACKAGE_PIN Y1 [get_ports J]
# set_property IOSTANDARD LVCMOS33 [get_ports J]
# set_property PACKAGE_PIN W3 [get_ports K]
# set_property IOSTANDARD LVCMOS33 [get_ports K]
# set_property PACKAGE_PIN K4 [get_ports clk]
# set_property IOSTANDARD LVCMOS33 [get_ports clk]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
# set_property PACKAGE_PIN N8 [get_ports rst]
# set_property IOSTANDARD LVCMOS33 [get_ports rst]
# set_property PACKAGE_PIN L4 [get_ports Q]
# set_property IOSTANDARD LVCMOS33 [get_ports Q]


# =========================================================
# 6.3 T flip-flop [원샷 미적용] (T = DIP1, clock = SM_1, reset = SM_2, Q = LED1)
# =========================================================
# set_property PACKAGE_PIN Y1 [get_ports T]
# set_property IOSTANDARD LVCMOS33 [get_ports T]
# set_property PACKAGE_PIN K4 [get_ports clk]
# set_property IOSTANDARD LVCMOS33 [get_ports clk]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
# set_property PACKAGE_PIN N8 [get_ports rst]
# set_property IOSTANDARD LVCMOS33 [get_ports rst]
# set_property PACKAGE_PIN L4 [get_ports Q]
# set_property IOSTANDARD LVCMOS33 [get_ports Q]


# =========================================================
# 6.4 T flip-flop [원샷 적용] (T = DIP1, clock = SM_1, reset = SM_2, Q = LED1)
# =========================================================
# set_property PACKAGE_PIN Y1 [get_ports T]
# set_property IOSTANDARD LVCMOS33 [get_ports T]
# set_property PACKAGE_PIN K4 [get_ports clk]
# set_property IOSTANDARD LVCMOS33 [get_ports clk]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
# set_property PACKAGE_PIN N8 [get_ports rst]
# set_property IOSTANDARD LVCMOS33 [get_ports rst]
# set_property PACKAGE_PIN L4 [get_ports Q]
# set_property IOSTANDARD LVCMOS33 [get_ports Q]


# =========================================================
# 6.5 T flip-flop [원샷 적용, 메인 클럭] (T = DIP1, clock = Main_clock1, reset = SM_2, Q = LED1)
# =========================================================
 set_property PACKAGE_PIN Y1 [get_ports T]
 set_property IOSTANDARD LVCMOS33 [get_ports T]
 set_property PACKAGE_PIN B6 [get_ports clk]
 set_property IOSTANDARD LVCMOS33 [get_ports clk]
 set_property PACKAGE_PIN N8 [get_ports rst]
 set_property IOSTANDARD LVCMOS33 [get_ports rst]
 set_property PACKAGE_PIN L4 [get_ports Q]
 set_property IOSTANDARD LVCMOS33 [get_ports Q]