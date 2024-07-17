require 'faker'

# Comment.destroy_all
# Payment.destroy_all

payments_count = 60
comments_per_payment = 60

payments_count.times do
  payment = Payment.create!(
    product: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    amount: Faker::Commerce.price(range: 10..100).to_i,
    created_at: Faker::Time.backward(days: 30),
    updated_at: Faker::Time.backward(days: 30)
  )

  # Создание комментариев для каждого платежа
  comments_per_payment.times do
    payment.comments.create!(
      body: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 4),
      created_at: Faker::Time.backward(days: 30),
      updated_at: Faker::Time.backward(days: 30)
    )
  end
end
