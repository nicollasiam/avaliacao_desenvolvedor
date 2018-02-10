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
          imported_data << { buyer: line[0].force_encoding("utf-8").capitalize,
                             description: line[1].force_encoding("utf-8").capitalize,
                             unit_price: line[2].force_encoding("utf-8").capitalize,
                             quantity: line[3].force_encoding("utf-8").capitalize,
                             address: line[4].force_encoding("utf-8").capitalize,
                             provider: line[5].force_encoding("utf-8").capitalize }
          next
        end

        line = line.split(/\t/)
        order = { buyer: line[0].force_encoding("utf-8"),
                  description: line[1].force_encoding("utf-8"),
                  unit_price: line[2].to_f,
                  quantity: line[3].to_i,
                  address: line[4].force_encoding("utf-8"),
                  provider: line[5].force_encoding("utf-8") }

        # buyer: 0, description: 1, price: 2, qty: 3, address: 4, provider: 5
        new_order = Order.new(order)

        if new_order.save
          imported_data << order
        end
      end

      imported_data
    end
  end
end
