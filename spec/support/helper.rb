module TestHelpers

  def click_id(id)
    find(id).click
  end

  def fill(field, input)
    fill_in field, with: input
  end

  def user_email(user)
    User.find_by_email(user)
  end

  def content(stuff)
    page.should have_content(stuff)
  end

  def no_content(stuff)
    page.should_not have_content(stuff)
  end

  def check_me(attribute)
    find(:css, attribute).set(true)
  end
end

RSpec.configure do |c|
  c.include TestHelpers
end