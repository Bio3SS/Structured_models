# Structured_models
# Not much of a repo, is it. Maybe more old-fashioned than Life_tables?

current: target
-include target.mk

# -include makestuff/perl.def

######################################################################

# Content

vim_session:
	bash -cl "vmt"

######################################################################

## Content

Sources += $(wildcard *.R *.ssv)

dandy.Rout: funs.Rout
salmon.Rout: salmon.ssv funs.Rout
squirrels.Rout: squirrels.ssv funs.Rout

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
