 /*                                                                      
 Copyright 2018 Nuclei System Technology, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  The files to include all the macro defines
//
// ====================================================================
`include "config.v"

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// ISA relevant macro
//
/*
Comment by Chao Wang

E203_ADDR_SIZE_IS_32
  配置 E203 核的物理地址位宽宏
E203_PC_SIZE_IS_32
  配置 E203 核的 PC 位宽宏
E203_ADDR_SIZE
  配置 E203 核的物理地址位宽
E203_PC_SIZE
  配置 E203 核的 PC 位宽
*/
`ifdef E203_CFG_ADDR_SIZE_IS_16
   `define E203_ADDR_SIZE_IS_16
   `define E203_PC_SIZE_IS_16
   `define E203_ADDR_SIZE   16
   `define E203_PC_SIZE     16
`endif
`ifdef E203_CFG_ADDR_SIZE_IS_32
   `define E203_ADDR_SIZE_IS_32
   `define E203_PC_SIZE_IS_32
   `define E203_ADDR_SIZE   32
   `define E203_PC_SIZE     32
`endif
`ifdef E203_CFG_ADDR_SIZE_IS_24
   `define E203_ADDR_SIZE_IS_24
   `define E203_PC_SIZE_IS_24
   `define E203_ADDR_SIZE   24
   `define E203_PC_SIZE     24
`endif


/*
Comment by Chao Wang

从这里可以看出 E203 核取消了 E203_CFG_SUPPORT_MSCRATCH 宏，E203 核一直支持 MSCRATCH
*/
//`ifdef E203_CFG_SUPPORT_MSCRATCH
   `define E203_SUPPORT_MSCRATCH 
//`endif
/*
Comment by Chao Wang

从这里可以看出 E203 核取消了 E203_CFG_SUPPORT_MTVEC 宏（已经从config文件中删除），E203 核一直支持 MTVEC
*/
//`ifdef E203_CFG_SUPPORT_MTVEC
   `define E203_SUPPORT_MTVEC
//`endif
/*
Comment by Chao Wang

以下是根据 E203_CFG_SUPPORT_MCYCLE_MINSTRET 宏
配置 E203_SUPPORT_MCYCLE_MINSTRET 宏
*/
`ifdef E203_CFG_SUPPORT_MCYCLE_MINSTRET
   `define E203_SUPPORT_MCYCLE_MINSTRET 
`endif


/*
Comment by Chao Wang

E203_XLEN_IS_32
E203_XLEN
  XLEN 指的是 E203 核中整数的长度
*/
`define E203_CFG_XLEN_IS_32
`ifdef E203_CFG_XLEN_IS_32//{
  `define E203_XLEN_IS_32 
  `define E203_XLEN          32
`endif//}

/*
Comment by Chao Wang

E203_INSTR_SIZE
  配置 E203 核的指令位宽
*/
`define E203_INSTR_SIZE    32

//
/*
Comment by Chao Wang

E203_RFIDX_WIDTH
  RFIDX 是 Register File IDdeX 的缩写，配置 E203 核的寄存器地址位宽
E203_RFREG_NUM_IS_32
  配置 E203 核的寄存器数量宏
E203_RFREG_NUM
  配置 E203 核的寄存器数量
*/
`define E203_RFIDX_WIDTH   5
`ifdef E203_CFG_REGNUM_IS_32//{
  `define E203_RFREG_NUM_IS_32 
  `define E203_RFREG_NUM     32
`endif//}
`ifdef E203_CFG_REGNUM_IS_16//{
  `define E203_RFREG_NUM_IS_16 
  `define E203_RFREG_NUM     16
`endif//}
`ifdef E203_CFG_REGNUM_IS_8//{
  `define E203_RFREG_NUM_IS_8 
  `define E203_RFREG_NUM     8
`endif//}
`ifdef E203_CFG_REGNUM_IS_4//{
  `define E203_RFREG_NUM_IS_4 
  `define E203_RFREG_NUM     4
`endif//}

/*
Comment by Chao Wang

以下是根据 E203_CFG_REGFILE_LATCH_BASED 宏
配置 E203_REGFILE_LATCH_BASED 宏
*/
`ifdef E203_CFG_REGFILE_LATCH_BASED//{
    `ifndef FPGA_SOURCE//{ Only If there is not on FPGA
        `define E203_REGFILE_LATCH_BASED 
    `endif//}
`endif//}

/*
Comment by Chao Wang

根据 config 配置物理基地址
*/
`define E203_PPI_ADDR_BASE    `E203_CFG_PPI_ADDR_BASE  
`define E203_PPI_BASE_REGION  `E203_CFG_PPI_BASE_REGION
`define E203_CLINT_ADDR_BASE    `E203_CFG_CLINT_ADDR_BASE  
`define E203_CLINT_BASE_REGION  `E203_CFG_CLINT_BASE_REGION
`define E203_PLIC_ADDR_BASE    `E203_CFG_PLIC_ADDR_BASE  
`define E203_PLIC_BASE_REGION  `E203_CFG_PLIC_BASE_REGION
`define E203_FIO_ADDR_BASE    `E203_CFG_FIO_ADDR_BASE  
`define E203_FIO_BASE_REGION  `E203_CFG_FIO_BASE_REGION
                              
`define E203_DTCM_ADDR_BASE   `E203_CFG_DTCM_ADDR_BASE 
`define E203_ITCM_ADDR_BASE   `E203_CFG_ITCM_ADDR_BASE 
                             



/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// Interface relevant macro
//
/*
Comment by Chao Wang

E203_HART_NUM
  配置值为 1
E203_HART_ID_W
  配置值为 1
  HART 是 Highway Addressable Remote Transducer 的缩写，是一种设备之间的通信协议
  E203_HART_NUM 应该是指示 单核/多核
  E203_HART_ID_W 含义暂不清楚
E203_LIRQ_NUM
E203_EVT_NUM
  含义暂时不清楚
*/
`define E203_HART_NUM   1
`define E203_HART_ID_W  1
`define E203_LIRQ_NUM   1
`define E203_EVT_NUM    1

/*
Comment by Chao Wang

E203_DEBUG_HAS_DM
  含义暂时不清楚
*/
`define E203_CFG_DEBUG_HAS_DM
`ifdef E203_CFG_DEBUG_HAS_DM//{
   `define E203_DEBUG_HAS_DM 
`endif//}

/*
Comment by Chao Wang

以下是根据 E203_CFG_IRQ_NEED_SYNC 宏
配置 E203_IRQ_NEED_SYNC 宏
*/
`ifdef E203_CFG_IRQ_NEED_SYNC//{
   `define E203_IRQ_NEED_SYNC 
`endif//}

/*
Comment by Chao Wang

以下是根据 E203_CFG_DEBUG_HAS_JTAG 宏
配置 E203_DEBUG_HAS_JTAG 宏
*/
`ifdef E203_CFG_DEBUG_HAS_JTAG//{
   `define E203_DEBUG_HAS_JTAG 
`endif//}

/*
Comment by Chao Wang

E203_HAS_MEM_ITF
E203_SYSMEM_DATA_WIDTH_IS_32
E203_SYSMEM_DATA_WIDTH
  功能暂不清楚
*/
`define E203_HAS_MEM_ITF
`define E203_CFG_SYSMEM_DATA_WIDTH_IS_32
`ifdef E203_CFG_SYSMEM_DATA_WIDTH_IS_32
    `define E203_SYSMEM_DATA_WIDTH_IS_32
    `define E203_SYSMEM_DATA_WIDTH   32
`endif
`ifdef E203_CFG_SYSMEM_DATA_WIDTH_IS_64
    `define E203_SYSMEM_DATA_WIDTH_IS_64
    `define E203_SYSMEM_DATA_WIDTH   64
`endif

//`ifdef E203_CFG_HAS_FIO//{
//  `define E203_HAS_FIO 
//`endif//}

/*
Comment by Chao Wang

E203_HAS_PPI
E203_HAS_PLIC
E203_HAS_CLINT
E203_HAS_FIO
  配置相应的物理部件
*/
`define E203_HAS_PPI 
`define E203_HAS_PLIC 
`define E203_HAS_CLINT 
`define E203_HAS_FIO 

/*
Comment by Chao Wang

ECC 和 EAI 只是预留选项，没有实现
*/
`ifdef E203_CFG_HAS_ECC//{
`endif//}
`ifdef E203_CFG_HAS_EAI//{
`endif//}

