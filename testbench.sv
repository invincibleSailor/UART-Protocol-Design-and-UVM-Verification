`include "uvm_macros.svh"
import uvm_pkg::*;

class uart_config extends uvm_object;
`uvm_object_utils(uart_config)
function new(input string path="uart_config");
    super.new(path);
endfunction

uvm_active_passive_enum is_active=UVM_ACTIVE;
endclass

typedef enum bit [3:0] {rand_baud_1_stop=0,rand_length_1_stop = 1, length5wp = 2, length6wp = 3, length7wp = 4, length8wp = 5, length5wop = 6, length6wop = 7, length7wop = 8, length8wop = 9,rand_baud_2_stop = 11, rand_length_2_stop = 12} oper_mode;

class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
    rand oper_mode   op;
         logic tx_start, rx_start;
         logic rst;
    rand logic [7:0] tx_data;
    rand logic [16:0] baud;
    rand logic [3:0] length; 
    rand logic parity_type, parity_en;
         logic stop2;
         logic tx_done, rx_done, tx_err, rx_err;
         logic [7:0] rx_out;
  

  
  constraint baud_c { baud inside {4800,9600,14400,19200,38400,57600}; }
  constraint length_c { length inside {5,6,7,8}; }

  function new(string name = "transaction");
    super.new(name);
  endfunction

endclass : transaction

