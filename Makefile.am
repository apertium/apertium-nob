###############################################################################
## Makefile for apertium-nob
###############################################################################

RELEASE=0.1
VERSION=0.1.0
LANG1=nob
BASENAME=apertium-$(LANG1)

TARGETS_COMMON = $(LANG1).automorf.bin $(LANG1).autogen.bin \
	$(LANG1).automorf.att.gz $(LANG2).autogen.att.gz \
        $(LANG1).rlx.bin modes

###############################################################################
## Norwegian Bokmål transducer
###############################################################################

$(LANG1).autogen.bin: $(BASENAME).$(LANG1).dix
	lt-comp rl $< $@

$(LANG1).automorf.bin: $(BASENAME).$(LANG1).dix
	lt-comp lr $< $@

$(LANG1).autogen.att.gz: $(LANG1).autogen.bin
	lt-print $< | gzip -9 -c > $@

$(LANG1).automorf.att.gz: $(LANG1).automorf.bin
	lt-print $< | gzip -9 -c > $@

###############################################################################
## Disambiguation rules 
###############################################################################

$(LANG1).rlx.bin: $(BASENAME).$(LANG1).rlx
	cg-comp $< $@

###############################################################################
## Installation stuff
###############################################################################
#
#   apertium_nob_libdir: This is where the compiled binaries go
#   apertium_nob_srcdir: This is where the source files go

modes: modes.xml
	apertium-gen-modes modes.xml

apertium_nobdir=$(prefix)/lib/apertium/$(BASENAME)/
apertium_nob_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_nob_DATA=$(LANG1).automorf.bin $(LANG1).autogen.bin \
		    $(LANG1).automorf.att.gz $(LANG1).autogen.att.gz \
		    $(LANG1).rlx.bin modes

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

install-data-local:
	if [ ! -d $(DESTDIR)$(apertium_nob_srcdir) ]; then mkdir -p $(DESTDIR)$(apertium_nob_srcdir); fi
	$(INSTALL_DATA) $(BASENAME).$(LANG1).dix $(DESTDIR)$(apertium_nob_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).rlx $(DESTDIR)$(apertium_nob_srcdir)

CLEANFILES = -r $(TARGETS_COMMON) .deps/