/*
Comment by Chao Wang

LOCKSTEP 含义不清楚，也没有实现
*/
`ifdef E203_CFG_HAS_LOCKSTEP//{
`endif//}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// ITCM relevant macro
//
/*
Comment by Chao Wang

ITCM 相关配置：
  E203_HAS_ITCM
    配置 E203 核使用 ITCM，含义暂不确定，可能是指有几个 ITCM
    配置值为 1
  E203_ITCM_ADDR_WIDTH
    配置通过 ICB 访问 ITCM 的地址位宽
    配置值为 16
  E203_ITCM_RAM_DP
    说明 ITCM 使用 RAM 实现，DP 是 depth 的缩写，配置 ITCM 深度
    ITCM 字长是 64 bits，大小是 2 ^ addr_width 字节，所以深度是 2 ^ addr_width / 8
    配置值为 2 ^ 13
  E203_ITCM_RAM_AW
    AW 是 Address Width 的缩写，它这么长的地址索引一个字，就像 E203_ITCM_ADDR_WIDTH 
    这么长的地址每次索引一个字节一样
    配置值为 13
  E203_ITCM_BASE_REGION
    REGION 指高位，固定高位，低位变动则表示一块大小，这里是 15:0 变动，则
    大小是 2 ^ 16 字节，64 KB
    配置值为 31：16
  E203_ITCM_DATA_WIDTH_IS_64
    配置 ITCM 字长是 8 个字节
  E203_ITCM_DATA_WIDTH
    配置值为为 64
  E203_ITCM_WMSK_WIDTH
    含义不明确
    配置值为 8
  E203_ITCM_RAM_ECC_DW
    配置值为 8，ECC 没有代码实现
  E203_ITCM_RAM_ECC_MW
    配置值为 1，ECC 没有代码实现
  E203_ITCM_RAM_DW
    DW 是 Data Width 的缩写
    配置为 64 比特
  E203_ITCM_RAM_MW
    含义不清楚，但是意思是用 8 个比特去说明 8 个字节是否有效
    配置值为 8
  E203_ITCM_OUTS_NUM
    ITCM 输出端口数量
    配置值为 1
  E203_HAS_ITCM_EXTITF
    EXTITF 是 External interface 的意思，意指通过 ICB 总线访问。
    配置可以使用扩展接口访问 ITCM
*/
`ifdef E203_CFG_HAS_ITCM//{
  `define E203_HAS_ITCM 1
  `define E203_ITCM_ADDR_WIDTH  `E203_CFG_ITCM_ADDR_WIDTH
  // The ITCM size is 2^addr_width bytes, and ITCM is 64bits wide (8 bytes)
  //  so the DP is 2^addr_wdith/8
  //  so the AW is addr_wdith - 3
  `define E203_ITCM_RAM_DP      (1<<(`E203_CFG_ITCM_ADDR_WIDTH-3)) 
  `define E203_ITCM_RAM_AW          (`E203_CFG_ITCM_ADDR_WIDTH-3) 
  `define E203_ITCM_BASE_REGION  `E203_ADDR_SIZE-1:`E203_ITCM_ADDR_WIDTH
  
  `define E203_CFG_ITCM_DATA_WIDTH_IS_64
  `ifdef E203_CFG_ITCM_DATA_WIDTH_IS_64
    `define E203_ITCM_DATA_WIDTH_IS_64
    `define E203_ITCM_DATA_WIDTH  64
    `define E203_ITCM_WMSK_WIDTH  8
  
    `define E203_ITCM_RAM_ECC_DW  8
    `define E203_ITCM_RAM_ECC_MW  1
  `endif
/*
Comment by Chao Wang

E203_HAS_ECC
  因为 ECC 没有实现，所以未定义
*/
  `ifndef E203_HAS_ECC //{
    `define E203_ITCM_RAM_DW      `E203_ITCM_DATA_WIDTH
    `define E203_ITCM_RAM_MW      `E203_ITCM_WMSK_WIDTH
    `define E203_ITCM_OUTS_NUM 1 // If no-ECC, ITCM is 1 cycle latency then only allow 1 oustanding for external agent
  `endif//}

  `define E203_HAS_ITCM_EXTITF
`endif//}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// DTCM relevant macro
//
/*
Comment by Chao Wang

DTCM 相关配置：
  E203_HAS_DTCM
    配置 E203 核使用 DTCM，含义暂不确定，可能是指有几个 DTCM
    配置值为 1
  E203_DTCM_ADDR_WIDTH
    配置通过 ICB 访问 DTCM 的地址位宽
    配置值为 16
  E203_DTCM_RAM_DP
    说明 DTCM 使用 RAM 实现，DP 是 depth 的缩写，配置 DTCM 深度
    DTCM 字长是 64 bits，大小是 2 ^ addr_width 字节，所以深度是 2 ^ addr_width / 8
    配置值为 2 ^ 13
  E203_DTCM_RAM_AW
    AW 是 Address Width 的缩写，它这么长的地址索引一个字，就像 E203_DTCM_ADDR_WIDTH 
    这么长的地址每次索引一个字节一样
    配置值为 13
  E203_DTCM_BASE_REGION
    REGION 指高位，固定高位，低位变动则表示一块大小，这里是 15:0 变动，则
    大小是 2 ^ 16 字节，64 KB
    配置值为 31：16
  E203_DTCM_DATA_WIDTH_IS_64
    配置 DTCM 字长是 8 个字节
  E203_DTCM_DATA_WIDTH
    配置值为为 64
  E203_DTCM_WMSK_WIDTH
    含义不明确
    配置值为 8
  E203_DTCM_RAM_ECC_DW
    配置值为 8，ECC 没有代码实现
  E203_DTCM_RAM_ECC_MW
    配置值为 1，ECC 没有代码实现
  E203_DTCM_RAM_DW
    DW 是 Data Width 的缩写
    配置为 64 比特
  E203_DTCM_RAM_MW
    含义不清楚，但是意思是用 8 个比特去说明 8 个字节是否有效
    配置值为 8
  E203_DTCM_OUTS_NUM
    DTCM 输出端口数量
    配置值为 1
  E203_HAS_DTCM_EXTITF
    EXTITF 是 External interface 的意思，意指通过 ICB 总线访问。
    配置可以使用扩展接口访问 DTCM
*/
`ifdef E203_CFG_HAS_DTCM//{
  `define E203_HAS_DTCM 1
  `define E203_DTCM_ADDR_WIDTH  `E203_CFG_DTCM_ADDR_WIDTH
  // The DTCM size is 2^addr_width bytes, and DTCM is 32bits wide (4 bytes)
  //  so the DP is 2^addr_wdith/4
  //  so the AW is addr_wdith - 2
  `define E203_DTCM_RAM_DP      (1<<(`E203_CFG_DTCM_ADDR_WIDTH-2)) 
  `define E203_DTCM_RAM_AW          (`E203_CFG_DTCM_ADDR_WIDTH-2) 
  `define E203_DTCM_BASE_REGION `E203_ADDR_SIZE-1:`E203_DTCM_ADDR_WIDTH
  
    `define E203_DTCM_DATA_WIDTH  32
    `define E203_DTCM_WMSK_WIDTH  4
  
    `define E203_DTCM_RAM_ECC_DW  7
    `define E203_DTCM_RAM_ECC_MW  1

/*
Comment by Chao Wang

E203_HAS_ECC
  因为 ECC 没有实现，所以未定义
*/
  `ifndef E203_HAS_ECC //{
    `define E203_DTCM_RAM_DW      `E203_DTCM_DATA_WIDTH
    `define E203_DTCM_RAM_MW      `E203_DTCM_WMSK_WIDTH
    `define E203_DTCM_OUTS_NUM 1 // If no-ECC, DTCM is 1 cycle latency then only allow 1 oustanding for external agent
  `endif//}


  `define E203_HAS_DTCM_EXTITF
`endif//}








/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// MULDIV relevant macro
//
/*
Comment by Chao Wang

E203_CFG_SUPPORT_SHARE_MULDIV 此宏 E203 核必须配置
E203_SUPPORT_MULDIV
  配置支持乘除法
E203_SUPPORT_SHARE_MULDIV
  含义暂时不清楚
*/
  `ifdef E203_CFG_SUPPORT_SHARE_MULDIV//{
`define E203_SUPPORT_MULDIV
`define E203_SUPPORT_SHARE_MULDIV
  `endif//}

/*
Comment by Chao Wang
E203_SUPPORT_INDEP_MUL_1CYC
  E203_CFG_SUPPORT_INDEP_MULDIV 此宏 E203 核 config 文件未配置，不生效
*/
  `ifdef E203_CFG_SUPPORT_INDEP_MULDIV//{
`define E203_SUPPORT_MULDIV
`define E203_SUPPORT_INDEP_MUL_1CYC
  `endif//}


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// ALU relevant macro
//
/*
Comment by Chao Wang

E203_MULDIV_ADDER_WIDTH
  配置 E203 核乘除法中加法器（Adder）的数据位宽为 35 比特
E203_ALU_ADDER_WIDTH
  配置 E203 核 ALU 中加法器（Adder）的数据位宽
  因为 E203 必须配置 E203_CFG_SUPPORT_SHARE_MULDIV 宏，
  所以 ALU 中加法器的数据位宽为 35 比特
*/
`define E203_MULDIV_ADDER_WIDTH 35

  `ifdef E203_CFG_SUPPORT_SHARE_MULDIV
`define E203_ALU_ADDER_WIDTH `E203_MULDIV_ADDER_WIDTH
  `endif
  `ifndef E203_CFG_SUPPORT_SHARE_MULDIV
`define E203_ALU_ADDER_WIDTH (`E203_XLEN+1)
  `endif


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// MAS relevant macro
//
/*
Comment by Chao Wang

E203_ASYNC_FF_LEVELS
  ASYNC 是 asynchronous（异步） 的缩写，FF 含义不清楚
  含义暂不清楚
*/
`define E203_ASYNC_FF_LEVELS   2
//`ifdef E203_CFG_OITF_DEPTH_IS_1
//  `define E203_OITF_DEPTH     1
//  `define E203_OITF_DEPTH_IS_1
//`endif
 // To cut down the loop between ALU write-back valid --> oitf_ret_ena --> oitf_ready ---> dispatch_ready --- > alu_i_valid
 //   we exclude the ret_ena from the ready signal
 //   so in order to back2back dispatch, we need at least 2 entries in OITF
/*
Comment by Chao Wang

E203_CFG_OITF_DEPTH_IS_4
  E203_CFG_SUPPORT_INDEP_MULDIV 和 E203_CFG_HAS_FPU 宏 E203 核 config 文件未配置，不生效
E203_CFG_OITF_DEPTH_IS_2、E203_OITF_DEPTH_IS_2、E203_OITF_DEPTH、E203_ITAG_WIDTH
  含义暂不清楚
*/
`define E203_CFG_OITF_DEPTH_IS_2
`ifdef E203_CFG_SUPPORT_INDEP_MULDIV//{
  `define E203_CFG_OITF_DEPTH_IS_4
`endif//}
`ifdef E203_CFG_HAS_FPU//{
  `define E203_CFG_OITF_DEPTH_IS_4
`endif//}

`ifdef E203_CFG_OITF_DEPTH_IS_4
  `define E203_OITF_DEPTH     4
  `define E203_OITF_DEPTH_IS_4
  `define E203_ITAG_WIDTH  2
`elsif E203_CFG_OITF_DEPTH_IS_2
  `define E203_OITF_DEPTH     2
  `define E203_OITF_DEPTH_IS_2
  `define E203_ITAG_WIDTH  1
`endif

/*
Comment by Chao Wang

E203_CFG_HAS_FPU 宏 E203 核 config 文件未配置，不生效
E203_FLEN
  FLEN 指的是 E203 核中浮点数的长度，定义为 32 比特
*/
`ifdef E203_CFG_HAS_FPU
  `ifdef E203_CFG_FPU_DOUBLE
    `define E203_FPU_DOUBLE     
    `define E203_FLEN 64
  `else
    `define E203_FLEN 32
  `endif
`else
    `define E203_FLEN 32
`endif


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// Decode relevant macro
//
/*
Comment by Chao Wang

E203_DECINFO_GRP_WIDTH
  DECINFO 是 decode information 的缩写，GRP 是 group 的缩写
  配置译码组位宽为 3，最高可有 2 ^ 3 = 8 个译码指令组
E203_DECINFO_GRP_ALU
  值为 3'd0，第一组，ALU 组，Arithmetic Logic Unit 算术逻辑部件指令组
E203_DECINFO_GRP_AGU
  值为 3'd1，第二组，AGU 组，Address Generate Unit 地址生成部件指令组
E203_DECINFO_GRP_BJP
  值为 3'd2，第三组，BJP 组，Branch Jump 跳转指令组
E203_DECINFO_GRP_CSR
  值为 3'd3，第四组，CSR 组，Control and Status Register 控制状态寄存器指令组
E203_DECINFO_GRP_MULDIV
  值为 3'd4，第五组，MULDIV 组，Multiply Divide 乘除法指令组
E203_DECINFO_GRP_EAI
  值为 3'd5，第六组，EAI 组，Extension Accelerator Interface 扩展指令组
E203_DECINFO_GRP_FPU
  值为 3'd6，第七组，FPU 组，Floating Point Unit 浮点运算部件指令组
*/
  `define E203_DECINFO_GRP_WIDTH    3
  `define E203_DECINFO_GRP_ALU      `E203_DECINFO_GRP_WIDTH'd0
  `define E203_DECINFO_GRP_AGU      `E203_DECINFO_GRP_WIDTH'd1
  `define E203_DECINFO_GRP_BJP      `E203_DECINFO_GRP_WIDTH'd2
  `define E203_DECINFO_GRP_CSR      `E203_DECINFO_GRP_WIDTH'd3
  `define E203_DECINFO_GRP_MULDIV   `E203_DECINFO_GRP_WIDTH'd4
  `define E203_DECINFO_GRP_EAI      `E203_DECINFO_GRP_WIDTH'd5
  `define E203_DECINFO_GRP_FPU      `E203_DECINFO_GRP_WIDTH'd6

/*
Comment by Chao Wang

E203_DECINFO_GRP_FPU_WIDTH
  配置浮点运算部件指令组位宽为 2，最高可有 2 ^ 2 = 4 个浮点运算部件指令组
E203_DECINFO_GRP_FPU_FLSU
  值为 2'd0，第一组，FLSU 组，Floating Point Load Store Unit 浮点数存取指令组
E203_DECINFO_GRP_FPU_FMAC
  值为 2'd1，第二组，FMAC 组，Floating Point Multiply Accumulator 浮点数乘法加速器指令组
E203_DECINFO_GRP_FPU_FDIV
  值为 2'd2，第三组，FDIV 组，Floating Point Divide 浮点数除法指令组
E203_DECINFO_GRP_FPU_FMIS
  值为 2'd3，第四组，FMIS 组，暂不清楚
*/
  `define E203_DECINFO_GRP_FPU_WIDTH    2
  `define E203_DECINFO_GRP_FPU_FLSU     `E203_DECINFO_GRP_FPU_WIDTH'd0
  `define E203_DECINFO_GRP_FPU_FMAC     `E203_DECINFO_GRP_FPU_WIDTH'd1
  `define E203_DECINFO_GRP_FPU_FDIV     `E203_DECINFO_GRP_FPU_WIDTH'd2
  `define E203_DECINFO_GRP_FPU_FMIS     `E203_DECINFO_GRP_FPU_WIDTH'd3

