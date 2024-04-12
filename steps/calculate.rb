require_relative "../configs/config"

module Steps
  class Calculate
    include RailsService::Config

    attribute :num, :integer

    validates :num, presence: true

    def result
      sleep 5
      res = calc

      success(sum: res)
    end

    private

    def calc
      num + 5
    end
  end
end
