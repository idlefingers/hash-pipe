Hash.class_eval do

  def nested_fetch(path)
    path = Array(path)

    value = self
    until path.empty?
      value = value[path.shift]
    end

    value
  end

  def nested_delete(path)
    path = Array(path)
    last_path_element = path.pop

    self.nested_fetch(path).delete last_path_element
  end

end