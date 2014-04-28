Hash.class_eval do

  def self.convert_keys(hash, method = :underscore)
    if hash.is_a?(Array)
      hash.collect {|h| convert_keys(h, method) }
    elsif hash.is_a?(Hash)
      hash_array = hash.collect do |key,value|
        [ key.to_s.send(method), convert_keys(value, method) ]
      end

      Hash[hash_array]
    else
      hash
    end
  end

  def convert_keys(method = :underscore)
    Hash.convert_keys self, method
  end

end