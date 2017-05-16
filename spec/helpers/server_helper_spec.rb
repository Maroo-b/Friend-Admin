require 'rails_helper'

RSpec.describe ServerHelper, type: :helper do
  describe '#display_by_line' do
    it 'display each array item in new line' do
      res = "<p>1\n<br />2\n<br />3</p>"
      expect(helper.display_by_line([1,2,3])).to eq(res)
    end
  end
end
