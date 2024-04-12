require_relative "../configs/config"

module Steps
  class Format
    include RailsService::Config

    attribute :multiplied_sum, :integer

    validates :multiplied_sum, presence: true

    def result
      sleep 10
      res = formated_sum

      success(formatted_sum: res)
    end

    private

    def formated_sum
      "Sum: #{multiplied_sum}"
    end
  end
end
