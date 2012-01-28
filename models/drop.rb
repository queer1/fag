#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Fag

class Drop
	include DataMapper::Resource
	include Fag::Authored
	include Fag::Serializable
	include Fag::Versioned

	property :id, Serial

	property :title, String
	property :content, Text

	serialize_as do
		{
			id: id,

			author:  author.to_hash,
			content: content,

			created_at: created_at,
			updated_at: updated_at
		}
	end
end

end
