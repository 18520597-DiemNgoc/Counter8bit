library verilog;
use verilog.vl_types.all;
entity HAS is
    port(
        C_out           : out    vl_logic;
        Q_out           : out    vl_logic;
        D_Ctrl          : in     vl_logic;
        E_Ctrl          : in     vl_logic;
        Q_IN            : in     vl_logic
    );
end HAS;
