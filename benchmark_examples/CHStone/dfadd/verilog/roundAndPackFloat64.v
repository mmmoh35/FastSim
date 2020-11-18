// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module roundAndPackFloat64 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zSign,
        zExp,
        zSig,
        float_exception_flag_i,
        float_exception_flag_o,
        float_exception_flag_o_ap_vld,
        ap_return
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [0:0] zSign;
input  [11:0] zExp;
input  [63:0] zSig;
input  [31:0] float_exception_flag_i;
output  [31:0] float_exception_flag_o;
output   float_exception_flag_o_ap_vld;
output  [63:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] float_exception_flag_o;
reg float_exception_flag_o_ap_vld;
reg[63:0] ap_return;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [9:0] roundBits_fu_139_p1;
wire   [0:0] tmp_s_fu_143_p2;
reg   [0:0] tmp_s_reg_427;
wire   [0:0] tmp_1_fu_149_p2;
reg   [0:0] tmp_1_reg_431;
wire   [0:0] tmp_2_fu_155_p2;
reg   [0:0] tmp_2_reg_435;
wire   [0:0] tmp_7_fu_167_p3;
reg   [0:0] tmp_7_reg_439;
wire   [11:0] count_assign_fu_183_p2;
reg   [11:0] count_assign_reg_446;
wire   [0:0] tmp_15_fu_175_p3;
wire   [63:0] tmp_30_i9_fu_209_p2;
wire   [63:0] z_fu_261_p3;
wire    ap_CS_fsm_state2;
wire   [9:0] roundBits_2_fu_279_p3;
wire   [53:0] zSig_assign_2_fu_359_p2;
reg   [53:0] zSig_assign_2_reg_472;
wire    ap_CS_fsm_state3;
reg   [63:0] zSig_assign1_reg_90;
reg   [11:0] zExp_assign_1_reg_101;
reg   [9:0] roundBits_1_reg_115;
reg   [63:0] ap_phi_mux_p_0_phi_fu_129_p4;
reg   [63:0] p_0_reg_126;
wire   [63:0] tmp_30_i8_fu_394_p2;
wire    ap_CS_fsm_state4;
wire   [0:0] tmp_3_fu_287_p2;
wire   [0:0] tmp_5_fu_305_p2;
wire   [31:0] float_exception_flag_2_fu_189_p2;
wire   [31:0] float_exception_flag_4_fu_293_p2;
wire   [31:0] tmp_8_fu_311_p2;
wire   [63:0] tmp_4_fu_161_p2;
wire   [63:0] tmp_i_fu_201_p3;
wire   [63:0] tmp_6_i_fu_215_p1;
wire   [5:0] tmp_16_fu_223_p1;
wire   [63:0] tmp_i3_fu_226_p1;
wire   [63:0] tmp_1_i_fu_230_p2;
wire   [63:0] tmp_7_i_fu_218_p2;
wire   [0:0] tmp_17_fu_241_p1;
wire   [0:0] tmp_2_i_fu_235_p2;
wire   [62:0] tmp_11_i_fu_251_p4;
wire   [0:0] tmp_10_i_fu_245_p2;
wire   [8:0] tmp_fu_269_p4;
wire   [63:0] tmp_9_fu_323_p2;
wire   [0:0] tmp_6_fu_339_p2;
wire   [31:0] tmp_10_fu_345_p1;
wire   [31:0] tmp_11_fu_349_p2;
wire   [53:0] zSig_assign_1_cast_fu_329_p4;
wire  signed [53:0] tmp_21_cast_fu_355_p1;
wire   [0:0] tmp_12_fu_365_p2;
wire   [11:0] tmp_13_fu_370_p3;
wire   [63:0] tmp_28_i_fu_378_p3;
wire   [63:0] tmp_29_i_fu_386_p4;
reg   [63:0] ap_return_preg;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_return_preg = 64'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_preg <= ap_phi_mux_p_0_phi_fu_129_p4;
        end   
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_427 == 1'd0) | (((tmp_2_reg_435 == 1'd0) & (tmp_1_reg_431 == 1'd0)) | ((tmp_7_reg_439 == 1'd0) & (tmp_1_reg_431 == 1'd0)))))) begin
        p_0_reg_126 <= tmp_30_i8_fu_394_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_1_fu_149_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd1) & (tmp_2_fu_155_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1))))) begin
        p_0_reg_126 <= tmp_30_i9_fu_209_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((((ap_start == 1'b1) & (tmp_s_fu_143_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_15_fu_175_p3 == 1'd0) & (tmp_2_fu_155_p2 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_15_fu_175_p3 == 1'd0) & (tmp_7_fu_167_p3 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)))))) begin
        roundBits_1_reg_115 <= roundBits_fu_139_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        roundBits_1_reg_115 <= roundBits_2_fu_279_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((((ap_start == 1'b1) & (tmp_s_fu_143_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_15_fu_175_p3 == 1'd0) & (tmp_2_fu_155_p2 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_15_fu_175_p3 == 1'd0) & (tmp_7_fu_167_p3 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)))))) begin
        zExp_assign_1_reg_101 <= zExp;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        zExp_assign_1_reg_101 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((((ap_start == 1'b1) & (tmp_s_fu_143_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_15_fu_175_p3 == 1'd0) & (tmp_2_fu_155_p2 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_15_fu_175_p3 == 1'd0) & (tmp_7_fu_167_p3 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)))))) begin
        zSig_assign1_reg_90 <= zSig;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        zSig_assign1_reg_90 <= z_fu_261_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_2_fu_155_p2 == 1'd0) & (tmp_15_fu_175_p3 == 1'd1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd0) & (tmp_15_fu_175_p3 == 1'd1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1))))) begin
        count_assign_reg_446 <= count_assign_fu_183_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (tmp_s_fu_143_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_1_reg_431 <= tmp_1_fu_149_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_2_reg_435 <= tmp_2_fu_155_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (tmp_2_fu_155_p2 == 1'd1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_7_reg_439 <= tmp_4_fu_161_p2_temp111;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_s_reg_427 <= tmp_s_fu_143_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        zSig_assign_2_reg_472 <= zSig_assign_2_fu_359_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_427 == 1'd0) | (((tmp_2_reg_435 == 1'd0) & (tmp_1_reg_431 == 1'd0)) | ((tmp_7_reg_439 == 1'd0) & (tmp_1_reg_431 == 1'd0)))))) begin
        ap_phi_mux_p_0_phi_fu_129_p4 = tmp_30_i8_fu_394_p2;
    end else begin
        ap_phi_mux_p_0_phi_fu_129_p4 = p_0_reg_126;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return = ap_phi_mux_p_0_phi_fu_129_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((tmp_5_fu_305_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        float_exception_flag_o = tmp_8_fu_311_p2;
    end else if (((tmp_3_fu_287_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        float_exception_flag_o = float_exception_flag_4_fu_293_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_1_fu_149_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd1) & (tmp_2_fu_155_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1))))) begin
        float_exception_flag_o = float_exception_flag_2_fu_189_p2;
    end else begin
        float_exception_flag_o = float_exception_flag_i;
    end
end

always @ (*) begin
    if ((((tmp_5_fu_305_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_3_fu_287_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_1_fu_149_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd1) & (tmp_2_fu_155_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1)))))) begin
        float_exception_flag_o_ap_vld = 1'b1;
    end else begin
        float_exception_flag_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_1_fu_149_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd1) & (tmp_2_fu_155_p2 == 1'd1) & (tmp_s_fu_143_p2 == 1'd1))))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (((tmp_2_fu_155_p2 == 1'd0) & (tmp_15_fu_175_p3 == 1'd1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1)) | ((tmp_7_fu_167_p3 == 1'd0) & (tmp_15_fu_175_p3 == 1'd1) & (tmp_1_fu_149_p2 == 1'd0) & (tmp_s_fu_143_p2 == 1'd1))))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_s_fu_143_p2 == 1'd0) | (((tmp_15_fu_175_p3 == 1'd0) & (tmp_2_fu_155_p2 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0)) | ((tmp_15_fu_175_p3 == 1'd0) & (tmp_7_fu_167_p3 == 1'd0) & (tmp_1_fu_149_p2 == 1'd0)))))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign tmp_4_fu_161_p2_temp111 = tmp_4_fu_161_p2_temp121 & 1'd1;
assign tmp_4_fu_161_p2_temp121 = tmp_4_fu_161_p2 >> 1'd63;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign count_assign_fu_183_p2 = (12'd0 - zExp);

assign float_exception_flag_2_fu_189_p2 = (float_exception_flag_i | 32'd9);

assign float_exception_flag_4_fu_293_p2 = (float_exception_flag_i | 32'd4);

//assign roundBits_2_fu_279_p3 = {{tmp_fu_269_p4}, {tmp_10_i_fu_245_p2}};
assign roundBits_2_fu_279_p3 = tmp_fu_269_p4_temp151 |tmp_10_i_fu_245_p2_temp151;
assign tmp_fu_269_p4_temp151 = tmp_fu_269_p4 << 1'd1;
assign tmp_10_i_fu_245_p2_temp151 = tmp_10_i_fu_245_p2 & 1'd1;

assign roundBits_fu_139_p1 = zSig & 11'd1023;

assign tmp_10_fu_345_p1 = tmp_6_fu_339_p2;

assign tmp_10_i_fu_245_p2 = (tmp_2_i_fu_235_p2 | tmp_17_fu_241_p1);

assign tmp_11_fu_349_p2 = (tmp_10_fu_345_p1 ^ 32'd4294967295);

//assign tmp_11_i_fu_251_p4 = {{tmp_7_i_fu_218_p2[63:1]}};
assign tmp_11_i_fu_251_p4 = tmp_7_i_fu_218_p2_temp131 >> 1'd1;
assign tmp_7_i_fu_218_p2_temp131 = tmp_7_i_fu_218_p2 & 63'd18446744073709551614;

assign tmp_12_fu_365_p2 = ((zSig_assign_2_reg_472 == 54'd0) ? 1'b1 : 1'b0);

assign tmp_13_fu_370_p3 = ((tmp_12_fu_365_p2_temp101 === 1'b1) ? 12'd0 : zExp_assign_1_reg_101);
assign tmp_12_fu_365_p2_temp101 = tmp_12_fu_365_p2 & 1'd1;

//assign tmp_15_fu_175_p3 = zExp[32'd11];
assign tmp_15_fu_175_p3 = zExp_temp131 & 1'd1;
assign zExp_temp131 = zExp >> 4'd11;

assign tmp_16_fu_223_p1 = zExp & 6'd63;

assign tmp_17_fu_241_p1 = tmp_7_i_fu_218_p2 & 1'd1;

assign tmp_1_fu_149_p2 = (($signed(zExp) > $signed(12'd2045)) ? 1'b1 : 1'b0);

assign tmp_1_i_fu_230_p2 = zSig << tmp_i3_fu_226_p1;

assign tmp_21_cast_fu_355_p1 = $signed(tmp_11_fu_349_p2);

//assign tmp_28_i_fu_378_p3 = {{tmp_13_fu_370_p3}, {52'd0}};
assign tmp_28_i_fu_378_p3 = tmp_13_fu_370_p3 << 6'd52;

//assign tmp_29_i_fu_386_p4 = {{{zSign}, {9'd0}}, {zSig_assign_2_reg_472}};
assign tmp_29_i_fu_386_p4 = zSign_temp151 | zSig_assign_2_reg_472;
assign zSign_temp151 = zSign_temp161 << 6'd54;
assign zSign_temp161 = zSign << 3'd9;

assign tmp_2_fu_155_p2 = ((zExp == 12'd2045) ? 1'b1 : 1'b0);

assign tmp_2_i_fu_235_p2 = ((tmp_1_i_fu_230_p2 != 64'd0) ? 1'b1 : 1'b0);

assign tmp_30_i8_fu_394_p2 = (tmp_28_i_fu_378_p3 + tmp_29_i_fu_386_p4);

assign tmp_30_i9_fu_209_p2 = (tmp_i_fu_201_p3 | 64'd9218868437227405312);

assign tmp_3_fu_287_p2 = ((roundBits_2_fu_279_p3 == 10'd0) ? 1'b1 : 1'b0);

assign tmp_4_fu_161_p2 = (zSig + 64'd512);

assign tmp_5_fu_305_p2 = ((roundBits_1_reg_115 == 10'd0) ? 1'b1 : 1'b0);

assign tmp_6_fu_339_p2 = ((roundBits_1_reg_115 == 10'd512) ? 1'b1 : 1'b0);

assign tmp_6_i_fu_215_p1 = count_assign_reg_446;

assign tmp_7_fu_167_p3 = tmp_4_fu_161_p2_temp131 & 1'd1;
assign tmp_4_fu_161_p2_temp131 = tmp_4_fu_161_p2 >> 6'd63;

assign tmp_7_i_fu_218_p2 = zSig >> tmp_6_i_fu_215_p1;

assign tmp_8_fu_311_p2 = (float_exception_flag_i | 32'd1);

assign tmp_9_fu_323_p2 = (zSig_assign1_reg_90 + 64'd512);

//assign tmp_fu_269_p4 = {{tmp_7_i_fu_218_p2[9:1]}};
assign tmp_fu_269_p4 = tmp_7_i_fu_218_p2 >> 1'd1;
assign tmp_7_i_fu_218_p2_temp121 = tmp_7_i_fu_218_p2 & 11'd1022;

assign tmp_i3_fu_226_p1 = tmp_16_fu_223_p1;

assign tmp_i_fu_201_p3 = zSign << 6'd63;

assign tmp_s_fu_143_p2 = ((zExp > 12'd2044) ? 1'b1 : 1'b0);

//assign zSig_assign_1_cast_fu_329_p4 = {{tmp_9_fu_323_p2[63:10]}};
assign zSig_assign_1_cast_fu_329_p4 = tmp_9_fu_323_p2_temp131 >> 1'd10;
assign tmp_9_fu_323_p2_temp131 = tmp_9_fu_323_p2 & 54'd18446744073709550592;

assign zSig_assign_2_fu_359_p2 = (zSig_assign_1_cast_fu_329_p4 & tmp_21_cast_fu_355_p1);

//assign z_fu_261_p3 = {{tmp_11_i_fu_251_p4}, {tmp_10_i_fu_245_p2}};
assign z_fu_261_p3 = tmp_11_i_fu_251_p4_temp141 | tmp_10_i_fu_245_p2_temp141;
assign tmp_11_i_fu_251_p4_temp141 = tmp_11_i_fu_251_p4 << 1'd1;
assign tmp_10_i_fu_245_p2_temp141 = tmp_10_i_fu_245_p2 & 1'd1;

endmodule //roundAndPackFloat64
