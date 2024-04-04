define float @saxpy(float %a, float %x, float %y) {
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
