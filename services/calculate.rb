require_relative "../configs/config"
require_relative "../configs/steps"
require "ruby-progressbar"

module Services
  class Calculate
    include RailsService::Config

    attribute :num, :integer

    validates :num, presence: true

    step ::Steps::Calculate,
      in: :num,
      out: :sum

    step ::Steps::Multiply,
      in: :sum,
      out: :multiplied_sum

    step ::Steps::Format,
      in: :multiplied_sum,
      out: :formatted_sum

    before :result do
      @progressbar = ::ProgressBar.create(title: "Formatting", total: steps.count)
    end

    after :step do |_step|
      @progressbar.increment
    end
  end
end
