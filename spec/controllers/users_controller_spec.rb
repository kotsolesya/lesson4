require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    { name: 'Alex', email: 'mail@mail.com', password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd' }
  end

  let(:invalid_attributes) do
    { name: 'Alex', email: 'User', password: '123', password_confirmation: '1234' }
  end

  #  let(:valid_session) { { user_id: User.find_by_email('mail@mail.com').id } }
  let(:valid_session) { { user_id: 1 } }

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      # user = User.create! valid_attributes
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end
end
