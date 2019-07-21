# Source Code


define.v:	Global include


## structure format
```
└── instance_name:module_name (file_name)
```


## code structure
```
└── myCPU (myCPU.v)
    ├── IF:IF (if.v)
    │   ├── PC:pc_reg (pc.v)
    │   └── mux32:mux_32 (mux_32.v)
    ├── IF_ID:IF_ID (if_id.v)
    ├── ID:ID (id.v)
    │   ├── rf:regfile (regfile.v)
    │   └── ctrl:control (control.v)
    ├── ID_EX:ID_EX (id_ex.v)
    ├── EX:EX (ex.v)
    │   ├── add:Add (add.v)
    │   ├── mux32:mux_32 (mux_32.v)
    │   ├── aluc:ALUControl (alu_control.v)
    │   ├── alu:ALU (alu.v)
    │   └── mux5:mux_5 (mux_5.v)
    ├── EX_MEM:EX_MEM (ex_mem.v)
    ├── MEM:MEM (mem.v)
    ├── MEM_WB:MEM_WB (mem_wb.v)
    └── WB:WB (wb.v)
        └── mux32:mux_32 (mux_32.v)
```
