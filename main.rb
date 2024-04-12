require_relative "configs/config"
require_relative "services/calculate"

class Main
  include ConvenientService::Feature::Standard::Config

  entry :calculate

  def calculate(num)
    Services::Calculate[num: num]
  end
end
