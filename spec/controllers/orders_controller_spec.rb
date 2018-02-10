require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it 'should get index' do
    get :index
    expect(response).to render_template("index")
  end
end
