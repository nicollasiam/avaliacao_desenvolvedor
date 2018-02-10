require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has one more after adding one" do
    before = Order.count
    Order.create
    expect(Order.count).to eq(before + 1)
  end
end
