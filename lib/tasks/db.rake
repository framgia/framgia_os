namespace :db do
  task add_tel_card: :environment do
    f = M::Food.create(name: "Thẻ điện thoại 50000VND(50000VNDの携帯マネーカード)", price: 49000)
    f.m_food_options << M::FoodOption.create(name: "Viettel")
    f.m_food_options << M::FoodOption.create(name: "Vinaphone")
    f.m_food_options << M::FoodOption.create(name: "Mobiphone")
    f = M::Food.create(name: "Thẻ điện thoại 100000VND(100000VNDの携帯マネーカード)", price: 98000)
    f.m_food_options << M::FoodOption.create(name: "Viettel")
    f.m_food_options << M::FoodOption.create(name: "Vinaphone")
    f.m_food_options << M::FoodOption.create(name: "Mobiphone")
    f = M::Food.create(name: "Thẻ điện thoại 200000VND(200000VNDの携帯マネーカード)", price: 196000)
    f.m_food_options << M::FoodOption.create(name: "Viettel")
    f.m_food_options << M::FoodOption.create(name: "Vinaphone")
    f.m_food_options << M::FoodOption.create(name: "Mobiphone")
    f = M::Food.create(name: "Thẻ điện thoại 500000VND(500000VNDの携帯マネーカード)", price: 490000)
    f.m_food_options << M::FoodOption.create(name: "Viettel")
    f.m_food_options << M::FoodOption.create(name: "Vinaphone")
    f.m_food_options << M::FoodOption.create(name: "Mobiphone")
  end
end
