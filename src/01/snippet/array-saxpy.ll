for.cond:                                         
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end
  [...]
for.inc:                                          
  %inc = add i32 %i.0, 1
  br label %for.cond

