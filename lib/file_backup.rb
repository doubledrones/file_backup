
class File

  def self.backup(file)
    rename(file, backup_name(file))
  end

  private

    def self.backup_name(file)
      backup_number = 0
      while exist? "#{file}.#{backup_number}.backup" do
        backup_number += 1
      end
      "#{file}.#{backup_number}.backup"
    end

end
