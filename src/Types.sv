package Types;
    
    typedef logic [6:0] t_opcode;
    const t_opcode OP_IMM = 'b00_100_11;
    
    typedef logic [2:0] t_funct3;
    const t_funct3 F3_ADD = 'b000;
    const t_funct3 F3_SUB = 'b000;
    const t_funct3 F3_SLL = 'b001;
    const t_funct3 F3_SLT = 'b010;
    const t_funct3 F3_SLTU = 'b011;
    const t_funct3 F3_XOR = 'b100;
    const t_funct3 F3_SRL = 'b101;
    const t_funct3 F3_SRA = 'b101;
    const t_funct3 F3_OR = 'b110;
    const t_funct3 F3_AND = 'b111;

    typedef logic [4:0] t_register;
    typedef logic [31:0] t_word;

    typedef enum logic [0:0] { 
        OK_UNKNOWN,
        OK_OP_IMM
    } t_op_kind;

    typedef enum logic [3:0] { 
        FK_ADD,
        FK_SUB,
        FK_SLT,
        FK_SLTU,
        FK_AND,
        FK_OR,
        FK_XOR,
        FK_SLL,
        FK_SRL,
        FK_SRA
    } t_func_kind;

    typedef struct packed {
        t_func_kind func;
        t_register src_register;
        t_word immediate_value;
        t_register dest_register;
    } t_op_imm_instr;

    typedef union packed {
        t_op_imm_instr op_imm_instr;
    } t_instr_data_union;

    typedef struct packed {
        t_op_kind kind;
        t_instr_data_union instr_data;
    } t_decoded_instr;

endpackage