# This file is a part of Redmine Tags (redmine_tags) plugin,
# customer relationship management plugin for Redmine
#
# Copyright (C) 2011-2019 RedmineUP
# http://www.redmineup.com/
#
# redmine_tags is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# redmine_tags is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with redmine_tags.  If not, see <http://www.gnu.org/licenses/>.

module RedmineTags
  module Patches
    module AddHelpersForIssueTagsPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          helper :tags
          helper :issues_tags
        end
      end
    end
  end
end

[IssuesController, CalendarsController, GanttsController, SettingsController].each do |controller|
  unless controller.included_modules.include?(RedmineTags::Patches::AddHelpersForIssueTagsPatch)
    controller.send(:include, RedmineTags::Patches::AddHelpersForIssueTagsPatch)
  end
end

unless ImportsController.included_modules.include?(RedmineTags::Patches::AddHelpersForIssueTagsPatch)
  ImportsController.send(:include, RedmineTags::Patches::AddHelpersForIssueTagsPatch)
end if Redmine::VERSION.to_s > '3.2'
