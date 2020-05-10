  %i.0 = phi i32 [ 0, %entry ], [ %inc6, %for.inc5 ]
  -->  {0,+,1}<nuw><nsw><%for.cond>     Exits: 10
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond1>    Exits: 20

