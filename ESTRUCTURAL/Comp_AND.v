module Comp_AND (
    input wire  A_and,
    input wire  B_and,
    output wire AND
);
    assign AND = A_and & B_and;
endmodule