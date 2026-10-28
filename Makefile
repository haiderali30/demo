.PHONY: lint test

lint:
	@echo "Running linter..."
	@sh -n test.sh
	@grep -qi '<!doctype html>' index.html || (echo "index.html is missing <!doctype html>"; exit 1)
	@echo "Lint checks passed!"

test:
	@echo "Running test suite..."
	@sh test.sh
