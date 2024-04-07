module inversor (
    input wire entrada,
    output wire salida
);
    assign salida = ~entrada;
endmodule