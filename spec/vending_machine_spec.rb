# -*- coding: utf-8 -*-
require File.expand_path('../spec_helper', __FILE__)

RSpec.describe VendingMachine do

  let (:vending_machine) do
    VendingMachine.new()
  end

  context "ステップ0" do
    it "10円玉を投入できる" do
      answer = true
      expect(vending_machine.input(10)).to eq answer
    end

    it "50円玉を投入できる" do
      answer = true
      expect(vending_machine.input(50)).to eq answer
    end

    it "100円玉を投入できる" do
      answer = true
      expect(vending_machine.input(100)).to eq answer
    end

    it "5000円玉を投入できる" do
      answer = true
      expect(vending_machine.input(500)).to eq answer
    end

    it "1000円札を投入できる" do
      answer = true
      expect(vending_machine.input(1000)).to eq answer
    end

    it "連続で投入する" do
      answer = true
      expect(vending_machine.input(10)).to eq answer
      expect(vending_machine.input(10)).to eq answer
    end

    it "投入金額の合計を取得できる" do
      answer = 60
      vending_machine.input(10)
      vending_machine.input(50)
      expect(vending_machine.total).to eq answer
      coin = 100
      vending_machine.input(coin)
      expect(vending_machine.total).to eq answer + coin
    end

    it "払い戻し操作ができる" do
      answer = 60
      vending_machine.input(10)
      vending_machine.input(50)
      expect(vending_machine.refund).to eq answer
      expect(vending_machine.total).to eq 0
    end
  end

  context "ステップ1" do
    it "1円玉が投入されたら金額に加算しない" do
      answer = 0
      expect(vending_machine.input(1)).to eq nil
      expect(vending_machine.total).to eq answer
    end

    it "5円玉が投入されたら金額に加算しない" do
      answer = 0
      expect(vending_machine.input(5)).to eq nil
      expect(vending_machine.total).to eq answer
    end

    it "2000円冊が投入されたら金額に加算しない" do
      answer = 0
      expect(vending_machine.input(2000)).to eq nil
      expect(vending_machine.total).to eq answer
    end
  end

  context "ステップ2" do
    it "1本120円のコーラが5本入ってる" do
      #stock = vending_machine.stock
      stock = vending_machine.stock.select{|drink| drink.name == 'cola'} # ステップ4対応
      expect(stock.size).to eq 5
      stock.each do |drink|
        expect(drink.name).to eq 'cola'
        expect(drink.price).to eq 120
      end
    end
  end

  context "ステップ3" do
    it "コーラの購入ができるか判定を行う" do
      vending_machine.input(100)
      vending_machine.input(10)
      expect(vending_machine.can_buy?('cola')).to eq nil
      vending_machine.input(10)
      expect(!!vending_machine.can_buy?('cola')).to eq true
    end

    it "ジュースを購入する" do
      vending_machine.input(100)
      vending_machine.input(50)
      expect(vending_machine.purchase('cola')).to eq 30
    end

    it "売り上げ金額を取得する" do
      sale_amount= 120
      vending_machine.input(100)
      vending_machine.input(50)
      vending_machine.purchase('cola')
      expect(vending_machine.sale_amount).to eq sale_amount
    end

    it "払い戻し操作をする" do
      total = 30
      vending_machine.input(100)
      vending_machine.input(50)
      vending_machine.purchase('cola')
      expect(vending_machine.refund).to eq total
    end
  end

  context "ステップ4" do
    it "購入可能リストを取得する" do
      list = ['cola', 'water']
      vending_machine.input(100)
      vending_machine.input(50)
      expect(vending_machine.can_buy_list).to eq list
    end
    it "購入可能リストなし" do
     list = []
      vending_machine.input(50)
      expect(vending_machine.can_buy_list).to eq list
    end
  end

  context "ステップ5" do
    it "購入時に釣り銭がある場合釣り銭を出力する" do
      vending_machine.input(100)
      vending_machine.input(50)
      expect(vending_machine.purchase('cola')).to eq 30
    end
    it "購入時にジュースと投入金額が同じ場合は0円を返す" do
      vending_machine.input(100)
      vending_machine.input(100)
      expect(vending_machine.purchase('redbull')).to eq 0
    end
  end
end
