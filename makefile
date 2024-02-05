auto_generate:
	dart run build_runner build --delete-conflicting-outputs 

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@echo Done with the formate lib
	@flutter pub run import_sorter:main
	@echo Done with format import_sorter
	@dart fix --apply
	@echo Done with format lib
