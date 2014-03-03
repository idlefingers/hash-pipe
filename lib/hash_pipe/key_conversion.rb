class Hash

  def self.convert_keys(hash, method = :underscore)
    if hash.is_a?(Array)
      hash.collect {|h| convert_keys(h, method) }
    else
      hash_array = hash.collect do |key,value|
        value = value.is_a?(Hash) ? convert_keys(value, method) : value
        [ key.to_s.send(method), value ]
      end

      Hash[hash_array]
    end
  end

  def convert_keys(method = :underscore)
    Hash.convert_keys self, method
  end

end