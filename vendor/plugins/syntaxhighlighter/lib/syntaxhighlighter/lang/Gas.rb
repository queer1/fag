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

require 'syntaxhighlighter/language'

class SyntaxHighlighter

class Language

class Gas < Language
    def initialize (content, options={})
        @regexes = {
            /(\w+)(\s*[:=])/ => '<span class=\'gas label\'>\1</span>\2',

            /("([^\\"]|\\.)*")/m => '<span class="string">\1</span>',

            /(\/\*.*?\*\/)/m => '<span class="comment">\1</span>',

            /(\s|^)(\.[^\s]+)/ => '\1<span class="gas section">\2</span>',
        }

        super(content, options)
    end
end

end

end