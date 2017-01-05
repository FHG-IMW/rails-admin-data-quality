module RailsAdmin
  module Config
    module Actions
      class DataQualityView < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :visible do
          model = bindings[:abstract_model].model
          model.respond_to?(:has_quality_tests?) && model.has_quality_tests?
        end

        register_instance_option :controller do
          Proc.new do

            if params[:identifier]
              quality_test=@object.quality_test_states.find_by_identifier(params[:identifier])
              unless quality_test
                quality_test=@object.quality_test_states.new
                quality_test.identifier=params[:identifier]
              end
              quality_test.not_applicable= params[:not_applicable]
              quality_test.save
            end

            @test_result= @object.run_quality_tests(true)

            render :action => @action.template_name
          end
        end

        register_instance_option :link_icon do
          'icon-thumbs-up'
        end

      end
    end
  end
end
