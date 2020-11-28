require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe '#password=' do
    example '文字列を与えると、password_digestは長さ60の文字列になる' do
      admin = Administrator.new
      admin.password = 'baukis'
      expect(admin.password_digest).to be_kind_of(String)
      expect(admin.password_digest.size).to eq(60)
    end
    example 'nilを与えると、password_digestはnilになる' do
      admin = Administrator.new(password_digest: 'x')
      admin.password = nil
      expect(admin.password_digest).to be_nil
    end
  end
end