/*
Comment by Chao Wang

E203_DECINFO_GRP_LSB
  LSB 是 Least Significant Bit 的缩写，指的是传输 group 数据的最低有效位
  配置值为 0，意思是传输 group 数据的最低有效位是第 0 位
E203_DECINFO_GRP_MSB
  MSB 是 Most Significant Bit 的缩写，指的是传输 group 数据的最高有效位
  配置值为 2，意思是传输 group 数据的最高有效位是第 2 位
E203_DECINFO_GRP
  指的是传输 group 数据的最高有效位到最低有效位的一个区间
  配置值为区间 2:0，意思是传输 group 数据的有效位是 2 位到 0 位
E203_DECINFO_RV32_LSB
  含义不清楚，配置值为 3
E203_DECINFO_RV32_MSB
  含义不清楚，配置为 3
E203_DECINFO_RV32
  含义不清楚，配置为 3:3
E203_DECINFO_SUBDECINFO_LSB
  SUBDECINFO 应是 Sub DECINFO 的意思
  配置值为 4
意思是 DECINFO 中，GROUP 信息占 2:0 位，RV32 信息占 3:3 位
*/
      `define E203_DECINFO_GRP_LSB  0
      `define E203_DECINFO_GRP_MSB  (`E203_DECINFO_GRP_LSB+`E203_DECINFO_GRP_WIDTH-1)
  `define E203_DECINFO_GRP          `E203_DECINFO_GRP_MSB:`E203_DECINFO_GRP_LSB
      `define E203_DECINFO_RV32_LSB  (`E203_DECINFO_GRP_MSB+1)
      `define E203_DECINFO_RV32_MSB  (`E203_DECINFO_RV32_LSB+1-1)
  `define E203_DECINFO_RV32          `E203_DECINFO_RV32_MSB:`E203_DECINFO_RV32_LSB

  `define E203_DECINFO_SUBDECINFO_LSB    (`E203_DECINFO_RV32_MSB+1)

/*
Comment by Chao Wang

因为 DECINFO 信息已经有四位被通用的 GROUP 和 RV32 用了，
所以对于由低三位 GROUP 区分的各个组的信息从 ？：4 开始
*/
/*
Comment by Chao Wang

以下是 ALU group 的译码信息：

ALU ADD 占 4:4
E203_DECINFO_ALU_ADD_LSB
  配置值为 4
E203_DECINFO_ALU_ADD_MSB
  配置值为 4
E203_DECINFO_ALU_ADD
  配置值为 4:4

ALU SUB 占 5:5
E203_DECINFO_ALU_SUB_LSB
  配置值为 5
E203_DECINFO_ALU_SUB_MSB
  配置值为 5
E203_DECINFO_ALU_SUB
  配置值为 5:5

ALU XOR
E203_DECINFO_ALU_XOR
  配置值为 6:6

E203_DECINFO_ALU_SLL
  配置值为 7:7

E203_DECINFO_ALU_SRL
  配置值为 8:8

E203_DECINFO_ALU_SRA
  配置值为 9:9

E203_DECINFO_ALU_OR
  配置值为 10:10

E203_DECINFO_ALU_AND
  配置值为 11:11

E203_DECINFO_ALU_SLT
  配置值为 12:12

E203_DECINFO_ALU_SLTU
  配置值为 13:13

E203_DECINFO_ALU_LUI
  配置值为 14:14

E203_DECINFO_ALU_OP2IMM
  配置值为 15:15

E203_DECINFO_ALU_OP1PC
  配置值为 16:16

E203_DECINFO_ALU_NOP
  配置值为 17:17

E203_DECINFO_ALU_ECAL
  配置值为 18:18

E203_DECINFO_ALU_EBRK
  配置值为 19:19

E203_DECINFO_ALU_WFI
  WFI 是 Wating For Interrupt 的缩写，执行此指令，进入睡眠状态
  配置值为 20:20

E203_DECINFO_ALU_WIDTH
  配置值为 21
意思是 ALU Group 的译码要求 DECINFO 至少为 21 位
*/
  // ALU group
      `define E203_DECINFO_ALU_ADD_LSB    `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_ALU_ADD_MSB    (`E203_DECINFO_ALU_ADD_LSB+1-1)
  `define E203_DECINFO_ALU_ADD    `E203_DECINFO_ALU_ADD_MSB :`E203_DECINFO_ALU_ADD_LSB 
      `define E203_DECINFO_ALU_SUB_LSB    (`E203_DECINFO_ALU_ADD_MSB+1)
      `define E203_DECINFO_ALU_SUB_MSB    (`E203_DECINFO_ALU_SUB_LSB+1-1)
  `define E203_DECINFO_ALU_SUB    `E203_DECINFO_ALU_SUB_MSB :`E203_DECINFO_ALU_SUB_LSB 
      `define E203_DECINFO_ALU_XOR_LSB    (`E203_DECINFO_ALU_SUB_MSB+1)
      `define E203_DECINFO_ALU_XOR_MSB    (`E203_DECINFO_ALU_XOR_LSB+1-1)
  `define E203_DECINFO_ALU_XOR    `E203_DECINFO_ALU_XOR_MSB :`E203_DECINFO_ALU_XOR_LSB 
      `define E203_DECINFO_ALU_SLL_LSB    (`E203_DECINFO_ALU_XOR_MSB+1)
      `define E203_DECINFO_ALU_SLL_MSB    (`E203_DECINFO_ALU_SLL_LSB+1-1)
  `define E203_DECINFO_ALU_SLL    `E203_DECINFO_ALU_SLL_MSB :`E203_DECINFO_ALU_SLL_LSB 
      `define E203_DECINFO_ALU_SRL_LSB    (`E203_DECINFO_ALU_SLL_MSB+1)
      `define E203_DECINFO_ALU_SRL_MSB    (`E203_DECINFO_ALU_SRL_LSB+1-1)
  `define E203_DECINFO_ALU_SRL    `E203_DECINFO_ALU_SRL_MSB :`E203_DECINFO_ALU_SRL_LSB 
      `define E203_DECINFO_ALU_SRA_LSB    (`E203_DECINFO_ALU_SRL_MSB+1)
      `define E203_DECINFO_ALU_SRA_MSB    (`E203_DECINFO_ALU_SRA_LSB+1-1)
  `define E203_DECINFO_ALU_SRA    `E203_DECINFO_ALU_SRA_MSB :`E203_DECINFO_ALU_SRA_LSB 
      `define E203_DECINFO_ALU_OR_LSB    (`E203_DECINFO_ALU_SRA_MSB+1)
      `define E203_DECINFO_ALU_OR_MSB    (`E203_DECINFO_ALU_OR_LSB+1-1)
  `define E203_DECINFO_ALU_OR     `E203_DECINFO_ALU_OR_MSB  :`E203_DECINFO_ALU_OR_LSB  
      `define E203_DECINFO_ALU_AND_LSB    (`E203_DECINFO_ALU_OR_MSB+1)
      `define E203_DECINFO_ALU_AND_MSB    (`E203_DECINFO_ALU_AND_LSB+1-1)
  `define E203_DECINFO_ALU_AND    `E203_DECINFO_ALU_AND_MSB :`E203_DECINFO_ALU_AND_LSB 
      `define E203_DECINFO_ALU_SLT_LSB    (`E203_DECINFO_ALU_AND_MSB+1)
      `define E203_DECINFO_ALU_SLT_MSB    (`E203_DECINFO_ALU_SLT_LSB+1-1)
  `define E203_DECINFO_ALU_SLT    `E203_DECINFO_ALU_SLT_MSB :`E203_DECINFO_ALU_SLT_LSB 
      `define E203_DECINFO_ALU_SLTU_LSB    (`E203_DECINFO_ALU_SLT_MSB+1)
      `define E203_DECINFO_ALU_SLTU_MSB    (`E203_DECINFO_ALU_SLTU_LSB+1-1)
  `define E203_DECINFO_ALU_SLTU   `E203_DECINFO_ALU_SLTU_MSB:`E203_DECINFO_ALU_SLTU_LSB
      `define E203_DECINFO_ALU_LUI_LSB    (`E203_DECINFO_ALU_SLTU_MSB+1)
      `define E203_DECINFO_ALU_LUI_MSB    (`E203_DECINFO_ALU_LUI_LSB+1-1)
  `define E203_DECINFO_ALU_LUI    `E203_DECINFO_ALU_LUI_MSB :`E203_DECINFO_ALU_LUI_LSB 
      `define E203_DECINFO_ALU_OP2IMM_LSB    (`E203_DECINFO_ALU_LUI_MSB+1)
      `define E203_DECINFO_ALU_OP2IMM_MSB    (`E203_DECINFO_ALU_OP2IMM_LSB+1-1)
  `define E203_DECINFO_ALU_OP2IMM    `E203_DECINFO_ALU_OP2IMM_MSB :`E203_DECINFO_ALU_OP2IMM_LSB 
      `define E203_DECINFO_ALU_OP1PC_LSB    (`E203_DECINFO_ALU_OP2IMM_MSB+1)
      `define E203_DECINFO_ALU_OP1PC_MSB    (`E203_DECINFO_ALU_OP1PC_LSB+1-1)
  `define E203_DECINFO_ALU_OP1PC    `E203_DECINFO_ALU_OP1PC_MSB :`E203_DECINFO_ALU_OP1PC_LSB 
      `define E203_DECINFO_ALU_NOP_LSB    (`E203_DECINFO_ALU_OP1PC_MSB+1)
      `define E203_DECINFO_ALU_NOP_MSB    (`E203_DECINFO_ALU_NOP_LSB+1-1)
  `define E203_DECINFO_ALU_NOP    `E203_DECINFO_ALU_NOP_MSB :`E203_DECINFO_ALU_NOP_LSB 
      `define E203_DECINFO_ALU_ECAL_LSB  (`E203_DECINFO_ALU_NOP_MSB+1)
      `define E203_DECINFO_ALU_ECAL_MSB  (`E203_DECINFO_ALU_ECAL_LSB+1-1)
  `define E203_DECINFO_ALU_ECAL   `E203_DECINFO_ALU_ECAL_MSB:`E203_DECINFO_ALU_ECAL_LSB 
      `define E203_DECINFO_ALU_EBRK_LSB  (`E203_DECINFO_ALU_ECAL_MSB+1)
      `define E203_DECINFO_ALU_EBRK_MSB  (`E203_DECINFO_ALU_EBRK_LSB+1-1)
  `define E203_DECINFO_ALU_EBRK   `E203_DECINFO_ALU_EBRK_MSB:`E203_DECINFO_ALU_EBRK_LSB 
      `define E203_DECINFO_ALU_WFI_LSB  (`E203_DECINFO_ALU_EBRK_MSB+1)
      `define E203_DECINFO_ALU_WFI_MSB  (`E203_DECINFO_ALU_WFI_LSB+1-1)
  `define E203_DECINFO_ALU_WFI   `E203_DECINFO_ALU_WFI_MSB:`E203_DECINFO_ALU_WFI_LSB 

  `define E203_DECINFO_ALU_WIDTH    (`E203_DECINFO_ALU_WFI_MSB+1)

/*
Comment by Chao Wang

以下是 AGU group 的译码信息：

E203_DECINFO_AGU_LOAD
  配置值为 4:4

E203_DECINFO_AGU_STORE
  配置值为 5:5

E203_DECINFO_AGU_SIZE
  配置值为 7:6

E203_DECINFO_AGU_USIGN
  配置值为 8:8

E203_DECINFO_AGU_EXCL
  配置值为 9:9

E203_DECINFO_AGU_AMO
  配置值为 10:10

E203_DECINFO_AGU_AMOSWAP
  配置值为 11:11

E203_DECINFO_AGU_AMOADD
  配置值为 12:12

E203_DECINFO_AGU_AMOAND
  配置值为 13:13

E203_DECINFO_AGU_AMOOR
  配置值为 14:14

E203_DECINFO_AGU_AMOXOR
  配置值为 15:15

E203_DECINFO_AGU_AMOMAX
  配置值为 16:16

E203_DECINFO_AGU_AMOMIN
  配置值为 17:17

E203_DECINFO_AGU_AMOMAXU
  配置值为 18:18

E203_DECINFO_AGU_AMOMINU
  配置值为 19:19

E203_DECINFO_AGU_OP2IMM
  配置值为 20:20

E203_DECINFO_AGU_WIDTH
  配置值为 21
意思是 AGU Group 的译码要求 DECINFO 至少为 21 位
*/
   //AGU group
    `define E203_DECINFO_AGU_LOAD_LSB      `E203_DECINFO_SUBDECINFO_LSB
    `define E203_DECINFO_AGU_LOAD_MSB      (`E203_DECINFO_AGU_LOAD_LSB+1-1)   
  `define E203_DECINFO_AGU_LOAD      `E203_DECINFO_AGU_LOAD_MSB   :`E203_DECINFO_AGU_LOAD_LSB   
    `define E203_DECINFO_AGU_STORE_LSB      (`E203_DECINFO_AGU_LOAD_MSB+1)
    `define E203_DECINFO_AGU_STORE_MSB      (`E203_DECINFO_AGU_STORE_LSB+1-1)   
  `define E203_DECINFO_AGU_STORE     `E203_DECINFO_AGU_STORE_MSB  :`E203_DECINFO_AGU_STORE_LSB  
    `define E203_DECINFO_AGU_SIZE_LSB      (`E203_DECINFO_AGU_STORE_MSB+1)
    `define E203_DECINFO_AGU_SIZE_MSB      (`E203_DECINFO_AGU_SIZE_LSB+2-1)   
  `define E203_DECINFO_AGU_SIZE      `E203_DECINFO_AGU_SIZE_MSB   :`E203_DECINFO_AGU_SIZE_LSB   
    `define E203_DECINFO_AGU_USIGN_LSB      (`E203_DECINFO_AGU_SIZE_MSB+1)
    `define E203_DECINFO_AGU_USIGN_MSB      (`E203_DECINFO_AGU_USIGN_LSB+1-1)   
  `define E203_DECINFO_AGU_USIGN     `E203_DECINFO_AGU_USIGN_MSB  :`E203_DECINFO_AGU_USIGN_LSB  
    `define E203_DECINFO_AGU_EXCL_LSB      (`E203_DECINFO_AGU_USIGN_MSB+1)
    `define E203_DECINFO_AGU_EXCL_MSB      (`E203_DECINFO_AGU_EXCL_LSB+1-1)   
  `define E203_DECINFO_AGU_EXCL      `E203_DECINFO_AGU_EXCL_MSB   :`E203_DECINFO_AGU_EXCL_LSB   
    `define E203_DECINFO_AGU_AMO_LSB      (`E203_DECINFO_AGU_EXCL_MSB+1)
    `define E203_DECINFO_AGU_AMO_MSB      (`E203_DECINFO_AGU_AMO_LSB+1-1)   
  `define E203_DECINFO_AGU_AMO       `E203_DECINFO_AGU_AMO_MSB    :`E203_DECINFO_AGU_AMO_LSB    
    `define E203_DECINFO_AGU_AMOSWAP_LSB      (`E203_DECINFO_AGU_AMO_MSB+1)
    `define E203_DECINFO_AGU_AMOSWAP_MSB      (`E203_DECINFO_AGU_AMOSWAP_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOSWAP   `E203_DECINFO_AGU_AMOSWAP_MSB:`E203_DECINFO_AGU_AMOSWAP_LSB
    `define E203_DECINFO_AGU_AMOADD_LSB      (`E203_DECINFO_AGU_AMOSWAP_MSB+1)
    `define E203_DECINFO_AGU_AMOADD_MSB      (`E203_DECINFO_AGU_AMOADD_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOADD    `E203_DECINFO_AGU_AMOADD_MSB :`E203_DECINFO_AGU_AMOADD_LSB 
    `define E203_DECINFO_AGU_AMOAND_LSB      (`E203_DECINFO_AGU_AMOADD_MSB+1)
    `define E203_DECINFO_AGU_AMOAND_MSB      (`E203_DECINFO_AGU_AMOAND_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOAND    `E203_DECINFO_AGU_AMOAND_MSB :`E203_DECINFO_AGU_AMOAND_LSB 
    `define E203_DECINFO_AGU_AMOOR_LSB      (`E203_DECINFO_AGU_AMOAND_MSB+1)
    `define E203_DECINFO_AGU_AMOOR_MSB      (`E203_DECINFO_AGU_AMOOR_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOOR     `E203_DECINFO_AGU_AMOOR_MSB  :`E203_DECINFO_AGU_AMOOR_LSB  
    `define E203_DECINFO_AGU_AMOXOR_LSB      (`E203_DECINFO_AGU_AMOOR_MSB+1)
    `define E203_DECINFO_AGU_AMOXOR_MSB      (`E203_DECINFO_AGU_AMOXOR_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOXOR    `E203_DECINFO_AGU_AMOXOR_MSB :`E203_DECINFO_AGU_AMOXOR_LSB 
    `define E203_DECINFO_AGU_AMOMAX_LSB      (`E203_DECINFO_AGU_AMOXOR_MSB+1)
    `define E203_DECINFO_AGU_AMOMAX_MSB      (`E203_DECINFO_AGU_AMOMAX_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOMAX    `E203_DECINFO_AGU_AMOMAX_MSB :`E203_DECINFO_AGU_AMOMAX_LSB 
    `define E203_DECINFO_AGU_AMOMIN_LSB      (`E203_DECINFO_AGU_AMOMAX_MSB+1)
    `define E203_DECINFO_AGU_AMOMIN_MSB      (`E203_DECINFO_AGU_AMOMIN_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOMIN    `E203_DECINFO_AGU_AMOMIN_MSB :`E203_DECINFO_AGU_AMOMIN_LSB 
    `define E203_DECINFO_AGU_AMOMAXU_LSB      (`E203_DECINFO_AGU_AMOMIN_MSB+1)
    `define E203_DECINFO_AGU_AMOMAXU_MSB      (`E203_DECINFO_AGU_AMOMAXU_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOMAXU   `E203_DECINFO_AGU_AMOMAXU_MSB:`E203_DECINFO_AGU_AMOMAXU_LSB
    `define E203_DECINFO_AGU_AMOMINU_LSB      (`E203_DECINFO_AGU_AMOMAXU_MSB+1)
    `define E203_DECINFO_AGU_AMOMINU_MSB      (`E203_DECINFO_AGU_AMOMINU_LSB+1-1)   
  `define E203_DECINFO_AGU_AMOMINU   `E203_DECINFO_AGU_AMOMINU_MSB:`E203_DECINFO_AGU_AMOMINU_LSB
    `define E203_DECINFO_AGU_OP2IMM_LSB      (`E203_DECINFO_AGU_AMOMINU_MSB+1)
    `define E203_DECINFO_AGU_OP2IMM_MSB      (`E203_DECINFO_AGU_OP2IMM_LSB+1-1)   
  `define E203_DECINFO_AGU_OP2IMM   `E203_DECINFO_AGU_OP2IMM_MSB:`E203_DECINFO_AGU_OP2IMM_LSB

  `define E203_DECINFO_AGU_WIDTH    (`E203_DECINFO_AGU_OP2IMM_MSB+1)

/*
Comment by Chao Wang

以下是 AJP group 的译码信息：

E203_DECINFO_BJP_JUMP
  配置值为 4:4

E203_DECINFO_BJP_BPRDT
  配置值为 5:5

E203_DECINFO_BJP_BEQ
  配置值为 6:6

E203_DECINFO_BJP_BNE
  配置值为 7:7

E203_DECINFO_BJP_BLT
  配置值为 8:8

E203_DECINFO_BJP_BGT
  配置值为 9:9

E203_DECINFO_BJP_BLTU
  配置值为 10:10

E203_DECINFO_BJP_BGTU
  配置值为 11:11

E203_DECINFO_BJP_BXX
  配置值为 12:12

E203_DECINFO_BJP_MRET
  配置值为 13:13

E203_DECINFO_BJP_DRET
  配置值为 14:14

E203_DECINFO_BJP_FENCE
  配置值为 15:15

E203_DECINFO_BJP_FENCEI
  配置值为 16:16

E203_DECINFO_BJP_WIDTH
  配置值为 17
意思是 BJP Group 的译码要求 DECINFO 至少为 17 位
*/
  // Bxx group
      `define E203_DECINFO_BJP_JUMP_LSB `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_BJP_JUMP_MSB (`E203_DECINFO_BJP_JUMP_LSB+1-1)
  `define E203_DECINFO_BJP_JUMP   `E203_DECINFO_BJP_JUMP_MSB :`E203_DECINFO_BJP_JUMP_LSB 
      `define E203_DECINFO_BJP_BPRDT_LSB (`E203_DECINFO_BJP_JUMP_MSB+1)
      `define E203_DECINFO_BJP_BPRDT_MSB (`E203_DECINFO_BJP_BPRDT_LSB+1-1)
  `define E203_DECINFO_BJP_BPRDT  `E203_DECINFO_BJP_BPRDT_MSB:`E203_DECINFO_BJP_BPRDT_LSB
      `define E203_DECINFO_BJP_BEQ_LSB (`E203_DECINFO_BJP_BPRDT_MSB+1)
      `define E203_DECINFO_BJP_BEQ_MSB (`E203_DECINFO_BJP_BEQ_LSB+1-1)
  `define E203_DECINFO_BJP_BEQ    `E203_DECINFO_BJP_BEQ_MSB  :`E203_DECINFO_BJP_BEQ_LSB  
      `define E203_DECINFO_BJP_BNE_LSB (`E203_DECINFO_BJP_BEQ_MSB+1)
      `define E203_DECINFO_BJP_BNE_MSB (`E203_DECINFO_BJP_BNE_LSB+1-1)
  `define E203_DECINFO_BJP_BNE    `E203_DECINFO_BJP_BNE_MSB  :`E203_DECINFO_BJP_BNE_LSB  
      `define E203_DECINFO_BJP_BLT_LSB (`E203_DECINFO_BJP_BNE_MSB+1)
      `define E203_DECINFO_BJP_BLT_MSB (`E203_DECINFO_BJP_BLT_LSB+1-1)
  `define E203_DECINFO_BJP_BLT    `E203_DECINFO_BJP_BLT_MSB  :`E203_DECINFO_BJP_BLT_LSB  
      `define E203_DECINFO_BJP_BGT_LSB (`E203_DECINFO_BJP_BLT_MSB+1)
      `define E203_DECINFO_BJP_BGT_MSB (`E203_DECINFO_BJP_BGT_LSB+1-1)
  `define E203_DECINFO_BJP_BGT    `E203_DECINFO_BJP_BGT_MSB  :`E203_DECINFO_BJP_BGT_LSB  
      `define E203_DECINFO_BJP_BLTU_LSB (`E203_DECINFO_BJP_BGT_MSB+1)
      `define E203_DECINFO_BJP_BLTU_MSB (`E203_DECINFO_BJP_BLTU_LSB+1-1)
  `define E203_DECINFO_BJP_BLTU   `E203_DECINFO_BJP_BLTU_MSB :`E203_DECINFO_BJP_BLTU_LSB 
      `define E203_DECINFO_BJP_BGTU_LSB (`E203_DECINFO_BJP_BLTU_MSB+1)
      `define E203_DECINFO_BJP_BGTU_MSB (`E203_DECINFO_BJP_BGTU_LSB+1-1)
  `define E203_DECINFO_BJP_BGTU   `E203_DECINFO_BJP_BGTU_MSB :`E203_DECINFO_BJP_BGTU_LSB 
      `define E203_DECINFO_BJP_BXX_LSB  (`E203_DECINFO_BJP_BGTU_MSB+1)
      `define E203_DECINFO_BJP_BXX_MSB  (`E203_DECINFO_BJP_BXX_LSB+1-1)
  `define E203_DECINFO_BJP_BXX    `E203_DECINFO_BJP_BXX_MSB :`E203_DECINFO_BJP_BXX_LSB
      `define E203_DECINFO_BJP_MRET_LSB  (`E203_DECINFO_BJP_BXX_MSB+1)
      `define E203_DECINFO_BJP_MRET_MSB  (`E203_DECINFO_BJP_MRET_LSB+1-1)
  `define E203_DECINFO_BJP_MRET    `E203_DECINFO_BJP_MRET_MSB :`E203_DECINFO_BJP_MRET_LSB
      `define E203_DECINFO_BJP_DRET_LSB  (`E203_DECINFO_BJP_MRET_MSB+1)
      `define E203_DECINFO_BJP_DRET_MSB  (`E203_DECINFO_BJP_DRET_LSB+1-1)
  `define E203_DECINFO_BJP_DRET    `E203_DECINFO_BJP_DRET_MSB :`E203_DECINFO_BJP_DRET_LSB
      `define E203_DECINFO_BJP_FENCE_LSB  (`E203_DECINFO_BJP_DRET_MSB+1)
      `define E203_DECINFO_BJP_FENCE_MSB  (`E203_DECINFO_BJP_FENCE_LSB+1-1)
  `define E203_DECINFO_BJP_FENCE    `E203_DECINFO_BJP_FENCE_MSB :`E203_DECINFO_BJP_FENCE_LSB
      `define E203_DECINFO_BJP_FENCEI_LSB  (`E203_DECINFO_BJP_FENCE_MSB+1)
      `define E203_DECINFO_BJP_FENCEI_MSB  (`E203_DECINFO_BJP_FENCEI_LSB+1-1)
  `define E203_DECINFO_BJP_FENCEI    `E203_DECINFO_BJP_FENCEI_MSB :`E203_DECINFO_BJP_FENCEI_LSB

`define E203_DECINFO_BJP_WIDTH  (`E203_DECINFO_BJP_FENCEI_MSB+1)


/*
Comment by Chao Wang

以下是 CSR group 的译码信息：

E203_DECINFO_CSR_CSRRW
  配置值为 4:4

E203_DECINFO_CSR_CSRRS
  配置值为 5:5

E203_DECINFO_CSR_CSRRC
  配置值为 6:6

E203_DECINFO_CSR_RS1IMM
  配置值为 7:7

E203_DECINFO_CSR_ZIMMM
  配置值为 12:8

E203_DECINFO_CSR_RS1IS0
  配置值为 13:13

E203_DECINFO_CSR_CSRIDX
  配置值为 25:14

E203_DECINFO_CSR_WIDTH
  配置值为 26
意思是 CSR Group 的译码要求 DECINFO 至少为 26 位
*/
  // CSR group
      `define E203_DECINFO_CSR_CSRRW_LSB   `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_CSR_CSRRW_MSB   (`E203_DECINFO_CSR_CSRRW_LSB+1-1)    
  `define E203_DECINFO_CSR_CSRRW   `E203_DECINFO_CSR_CSRRW_MSB:`E203_DECINFO_CSR_CSRRW_LSB    
      `define E203_DECINFO_CSR_CSRRS_LSB   (`E203_DECINFO_CSR_CSRRW_MSB+1)
      `define E203_DECINFO_CSR_CSRRS_MSB   (`E203_DECINFO_CSR_CSRRS_LSB+1-1)    
  `define E203_DECINFO_CSR_CSRRS   `E203_DECINFO_CSR_CSRRS_MSB:`E203_DECINFO_CSR_CSRRS_LSB 
      `define E203_DECINFO_CSR_CSRRC_LSB   (`E203_DECINFO_CSR_CSRRS_MSB+1)
      `define E203_DECINFO_CSR_CSRRC_MSB   (`E203_DECINFO_CSR_CSRRC_LSB+1-1)    
  `define E203_DECINFO_CSR_CSRRC   `E203_DECINFO_CSR_CSRRC_MSB:`E203_DECINFO_CSR_CSRRC_LSB 
      `define E203_DECINFO_CSR_RS1IMM_LSB  (`E203_DECINFO_CSR_CSRRC_MSB+1)
      `define E203_DECINFO_CSR_RS1IMM_MSB   (`E203_DECINFO_CSR_RS1IMM_LSB+1-1)    
  `define E203_DECINFO_CSR_RS1IMM  `E203_DECINFO_CSR_RS1IMM_MSB:`E203_DECINFO_CSR_RS1IMM_LSB
      `define E203_DECINFO_CSR_ZIMMM_LSB   (`E203_DECINFO_CSR_RS1IMM_MSB+1)
      `define E203_DECINFO_CSR_ZIMMM_MSB   (`E203_DECINFO_CSR_ZIMMM_LSB+5-1)    
  `define E203_DECINFO_CSR_ZIMMM   `E203_DECINFO_CSR_ZIMMM_MSB:`E203_DECINFO_CSR_ZIMMM_LSB 
      `define E203_DECINFO_CSR_RS1IS0_LSB  (`E203_DECINFO_CSR_ZIMMM_MSB+1)
      `define E203_DECINFO_CSR_RS1IS0_MSB  (`E203_DECINFO_CSR_RS1IS0_LSB+1-1)    
  `define E203_DECINFO_CSR_RS1IS0  `E203_DECINFO_CSR_RS1IS0_MSB:`E203_DECINFO_CSR_RS1IS0_LSB
      `define E203_DECINFO_CSR_CSRIDX_LSB  (`E203_DECINFO_CSR_RS1IS0_MSB+1)
      `define E203_DECINFO_CSR_CSRIDX_MSB  (`E203_DECINFO_CSR_CSRIDX_LSB+12-1)    
  `define E203_DECINFO_CSR_CSRIDX  `E203_DECINFO_CSR_CSRIDX_MSB:`E203_DECINFO_CSR_CSRIDX_LSB

`define E203_DECINFO_CSR_WIDTH  (`E203_DECINFO_CSR_CSRIDX_MSB+1)

/*
Comment by Chao Wang

以下是 EAI group 的译码信息：

E203_DECINFO_EAI_INSTR_LSB
  配置值为 4
E203_DECINFO_EAI_INSTR_MSB
  配置值为 30
E203_DECINFO_EAI_INSTR
  配置值为 30:4

E203_DECINFO_EAI_WIDTH
  配置值为 31
意思是 EAI Group 的译码要求 DECINFO 至少为 31 位
*/
  // EAI group
      `define E203_DECINFO_EAI_INSTR_LSB   `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_EAI_INSTR_MSB   (`E203_DECINFO_EAI_INSTR_LSB+27-1)    
  `define E203_DECINFO_EAI_INSTR   `E203_DECINFO_EAI_INSTR_MSB:`E203_DECINFO_EAI_INSTR_LSB    

`define E203_DECINFO_EAI_WIDTH  (`E203_DECINFO_EAI_INSTR_MSB+1)

/*
Comment by Chao Wang

以下是 FPU group 的译码信息：

E203_DECINFO_FPU_GRP_LSB
  配置值为 4
E203_DECINFO_FPU_GRP_MSB
  配置值为 5
E203_DECINFO_FPU_GRP
  配置值为 5:4

E203_DECINFO_FPU_RM_LSB
  配置值为 6
E203_DECINFO_FPU_RM_MSB
  配置值为 8
E203_DECINFO_FPU_RM
  配置值为 8:6

E203_DECINFO_FPU_USERM_LSB
  配置值为 9
E203_DECINFO_FPU_USERM_MSB
  配置值为 9
E203_DECINFO_FPU_USERM
  配置值为 9:9

以上是 FPU 优先占用的 9:4 位，FPU的子组只能从 ？：10位占用
*/
  // FPU group
      `define E203_DECINFO_FPU_GRP_LSB   `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_FPU_GRP_MSB   (`E203_DECINFO_FPU_GRP_LSB+`E203_DECINFO_GRP_FPU_WIDTH-1)    
  `define E203_DECINFO_FPU_GRP   `E203_DECINFO_FPU_GRP_MSB:`E203_DECINFO_FPU_GRP_LSB    
      `define E203_DECINFO_FPU_RM_LSB   (`E203_DECINFO_FPU_GRP_MSB+1)
      `define E203_DECINFO_FPU_RM_MSB   (`E203_DECINFO_FPU_RM_LSB+3-1)    
  `define E203_DECINFO_FPU_RM   `E203_DECINFO_FPU_RM_MSB:`E203_DECINFO_FPU_RM_LSB    
      `define E203_DECINFO_FPU_USERM_LSB   (`E203_DECINFO_FPU_RM_MSB+1)
      `define E203_DECINFO_FPU_USERM_MSB   (`E203_DECINFO_FPU_USERM_LSB+1-1)    
  `define E203_DECINFO_FPU_USERM   `E203_DECINFO_FPU_USERM_MSB:`E203_DECINFO_FPU_USERM_LSB    

/*
Comment by Chao Wang

以下是 FPU group 的子 FLSU group 的译码信息：

E203_DECINFO_FLSU_LOAD
  配置值为 10:10

E203_DECINFO_FLSU_STORE
  配置值为 11:11

E203_DECINFO_FLSU_DOUBLE
  配置值为 12:12

E203_DECINFO_FLSU_OP2IMM
  配置值为 13:13

E203_DECINFO_FLSU_WIDTH
  配置值为 14
意思是 FPU group 的子 FLSU group 的译码要求 DECINFO 至少为 14 位
*/
  // FLSU group
      `define E203_DECINFO_FLSU_LOAD_LSB   (`E203_DECINFO_FPU_USERM_MSB+1)
      `define E203_DECINFO_FLSU_LOAD_MSB   (`E203_DECINFO_FLSU_LOAD_LSB+1-1)    
  `define E203_DECINFO_FLSU_LOAD   `E203_DECINFO_FLSU_LOAD_MSB:`E203_DECINFO_FLSU_LOAD_LSB 
      `define E203_DECINFO_FLSU_STORE_LSB   (`E203_DECINFO_FLSU_LOAD_MSB+1)
      `define E203_DECINFO_FLSU_STORE_MSB   (`E203_DECINFO_FLSU_STORE_LSB+1-1)    
  `define E203_DECINFO_FLSU_STORE   `E203_DECINFO_FLSU_STORE_MSB:`E203_DECINFO_FLSU_STORE_LSB 
      `define E203_DECINFO_FLSU_DOUBLE_LSB  (`E203_DECINFO_FLSU_STORE_MSB+1)
      `define E203_DECINFO_FLSU_DOUBLE_MSB   (`E203_DECINFO_FLSU_DOUBLE_LSB+1-1)    
  `define E203_DECINFO_FLSU_DOUBLE  `E203_DECINFO_FLSU_DOUBLE_MSB:`E203_DECINFO_FLSU_DOUBLE_LSB
      `define E203_DECINFO_FLSU_OP2IMM_LSB   (`E203_DECINFO_FLSU_DOUBLE_MSB+1)
      `define E203_DECINFO_FLSU_OP2IMM_MSB   (`E203_DECINFO_FLSU_OP2IMM_LSB+1-1)    
  `define E203_DECINFO_FLSU_OP2IMM   `E203_DECINFO_FLSU_OP2IMM_MSB:`E203_DECINFO_FLSU_OP2IMM_LSB 

`define E203_DECINFO_FLSU_WIDTH  (`E203_DECINFO_FLSU_OP2IMM_MSB+1)

/*
Comment by Chao Wang

以下是 FPU group 的子 FDIV group 的译码信息：

E203_DECINFO_FDIV_DIV
  配置值为 10:10

E203_DECINFO_FDIV_SQRT
  配置值为 11:11

E203_DECINFO_FDIV_DOUBLE
  配置值为 12:12

E203_DECINFO_FLSU_WIDTH
  配置值为 13
意思是 FPU group 的子 FDIV group 的译码要求 DECINFO 至少为 13 位
*/
  // FDIV group
      `define E203_DECINFO_FDIV_DIV_LSB   (`E203_DECINFO_FPU_USERM_MSB+1)
      `define E203_DECINFO_FDIV_DIV_MSB   (`E203_DECINFO_FDIV_DIV_LSB+1-1)    
  `define E203_DECINFO_FDIV_DIV   `E203_DECINFO_FDIV_DIV_MSB:`E203_DECINFO_FDIV_DIV_LSB 
      `define E203_DECINFO_FDIV_SQRT_LSB   (`E203_DECINFO_FDIV_DIV_MSB+1)
      `define E203_DECINFO_FDIV_SQRT_MSB   (`E203_DECINFO_FDIV_SQRT_LSB+1-1)    
  `define E203_DECINFO_FDIV_SQRT   `E203_DECINFO_FDIV_SQRT_MSB:`E203_DECINFO_FDIV_SQRT_LSB 
      `define E203_DECINFO_FDIV_DOUBLE_LSB  (`E203_DECINFO_FDIV_SQRT_MSB+1)
      `define E203_DECINFO_FDIV_DOUBLE_MSB   (`E203_DECINFO_FDIV_DOUBLE_LSB+1-1)    
  `define E203_DECINFO_FDIV_DOUBLE  `E203_DECINFO_FDIV_DOUBLE_MSB:`E203_DECINFO_FDIV_DOUBLE_LSB

`define E203_DECINFO_FDIV_WIDTH  (`E203_DECINFO_FDIV_DOUBLE_MSB+1)

/*
Comment by Chao Wang

以下是 FPU group 的子 FDIV group 的译码信息：

E203_DECINFO_FMIS_FSGNJ
  配置值为 10:10

E203_DECINFO_FMIS_FSGNJN
  配置值为 11:11

E203_DECINFO_FMIS_FSGNJX
  配置值为 12:12

E203_DECINFO_FMIS_FMVXW
  配置值为 13：13

E203_DECINFO_FMIS_FCLASS
  配置值为 14：14

E203_DECINFO_FMIS_FMVWX
  配置值为 15：15

E203_DECINFO_FMIS_CVTWS
  配置值为 16：16

E203_DECINFO_FMIS_CVTWUS
  配置值为 17：17

E203_DECINFO_FMIS_CVTSW
  配置值为 18：18

E203_DECINFO_FMIS_CVTSWU
  配置值为 19：19

E203_DECINFO_FMIS_CVTSD
  配置值为 20：20

E203_DECINFO_FMIS_CVTDS
  配置值为 21：21

E203_DECINFO_FMIS_CVTWD
  配置值为 22：22

E203_DECINFO_FMIS_CVTWUD
  配置值为 23：23

E203_DECINFO_FMIS_CVTDW
  配置值为 24：24

E203_DECINFO_FMIS_CVTDWU
  配置值为 25：25

E203_DECINFO_FMIS_DOUBLE
  配置值为 26：26

E203_DECINFO_FMIS_WIDTH
  配置值为 27

意思是 FPU group 的子 FMIS group 的译码要求 DECINFO 至少为 27 位
*/
  // FMIS group
      `define E203_DECINFO_FMIS_FSGNJ_LSB   (`E203_DECINFO_FPU_USERM_MSB+1)
      `define E203_DECINFO_FMIS_FSGNJ_MSB   (`E203_DECINFO_FMIS_FSGNJ_LSB+1-1)    
  `define E203_DECINFO_FMIS_FSGNJ   `E203_DECINFO_FMIS_FSGNJ_MSB:`E203_DECINFO_FMIS_FSGNJ_LSB 
      `define E203_DECINFO_FMIS_FSGNJN_LSB   (`E203_DECINFO_FMIS_FSGNJ_MSB+1)
      `define E203_DECINFO_FMIS_FSGNJN_MSB   (`E203_DECINFO_FMIS_FSGNJN_LSB+1-1)    
  `define E203_DECINFO_FMIS_FSGNJN   `E203_DECINFO_FMIS_FSGNJN_MSB:`E203_DECINFO_FMIS_FSGNJN_LSB 
      `define E203_DECINFO_FMIS_FSGNJX_LSB  (`E203_DECINFO_FMIS_FSGNJN_MSB+1)
      `define E203_DECINFO_FMIS_FSGNJX_MSB   (`E203_DECINFO_FMIS_FSGNJX_LSB+1-1)    
  `define E203_DECINFO_FMIS_FSGNJX  `E203_DECINFO_FMIS_FSGNJX_MSB:`E203_DECINFO_FMIS_FSGNJX_LSB
      `define E203_DECINFO_FMIS_FMVXW_LSB  (`E203_DECINFO_FMIS_FSGNJX_MSB+1)
      `define E203_DECINFO_FMIS_FMVXW_MSB   (`E203_DECINFO_FMIS_FMVXW_LSB+1-1)    
  `define E203_DECINFO_FMIS_FMVXW  `E203_DECINFO_FMIS_FMVXW_MSB:`E203_DECINFO_FMIS_FMVXW_LSB
      `define E203_DECINFO_FMIS_FCLASS_LSB  (`E203_DECINFO_FMIS_FMVXW_MSB+1)
      `define E203_DECINFO_FMIS_FCLASS_MSB   (`E203_DECINFO_FMIS_FCLASS_LSB+1-1)    
  `define E203_DECINFO_FMIS_FCLASS  `E203_DECINFO_FMIS_FCLASS_MSB:`E203_DECINFO_FMIS_FCLASS_LSB
      `define E203_DECINFO_FMIS_FMVWX_LSB  (`E203_DECINFO_FMIS_FCLASS_MSB+1)
      `define E203_DECINFO_FMIS_FMVWX_MSB   (`E203_DECINFO_FMIS_FMVWX_LSB+1-1)    
  `define E203_DECINFO_FMIS_FMVWX  `E203_DECINFO_FMIS_FMVWX_MSB:`E203_DECINFO_FMIS_FMVWX_LSB
      `define E203_DECINFO_FMIS_CVTWS_LSB  (`E203_DECINFO_FMIS_FMVWX_MSB+1)
      `define E203_DECINFO_FMIS_CVTWS_MSB   (`E203_DECINFO_FMIS_CVTWS_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTWS  `E203_DECINFO_FMIS_CVTWS_MSB:`E203_DECINFO_FMIS_CVTWS_LSB
      `define E203_DECINFO_FMIS_CVTWUS_LSB  (`E203_DECINFO_FMIS_CVTWS_MSB+1)
      `define E203_DECINFO_FMIS_CVTWUS_MSB   (`E203_DECINFO_FMIS_CVTWUS_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTWUS  `E203_DECINFO_FMIS_CVTWUS_MSB:`E203_DECINFO_FMIS_CVTWUS_LSB
      `define E203_DECINFO_FMIS_CVTSW_LSB  (`E203_DECINFO_FMIS_CVTWUS_MSB+1)
      `define E203_DECINFO_FMIS_CVTSW_MSB   (`E203_DECINFO_FMIS_CVTSW_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTSW  `E203_DECINFO_FMIS_CVTSW_MSB:`E203_DECINFO_FMIS_CVTSW_LSB
      `define E203_DECINFO_FMIS_CVTSWU_LSB  (`E203_DECINFO_FMIS_CVTSW_MSB+1)
      `define E203_DECINFO_FMIS_CVTSWU_MSB   (`E203_DECINFO_FMIS_CVTSWU_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTSWU  `E203_DECINFO_FMIS_CVTSWU_MSB:`E203_DECINFO_FMIS_CVTSWU_LSB
      `define E203_DECINFO_FMIS_CVTSD_LSB  (`E203_DECINFO_FMIS_CVTSWU_MSB+1)
      `define E203_DECINFO_FMIS_CVTSD_MSB   (`E203_DECINFO_FMIS_CVTSD_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTSD  `E203_DECINFO_FMIS_CVTSD_MSB:`E203_DECINFO_FMIS_CVTSD_LSB
      `define E203_DECINFO_FMIS_CVTDS_LSB  (`E203_DECINFO_FMIS_CVTSD_MSB+1)
      `define E203_DECINFO_FMIS_CVTDS_MSB   (`E203_DECINFO_FMIS_CVTDS_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTDS  `E203_DECINFO_FMIS_CVTDS_MSB:`E203_DECINFO_FMIS_CVTDS_LSB
      `define E203_DECINFO_FMIS_CVTWD_LSB  (`E203_DECINFO_FMIS_CVTDS_MSB+1)
      `define E203_DECINFO_FMIS_CVTWD_MSB   (`E203_DECINFO_FMIS_CVTWD_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTWD  `E203_DECINFO_FMIS_CVTWD_MSB:`E203_DECINFO_FMIS_CVTWD_LSB
      `define E203_DECINFO_FMIS_CVTWUD_LSB  (`E203_DECINFO_FMIS_CVTWD_MSB+1)
      `define E203_DECINFO_FMIS_CVTWUD_MSB   (`E203_DECINFO_FMIS_CVTWUD_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTWUD  `E203_DECINFO_FMIS_CVTWUD_MSB:`E203_DECINFO_FMIS_CVTWUD_LSB
      `define E203_DECINFO_FMIS_CVTDW_LSB  (`E203_DECINFO_FMIS_CVTWUD_MSB+1)
      `define E203_DECINFO_FMIS_CVTDW_MSB   (`E203_DECINFO_FMIS_CVTDW_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTDW  `E203_DECINFO_FMIS_CVTDW_MSB:`E203_DECINFO_FMIS_CVTDW_LSB
      `define E203_DECINFO_FMIS_CVTDWU_LSB  (`E203_DECINFO_FMIS_CVTDW_MSB+1)
      `define E203_DECINFO_FMIS_CVTDWU_MSB   (`E203_DECINFO_FMIS_CVTDWU_LSB+1-1)    
  `define E203_DECINFO_FMIS_CVTDWU  `E203_DECINFO_FMIS_CVTDWU_MSB:`E203_DECINFO_FMIS_CVTDWU_LSB
      `define E203_DECINFO_FMIS_DOUBLE_LSB  (`E203_DECINFO_FMIS_CVTDWU_MSB+1)
      `define E203_DECINFO_FMIS_DOUBLE_MSB   (`E203_DECINFO_FMIS_DOUBLE_LSB+1-1)    
  `define E203_DECINFO_FMIS_DOUBLE  `E203_DECINFO_FMIS_DOUBLE_MSB:`E203_DECINFO_FMIS_DOUBLE_LSB

`define E203_DECINFO_FMIS_WIDTH  (`E203_DECINFO_FMIS_DOUBLE_MSB+1)



/*
Comment by Chao Wang

以下是 FPU group 的子 FMAC group 的译码信息：

E203_DECINFO_FMAC_FMADD
  配置值为 10:10

E203_DECINFO_FMAC_FMSUB
  配置值为 11:11

E203_DECINFO_FMAC_FNMSUB
  配置值为 12:12

E203_DECINFO_FMAC_FNMADD
  配置值为 13：13

E203_DECINFO_FMAC_FADD
  配置值为 14：14

E203_DECINFO_FMAC_FSUB
  配置值为 15：15

E203_DECINFO_FMAC_FMUL
  配置值为 16：16

E203_DECINFO_FMAC_FMIN
  配置值为 17：17

E203_DECINFO_FMAC_FMAX
  配置值为 18：18

E203_DECINFO_FMAC_FEQ
  配置值为 19：19

E203_DECINFO_FMAC_FLT
  配置值为 20：20

E203_DECINFO_FMAC_FLE
  配置值为 21：21

E203_DECINFO_FMAC_DOUBLE
  配置值为 22：22

E203_DECINFO_FMAC_WIDTH
  配置值为 23

意思是 FPU group 的子 FMAC group 的译码要求 DECINFO 至少为 23 位
*/
  // FMAC group
      `define E203_DECINFO_FMAC_FMADD_LSB   (`E203_DECINFO_FPU_USERM_MSB+1)
      `define E203_DECINFO_FMAC_FMADD_MSB   (`E203_DECINFO_FMAC_FMADD_LSB+1-1)    
  `define E203_DECINFO_FMAC_FMADD   `E203_DECINFO_FMAC_FMADD_MSB:`E203_DECINFO_FMAC_FMADD_LSB 
      `define E203_DECINFO_FMAC_FMSUB_LSB   (`E203_DECINFO_FMAC_FMADD_MSB+1)
      `define E203_DECINFO_FMAC_FMSUB_MSB   (`E203_DECINFO_FMAC_FMSUB_LSB+1-1)    
  `define E203_DECINFO_FMAC_FMSUB   `E203_DECINFO_FMAC_FMSUB_MSB:`E203_DECINFO_FMAC_FMSUB_LSB 
      `define E203_DECINFO_FMAC_FNMSUB_LSB  (`E203_DECINFO_FMAC_FMSUB_MSB+1)
      `define E203_DECINFO_FMAC_FNMSUB_MSB   (`E203_DECINFO_FMAC_FNMSUB_LSB+1-1)    
  `define E203_DECINFO_FMAC_FNMSUB  `E203_DECINFO_FMAC_FNMSUB_MSB:`E203_DECINFO_FMAC_FNMSUB_LSB
      `define E203_DECINFO_FMAC_FNMADD_LSB  (`E203_DECINFO_FMAC_FNMSUB_MSB+1)
      `define E203_DECINFO_FMAC_FNMADD_MSB   (`E203_DECINFO_FMAC_FNMADD_LSB+1-1)    
  `define E203_DECINFO_FMAC_FNMADD  `E203_DECINFO_FMAC_FNMADD_MSB:`E203_DECINFO_FMAC_FNMADD_LSB
      `define E203_DECINFO_FMAC_FADD_LSB  (`E203_DECINFO_FMAC_FNMADD_MSB+1)
      `define E203_DECINFO_FMAC_FADD_MSB   (`E203_DECINFO_FMAC_FADD_LSB+1-1)    
  `define E203_DECINFO_FMAC_FADD  `E203_DECINFO_FMAC_FADD_MSB:`E203_DECINFO_FMAC_FADD_LSB
      `define E203_DECINFO_FMAC_FSUB_LSB  (`E203_DECINFO_FMAC_FADD_MSB+1)
      `define E203_DECINFO_FMAC_FSUB_MSB   (`E203_DECINFO_FMAC_FSUB_LSB+1-1)    
  `define E203_DECINFO_FMAC_FSUB  `E203_DECINFO_FMAC_FSUB_MSB:`E203_DECINFO_FMAC_FSUB_LSB
      `define E203_DECINFO_FMAC_FMUL_LSB  (`E203_DECINFO_FMAC_FSUB_MSB+1)
      `define E203_DECINFO_FMAC_FMUL_MSB   (`E203_DECINFO_FMAC_FMUL_LSB+1-1)    
  `define E203_DECINFO_FMAC_FMUL  `E203_DECINFO_FMAC_FMUL_MSB:`E203_DECINFO_FMAC_FMUL_LSB
      `define E203_DECINFO_FMAC_FMIN_LSB  (`E203_DECINFO_FMAC_FMUL_MSB+1)
      `define E203_DECINFO_FMAC_FMIN_MSB   (`E203_DECINFO_FMAC_FMIN_LSB+1-1)    
  `define E203_DECINFO_FMAC_FMIN  `E203_DECINFO_FMAC_FMIN_MSB:`E203_DECINFO_FMAC_FMIN_LSB
      `define E203_DECINFO_FMAC_FMAX_LSB  (`E203_DECINFO_FMAC_FMIN_MSB+1)
      `define E203_DECINFO_FMAC_FMAX_MSB   (`E203_DECINFO_FMAC_FMAX_LSB+1-1)    
  `define E203_DECINFO_FMAC_FMAX  `E203_DECINFO_FMAC_FMAX_MSB:`E203_DECINFO_FMAC_FMAX_LSB
      `define E203_DECINFO_FMAC_FEQ_LSB  (`E203_DECINFO_FMAC_FMAX_MSB+1)
      `define E203_DECINFO_FMAC_FEQ_MSB   (`E203_DECINFO_FMAC_FEQ_LSB+1-1)    
  `define E203_DECINFO_FMAC_FEQ  `E203_DECINFO_FMAC_FEQ_MSB:`E203_DECINFO_FMAC_FEQ_LSB
      `define E203_DECINFO_FMAC_FLT_LSB  (`E203_DECINFO_FMAC_FEQ_MSB+1)
      `define E203_DECINFO_FMAC_FLT_MSB   (`E203_DECINFO_FMAC_FLT_LSB+1-1)    
  `define E203_DECINFO_FMAC_FLT  `E203_DECINFO_FMAC_FLT_MSB:`E203_DECINFO_FMAC_FLT_LSB
      `define E203_DECINFO_FMAC_FLE_LSB  (`E203_DECINFO_FMAC_FLT_MSB+1)
      `define E203_DECINFO_FMAC_FLE_MSB   (`E203_DECINFO_FMAC_FLE_LSB+1-1)    
  `define E203_DECINFO_FMAC_FLE  `E203_DECINFO_FMAC_FLE_MSB:`E203_DECINFO_FMAC_FLE_LSB
      `define E203_DECINFO_FMAC_DOUBLE_LSB  (`E203_DECINFO_FMAC_FLE_MSB+1)
      `define E203_DECINFO_FMAC_DOUBLE_MSB   (`E203_DECINFO_FMAC_DOUBLE_LSB+1-1)    
  `define E203_DECINFO_FMAC_DOUBLE  `E203_DECINFO_FMAC_DOUBLE_MSB:`E203_DECINFO_FMAC_DOUBLE_LSB

`define E203_DECINFO_FMAC_WIDTH  (`E203_DECINFO_FMAC_DOUBLE_MSB+1)

/*
Comment by Chao Wang

以下是 MULDIV group 的译码信息：

E203_DECINFO_MULDIV_MUL
  配置值为 4：4

E203_DECINFO_MULDIV_MULH
  配置值为 5:5

E203_DECINFO_MULDIV_MULHSU
  配置值为 6:6

E203_DECINFO_MULDIV_MULHU
  配置值为 7:7

E203_DECINFO_MULDIV_DIV
  配置值为 8:8

E203_DECINFO_MULDIV_DIVU
  配置值为 9:9

E203_DECINFO_MULDIV_REM
  配置值为 10:10

E203_DECINFO_MULDIV_REMU
  配置值为 11:11

E203_DECINFO_MULDIV_B2B
  配置值为 12:12

E203_DECINFO_MULDIV_WIDTH
  配置值为 13

意思是 MULDIV Group 的译码要求 DECINFO 至少为 13 位
*/
  // MULDIV group
      `define E203_DECINFO_MULDIV_MUL_LSB   `E203_DECINFO_SUBDECINFO_LSB
      `define E203_DECINFO_MULDIV_MUL_MSB   (`E203_DECINFO_MULDIV_MUL_LSB+1-1)    
  `define E203_DECINFO_MULDIV_MUL   `E203_DECINFO_MULDIV_MUL_MSB:`E203_DECINFO_MULDIV_MUL_LSB    
      `define E203_DECINFO_MULDIV_MULH_LSB   (`E203_DECINFO_MULDIV_MUL_MSB+1)
      `define E203_DECINFO_MULDIV_MULH_MSB   (`E203_DECINFO_MULDIV_MULH_LSB+1-1)    
  `define E203_DECINFO_MULDIV_MULH   `E203_DECINFO_MULDIV_MULH_MSB:`E203_DECINFO_MULDIV_MULH_LSB 
      `define E203_DECINFO_MULDIV_MULHSU_LSB   (`E203_DECINFO_MULDIV_MULH_MSB+1)
      `define E203_DECINFO_MULDIV_MULHSU_MSB   (`E203_DECINFO_MULDIV_MULHSU_LSB+1-1)    
  `define E203_DECINFO_MULDIV_MULHSU   `E203_DECINFO_MULDIV_MULHSU_MSB:`E203_DECINFO_MULDIV_MULHSU_LSB 
      `define E203_DECINFO_MULDIV_MULHU_LSB  (`E203_DECINFO_MULDIV_MULHSU_MSB+1)
      `define E203_DECINFO_MULDIV_MULHU_MSB   (`E203_DECINFO_MULDIV_MULHU_LSB+1-1)    
  `define E203_DECINFO_MULDIV_MULHU  `E203_DECINFO_MULDIV_MULHU_MSB:`E203_DECINFO_MULDIV_MULHU_LSB
      `define E203_DECINFO_MULDIV_DIV_LSB   (`E203_DECINFO_MULDIV_MULHU_MSB+1)
      `define E203_DECINFO_MULDIV_DIV_MSB   (`E203_DECINFO_MULDIV_DIV_LSB+1-1)    
  `define E203_DECINFO_MULDIV_DIV   `E203_DECINFO_MULDIV_DIV_MSB:`E203_DECINFO_MULDIV_DIV_LSB 
      `define E203_DECINFO_MULDIV_DIVU_LSB  (`E203_DECINFO_MULDIV_DIV_MSB+1)
      `define E203_DECINFO_MULDIV_DIVU_MSB  (`E203_DECINFO_MULDIV_DIVU_LSB+1-1)    
  `define E203_DECINFO_MULDIV_DIVU  `E203_DECINFO_MULDIV_DIVU_MSB:`E203_DECINFO_MULDIV_DIVU_LSB
      `define E203_DECINFO_MULDIV_REM_LSB   (`E203_DECINFO_MULDIV_DIVU_MSB+1)
      `define E203_DECINFO_MULDIV_REM_MSB   (`E203_DECINFO_MULDIV_REM_LSB+1-1)    
  `define E203_DECINFO_MULDIV_REM   `E203_DECINFO_MULDIV_REM_MSB:`E203_DECINFO_MULDIV_REM_LSB    
      `define E203_DECINFO_MULDIV_REMU_LSB   (`E203_DECINFO_MULDIV_REM_MSB+1)
      `define E203_DECINFO_MULDIV_REMU_MSB   (`E203_DECINFO_MULDIV_REMU_LSB+1-1)    
  `define E203_DECINFO_MULDIV_REMU   `E203_DECINFO_MULDIV_REMU_MSB:`E203_DECINFO_MULDIV_REMU_LSB 
      `define E203_DECINFO_MULDIV_B2B_LSB   (`E203_DECINFO_MULDIV_REMU_MSB+1)
      `define E203_DECINFO_MULDIV_B2B_MSB   (`E203_DECINFO_MULDIV_B2B_LSB+1-1)    
  `define E203_DECINFO_MULDIV_B2B   `E203_DECINFO_MULDIV_B2B_MSB:`E203_DECINFO_MULDIV_B2B_LSB 

`define E203_DECINFO_MULDIV_WIDTH  (`E203_DECINFO_MULDIV_B2B_MSB+1)

/*
Comment by Chao Wang

每组有各自需要的最少译码长度，最后的译码长度选择最大的
E203_DECINFO_EAI_WIDTH，配置值为 31，所以
E203_DECINFO_WIDTH
  配置值为 32
*/
// Choose the longest group as the final DEC info width
`define E203_DECINFO_WIDTH  (`E203_DECINFO_EAI_WIDTH+1)






