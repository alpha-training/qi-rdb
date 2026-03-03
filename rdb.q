
.qi.frompkg[`tp;`u];  

\d .u

w:(0#`)!()

pub1:{[t;x;w] $[count x:sel[x]w 1;[neg[w 0](`upd;t;x);count x];0]}
selflush:{if[count r:sel[`. x;y];![x;$[`~y;();enlist(in;`sym;y)];0b;0#`];.Q.gc`];r}
add:{$[(count w x)>i:w[x;;0]?.z.w;.[`.u.w;(x;i;1);union;y];w[x],:enlist(.z.w;y)];(x;selflush[x;y])}

osub:sub

sub:{
  if[t~a:mt x; '"Cannot subscribe to all tables in a chained rdb"];
  r:osub[a;y];
  setupd`;
  r
  }

upd2:{[t;x]
  $[0=p:sum 0,pub1[t;x]each subs:.u.w t;
    t insert x;
  p<count x;
    t insert select from x where not sym in distinct raze subs[;1];
    ()];
  }

setupd:{`..upd set $[count handles`;upd2;insert]}

pc:{h:handles`;del[;x]each t;if[not h~handles`;setupd`];}

end:{[d]
  .qi.info".u.end ",.qi.tostr d;
  neg[handles`]@\:(`.u.end;x);
  {[t] .qi.info"Clearing and applying g# ",.qi.tostr t;delete from t;update `g#sym from t;}each t;
  .qi.info".Q.gc[]";
  .Q.gc`;
  }

\d .

tcounts:{desc a!(count get@)each a:tables x}

.rdb.init:{
  .event.addhandler[`.z.pc;`.u.pc];
  .u.setupd`;
  .proc.replay .proc.subscribe`;
  .u.init[];
  }