# $NetBSD: Makefile,v 1.11 2019/01/29 20:07:03 mgorny Exp $

.include <bsd.own.mk>

TESTSDIR=	${TESTSBASE}/usr.bin/c++

ASAN_TESTS=	#
ASAN_TESTS+=	t_asan_double_free
ASAN_TESTS+=	t_asan_global_buffer_overflow
ASAN_TESTS+=	t_asan_heap_overflow
ASAN_TESTS+=	t_asan_off_by_one
ASAN_TESTS+=	t_asan_poison
ASAN_TESTS+=	t_asan_uaf

UBSAN_TESTS=	#
UBSAN_TESTS+=	t_ubsan_int_add_overflow
UBSAN_TESTS+=	t_ubsan_int_neg_overflow
UBSAN_TESTS+=	t_ubsan_vla_out_of_bounds
UBSAN_TESTS+=	t_ubsan_int_sub_overflow
UBSAN_TESTS+=	t_ubsan_int_divzero

TESTS_SH=	#
TESTS_SH+=	$(ASAN_TESTS)
TESTS_SH+=	$(UBSAN_TESTS)
TESTS_SH+=	t_call_once
TESTS_SH+=	t_call_once2
TESTS_SH+=	t_cxxruntime
TESTS_SH+=	t_hello
TESTS_SH+=	t_pthread_once
TESTS_SH+=	t_static_destructor

.for test in ${ASAN_TESTS}
TESTS_SH_SRC_${test}=	asan_common.subr ${test}.sh
.endfor
.for test in ${UBSAN_TESTS}
TESTS_SH_SRC_${test}=	ubsan_common.subr ${test}.sh
.endfor

.include <bsd.test.mk>
