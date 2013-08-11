describe 'User' do
  context "testing associations" do
    it { should have_many :posts }
    it { should have_many (:comments).through(:posts)}
  end
end
