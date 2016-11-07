module UsefulLogs
  module LogFormatter
    def self.key_value_pairs(hash)
      hash.map do |pair|
        value = pair.last
        value = value.nil? ? 'NULL' : value
        value = value.is_a?(String) ? "'#{value}'" : value
        "#{pair.first}=#{value}"
      end.join(' ')
    end
  end
end