/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// LSU relevant macro
//
    // Currently is OITF_DEPTH, In the future, if the ROCC
    // support multiple oustanding
    // we can enlarge this number to 2 or 4
    //
    //
  //`ifdef E203_CFG_HAS_EAI //{
  //  //`define E203_LSU_OUTS_NUM 2 
  //`else//}{
    //`define E203_LSU_OUTS_NUM `E203_OITF_DEPTH 
    //`ifdef E203_OITF_DEPTH_IS_1
    //  `define E203_LSU_OUTS_NUM_IS_1
    //`endif
    // Although we defined the OITF depth as 2, but for LSU, we still only allow 1 oustanding for LSU
/*
Comment by Chao Wang

E203_LSU_OUTS_NUM_IS_1
E203_LSU_OUTS_NUM
  配置 LSU 有一个输出端口
*/
    `define E203_LSU_OUTS_NUM    1
    `define E203_LSU_OUTS_NUM_IS_1
  //`endif//}

/*
Comment by Chao Wang

E203_SUPPORT_AMO
  根据 E203_CFG_SUPPORT_AMO 配置，此选项对于开源的 E203 核必须配置，不可修改。
*/
  `ifdef E203_CFG_SUPPORT_AMO//{
     `define E203_SUPPORT_AMO
  `endif//}
  // No unalign
  //`ifdef E203_CFG_SUPPORT_UNALGNLDST//{
  //   `define E203_SUPPORT_UNALGNLDST
  //`endif//}
 
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////// BIU relevant macro
//
    // Currently is 1, In the future, if the DCache
    // support hit-under-miss (out of order return), then
    // we can enlarge this number to 2 or 4
    //
