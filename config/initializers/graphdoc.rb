GraphdocRuby.configure do |config|
  config.schema_name = "GraphRailsSchema"
  config.endpoint = Rails.root.join("tmp", "graphdoc", "output.json")
  # config.output_directory = Rails.root.join('tmp', 'graphdoc').to_s
end
