
.qi.frompkg[`tp;`u];  

\d .u

w:(0#`)!()

pub1:{[t;x;w] $[count x:sel[x]w 1;[neg[w 0](`upd;t;x);count x];0]}

sub1:{0N!(`sub1;x;y);$[t~a:mt x;'"Cannot subscribe to all tables in an rdb";11=type a;:sub[;y]each a;not x in t;'x;[del[x].z.w;add[x;y]]]}

sub:{[t;x] r:sub1[t;x];flush`;setupd`;r}

upd2:{[new;t;x]
  $[0=p:sum 0,pub1[t;x]each subs:.u.w t;
    if[new;t insert x];
  p<count x;
    $[new;insert;set][t;select from x where not sym in distinct raze subs[;1]];
    ()];
  }

flush:{{upd2[0b;x;`. x]}each t}   / flush to subscribers (if there are any)

setupd:{`..upd set $[count handles`;upd2 1b;insert]}

pc:{h:handles`;del[;x]each t;if[not h~handles`;setupd`];}

end:{[d]
  .qi.info".u.end ",.qi.tostr d;
  neg[handles`]@\:(`.u.end;x);
  {[t] .qi.info"Clearing and applying g# ",.qi.tostr t;delete from t;update `g#sym from t;}each t;
  .qi.info".Q.gc[]";
  .Q.gc`;
  }

\d .

.rdb.init:{
  .event.addhandler[`.z.pc;`.u.pc];
  .u.setupd`;
  .proc.replay .proc.subscribe`;
  .u.init[];
  }