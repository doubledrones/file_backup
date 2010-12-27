require 'file_backup'

describe File do

  let(:the_class) { File }

  describe ".backup" do
    let(:file) { mock }
    let(:backup_file) { mock }

    before do
      the_class.stub!(:backup_name).with(file).and_return(backup_file)
      the_class.stub!(:move)
    end
    after { the_class.backup(file) }

    it { the_class.should_receive(:move).with(file, backup_file) }

    it { the_class.should_receive(:backup_name).with(file).and_return(backup_file) }
  end

  describe ".backup_name" do
    context "when first file exist" do
      subject do
        the_class.stub!(:exist?).with('file.0.backup').and_return(false)
        the_class.backup_name('file')
      end

      it { should == 'file.0.backup' }
    end

    context "when first and second files exist" do
      subject do
        the_class.stub!(:exist?).with('file.0.backup').and_return(true)
        the_class.stub!(:exist?).with('file.1.backup').and_return(false)
        the_class.backup_name('file')
      end

      it { should == 'file.1.backup' }
    end

    context "when first, second and third files exist" do
      subject do
        the_class.stub!(:exist?).with('file.0.backup').and_return(true)
        the_class.stub!(:exist?).with('file.1.backup').and_return(true)
        the_class.stub!(:exist?).with('file.2.backup').and_return(false)
        the_class.backup_name('file')
      end

      it { should == 'file.2.backup' }
    end
  end

end
