require_relative "../configs/config"

module Steps
  class Multiply
    include RailsService::Config

    attribute :sum, :integer

    validates :sum, presence: true

    def result
      sleep 4
      res = multiply

      success(multiplied_sum: res)
    end

    private

    def multiply
      sum * sum
    end
  end
end
