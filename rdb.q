upd:{[t;x] t insert x;if[not`g=attr get[t]`sym;update `g#sym from t];}
.u.end:{![`.;();0b;tables`.];.Q.gc`;}
.proc.subscribe`