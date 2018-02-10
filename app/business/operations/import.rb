module Operations
  class Import
    def initialize(file)
      @file = file
    end

    def import_to_database
      @file.each_line.with_index do |line, index|
        # Skip headers lilne
        next if index == 0

        line = line.split(/\t/)
        # buyer: 0, description: 1, price: 2, qty: 3, address: 4, provider: 5
        Order.create!(buyer: line[0],
                      description: line[1],
                      unit_price: line[2],
                      quantity: line[3],
                      address: line[4],
                      provider: line[5],)
      end
    end
  end
end
