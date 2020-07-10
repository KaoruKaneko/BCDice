# -*- coding: utf-8 -*-

require 'utils/table'

# 複数のダイス表の中から一つを選択して実行するダイス表
class ChainTable < Table
  # @param [String] name 表の名前
  # @param [String] type 項目を選ぶときのダイスロールの方法 '1D6'など
  # @param [Array<#roll>] items 表の一覧
  def initialize(name, type, items)
    super(name, type, items)
  end

  # @param (see Table#roll)
  # @return (see Table#roll)
  def roll(bcdice)
    value, = bcdice.roll(@times, @sides)
    index = value - @times
    next_table = @items[index]

    return "#{@name}(#{value}) ＞ #{next_table.roll(bcdice)}"
  end
end
