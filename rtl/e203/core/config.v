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
                                                                         
                                                                         
                                                                         

/*
Comment by Chao Wang

缩写注释： 
    E203 是蜂鸟项目中开源核的名字；
    CFG 是config的缩写；
*/

/*
Comment by Chao Wang

E203_CFG_DEBUG_HAS_JTAG
    如果添加了此宏，则配置使用 JTAG 调试接口
    更多可参考《手把手教你设计CPU：RISC-V处理器篇》第14章
E203_CFG_IRQ_NEED_SYNC
    功能暂不清楚
*/
`define E203_CFG_DEBUG_HAS_JTAG
`define E203_CFG_IRQ_NEED_SYNC

/*
Comment by Chao Wang

E203_CFG_ADDR_SIZE_IS_16、E203_CFG_ADDR_SIZE_IS_24、E203_CFG_ADDR_SIZE_IS_32
    三选一，用于配置处理器的寻址地址（物理地址）宽度为16位，24位或者32位
*/
//`define E203_CFG_ADDR_SIZE_IS_16
//`define E203_CFG_ADDR_SIZE_IS_24
`define E203_CFG_ADDR_SIZE_IS_32

/*
Comment by Chao Wang

E203_CFG_ADDR_SIZE
    e203核的寻址地址宽度（物理地址），根据E203_CFG_ADDR_SIZE_IS_16，E203_CFG_ADDR_SIZE_IS_24
    或E203_CFG_ADDR_SIZE_IS_32配置E203_CFG_ADDR_SIZE为16，24或32
*/
`ifdef E203_CFG_ADDR_SIZE_IS_16
   `define E203_CFG_ADDR_SIZE   16
`endif
`ifdef E203_CFG_ADDR_SIZE_IS_32
   `define E203_CFG_ADDR_SIZE   32
`endif
`ifdef E203_CFG_ADDR_SIZE_IS_24
   `define E203_CFG_ADDR_SIZE   24
`endif

/*
Comment by Chao Wang

E203_CFG_SUPPORT_MSCRATCH
    功能暂不清楚，从 ./e203_defines.v 中可以看出，这个CFG选项已经被取消，E203一直支持MSCRATCH
E203_CFG_SUPPORT_MCYCLE_MINSTRET
    如果添加了此宏,则配置使用 MCYCLE 和 MINSTRET 这两个 64 位的 Performance Counters
    更多关于 MCYCLE 和 MINSTRET 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》附录B2
*/
//`define E203_CFG_SUPPORT_MSCRATCH
`define E203_CFG_SUPPORT_MCYCLE_MINSTRET

/*
Comment by Chao Wang

E203_CFG_REGNUM_IS_32、E203_CFG_REGNUM_IS_16
    二选一，用于配置使用 32 个通用寄存器(RV32I) 或者 16 个通用寄存器(RV32E)
    更多关于 REG 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》附录A4
*/
//
`define E203_CFG_REGNUM_IS_32
/////////////////////////////////////////////////////////////////
/*
Comment by Chao Wang

以下是关于物理地址分配的宏：

E203_CFG_HAS_ITCM
    如果添加了此宏，则配置使用 ITCM（指令紧耦合存储）
E203_CFG_ITCM_ADDR_BASE
    配置 ITCM 的（物理）基地址
E203_CFG_ITCM_ADDR_WIDTH
    配置 ITCM 的大小，使用地址总线宽度作为大小的衡量，譬如假设 ITCM 的大小为 1 KByte，则此宏定义值为 10

E203_CFG_HAS_DTCM
    如果添加了此宏，则配置使用 DTCM（数据紧耦合存储）
E203_CFG_DTCM_ADDR_BASE
    配置 DTCM 的（物理）基地址
E203_CFG_DTCM_ADDR_WIDTH
    配置 DTCM 的大小，使用地址总线宽度作为大小的衡量，譬如假设 DTCM 的大小为 1 KByte，则此宏定义值为 10
    更多关于 ITCM 和 DTCM 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》第11章

E203_CFG_PPI_ADDR_BASE
    配置私有外设接口(PPI: Private Peripheral Interface)的（物理）基地址
E203_CFG_PPI_BASE_REGION
    配置 PPI 接口的地址区间，通过指定高位的区间来界定地址区间。
    譬如如果该 REGION 定义为 31:28，基地址定义为0x1000_0000。
    则表示 PPI 的地址区间为0x1000_0000 ~ 0x1FFF_FFFF。
    更多关于 PPI 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》第12章


E203_CFG_FIO_ADDR_BASE
    配置快速 IO 接口(FIO: Fast IO Interface)的（物理）基地址
E203_CFG_FIO_BASE_REGION
    配置 FIO 接口的地址区间，通过指定高位的区间来界定地址区间。
    譬如如果该REGION定义为 31:28，基地址定义为0xf000_0000。
    则表示 FIO 的地址区间为0xf000_0000 ~ 0xfFFF_FFFF。
    更多关于 FIO 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》第12章

E203_CFG_CLINT_ADDR_BASE
    CLINT 是 Core Local Interrupts Controller 的缩写
    配置 CLINT 接口的（物理）基地址。有关 CLINT 介绍，请参见
    《Hummingbird_E200_Series_Core_SoC_Quick_Start_Guide.pdf》
E203_CFG_CLINT_BASE_REGION
    配置 CLINT 接口的地址区间，通过指定高位的区间来界定地址区间。
    譬如如果该 REGION 定义为 31:16，基地址定义为0x0200_0000。
    则表示 PLIC 的地址区间为0x0200_0000 ~ 0x0200_FFFF。
    更多关于 CLINT 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》第13章

E203_CFG_PLIC_ADDR_BASE
    PLIC 是 Platform Level Interrupt Controller 的缩写
    配置 PLIC 接口的（物理）基地址。有关 PLIC 介绍，请参见
    《Hummingbird_E200_Series_Core_SoC_Quick_Start_Guide.pdf》
E203_CFG_PLIC_BASE_REGION
    配置 PLIC 接口的地址区间，通过指定高位的区间来界定地址区间。
    譬如如果该 REGION 定义为 31:24，基地址定义为0x0C00_0000。
    则表示 PLIC 的地址区间为0x0C00_0000 ~ 0x0CFF_FFFF。
    更多关于 PLIC 的信息可参考《手把手教你设计CPU：RISC-V处理器篇》第13章
*/
`define E203_CFG_HAS_ITCM
    // 64KB have address 16bits wide
    //   The depth is 64*1024*8/64=8192
`define E203_CFG_ITCM_ADDR_WIDTH  16

