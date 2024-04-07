module Comp_OR (
    input wire A_or,
    input wire B_or,
    output wire OR
);
    assign OR = A_or | B_or;
endmodule