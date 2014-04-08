AC_PREREQ(2.52)

AC_INIT([apertium-nob], [0.1.0], [francis.tyers@gmail.com])
AM_INIT_AUTOMAKE([apertium-nob], [0.1.0], no-define)
AC_PROG_LN_S
AC_PROG_AWK

m4_define([required_apertium_version], [3.3.0])
PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version, [], [PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version)])
                          

#AC_DEFUN([PKG_CHECK_HFST], [
#  HFST_VER=0
#  PKG_CHECK_MODULES(HFST, hfst-3.2 >= 3.2.0,
#  [
#      HFST_VER=32
#  ],
#  [
#      PKG_CHECK_MODULES(HFST, hfst-3.1 >= 3.1.0,
#      [
#          HFST_VER=31
#      ],
#      [
#          PKG_CHECK_MODULES(HFST, hfst-3.0 >= 3.0.0,
#          [
#              HFST_VER=30
#          ])
#      ])
#  ])
#  AC_SUBST(HFST_VER)
#])
#                          
#PKG_CHECK_HFST

AC_PATH_PROG(LTPRINT, lt-print, no)
if test x$ac_cv_path_LTPRINT = x
then
  AC_MSG_ERROR([You don't have lt-print installed.])
fi
if test x$ac_cv_path_LTPRINT = xno
then
  AC_MSG_ERROR([You don't have lt-print installed.])
fi

AC_PATH_PROG(CGCOMP, cg-comp, no)
if test x$ac_cv_path_CGCOMP = x
then
  AC_MSG_ERROR([You don't have cg-comp installed.])
fi
if test x$ac_cv_path_CGPROC = xno
then
  AC_MSG_ERROR([You don't have cg-comp installed.])
fi

AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
if test x$ac_cv_path_PKG_CONFIG = x
then
  AC_MSG_ERROR([You don't have pkg-config installed.])
fi
if test x$ac_cv_path_PKG_CONFIG = xno
then
  AC_MSG_ERROR([You don't have pkg-config installed.])
fi


AC_OUTPUT([Makefile apertium-nob.pc])
