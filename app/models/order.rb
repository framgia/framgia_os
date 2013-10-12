class Order < ActiveRecord::Base
  belongs_to :m_food, class_name: M::Food.name
  belongs_to :m_food_option, class_name: M::FoodOption.name
  belongs_to :user
  
  state_machine :state, initial: :init do
    state :delievery
    state :init
    state :paid

    event :deliver! do
      transition :init => :delievery
    end
    event :paid! do
      transition :delievery => :paid
    end
  end
end
