JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :paged
  config.default_page_size = 5
  config.maximum_page_size = 20
  config.top_level_meta_include_page_count = true
  config.json_key_format = :camelized_key
end
