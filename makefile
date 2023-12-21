auto_generate:
	dart run build_runner build --delete-conflicting-outputs

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@flutter pub run import_sorter:main
	@flutter format lib