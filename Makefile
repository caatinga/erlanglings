.PHONY: test compile

EXERCISE := exercises
CURRENT_EXERCISE := $(shell find $(EXERCISE) -mindepth 1 -maxdepth 1 -type d | sort | while read dir; do \
	if [ ! -f "$$dir/.completed" ]; then \
		echo "$$dir"; \
		break; \
	fi; \
done)

ifeq ($(CURRENT_EXERCISE),)
  $(error all challenge completed! congratulationns!)
endif


compile:
	@echo "compiling challenge in $(CURRENT_EXERCISE)..."
	@erlc -o $(CURRENT_EXERCISE) $(CURRENT_EXERCISE)/*.erl
	
test: compile
	@echo "running tests for challenge in $(CURRENT_EXERCISE)..."
	@erl -noshell -pa $(CURRENT_EXERCISE) -eval "case eunit:test([$(basename $(notdir $(wildcard $(CURRENT_EXERCISE)/*_tests.erl)))], [verbose]) of ok -> halt(0); _ -> halt(1) end." -s init stop
	@touch $(CURRENT_EXERCISE)/.completed
	@echo "challenge completed! Move to the next one."
