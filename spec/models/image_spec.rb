require 'spec_helper'

describe Image do
  describe "Required Attributes" do
    before  { subject.valid? }

    context "new object" do
      subject { Image.new } 

      it { subject.errors[:file].should include("can't be blank") }
      it { subject.errors[:width].should include("can't be blank") }
      it { subject.errors[:height].should include("can't be blank") }
      it { subject.errors[:unique_hash].should include("can't be blank") }
      it { subject.errors[:bytes].should include("can't be blank") }
      it { subject.errors[:uploader_id].should include("can't be blank") }
    end

    context "valid object" do
      subject do
        Image.new(
          file: File.new(Rails.root.join('spec', 'fixtures', 'cat.jpg')),
          height: 410,
          width: 615,
          bytes: 65347,
          unique_hash: "519e353f2a0fda78421c9380deb273924a0fcee9",
          uploader_id: 5
        )
      end

      it { should be_valid }
    end
  end
end