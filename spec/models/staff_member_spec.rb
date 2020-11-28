require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    example "文字列を与えると、password_digestは長さ60の文字列になる" do
      member = StaffMember.new
      member.password = "baukis"
      expect(member.password_digest).to be_kind_of(String)
      expect(member.password_digest.size).to eq(60)
    end
    example "nilを与えると、password_digestはnilになる" do
      member = StaffMember.new(password_digest: "x")
      member.password = nil
      expect(member.password_digest).to be_nil
    end
  end
end
