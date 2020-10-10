library verilog;
use verilog.vl_types.all;
entity Counter is
    generic(
        n               : integer := 8
    );
    port(
        \OUT\           : out    vl_logic_vector;
        DATA_IN         : in     vl_logic_vector;
        E               : in     vl_logic;
        D               : in     vl_logic;
        LOAD            : in     vl_logic;
        CLK             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end Counter;
