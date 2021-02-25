RUN:=server
DESTINATION:=
ENVIRONMENT:=

.PHONY: build
build:
	@docker run \
		--name hugo.build \
		--env  HUGO_DESTINATION=public/$(DESTINATION) \
	        --env  HUGO_ENV=$(ENVIRONMENT) \
		--rm \
		-v $(PWD)/src/:/src \
		klakegg/hugo:debian -D

.PHONY: run
run:
	@docker run \
		-d \
		--name hugo \
		--rm \
		-p 8080:1313 \
		-v $(PWD)/src/:/src \
		klakegg/hugo:debian server --buildDrafts --watch

.PHONY: kill
kill:
	@docker kill hugo

.PHONY: cmd
cmd:
	@docker run \
		--name hugobuild \
		--rm \
		-v $(PWD)/src/:/src \
		klakegg/hugo:debian $(RUN)

