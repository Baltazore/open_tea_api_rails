require 'rails_helper'

RSpec.describe Api::TeasController, type: :controller do

  it 'renders all created teas' do
    tea = Tea.create(name: 'tea', description: 'awesome tea')
    get :index

    expect(response.status).to eq(200)
    expect(response.content_type).to eq(Mime::JSON)

    teas = JSON.parse(response.body, symbolize_names: true).fetch(:teas)
    expect(teas.count).to eq(Tea.count)
    expect(teas).to include(TeaSerializer.new(tea).attributes)

    tea.destroy
  end

end
