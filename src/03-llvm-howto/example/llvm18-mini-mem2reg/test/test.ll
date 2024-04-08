; ModuleID = '../test/test.c'
source_filename = "../test/test.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable
define float @saxpy(float noundef %a, float noundef %x, float noundef %y) #0 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  %t = alloca float, align 4
  store float %a, ptr %a.addr, align 4
  store float %x, ptr %x.addr, align 4
  store float %y, ptr %y.addr, align 4
  %0 = load float, ptr %a.addr, align 4
  %1 = load float, ptr %x.addr, align 4
  %mul = fmul float %0, %1
  store float %mul, ptr %t, align 4
  %2 = load float, ptr %t, align 4
  %3 = load float, ptr %y.addr, align 4
  %add = fadd float %2, %3
  ret float %add
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @search(ptr noundef %x, i32 noundef %n, i32 noundef %y) #0 {
entry:
  %x.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %x, ptr %x.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  store i32 %y, ptr %y.addr, align 4
  store i32 -1, ptr %j, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %x.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %5 = load i32, ptr %y.addr, align 4
  %cmp1 = icmp eq i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32, ptr %i, align 4
  store i32 %6, ptr %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, ptr %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %8 = load i32, ptr %j, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @doubleIndirection(ptr noundef %x) #0 {
entry:
  %x.addr = alloca ptr, align 8
  %y = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  store ptr %x.addr, ptr %y, align 8
  %0 = load ptr, ptr %y, align 8
  %1 = load ptr, ptr %0, align 8
  %2 = load i32, ptr %1, align 4
  %call = call i32 @search(ptr noundef null, i32 noundef %2, i32 noundef 1)
  ret i32 %call
}

attributes #0 = { noinline nounwind ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 18.1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
