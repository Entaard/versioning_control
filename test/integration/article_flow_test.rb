require 'test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  test 'can see welcome page' do
    get '/'
    assert_select('h1', 'Welcome rails!')
  end

  test 'can create article' do
    get '/articles/new'
    assert_response :success

    post '/articles',
         params: {
           article: {
             title: 'Integration test created',
             text: 'This was created by integration test'
           }
         }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'p', "Title:\n  Integration test created"
  end
end
