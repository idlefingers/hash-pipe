Array.class_eval do
  # Creates a deep object out of an array
  #
  # hash = ["errors", "something", "somethingElse", "password",  ["VALIDATION_STATE_PASSWORD"]]
  #
  # Could be turned into an object usign this
  #
  # hash.nest
  #
  # And the end result would look like this:
  #
  # "errors" => {
  #   "something" => {
  #     "somethingElse" => {
  #       "password" => ["VALIDATION_STATE_PASSWORD"]
  #     }
  #   }
  # }
  #
  def nest
    self.each do |elm|
      raise ArgumentError, "Name too big" if elm.nil?
    end
    reverse.inject { |sum, key| {key => sum} }
  end
end

