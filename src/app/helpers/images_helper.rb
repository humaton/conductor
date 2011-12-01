#
#   Copyright 2011 Red Hat, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

module ImagesHelper
  def options_for_build_select(builds, selected, latest)
      options_for_select(builds.map do |b|
        label = Time.at(b.timestamp.to_f).to_s
        label += " (#{t'images.show.latest'})" if b.uuid == latest
        [label, b.uuid]
      end, selected ? selected.uuid : nil)
  end
end