class rand_baud extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud)
  
  transaction tr;

  function new(string name = "rand_baud");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = rand_baud_1_stop;
        tr.length = 8;
        tr.baud   = 9600;
        tr.rst       = 1'b0;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_with_stop extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_with_stop)
  
  transaction tr;

  function new(string name = "rand_baud_with_stop");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op        = rand_baud_2_stop;
        tr.rst       = 1'b0;
        tr.length    = 8;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b1;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len5p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len5p)
  
  transaction tr;

  function new(string name = "rand_baud_len5p");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length5wp;
        tr.rst       = 1'b0;
        tr.tx_data   = {3'b000, tr.tx_data[7:3]};
        tr.length = 5;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len6p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len6p)
  
  transaction tr;

  function new(string name = "rand_baud_len6p");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length6wp;
        tr.rst       = 1'b0;
        tr.length = 6;
        tr.tx_data   = {2'b00, tr.tx_data[7:2]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len7p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len7p)
  
  transaction tr;

  function new(string name = "rand_baud_len7p");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length7wp;
        tr.rst       = 1'b0;
        tr.length = 7;
        tr.tx_data   = {1'b0, tr.tx_data[7:1]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len8p extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len8p)
  
  transaction tr;

  function new(string name = "rand_baud_len8p");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length8wp;
        tr.rst       = 1'b0;
        tr.length = 8;
        tr.tx_data   =  tr.tx_data[7:0];
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len5 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len5)
  
  transaction tr;

  function new(string name = "rand_baud_len5");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length5wop;
        tr.rst       = 1'b0;
        tr.length = 5;
        tr.tx_data   = {3'b000, tr.tx_data[7:3]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len6 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len6)
  
  transaction tr;

  function new(string name = "rand_baud_len6");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length6wop;
        tr.rst       = 1'b0;
        tr.length = 6;
        tr.tx_data   = {2'b00, tr.tx_data[7:2]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len7 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len7)
  
  transaction tr;

  function new(string name = "rand_baud_len7");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length7wop;
        tr.rst       = 1'b0;
        tr.length = 7;
        tr.tx_data   = {1'b0, tr.tx_data[7:1]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class rand_baud_len8 extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len8)
  
  transaction tr;

  function new(string name = "rand_baud_len8");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length8wop;
        tr.rst       = 1'b0;
        tr.length = 8;
        tr.tx_data   =  tr.tx_data[7:0];
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  

endclass

class driver extends uvm_driver#(transaction);
`uvm_component_utils(driver)

virtual uart_if uif;
transaction tr;

 function new(input string path="driver",uvm_component parent=null);
    super.new(path,parent);
 endfunction
 
 virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     tr = transaction::type_id::create("tr"); 
   if(!uvm_config_db#(virtual uart_if)::get(this,"","uif",uif)) 
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
  task reset_dut();

    repeat(5) 
    begin
    uif.rst      <= 1'b1;  ///active high reset
    uif.tx_start <= 1'b0;
    uif.rx_start <= 1'b0;
    uif.tx_data  <= 8'h00;
    uif.baud     <= 16'h0;
    uif.length   <= 4'h0;
    uif.parity_type <= 1'b0;
    uif.parity_en   <= 1'b0;
    uif.stop2  <= 1'b0;
   `uvm_info("DRV", "System Reset : Start of Simulation", UVM_MEDIUM);
    @(posedge uif.clk);
      end
  endtask
  
  task drive();
    reset_dut();
    forever begin
         seq_item_port.get_next_item(tr);    
            uif.rst         <= 1'b0;
            uif.tx_start    <= tr.tx_start;
            uif.rx_start    <= tr.rx_start;
            uif.tx_data     <= tr.tx_data;
            uif.baud        <= tr.baud;
            uif.length      <= tr.length;
            uif.parity_type <= tr.parity_type;
            uif.parity_en   <= tr.parity_en;
            uif.stop2       <= tr.stop2;
         `uvm_info("DRV", $sformatf("BAUD:%0d LEN:%0d PAR_T:%0d PAR_EN:%0d STOP:%0d TX_DATA:%0d", tr.baud, tr.length, tr.parity_type, tr.parity_en, tr.stop2, tr.tx_data), UVM_NONE);
            @(posedge uif.clk); 
            @(posedge uif.tx_done);
            @(negedge uif.rx_done);
         seq_item_port.item_done();   
   end
  endtask
  
  virtual task run_phase(uvm_phase phase);
    drive();
  endtask
endclass

class monitor extends uvm_monitor;
`uvm_component_utils(monitor)

uvm_analysis_port #(transaction) send;
transaction tr;
virtual uart_if uif;

function new(input string inst = "monitor", uvm_component parent = null);
    super.new(inst,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    send = new("send", this);
    if(!uvm_config_db#(virtual uart_if)::get(this,"","uif",uif))//uvm_test_top.env.agent.drv.aif
       `uvm_error("MON","Unable to access Interface");
endfunction

virtual task run_phase(uvm_phase phase);
forever begin
  @(posedge uif.clk);
  if(uif.rst)
    begin
      tr.rst = 1'b1;
    `uvm_info("MON", "SYSTEM RESET DETECTED", UVM_NONE);
    send.write(tr);
    end
  else
     begin
     @(posedge uif.tx_done);
     tr.rst         = 1'b0;
     tr.tx_start    = uif.tx_start;
     tr.rx_start    = uif.rx_start;
     tr.tx_data     = uif.tx_data;
     tr.baud        = uif.baud;
     tr.length      = uif.length;
     tr.parity_type = uif.parity_type;
     tr.parity_en   = uif.parity_en;
     tr.stop2       = uif.stop2;
       @(negedge uif.rx_done);
     
     tr.rx_out      = uif.rx_out;
       `uvm_info("MON", $sformatf("BAUD:%0d LEN:%0d PAR_T:%0d PAR_EN:%0d STOP:%0d TX_DATA:%0d RX_DATA:%0d", tr.baud, tr.length, tr.parity_type, tr.parity_en, tr.stop2, tr.tx_data, tr.rx_out), UVM_NONE);
      send.write(tr);
     end
   end
endtask
endclass

class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_analysis_imp#(transaction,scoreboard) recv;
bit [31:0] arr[32] = '{default:0};
bit [31:0] addr    = 0;
bit [31:0] data_rd = 0;

function new(input string inst = "scoreboard", uvm_component parent = null);
    super.new(inst,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
endfunction

virtual function void write(transaction tr);
    `uvm_info("SCO", $sformatf("BAUD:%0d LEN:%0d PAR_T:%0d PAR_EN:%0d STOP:%0d TX_DATA:%0d RX_DATA:%0d", tr.baud, tr.length, tr.parity_type, tr.parity_en, tr.stop2, tr.tx_data, tr.rx_out), UVM_NONE);
    if(tr.rst==1'b1)
        `uvm_info("SCO","System Reset",UVM_NONE)
    else if(tr.tx_data==tr.rx_out)
        `uvm_info("SCO", "Test Passed", UVM_NONE)
    else
      `uvm_info("SCO", "Test Failed", UVM_NONE)
    $display("----------------------------------------------------------------");
endfunction
endclass

class agent extends uvm_agent;
`uvm_component_utils(agent)

uart_config cfg;
driver drv;
uvm_sequencer#(transaction) seqr;
monitor mon;

function new(input string path="agent",uvm_component parent=null);
    super.new(path,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
   cfg =  uart_config::type_id::create("cfg"); 
   mon = monitor::type_id::create("mon",this);
   if(cfg.is_active==UVM_ACTIVE)
    begin
    drv=driver::type_id::create("drv",this);
    seqr=uvm_sequencer #(transaction)::type_id::create("seqr", this);
    end
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
  if(cfg.is_active == UVM_ACTIVE) begin  
    drv.seq_item_port.connect(seqr.seq_item_export);
  end
endfunction
endclass

class env extends uvm_env;
`uvm_component_utils(env)

function new(input string inst = "env", uvm_component c);
super.new(inst,c);
endfunction

agent a;
scoreboard sco;

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = agent::type_id::create("a",this);
  sco = scoreboard::type_id::create("sco", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
 a.mon.send.connect(sco.recv);
endfunction

endclass

class test extends uvm_test;
`uvm_component_utils(test)

function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction


env e;//environment
//sequences
rand_baud rb;
rand_baud_with_stop rbs;
rand_baud_len5p  rb5l;
rand_baud_len6p rb6l;
rand_baud_len7p rb7l;
rand_baud_len8p rb8l;
rand_baud_len5  rb5lwop;
rand_baud_len6  rb6lwop;
rand_baud_len7  rb7lwop;
rand_baud_len8  rb8lwop;

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
   e       = env::type_id::create("env",this);
   rb      = rand_baud::type_id::create("rb");
   rbs     = rand_baud_with_stop::type_id::create("rbs");
  /////////////fixed length var baud with parity
   rb5l    = rand_baud_len5p::type_id::create("rb5l");
   rb6l    = rand_baud_len6p::type_id::create("rb6l");
   rb7l    = rand_baud_len7p::type_id::create("rb7l");
   rb8l    = rand_baud_len8p::type_id::create("rb8l");
  
  ///////////////fixed len var baud without parity
  rb5lwop = rand_baud_len5::type_id::create("rb5lwop");
  rb6lwop = rand_baud_len6::type_id::create("rb6lwop");
  rb7lwop = rand_baud_len7::type_id::create("rb7lwop");
  rb8lwop = rand_baud_len8::type_id::create("rb8lwop");
  
  
endfunction

virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rb8lwop.start(e.a.seqr);
    #20;
    phase.drop_objection(this);
endtask
endclass

module uart_tb();
  uart_if uif();
  uart_top dut (.clk(uif.clk), .rst(uif.rst), .tx_start(uif.tx_start), .rx_start(uif.rx_start), .tx_data(uif.tx_data), .baud(uif.baud), .length(uif.length), .parity_type(uif.parity_type), .parity_en(uif.parity_en),.stop2(uif.stop2),.tx_done(uif.tx_done), .rx_done(uif.rx_done), .tx_err(uif.tx_err), .rx_err(uif.rx_err), .rx_out(uif.rx_out));  
  initial begin
    uif.clk <= 0;
  end

  always #10 uif.clk <= ~uif.clk;
   initial begin
    uvm_config_db#(virtual uart_if)::set(null, "*", "uif", uif);
    run_test("test");
   end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  
endmodule