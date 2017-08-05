Premailer::Rails.config = Premailer::Rails.config.merge(
  line_length: 65,
  remove_ids: false,
  remove_classes: Rails.env.development?,
  remove_comments: Rails.env.development?,
  preserve_styles: Rails.env.development?,
  adapter: :nokogiri
)
