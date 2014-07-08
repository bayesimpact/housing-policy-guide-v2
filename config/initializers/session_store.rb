# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_housing-policy-guide_session'
Rails.application.config.assets.precompile += %w( cached_iframes.js )