# frozen_string_literal: true

#
Rails.application.config.assets.precompile << %r{(^[^_/]|/[^_])[^/]*(.js|.css)$}
