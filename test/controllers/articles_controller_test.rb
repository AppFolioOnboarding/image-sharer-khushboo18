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
      post articles_url, params: { article: { link: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/90B5/production/_104154073_gettyimages-154948449.jpg', text: 'A new llama' } }
    end

    assert_redirected_to article_url(Article.last)
  end
end
