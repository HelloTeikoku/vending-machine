## VendingMachine

Sample implementation for [TDDBC Osaka 2.0](http://devtesting.jp/tddbc/?TDDBC%E5%A4%A7%E9%98%AA2.0%2F%E8%AA%B2%E9%A1%8C)

Naming convention is taken from [here](http://devtesting.jp/tddbc/?TDDBC%E4%BB%99%E5%8F%B002%2F%E8%AA%B2%E9%A1%8C%E7%94%A8%E8%AA%9E%E9%9B%86).

## 環境構築手順
1. 以下リポジトリをFork
    1.  [vending-machine](https://github.com/Matsushin/vending-machine)

1. cloneしてGemをインストール
```
git clone git@github.com:アカウント名/vending-machine.git
cd vending-machine
bundle install --path vendor/bundle
```

## RSpec実行

```
bundle exec rspec ./spec/vending_machine_spec.rb
```
