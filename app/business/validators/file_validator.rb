module Validators
  class FileValidator
    def initialize(file)
      @file = file
    end

    # File is valid if:
      # The separator is tab (\t)
      # Has six columns
    def validate
      @file.each_line.first.split(/\t/).count == 6
    end
  end
end
