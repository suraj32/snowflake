require 'carrierwave/test/matchers'

describe ModelDataUploader do
	include CarrierWave::Test::Matchers

	let(:uploader) { ModelDataUploader.new(:input_file) }

	 it "has the correct format" do
    expect(uploader).to be_format('csv')
  end
end