require('minitest/autorun')
require('minitest/rg')
require_relative('../card.rb')

class CardTest < MiniTest::Test

  def setup
    @card = Card.new("Name", 5, 5, 2)
  end

  def test_name
    assert_equal("Name", @card.name)
  end


end
