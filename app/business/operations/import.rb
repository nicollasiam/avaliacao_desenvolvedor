module Operations
  class Import
    def initialize(file)
      @file = file
    end

    def import_to_database
      imported_data = []

      @file.each_line.with_index do |line, index|
        # Skip headers lilne
        # But save the headers
        if index == 0
          line = line.split(/\t/)
          imported_data << { buyer: line[0].force_encoding("utf-8"),
                            description: line[1].force_encoding("utf-8"),
                            unit_price: line[2].to_f,
                            quantity: line[3].to_i,
                            address: line[4].force_encoding("utf-8"),
                            provider: line[5].force_encoding("utf-8") }
          next
        end

        line = line.split(/\t/)
        order = { buyer: line[0].force_encoding("utf-8"),
                  description: line[1].force_encoding("utf-8"),
                  unit_price: line[2].to_f,
                  quantity: line[3].to_i,
                  address: line[4].force_encoding("utf-8"),
                  provider: line[5].force_encoding("utf-8") }

        imported_data << order
        # buyer: 0, description: 1, price: 2, qty: 3, address: 4, provider: 5
        Order.create!(order)
      end

      imported_data
    end
  end
end