//    // 1024KB have address 20bits wide
//    //   The depth is 1024*1024*8/64=131072
//`define E203_CFG_ITCM_ADDR_WIDTH  20

//    // 2048KB have address 21bits wide
//    //   The depth is 2*1024*1024*8/64=262144
//`define E203_CFG_ITCM_ADDR_WIDTH  21


/////////////////////////////////////////////////////////////////
`define E203_CFG_HAS_DTCM
    // 16KB have address 14 wide
    //   The depth is 16*1024*8/32=4096

    // 256KB have address 18 wide
    //   The depth is 256*1024*8/32=65536

//    // 1MB have address 20bits wide
//    //   The depth is 1024*1024*8/32=262144

/////////////////////////////////////////////////////////////////
/*
Comment by Chao Wang

E203_CFG_REGFILE_LATCH_BASED
    如果添加了此宏，则配置使用 Latch 作为通用寄存器组(Regfile)的基本单元。
    如果没有添加此宏，则使用 D Flip-Flops 作为基本单元。
    更多可参考《手把手教你设计CPU：RISC-V处理器篇》第八章
*/
//`define E203_CFG_REGFILE_LATCH_BASED
//




//
`define E203_CFG_ITCM_ADDR_BASE   `E203_CFG_ADDR_SIZE'h8000_0000 
`define E203_CFG_DTCM_ADDR_BASE   `E203_CFG_ADDR_SIZE'h9000_0000 
 //   * PPI       : 0x1000 0000 -- 0x1FFF FFFF
`define E203_CFG_PPI_ADDR_BASE  `E203_CFG_ADDR_SIZE'h1000_0000
    `define E203_CFG_PPI_BASE_REGION  `E203_CFG_ADDR_SIZE-1:`E203_CFG_ADDR_SIZE-4

  //  * CLINT     : 0x0200 0000 -- 0x0200 FFFF
  //  * PLIC      : 0x0C00 0000 -- 0x0CFF FFFF
`define E203_CFG_CLINT_ADDR_BASE  `E203_CFG_ADDR_SIZE'h0200_0000
    `define E203_CFG_CLINT_BASE_REGION  `E203_CFG_ADDR_SIZE-1:`E203_CFG_ADDR_SIZE-16
`define E203_CFG_PLIC_ADDR_BASE  `E203_CFG_ADDR_SIZE'h0C00_0000
    `define E203_CFG_PLIC_BASE_REGION  `E203_CFG_ADDR_SIZE-1:`E203_CFG_ADDR_SIZE-8

`define E203_CFG_FIO_ADDR_BASE  `E203_CFG_ADDR_SIZE'hf000_0000 
    `define E203_CFG_FIO_BASE_REGION  `E203_CFG_ADDR_SIZE-1:`E203_CFG_ADDR_SIZE-4





/*
Comment by Chao Wang
    
E203_CFG_HAS_ECC
    如果添加了此宏，则配置使用 ECC 对 ITCM 和 DTCM 的 SRAM 进行保护。
    注意：此选项的功能并未开源，因此相关代码并不具备，即便添加了配置宏也不起作用

E203_CFG_HAS_EAI
    如果添加了此宏，则配置使用协处理器接口
    注意：此选项的功能并未开源,因此相关代码并不具备，即便添加了配置宏也不起作用

E203_CFG_SUPPORT_SHARE_MULDIV
    如果添加了此宏，则配置使用面积优化的使用多周期乘除法
    注意：此选项对于开源的 E203 核必须配置，不可修改。

E203_CFG_SUPPORT_AMO
    如果添加了此宏，则配置支持 RISC-V 的“A”指令集扩展
    注意：此选项对于开源的 E203 核必须配置，不可修改。
*/
`define E203_CFG_HAS_ECC
`define E203_CFG_HAS_EAI
`define E203_CFG_SUPPORT_SHARE_MULDIV
`define E203_CFG_SUPPORT_AMO
`define E203_CFG_DTCM_ADDR_WIDTH 16
