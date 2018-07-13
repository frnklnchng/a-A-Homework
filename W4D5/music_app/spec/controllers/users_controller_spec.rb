require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates presence of user's email and password" do
        post :create, params: { user: { email: "user@www.com", password: "" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates password at least 6 characters long" do
        post :create, params: { user: { email: "user@www.com", password: "12345" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user sign-in page success" do
        post :create, params: { user: { email: "user@www.com", password: "password" } }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
