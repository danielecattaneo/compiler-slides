; <label>:5
  %6 = load i32, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  %8 = sub i32 %7, 1
  %9 = call i32 @fact(i32 %8)
  %10 = mul i32 %6, %9
  br label %11

; <label>:11
  %12 = phi i32 [ 1, %4 ], [ %10, %5 ]
  ret i32 %12
}
