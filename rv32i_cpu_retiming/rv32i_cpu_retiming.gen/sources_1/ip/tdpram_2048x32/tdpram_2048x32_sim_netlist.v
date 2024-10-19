// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Sun Oct 20 02:25:32 2024
// Host        : tony running 64-bit Red Hat Enterprise Linux release 8.10 (Ootpa)
// Command     : write_verilog -force -mode funcsim
//               /home/tony/Desktop/riscv/rv32i_cpu_retiming/rv32i_cpu_retiming.gen/sources_1/ip/tdpram_2048x32/tdpram_2048x32_sim_netlist.v
// Design      : tdpram_2048x32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "tdpram_2048x32,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module tdpram_2048x32
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "tdpram_2048x32.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  tdpram_2048x32_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Lg5F1Zfiau3QeByGU2d8iLyq6c0Ay54VBRkPDiennEnh7TDqlDHQ30ugh+dQhv2UbRSQ4p1Rw5u0
jZgZUZmy1Br6WeCfAfENro2z0tYpE6huap6VYu8VXMMViOdpLZhd3Joz8MWf9Vkpz9O8GsaXV6w1
FT3lzzRx4ZlWqSymP/Y=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k67ldAp8HxMr9nrczAiQCAT2rtecidPnBUTDua4bP0PhBLrvQbOxphm7BiFhkHdGPiDgK6MdINUG
D//GaYQsWWpVUpGZfs8KXRKikvei6OQ4trNDIgpYU9T+zsDYIrvScWpep4H0Kh3R+s45gq7RnJ5m
vdUnaWHtpnFw5f3ARp9akA4O1XBR1BgUKzTCIe0UPAGCpWS1hK4aBQcxKu2PkOA+tPNAh3UV3BiZ
vZru2ov5N6bbEX7XHtyrDx4JovVQLfEIY+57bKNfzEEYKSjLOo5b7ftblU7gLeFmR30a6dQOMMgx
KzeWIzCpQemUcnoi/VEHbHGDt4HRBpIGifDODg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
i+RRRWsjfOwMRpKMUFh0IBcShI8yHuzdR43aSUy7WlXp2lerQDV/hI6ANfHItxdA5uJrEIK5wJiU
VgB5oYlKbVJ1BvZbui5wQoJkmW7IbzfMYtuEI22QXBHs019oGwhANUpCO9BetK/0TTzFxVnHtNOu
/LHdKkMBA0VUUUKT6VU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tFYGPovVzEoIrKrjTzB6ZqQ6KnkrcjUP1OIG5V7ru9HH8w5P8AlgATXl1Xl3Dc0sTv5AhUl86uI/
Te6q6PxhMPJoRhRB1vXyGzAjrWjA4CWJdMmVu8MWo5zod7cvpkzdrQp18aQTcCDQwlU1DmNGiEOo
zimuLuAUKe6AyAorB43/1QRQQqCxNB7BHRnOJAQDnoyMFVNrG12rKOA/sAyZpMLD4B6xJ7gH7QXT
AZuGXKyILGNZ45qXUr2Hw1p0w3wXMgy/YvUW8HbaHN4jAYcIe/ECoyXyKCAWdzANlF2rT2PeCMqV
QEbigoyqGX27Rm4To5kqLVbmwgAs2ChKUhPckA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR8YLkP+Cq0MiT1XckSgPvE9wroyAiBbeHMaKlLiOTx7yegD3rCMk4uetnkA7xdOCG95C0Od5pVH
e2YrEW06xFSOsWdDnQqKOKFYhTwAs147Ze0j25zjomr5m7CmawjMolxykzS96zChWImangU+6Dpu
mE/MKg5/kaC+7gqdMqPmK5P2lIX+ouok9XKxOokJuqD87QwEzDlFFh/qV9pd923yFRNG1c5yQCAY
jC0bWlxJRQo6nbEwBgMn8rC/mMABPH8uD2sMe1yaJv5P7sFeOf3cmAdUGQBGVHRKdpZ59LnHTu1K
InNoIfz9Mx01CNUYdTBr3X0w6fmS/h2C4MO1mA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qqgM6XiDSmuIOj2QmFL4f6puTJICjYjWzQLoNxU1gzCcXd5+ng75tjwe5w6urE45Df59LYjXr90N
xoD+v0GnCLOppWUn4S+1ojqBqn0qMLsvms3D9/dYenWKxpbEiFxbArUoCPmld0c++8yPVQ73qapG
1gDmjbWJO8ByYC0/tiugtOK/vE3jYVzEtxehN3MCFPsHGsspvaF3CdRsMas3tebV/SuH2XSAP8j+
fZhSi0u301RRmZ6mSAEqJK3He0Y91Z5ZQOd80417UBeLHaQiA9kHY2RWaBMXWHjx36IJNuIr/7jr
pqPYRD+g+IOGSYqYr2U+oVSWF/J6FaLGEFORSw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SLY1z3pfrH+89d+aYr8ZYKuGi1pV2B4YTh8mk4uHOGs4LKQ1igmeyM9GJBaMAmt5JcC96WDDnBw4
nB1kIjnCrjVv02nSbiHz+gz/GD9SP86nLzS9QkwUHgiEudWJ/8Fkv+fRer0hLWhtpFMq+QCQAqbX
Dy+Em4RhLOM5CQyRCxiExuROQRkGjH1tQtyz+peAX147pqTEtR9LrFRYUYEPXhtD9b7MSp46zgf4
lSI4aGfqhp6fXq48O+If4NBHVZAh8gHdbneSQhe7VWYJyFRn5NXB16YXAJLa4JQatsMczE+AmO09
k2OEByw2UvUNKGEaf4tNqeBnQNu8yAJKmMaRpQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
rHgksH8uRTUXMqfrbR/KpR7K/BN7+l1GGoZ5uBkIVJQ9E1b2f3VZJPrQ7S7VUrJ9W3clOpFEhjAM
Oc8jJzlnUOrbHfYO51LCZ66FccJgE3OjLaM/OzA3c72JbMeF05jEDKf4QdMRaIQwV0vXvFMXFbcg
CD7AuUhMJ/GWQx0JJmueM8RLvNdUcIDBkWoZcPsRFynLr8IfIXTFpVIdlFrvWDV9M+csfXnQIq6k
Y3z8TRciA00/EiKvOp6Eo50/kD4QjKDFCqzWcw9vpMR1S+mAW8D3yQQ3Mw+7TRW5DTmB7qmmS/LD
xKznKyYDNP9KJ8z4NfSZgy9kCEKF/AEOrpIJqnNaoA6HXh9YFegFhy9SpTPldFTNyW6JDzyY5DW1
hVFcYJFPmlT/ZDM7HC/yiWmfTZamjNjr6j6r4fX5ptKg03NOZ6yoiMqKwnvLDnRIQe9/S7fEOqdV
LqZswQByjnvoCBsrGYw6cNNfz5CW00eecKgkExyDTb2F/xuv6oGtNaRS

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oDWKuMa0YoA/U/QPkQrlE/kjfj1li0yqCn8MeJ3rAm2Z/2YKghA9gsxWs8xB4fe/adKSQ4aHEt1i
tUAxBkQYlT8XiaSFJIAVhNmuXgiEPZ20R+VwppLUjekdT7PC18dHecsi59XlgVJPcddzakFIoqXD
rk8iU8PsQ4WRTiUl44mpMR93K+emGu1nkBJznWpM1pH3aBODRmMjU7IigwOfmOnDjrCzVULW4z7V
2AuUO8AJxPTXjBkt8QkS+Lo97MZG0bItGmjC+mkr0BAz/l2ADPjOsfpKHAN3Qk4Crlkhpfgt7XT0
5KHCyECHiPkWrJah55lp7roA13m4EgPMJeM69w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rabaiFoR9bIj5CFcJ70CIsYI2myG5mevbxKcSzOpgQHZ4FX874h3Mvv4oNhB5aIwoXefnyix4Pas
3xk2ZBOqreX1vuZUYS7Nk3rT6wqN+/JYXGO7E9xfmFF/iTdL9heWc8JHcLe4e6B8B9QYhGlkRIbN
3etlFTSqKlO5nfA6dKX6Cd+yV3PZZfJXT4jlaY1rpqMPaBtlHWQ7D4o1gO+mHgP0sOQ4bpowU+7Q
jMr0tYghyxsfIddTxrVE0fwZeg1qWlo+iSU1PAJGRVMKIAn7NZ4i8f+ed6NJKt2vGjDFfZXLXClO
nyA+xb6K3aWY3lMR6qP8qDkKAJJZe9Y36MRGng==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpnCRmSw3bCoDXuz4ACuAPPPaMheVpOmUjnTbTAMOWU5UsZtyDXZeGV8/oIsADVazSxLQZSBGgiy
SKvVnFKfYB7AgQDUMZFw0rVRtHiVMwSzKWeKD6RAhsC0bPj9SvO7LAbMlPup0Bqp/B+25di0U3gR
HcJdPJAve7xMFNBSYWEA8qxoNxWNshmZSjI/bZ357HlFVPisa6jUUqfB1NL8is8ZUS6S+cNLQyEf
tij0AWwPrqG8naFrpTzHWE6VrXYG5oNftxQbYOQR6HjuL4cx/R64+btFaWdnBHup1adCO/sGxhdd
Dd1b6OQ/2YtZTyp2K8aDHbceCM5X1/8CZdRU5g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47776)
`pragma protect data_block
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
4kcUMD53pZR46Q==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
