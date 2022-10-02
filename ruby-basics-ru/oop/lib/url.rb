# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  def initialize(uri)
    @uri = URI(uri)
  end

  def_delegators :@uri, :scheme, :host

  def <=>(url)
    uri <=> url.uri
  end

  def query_params
    return {} if uri.query.nil?
    uri.query.split('&').map do |key_value|
      key, value = key_value.split('=')
      [key.to_sym, value]
    end.to_h
  end

  def query_param(param, default = nil)
    query_params.fetch(param, default)
  end

  protected
  attr_reader :uri
end
# END