/*
Comment by Chao Wang

E203_BIU_OUTS_NUM
E203_BIU_OUTS_NUM_IS_1
  配置 BIU 有一个输出端口
E203_BIU_OUTS_CNT_W
  配置值为 1，含义不清楚
*/
  `ifdef E203_HAS_DCACHE //{
    //`define E203_BIU_OUTS_NUM 2 
  `else//}{
    `define E203_BIU_OUTS_NUM `E203_LSU_OUTS_NUM 
    `ifdef E203_LSU_OUTS_NUM_IS_1
      `define E203_BIU_OUTS_NUM_IS_1
      `define E203_BIU_OUTS_CNT_W  1
    `endif
  `endif//}



  // To cut the potential comb loop and critical path between LSU and IFU
  //   and also core and external system, we always cut the ready by BIU Stage
  //   You may argue: Always cut ready may potentially hurt throughput when the DP is just 1
  //   but it is actually a Pseudo proposition because:
  //     * If the BIU oustanding is just 1 in low end core, then we set DP as 1, and there is no 
  //         throughput issue becuase just only 1 oustanding. Even for the PPI or FIO port ideally
  //         if it is 0 cycle response and throughput can be bck-to-back ideally, but we just
  //         sacrafy sacrifice this performance lost, since this is a low end core
  //     * If the BIU oustanding is more than 1 in middle or high end core, then we
  //         set DP as 2 as ping-pong buffer, and then throughput is back-to-back
  //
