require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'should not allow name field to be empty' do
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(name: '', comments: 'Comment')
    end
  end

  test 'should not allow comments field to be empty' do
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(name: 'Name', comments: '')
    end
  end

  test 'does not throw error when both fields are filled' do
    assert_nothing_raised do
      Feedback.create!(name: 'Name', comments: 'Comment')
    end
  end
end
