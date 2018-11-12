require 'rails_helper'

RSpec.describe User, type: :model do



  subject { User.new(
                  first_name: "Ash",
                  last_name: "Ketchum",
                  email: "ash@pallet.com",
                  password: "pokemon",
                  password_confirmation: "pokemon"
              )}

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "is not valid if password and password_confirmation does not match" do
      subject.password = "pikachu"
      expect(subject).to_not be_valid
    end

    it "is not valid if the password is too short" do
      subject.password = "ash"
      subject.password_confirmation ="ash"
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if email already exists" do
      User.create(first_name: "Ash",
               last_name: "Ketchum",
               email: "ASH@PALLET.COM",
               password: "pokemon",
               password_confirmation: "pokemon"
              )
      expect(subject).to_not be_valid
    end

    it "is not valid if email is not unique without caplocks" do
      User.create(first_name: "Ash",
               last_name: "Ketchum",
               email: "ash@pallet.com",
               password: "pokemon",
               password_confirmation: "pokemon"
              )

      puts "Users"
      puts User.all

      expect(subject).to_not be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

  end









end
