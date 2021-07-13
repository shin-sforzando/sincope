# -*- coding: utf-8 -*-

TIMESTAMP := $(shell date +%Y%m%d%H%M%S)

.PHONY: setup hide reveal check build run test doc clean help

setup: ## 準備
	echo "TODO: Not Implemented Yet!"

hide: ## 秘匿
	git secret hide -v

reveal: ## 暴露
	git secret reveal -v

check: ## 検証
	cargo check

build: ## 試作
	cargo build

release: check ## 制作
	cargo build --release

run: ## 開始
	cargo run

# test: ## 試験
# 	echo "TODO: Not Implemented Yet!"

# doc: ## 文書
# 	echo "TODO: Not Implemented Yet!"

clean: down ## 掃除
	rm -rf log/*

help: ## 助言
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
