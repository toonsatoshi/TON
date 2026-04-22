.PHONY: bootstrap bootstrap-windows test dev

bootstrap:
	bash ./scripts/bootstrap.sh

bootstrap-windows:
	powershell -ExecutionPolicy Bypass -File ./scripts/bootstrap.ps1

test:
	npm test

dev:
	npm run dev --prefix frontend
