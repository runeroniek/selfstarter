Given /^there is a project "(.*?)" with (\d+) of goal and expires in (\d+) days$/ do |arg1, arg2, arg3|
  @project = Project.make! title: arg1, description: 'description', goal: arg2.to_f, expiration_date: Time.now + (arg3.to_i.days)
end


Given /^there were (\d+) orders of \$(\d+) from other backers in this project$/ do |arg1, arg2|
  @orders = []
  @users = User.make!
  arg1.to_i.times do 
    @orders << Order.make!(value: arg2.to_f, project: @project, user: @user)
  end
end

When /^I'm in the home page$/ do
  visit root_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content(arg1)
end

When /^I click "(.*?)"$/ do |arg1|
  click_on(arg1)
end


Then /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in arg1, with: arg2
end
