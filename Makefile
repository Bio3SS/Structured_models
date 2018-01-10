# Structured_models
### Hooks for the editor to set the default target
current: target
-include $(ms)/target.mk

##################################################################


# make files

Sources = Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R *.ssv)

dandy.Rout: funs.Rout
salmon.Rout: salmon.ssv funs.Rout
squirrels.Rout: squirrels.ssv funs.Rout

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