/*
Comment by Chao Wang

E203_BIU_CMD_CUT_READY
  CMD 是 Command 的缩写，意思是 Output data to slave
  配置值为 1，（CUT）
E203_BIU_RSP_CUT_READY
  RSP 是 Response 的缩写，意思是 Input data to slave
  配置值为 1，（CUT）
*/
  `define E203_BIU_CMD_CUT_READY 1
  `define E203_BIU_RSP_CUT_READY 1

  // If oustanding is just 1, then we just need 1 entry
  // If oustanding is more than 1, then we need ping-pong buffer to enhance throughput
  //   You may argue: why not allow 0 depth to save areas, well this is to cut the potential
  //   comb loop and critical path between LSU and IFU and external bus
/*
Comment by Chao Wang

E203_BIU_CMD_DP
  配置值为 1
E203_BIU_RSP_DP_RAW
  配置值为 1
*/
    `ifdef E203_BIU_OUTS_NUM_IS_1
  `define E203_BIU_CMD_DP 1
  `define E203_BIU_RSP_DP_RAW 1
    `else
  `define E203_BIU_CMD_DP 2
  `define E203_BIU_RSP_DP_RAW 2
    `endif
  //  // We allow such configurability to cut timing path of not to save areas
/*
Comment by Chao Wang

E203_BIU_RSP_DP
  配置值为 1
*/
  `define E203_TIMING_BOOST
  `ifdef E203_TIMING_BOOST
    `define E203_BIU_RSP_DP        `E203_BIU_RSP_DP_RAW       
  `else
    `define E203_BIU_RSP_DP        0
  `endif

/*
Comment by Chao Wang

E203_HAS_CSR_EAI
  配置值为 1
*/
  `define E203_HAS_CSR_EAI  1
