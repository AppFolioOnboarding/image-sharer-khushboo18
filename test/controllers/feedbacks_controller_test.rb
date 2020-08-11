require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should render page' do
    get '/feedbacks/new'
    assert_response :success
  end

  test 'should create feedback when both fields are filled' do
    assert_difference('Feedback.count', 1) do
      post api_feedbacks_url, params: { feedback: { name: 'My Name', comments: 'My Comments' } }
    end
    assert_equal JSON.parse(response.body)['status'], 'ok'
  end

  test 'should not create feedback when the name field is empty' do
    assert_no_difference('Feedback.count') do
      post api_feedbacks_url, params: { feedback: { name: '', comments: 'My Comments' } }
    end
    assert_equal JSON.parse(response.body)['status'], 'not_found'
  end

  test 'should not create feedback when the comments field is empty' do
    assert_no_difference('Feedback.count') do
      post api_feedbacks_url, params: { feedback: { name: 'My Name', comments: '' } }
    end
    assert_equal JSON.parse(response.body)['status'], 'not_found'
  end
end
