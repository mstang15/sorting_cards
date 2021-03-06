require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_it_can_access_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_it_can_respond
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_it_is_not_correct
    card = Card.new("2","Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal false, guess.correct?
  end

  def test_it_can_give_feedback_when_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_give_feedback_when_incorrect
    card = Card.new("2", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Incorrect.", guess.feedback
  end
end
