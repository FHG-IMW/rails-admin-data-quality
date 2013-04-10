module RailsAdmin
  module DataQualityViewHelper
    def get_last_quality_scores(object,n=20)

      scores = [object.quality_score]

      if version=object.previous_version

        scores << version.quality_score if version.quality_score

        n.times do
          if version=version.previous_version
            scores << version.quality_score if version.quality_score
          else
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
      maximum=0
      objects.each do |object|
        unless object.quality_score.blank?
          maximum=object.quality_score if object.quality_score > maximum
        end
      end
      maximum
    end

    def object_name_for(object = @object, abstract_model = @abstract_model)
      model_config = abstract_model.try(:config)
      object = abstract_model && object.is_a?(abstract_model.model) ? object : nil

      object.try(model_config.object_label_method) || object.class.model_name.human
    end

  end


end