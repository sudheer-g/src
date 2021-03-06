# $NetBSD: Makefile,v 1.58 2019/02/04 05:24:18 mrg Exp $

NOMAN=		# defined

.include <bsd.own.mk>

TESTSDIR=	${TESTSBASE}/kernel

TESTS_SUBDIRS+=	kqueue
TESTS_C=	t_lock
TESTS_C+=	t_lockf
TESTS_C+=	t_pty
TESTS_C+=	t_mqueue
TESTS_C+=	t_sysv
TESTS_C+=	t_subr_prf
TESTS_C+=	t_kauth_pr_47598
TESTS_C+=	t_ksem
TESTS_C+=	t_sysctl
TESTS_C+=	t_timeleft
TESTS_C+=	t_zombie

TESTS_SH=	t_umount
TESTS_SH+=	t_umountstress
TESTS_SH+=	t_ps_strings
TESTS_SH+=	t_trapsignal
TESTS_SH+=	t_interp
TESTS_SH+=	t_procpath

BINDIR=		${TESTSDIR}
PROGS=		h_ps_strings1
PROGS+=		h_ps_strings2
PROGS+=		h_segv
PROGS+=		h_getprocpath

SCRIPTSDIR=	${TESTSDIR}
SCRIPTS=	h_interpreter.sh

LDADD.t_mqueue+= -lrt


.if (${MKRUMP} != "no") && !defined(BSD_MK_COMPAT_FILE)
TESTS_SUBDIRS+=	tty

TESTS_C+=	t_extattrctl
TESTS_C+=	t_filedesc
TESTS_C+=	t_rnd
LDADD.t_extattrctl+= -lrumpvfs -lrump -lrumpuser
LDADD.t_extattrctl+= -lrump -lpthread
LDADD.t_filedesc+=  ${LDADD.t_rnd}
LDADD.t_rnd+=  -lrumpvfs -lrumpdev_rnd -lrumpdev -lrump -lrumpuser
LDADD.t_rnd+=  -lrump -lpthread

.endif

LDADD.t_timeleft+=	-lpthread

CPPFLAGS+=	-D_KERNTYPES

.PATH:			${NETBSDSRCDIR}/sys/kern
TESTS_C+=		t_extent
SRCS.t_extent=		t_extent.c subr_extent.c
CPPFLAGS.t_extent.c=	-D_EXTENT_TESTING -D__POOL_EXPOSE -D_KERNTYPES
CPPFLAGS.subr_extent.c=	-D_EXTENT_TESTING -D__POOL_EXPOSE -D_KERNTYPES

t_subr_prf.c: gen_t_subr_prf ${NETBSDSRCDIR}/sys/kern/subr_prf.c
	${HOST_SH} ${.ALLSRC} ${.TARGET}
CPPFLAGS.t_subr_prf.c=	-Wno-pointer-sign	# XXX platform vs kernel SHA2

.if defined(HAVE_GCC) && ${HAVE_GCC} == 7 && ${ACTIVE_CC} == "gcc"
# Test explicitly tests failure modes.
CPPFLAGS.t_subr_prf.c+=	-Wno-error=format-truncation
.endif

CLEANFILES+=	t_subr_prf.c

LDADD.h_segv+=	-lm

.include <bsd.test.mk>
