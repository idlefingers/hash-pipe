Hash.class_eval do

  def nested_fetch(path)
    Array(path).dup.reduce(self) { |current, key| current[key] }
  end

  def nested_delete(path)
    path = Array(path).dup
    last_path_element = path.pop

    nested_fetch(path).delete last_path_element
  end

end