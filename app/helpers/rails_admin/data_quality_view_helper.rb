module RailsAdmin
  module DataQualityViewHelper
    def get_last_quality_scores(object,n=20)

      scores = [object.quality_score]

      version = (object.previous_version rescue nil)

      if version
        scores << version.quality_score if version.quality_score

        n.times do
          begin
            version=version.previous_version
            if version
              scores << version.quality_score
            else
              break
            end
          rescue
            break
          end
        end
      end

      scores.reverse.join(",")
    end

    def avg_quality_score(objects)

      objects.sum { |object| object.quality_score || 0}/objects.count
    end

    def max_quality_score(objects)
      objects.map(&:quality_score).max
    end

    def object_name_for(object = @object, abstract_model = @abstract_model)
      model_config = abstract_model.try(:config)
      object = abstract_model && object.is_a?(abstract_model.model) ? object : nil

      object.try(model_config.object_label_method) || object.class.model_name.human
    end

  end


end