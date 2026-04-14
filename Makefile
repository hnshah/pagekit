# PageKit Makefile — discoverable wrappers around scripts/*.sh.
# Run `make help` for a list of targets.

.PHONY: help doctor slop-check new-run run-check claim-check

help:
	@echo "PageKit make targets"
	@echo ""
	@echo "  make doctor                             Pre-flight repo health check"
	@echo "  make slop-check                         Run slop-check.sh on default targets"
	@echo "  make new-run NAME=<name>                Scaffold a fully-logged run folder"
	@echo "  make run-check RUN=<name>               Validate a run against the logging tiers"
	@echo "  make claim-check DRAFT=<path> PROOF=<path> [SEVERITY=hard|normal|light]"
	@echo "                                          Expand the claim-check prompt for paste"
	@echo ""
	@echo "Examples:"
	@echo "  make new-run NAME=kind-bowl-second"
	@echo "  make run-check RUN=kind-bowl-second"
	@echo "  make claim-check DRAFT=runs/kind-bowl-second/first-page-draft.md \\"
	@echo "                  PROOF=runs/kind-bowl-second/proof-map.md SEVERITY=hard"

doctor:
	@bash scripts/doctor.sh

slop-check:
	@bash scripts/slop-check.sh

new-run:
ifndef NAME
	$(error NAME is required: make new-run NAME=<run-name>)
endif
	@bash scripts/new-run.sh $(NAME)

run-check:
ifndef RUN
	$(error RUN is required: make run-check RUN=<run-name>)
endif
	@bash scripts/run-check.sh runs/$(RUN)

SEVERITY ?= normal
claim-check:
ifndef DRAFT
	$(error DRAFT is required: make claim-check DRAFT=<path> PROOF=<path>)
endif
ifndef PROOF
	$(error PROOF is required: make claim-check DRAFT=<path> PROOF=<path>)
endif
	@bash scripts/claim-check.sh $(DRAFT) $(PROOF) --severity $(SEVERITY)
