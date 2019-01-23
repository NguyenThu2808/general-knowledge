require "rails_helper"
RSpec.describe User, type: :model do
  let(:store) {FactoryBot.create :store}
  let(:staff) {FactoryBot.create :staff, store: store}
  let(:reservation) {FactoryBot.build :reservation, store: store, staff: staff}

  it "#role_enum" do
    expect(user.role_enum).to be_present
  end

  it "#set_password_default" do
    expect(customer.set_password_default).to be_present
  end

  it "#gender_enum" do
    expect(profile.gender_enum).to be_present
  end

  it "#set_password_default" do
    expect(staff.set_password_default).to be_present
  end

  describe "associations" do
    it {is_expected.to have_one(:profile).with_foreign_key("user_id")
      .dependent(:destroy)}
    it {is_expected.to belong_to :store}
    it {is_expected.to have_many(:store_cards).dependent(:destroy)}
    it {is_expected.to have_many(:stores).through(:store_cards)}
    it {is_expected.to have_one(:store).dependent(:destroy).class_name("Store")
      .with_foreign_key("user_id")}
    it {is_expected.to belong_to(:staff).class_name("Staff")
      .with_foreign_key("user_id")}
  end

  describe "validations" do
    it "has a valid user" do
      expect(user).to be_valid
    end

    it "has a invalid user" do
      user.email = nil
      user.role = nil
      expect(user).to_not be_valid
    end

    it "has a invalid user" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "has a invalid user" do
      user.role = nil
      expect(user).to_not be_valid
    end

    it "has a invalid staff" do
      staff.store_id = nil
      staff.email = nil
      staff.role = nil
      expect(staff).to_not be_valid
    end

    it {is_expected.to define_enum_for :role}
    it {is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity}
    it {is_expected.to validate_presence_of :role}
    it {is_expected.to accept_nested_attributes_for :profile}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:store_id)}
    it {is_expected.to validate_uniqueness_of :name}
    it {is_expected.to validate_numericality_of :time}
    it {is_expected.to accept_nested_attributes_for :working_times}
    it {is_expected.to validate_numericality_of(:monthly_day_off).only_integer}
    it {is_expected.to validate_length_of(:monthly_day_off).is_at_least(0)}
    it {is_expected.to validate_length_of(:password).is_at_least(10)}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:email).of_type :string}
      it {is_expected.to have_db_column(:role).of_type :integer}
      it {is_expected.to have_db_column(:remember_created_at).of_type :datetime}
      it {is_expected.to have_db_column(:store_id).of_type :integer}
      it {is_expected.to have_db_column(:appoint).of_type :boolean}
      it {is_expected.to have_db_column(:birthday).of_type(:date)}
      it {is_expected.to have_db_column(:gender).of_type(:boolean)}
      it {is_expected.to have_db_column(:comment).of_type(:text)}
      it {is_expected.to have_db_column(:order).of_type :integer}
      it {is_expected.to have_db_column(:public).of_type :boolean}
      it {is_expected.to have_db_column(:pin).of_type :boolean}
      it {is_expected.to have_db_column(:monthly_week_off).of_type :integer}
      it {is_expected.to have_db_column(:monthly_day_off).of_type :integer}
    end
  end
end

require "rails_helper"
RSpec.describe WorkingTime, type: :model do
  let(:staff) {FactoryBot.create :staff}
  let(:working_time) {FactoryBot.create :working_time, time_work: staff}

  describe "associations" do
    it {is_expected.to belong_to :time_work}
  end

  describe "validations" do
    it "has a valid working time" do
      expect(working_time).to be_valid
    end
  end
end
