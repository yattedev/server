require 'spec_helper'
require 'carrierwave/storage/ftp'

describe CarrierWave::Storage::FTP::File do
  let(:uploader) do
    Class.new(CarrierWave::Uploader::Base) do
      storage :ftp
    end.tap do |u|
      allow(u).to receive(:store_path).and_return('uploads/test.jpg')
    end
  end

  let(:base) { CarrierWave::Storage::FTP.new(uploader) }

  let(:file) do
    CarrierWave::Storage::FTP::File.new(uploader, base, uploader.store_path)
  end

  let(:mime_type) { double('mime_type') }

  describe '#content_type' do
    it 'delegates to base file by default' do
      sanitized_file = CarrierWave::SanitizedFile.new(file)
      expect(CarrierWave::SanitizedFile).to receive(:new).with(file.path).
        and_return(sanitized_file)
      expect(sanitized_file).to receive(:content_type).and_return(mime_type)

      expect(file.content_type).to eq(mime_type)
    end

    it 'permits overriding the default value' do
      file.content_type = mime_type

      expect(file.content_type).to eq(mime_type)
    end
  end
end
