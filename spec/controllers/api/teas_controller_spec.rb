require 'rails_helper'

RSpec.describe Api::TeasController, type: :controller do

  context 'with existed teas' do
    let!(:tea) { Tea.create(name: 'tea', description: 'awesome tea') }
    after(:all) { Tea.destroy_all }

    it 'renders all created teas' do
      # GET index action
      get :index

      # Check status code and type of response
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      # Parse body and checking received object
      teas = JSON.parse(response.body, symbolize_names: true).fetch(:teas)
      expect(teas.count).to eq(Tea.count)
      expect(teas).to include(TeaSerializer.new(tea).attributes)
    end

    it 'returns requsted tea' do
      # GET show action
      get :show, id: tea.id

      # Check status code and type of response
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      # Parse body and checking received object
      teas = JSON.parse(response.body, symbolize_names: true).fetch(:tea)
      expect(teas).to eq(TeaSerializer.new(tea).attributes)
    end

    it 'updates requested tea' do
      expect(tea.name).to eq('tea')
      # PATCH to update action
      patch :update, tea: { name: 'oolong' }, id: tea.id

      # Check status code and type of response
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      # Parse body and checking received object
      teas = JSON.parse(response.body, symbolize_names: true).fetch(:tea)
      expect(teas.fetch(:name)).to eq('oolong')
    end

    it 'deletes tea sucessfully' do
      expect(tea.name).to eq('tea')

      # DELETE to destroy action
      delete :destroy, id: tea.id

      # Check status code and type of response
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      # Check sucessfull deletion
      expect(Tea.count).to eq(0)
    end
  end

  it 'creates tea by passed attributes' do
    attributes = { name: 'pu er', description: 'Awesome black oolong tea.' }
    # POST to create action
    post :create, tea: attributes
    # Check status code and type of response
    expect(response.status).to eq(200)
    expect(response.content_type).to eq(Mime::JSON)

    # Parse body and checking received object
    teas = JSON.parse(response.body, symbolize_names: true).fetch(:tea)
    expect(teas).to include(attributes)
  end
end
