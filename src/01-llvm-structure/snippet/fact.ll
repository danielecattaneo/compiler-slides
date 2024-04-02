define i32 @fact(i32 noundef %n) {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load i32, ptr %n.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:
  store i32 0, ptr %retval, align 4
  br label %return

if.else:
  %1 = load i32, ptr %n.addr, align 4
  %2 = load i32, ptr %n.addr, align 4
  %sub = sub nsw i32 %2, 1
  %call = call i32 @fact(i32 noundef %sub)
  %mul = mul nsw i32 %1, %call
  store i32 %mul, ptr %retval, align 4
  br label %return

return:
  %3 = load i32, ptr %retval, align 4
  ret i32 %3
}
