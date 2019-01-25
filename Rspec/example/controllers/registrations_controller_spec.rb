require "rails_helper"

RSpec.describe Client::RegistrationsController, type: :controller do
  describe "POST #create" do
    let(:customer) { FactoryBot.create :customer }
    let(:profile) { FactoryBot.create :profile, customer: customer }
  end
end
