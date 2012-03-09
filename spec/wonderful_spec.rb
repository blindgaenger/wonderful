require 'minitest/spec'
require 'minitest/autorun'

describe 'Wonderful' do
  it 'works' do
    'foo'.upcase.must_equal 'FOO'
  end
end
