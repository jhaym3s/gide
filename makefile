auto_generate:
	dart run build_runner build 
	## this was removed because there was a modification of the generated file(rest_client.g.dart)
	## --delete-conflicting-outputs 

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@flutter pub run import_sorter:main
	@flutter format lib