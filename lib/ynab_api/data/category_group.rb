module YnabApi
  module Data
    class CategoryGroup

      attr_reader :id, :name, :hidden, :categories

      def initialize(response_hash)
        @id = response_hash["id"]
        @name = response_hash["name"]
        @hidden = response_hash["hidden"]
        @categories = Array(response_hash["categories"]).map do |category_hsh|
          Data::Category.new(category_hsh, category_group: self)
        end
      end

    end
  end
end

