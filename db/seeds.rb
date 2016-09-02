STARTING_CATEGORIES = %w(fun love/relationships spiritual family friends work)

STARTING_CATEGORIES.each do |category_name|
  category = Category.create(name: category_name.split('/').map(&:capitalize).join('/'))
  3.times do
    Question.create(text: "How do you feel about #{Faker::Company.catch_phrase.downcase.pluralize}?", category: category)
  end
end

user = User.create({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'first.user@example.com',
  password: 'Pa55w0rd',
  password_confirmation: 'Pa55w0rd'
})
