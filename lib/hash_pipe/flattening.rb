Hash.class_eval do
	# Flattens a hash with delimiters and key prefix/postfix.
	#
	# 	hash = {
	# 		"errors" => {
	# 			"something" => {
	# 				"somethingElse" => {
	# 					"password" => ["VALIDATION_STATE_PASSWORD"]
	# 				}
	# 			}
	# 		}
	# 	}
	#
	# Could be turned into a flattened hash using this:
	#
	# 	hash.string_from_hash prefix: "registration[", delimiter: "][", postfix: "]"
	#
	# And the end result would look like this:
	#
	# 	{ "registration[errors][something][somethingElse][password]" => ["VALIDATION_STATE_PASSWORD"] }
	def flatten_keys(prefix: "", postfix: "", delimiter: "")
		each_with_object({}) do |(k, v), ret|
			key = k.to_s
			if v.is_a? Hash
				ret.merge! v.flatten_keys(prefix: prefix + key + delimiter, postfix: postfix, delimiter: delimiter) if v.present?
			else
				ret[prefix + key + postfix] = v
			end
		end
	end

end
