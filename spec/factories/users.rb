FactoryBot.define do
    factory :user do
        transient do
            person { Gimei.name }
        end
        # Gemの「Faker」と「Gimei」を使用
        
        nickname                {person.first.katakana}
        email                   {Faker::Internet.free_email}
        password                {'T1' + Faker::Internet.password(min_length: 4)}
        password_confirmation   {password}
        last_name_kanji         {person.last.kanji}
        first_name_kanji        {person.first.kanji}
        last_name_kata          {person.last.katakana}
        first_name_kata         {person.first.katakana}
        dob                     {Faker::Date.birthday(min_age: 18, max_age: 65)}
    end

end

        
