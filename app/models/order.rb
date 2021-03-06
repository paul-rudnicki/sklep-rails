class Order < ApplicationRecord
  belongs_to :shipping_type
  has_many :line_items
  has_one :address
  has_many :transitions, class_name: "OrderTransition", autosave: false

  include Statesman::Adapters::ActiveRecordQueries[transition_class: OrderTransition, initial_state: :new]

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
           to: :state_machine

  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition,
                                             association_name: :transitions)
  end

  def full_cost
    line_items.map {|e| e.unit_price }.sum + shipping_cost
  end

  def self.transition_class
    OrderTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end

  def self.transition_name
    :transitions
  end
end
