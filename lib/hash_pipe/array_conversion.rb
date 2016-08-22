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
  def to_nested_hash
    raise ArgumentError, "Values in array can't be nil" if any? &:nil?
    reverse.inject { |hash, key| {key => hash} }
  end
end

