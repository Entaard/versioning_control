require 'application_system_test_case'

class ArticlesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit articles_url

    assert_selector 'h1', text: 'Articles'
  end

  test 'create an article' do
    visit articles_path

    click_on 'New article'

    fill_in 'Title', with: 'A new article by system test'
    fill_in 'Text', with: 'Created by system test'

    click_on 'Create Article'

    assert_text 'A new article by system test'
  end
end
