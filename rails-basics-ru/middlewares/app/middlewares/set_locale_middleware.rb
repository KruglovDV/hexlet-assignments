# frozen_string_literal: true

class SetLocaleMiddleware
  # BEGIN
  def initialize(app)
    @app = app
  end

  def call(env)
    switch_locale(env)
    @app.call(env)
  end

  private

  def switch_locale(env)
    accept_language = env['HTTP_ACCEPT_LANGUAGE']

    if accept_language.nil? || accept_language.empty?
      I18n.locale = I18n.default_locale
      return
    end

    locale = accept_language.scan(/^[a-z]{2}/).first.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
  # END
end
