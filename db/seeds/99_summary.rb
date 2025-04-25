models = ActiveRecord::Base.descendants
results = {}.tap do |result|
  models.each do |model|
    next if model.name == "ActiveRecord::SchemaMigration"
    next if model.name == "ActiveRecord::InternalMetadata"
    next if model.name == "ApplicationRecord"

    result[model.name] = model.count
  end
end

Rails.logger.debug
Rails.logger.debug
Rails.logger.debug "Summary"
Rails.logger.debug "-----------------"
results.each do |k, v|
  Rails.logger.debug "#{k}: #{v}"
end
