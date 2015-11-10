class Resume < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :user_id, :uniqueness => {:scope => :id}
#この場合は、http://qiita.com/wadako111/items/958dded40a840c35c5ec
# user_id と resume_id　がユニークでなければならない。という意味合いなので、意図することと若干ことなる。
#意図していることは、user_id とresume_id　の値が常に一緒以外認められないということ。つまり、userid=1 の場合はresumeid=1以外ない。
  validates :user_id, uniqueness: true
  validates :id, uniqueness: true
#  validate :unique_resume

  has_many :rescats
  has_many :categories, :through => :rescats

 #private
#  def unique_resume
#    if user_id != id
#    errors.add(:unique_resume,("履歴書が上手く作成されませんでした。"))
#    end
#  end
end

