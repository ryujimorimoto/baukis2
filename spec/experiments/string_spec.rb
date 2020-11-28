# require "spec_helper" # 記述する必要は無いが、明示的に読み込んでいることを示す

describe String do
  describe "#<<" do
    example "文字列の追加" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end
    example "nilは追加できない", :exception do
      s = "ABC"
      expect{s << nil}.to raise_error(TypeError)
    end
  end
end
