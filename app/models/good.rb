class Good < ApplicationRecord
    #１以上の数字のみの許可
    validates :price, numericality: {greater_than_or_equal_to: 1}
    #空文字を禁止する
    validates :title, :description, :image_url, presence: true
    #タイトルの重複を禁止する
    validates :title, uniqueness: true
    #画像のバリデーション
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'はGIF、JPG、PNG画像のURLでなければなりません。'
    }

end
