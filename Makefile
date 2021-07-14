# -*- coding: utf-8 -*-

TIMESTAMP := $(shell date +%Y%m%d%H%M%S)

.PHONY: setup hide reveal check fmt lint build run test doc clean help

setup: ## 準備
	rustup update
	rustup component add clippy

hide: ## 秘匿
	git secret hide -v

reveal: ## 暴露
	git secret reveal -v

check: ## 検証
	cargo check

fmt: ## 整形
	cargo fmt

lint: ## 解析
	cargo clippy

build: check fmt lint ## 試作
	cargo build

release: check fmt lint ## 制作
	cargo build --release

run: check fmt lint ## 開始
	cargo run

test: ## 試験
	cargo test

doc: ## 文書
	cargo doc --open

clean: down ## 掃除
	rm -rf log/*

help: ## 助言
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
