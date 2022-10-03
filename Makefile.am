###############################################################################
## Makefile for apertium-nob
###############################################################################

LANG1=nob
BASENAME=apertium-$(LANG1)

TARGETS_COMMON = $(LANG1).automorf.bin $(LANG1).autogen.bin \
	$(LANG1).automorf.att.gz $(LANG1).autogen.att.gz    \
        $(LANG1).rlx.bin                                    \
        $(LANG1).seg.rlx.bin                                \
        $(LANG1).syn.rlx.bin

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Norwegian Bokmål transducer
###############################################################################

$(LANG1).autogen.bin: $(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

.deps/$(LANG1).automorf.bin: $(BASENAME).$(LANG1).dix $(BASENAME).$(LANG1).acx .deps/.d
	apertium-validate-dictionary $<
	apertium-validate-acx $(BASENAME).$(LANG1).acx
	lt-comp lr $< $@ $(BASENAME).$(LANG1).acx

.deps/$(LANG1).detriple.bin: $(BASENAME).detriple.dix
	lt-comp lr $< $@

$(LANG1).automorf.bin: .deps/$(LANG1).automorf.bin .deps/$(LANG1).detriple.bin
	lt-compose --inverted --anywhere $^ $@

$(LANG1).autogen.att.gz: $(LANG1).autogen.bin
	lt-print $< | gzip -9 -c -n > $@

$(LANG1).automorf.att.gz: $(LANG1).automorf.bin
	lt-print $< | gzip -9 -c -n > $@

###############################################################################
## Distribution
###############################################################################
EXTRA_DIST=$(BASENAME).$(LANG1).dix \
           $(BASENAME).$(LANG1).rlx \
	   $(BASENAME).$(LANG1).seg.rlx \
	   $(BASENAME).$(LANG1).syn.rlx \
           $(LANG1).prob            \
	   $(BASENAME).$(LANG1).tsx \
	   modes.xml

###############################################################################
## Installation stuff
###############################################################################
#
#   apertium_nob_dir: This is where the compiled binaries go
#   apertium_nob_srcdir: This is where the source files go

apertium_nobdir=$(prefix)/share/apertium/$(BASENAME)/
apertium_nob_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_nob_DATA=$(TARGETS_COMMON) $(LANG1).prob \
				  $(BASENAME).$(LANG1).dix \
				  $(BASENAME).$(LANG1).rlx \
				  $(BASENAME).$(LANG1).seg.rlx \
				  $(BASENAME).$(LANG1).syn.rlx \
				  $(BASENAME).$(LANG1).tsx

pkgconfigdir = $(prefix)/share/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

noinst_DATA=modes/$(LANG1)-morph.mode

install-data-local: install-modes
uninstall-local: uninstall-modes

###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	@grep -nE 'lm=".*/([a-zæøå]+)__' $(BASENAME).$(LANG1).dix \
	    | grep -vE '<i?g/?>'                                  \
	    | grep -vE  'lm="(.*)(.*)".*/\2__'                    \
	    | sed 's%^%WARNING: lemma vs par/tail inconsistency on line %'
	apertium-regtest test
