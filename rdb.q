h:hopen 8010;

upd:insert;

/ end of day: save, clear, hdb reload
.u.end:{
    t@:where`g=attr each(t:tables`.)@\:`sym;
    .Q.hdpf[.ipc.conn`hdb;hsym `$.conf.stack.vars.data;`$string .z.D;`sym]; / .conf.stack.vars.data needs to be changed 
    @[;`sym;`g#] each t;
 }

sub:{[t] h(`.u.sub;t)}