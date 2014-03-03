Hash.class_eval do

  def no_blank_values
    self.reject { |k,v| v.blank? }
  end

  def except(*keys)
    keys.collect! &:to_s
    self.reject {|k,v| keys.include? k.to_s }
  end

  def only(*keys)
    keys.collect! &:to_s
    self.select {|k,v| keys.include? k.to_s }
  end

end