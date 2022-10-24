class Reader < ApplicationRecord
  attr_accessor :activation_token
  before_create :create_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable
  validates :name, presence: true,message: "name must exist", on: :update
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "email wrong form(has key @)"}
  validates :age, presence: true, numericality: { greater_than: 0, less_than: 100, message: "Age must from 0 to 100" }, on: :update
  validates :phonenumber, presence: true, numericality: { only_integer: true , message: "Phone number must have character is number"}, length: { is: 10 , message: "Phone number must have 10 characters"}, on: :update
  validates :address, presence: true, length: { minimum: 8, maximum: 255 , message: "Address must have more than 8 characters and lessthan 255 characters"}, on: :update
  validates :password, length: { minimum: 8, maximum: 255, message: "Password is too short(minium is 8 characters" }, on: :create
  has_one_attached :image
  # has_and_belongs_to_many :gift, join_table: "reader_gift"
  # has_and_belongs_to_many :story, join_table: "reader_story"
  has_many :reader_story
  has_many :story, :through => :reader_story
  has_many :mission_reader
  has_many :mission, :through => :mission_reader
  has_many :reader_gift
  has_many :gift, :through => :reader_gift
  has_many :report
  has_many :comment
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  private

  def create_token
    self.activation_token = Reader.new_token
    self.activation_digest = Reader.digest(activation_token)
  end
end
