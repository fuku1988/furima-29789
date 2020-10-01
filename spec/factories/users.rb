FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    last_name               { person.last.kanji}
    first_name              { person.first.kanji}
    last_name_kana          { person.last.katakana}
    first_name_kana         { person.first.katakana}
    nickname                {Faker::Name.last_name}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birth_date              {Faker::Date.birthday}
  end

end