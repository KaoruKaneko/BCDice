# -*- coding: utf-8 -*-

require 'test/unit'
require 'bcdiceCore'
require 'utils/chain_table'

class TestChainTable < Test::Unit::TestCase
  def setup
    @bcdice = BCDiceMaker.new.newBcDice
    @tables = [
      Table.new("A", "1D4", %w{h i j k}),
      Table.new("B", "1D3", %w{x y z}),
      Table.new("C", "1D7", %w{o p q r s t u}),
    ]
  end

  def test_chain_table
    table = ChainTable.new(
      "テスト",
      "1D3",
      @tables
    )

    @bcdice.setRandomValues([[1, 3], [4, 4]])
    assert_equal("テスト(1) ＞ A(4) ＞ k", table.roll(@bcdice))
  end

  def test_chain_table_another_table
    table = ChainTable.new(
      "テスト",
      "1D3",
      @tables
    )

    @bcdice.setRandomValues([[3, 3], [7, 7]])
    assert_equal("テスト(3) ＞ C(7) ＞ u", table.roll(@bcdice))
  end
end
