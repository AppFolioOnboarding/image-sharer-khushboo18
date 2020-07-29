require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'article count' do
    assert_equal Article.count, 2
  end
end
