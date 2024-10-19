// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Sun Oct 20 02:25:32 2024
// Host        : tony running 64-bit Red Hat Enterprise Linux release 8.10 (Ootpa)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ tdpram_2048x32_sim_netlist.v
// Design      : tdpram_2048x32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "tdpram_2048x32,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47888)
`pragma protect data_block
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
+rpVZ8O3eaw=
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
