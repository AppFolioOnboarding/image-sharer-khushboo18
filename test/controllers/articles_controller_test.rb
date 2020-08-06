require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_path
    assert_response :success
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should show article' do
    get article_url(@article)
    assert_response :success
  end

  test 'should create article' do
    assert_difference('Article.count') do
      post articles_url, params: { article: { link: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/90B5/production/_104154073_gettyimages-154948449.jpg',
                                              text: 'A new llama' } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test 'should delete an image' do
    article = articles(:one)
    assert_difference('Article.count', -1) do
      delete article_url(article)
    end
    assert_redirected_to articles_path
  end

  test 'add tags to image' do
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: { link: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/90B5/production/_104154073_gettyimages-154948449.jpg',
                                              text: 'A new llama',
                                              tag_list: 'llama, happy, cute' } }
    end
    assert_redirected_to article_url(Article.last)
    assert_equal Article.last.tags.count, 3
    follow_redirect!
    assert_response :success
  end

  test 'filtering by tags' do
    Article.create!(link: 'https://i.ytimg.com/vi/Tq_MdFz7mlE/maxresdefault.jpg',
                    text: 'Testing filtering',
                    tag_list: 'test_tag, random')
    Article.create!(link: 'https://i.ytimg.com/vi/Tq_MdFz7mlE/maxresdefault.jpg',
                    text: 'New image',
                    tag_list: 'random2, test_tag, tag')
    get articles_path, params: { tag: 'test_tag' }
    assert_response :success
    assert_select 'a', 8 do |list|
      assert_match 'test_tag', list[2].values.to_s
      assert_match 'test_tag', list[5].values.to_s
    end
  end

  test 'unpermitted fields raise errors' do
    ActionController::Parameters.action_on_unpermitted_parameters = :raise
    assert_raise ActionController::UnpermittedParameters do
      post articles_url, params: { article: { link: 'https://i.ytimg.com/vi/Tq_MdFz7mlE/maxresdefault.jpg',
                                              text: 'A new llama',
                                              newField: 'not permitted' } }
    end
  end
end
