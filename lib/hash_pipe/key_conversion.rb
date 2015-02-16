Hash.class_eval do

  def self.convert_keys(hash, method = :underscore)
    if method.is_a? Proc
      converter = method
    else
      converter = -> (str) { str.to_s.send method }
    end

    if hash.is_a?(Array)
      hash.collect {|h| convert_keys(h, converter) }
    elsif hash.is_a?(Hash)
      hash_array = hash.collect do |key,value|
        [ converter.call(key), convert_keys(value, converter) ]
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