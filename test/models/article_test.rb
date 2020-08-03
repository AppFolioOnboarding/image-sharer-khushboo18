require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'article count' do
    assert_equal Article.count, 2
  end

  test 'should not add a link thats not an image' do
    assert_raise ActiveRecord::RecordInvalid do
      Article.create!(link: 'https://www.google.com',
                      text: 'No image link exists')
    end
  end

  test 'should not add invalid urls' do
    assert_raise Errno::EADDRNOTAVAIL do
      Article.create!(link: 'i.ytimg.com/vi/Tq_MdFz7mlE/maxresdefault.jpg',
                      text: 'Invalid url')
    end
  end

  test 'add tags to image' do
    assert_difference('Article.count', 1) do
      Article.create!(link: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/90B5/production/_104154073_gettyimages-154948449.jpg',
                      text: 'A new llama',
                      tag_list: 'llama, happy, cute')
    end
    assert_equal Article.last.tags.count, 3
    assert_equal Article.last.tags.first.name, 'llama'
    assert_equal Article.last.tags.last.name, 'cute'
  end
end
