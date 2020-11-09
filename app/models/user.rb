class User < ApplicationRecord

  def self.export_as(type: )
    raise ArgumentError if %w[xls].include?(type)

    "User::#{type.to_s.camelize}".safe_constantize.new(all).execute
  end
end
