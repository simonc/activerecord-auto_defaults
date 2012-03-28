require 'active_support/concern'
require 'active_record'
require 'active_record/auto_defaults/version'

module ActiveRecord
  module AutoDefaults
    extend ActiveSupport::Concern

    included do
      before_validation :set_default_values_from_schema
    end

    def set_default_values_from_schema
      columns_hash = self.class.columns_hash

      self.attributes.keys.each do |attr|
        next unless self.read_attribute(attr).nil?
        next unless column_desc = columns_hash[attr]

        unless column_desc.null || column_desc.default.nil?
          self.send(:"#{attr}=", column_desc.default)
        end
      end
    end
  end
end
