require "active_model" # NOTE: Minimal `active_model` version - `5.2.0`.

require "convenient_service"

ConvenientService::Dependencies.require_assigns_attributes_in_constructor_using_active_model_attribute_assignment
ConvenientService::Dependencies.require_has_attributes_using_active_model_attributes
ConvenientService::Dependencies.require_has_j_send_result_params_validations_using_active_model_validations

module RailsService
  module Config
    include ConvenientService::Concern

    included do
      include ConvenientService::Standard::Config

      concerns do
        use ConvenientService::Plugins::Common::AssignsAttributesInConstructor::UsingActiveModelAttributeAssignment::Concern
        use ConvenientService::Plugins::Common::HasAttributes::UsingActiveModelAttributes::Concern
        use ConvenientService::Plugins::Service::HasJSendResultParamsValidations::UsingActiveModelValidations::Concern
      end

      middlewares :initialize do
        use ConvenientService::Plugins::Common::AssignsAttributesInConstructor::UsingActiveModelAttributeAssignment::Middleware
      end

      middlewares :result do
        insert_before \
          ConvenientService::Plugins::Service::CanHaveConnectedSteps::Middleware,
          ConvenientService::Plugins::Service::HasJSendResultParamsValidations::UsingActiveModelValidations::Middleware
      end
    end
  end
end
