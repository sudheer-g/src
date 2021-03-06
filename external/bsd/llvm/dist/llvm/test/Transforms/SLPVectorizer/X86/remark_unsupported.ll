; RUN: opt -S -mtriple=x86_64-pc-linux-gnu -mcpu=generic -slp-vectorizer -pass-remarks-output=%t < %s | FileCheck %s
; RUN: FileCheck --input-file=%t --check-prefix=YAML %s

; This type is not supported by SLP
define void @test(x86_fp80* %i1, x86_fp80* %i2, x86_fp80* %o) {

entry:
  %i1.0 = load x86_fp80, x86_fp80* %i1, align 16
  %i1.gep1 = getelementptr x86_fp80, x86_fp80* %i1, i64 1
  %i1.1 = load x86_fp80, x86_fp80* %i1.gep1, align 16
  br i1 undef, label %then, label %end
then:
  %i2.gep0 = getelementptr inbounds x86_fp80, x86_fp80* %i2, i64 0
  %i2.0 = load x86_fp80, x86_fp80* %i2.gep0, align 16
  %i2.gep1 = getelementptr inbounds x86_fp80, x86_fp80* %i2, i64 1
  %i2.1 = load x86_fp80, x86_fp80* %i2.gep1, align 16
  br label %end
end:
  %phi0 = phi x86_fp80 [ %i1.0, %entry ], [ %i2.0, %then ]

  %phi1 = phi x86_fp80 [ %i1.1, %entry ], [ %i2.1, %then ]
  store x86_fp80 %phi0, x86_fp80* %o, align 16
  %o.gep1 = getelementptr inbounds x86_fp80, x86_fp80* %o, i64 1
  store x86_fp80 %phi1, x86_fp80* %o.gep1, align 16
 ; CHECK-NOT: <{{[0-9]+}} x x86_fp80>
 ; YAML:      Pass:            slp-vectorizer
 ; YAML-NEXT: Name:            UnsupportedType
 ; YAML-NEXT: Function:        test
 ; YAML-NEXT: Args:
 ; YAML-NEXT:   - String:          'Cannot SLP vectorize list: type '
 ; YAML-NEXT:   - String:          x86_fp80 is unsupported by vectorizer

  ret void
}
