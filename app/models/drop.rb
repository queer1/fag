# == Schema Information
# Schema version: 5
#
# Table name: drops
#
#  id         :integer         not null, primary key
#  flow_id    :integer
#  user_id    :integer
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

# fag, forums are gay
#
# Copyleft meh. [http://meh.doesntexist.org | meh.ffff@gmail.com]
#
# This file is part of fag.
#
# fag is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# fag is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with fag. If not, see <http://www.gnu.org/licenses/>.

class Drop < ActiveRecord::Base
    attr_accessible :name, :title, :content

    belongs_to :flow
    belongs_to :user

    def output_class
        if self.user
            return self.user.modes[:class].to_s
        else
            return 'anonymous'
        end
    end

    def output_user
        if self.user
            return "<a href='/users/#{self.user.id}'>#{self.user.name}</a>"
        else
            return 'Anonymous'
        end
    end
end
