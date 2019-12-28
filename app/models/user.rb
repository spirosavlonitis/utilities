class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :utilities

    before_create :set_nickname_default

    private

    def set_nickname_default
        self.nickname = self.email.gsub(/@.+/, '')
    end

end
