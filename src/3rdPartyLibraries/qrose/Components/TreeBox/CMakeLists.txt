set(TREEBOX_MOC_SOURCES QRTreeBox.h)
QT4_WRAP_CPP(TREEBOX_MOC_CPP ${TREEBOX_MOC_SOURCES})

########### next target ###############
set(TREEBOX_SOURCES
  QRListViewItem.C QRTreeBox.C QRTreeVisitor.C)
add_library(qrtreebox ${TREEBOX_SOURCES} ${TREEBOX_MOC_CPP})
add_dependencies(qrtreebox rosetta_generated)


########### install files ###############

install(FILES  QRTreeBox.h DESTINATION ${INCLUDE_INSTALL_DIR})



#original Makefile.am contents follow:

#include $(top_srcdir)/config/Makefile.for.ROSE.includes.and.libs
#
#if ROSE_USE_QT
#
#INCLUDES = $(ROSE_INCLUDES) $(QT_INCLUDES) 
#
##LD_FLAGS = @LIB_ROSE@ @ROSE_LDFLAGS@  @LIB_QT@ @QT_LDFLAGS@
#METASOURCES = auto
#
#include_HEADERS = QRTreeBox.h
#
#noinst_LTLIBRARIES = libqrtreebox.la
#
#MOC_SOURCES = moc_QRTreeBox.C 
#
#libqrtreebox_la_SOURCES = QRListViewItem.C QRTreeBox.C QRTreeVisitor.C
#  
#nodist_libqrtreebox_la_SOURCES = $(MOC_SOURCES)
#
#CLEANFILES = moc_*.C
#
#if QROSE_USE_WINDOWS
#moc_%.C: $(srcdir)/%.h 
#	$(MOC) -o $@ `cygpath -w $<` -p$(srcdir)
#else
#moc_%.C: $(srcdir)/%.h 
#	$(MOC) -o $@ $<
#endif 
#
#endif
#
#EXTRA_DIST = QRListViewItem.h \
#             QRTreeBox.h \
#             QRTreeVisitor.h
#              
