# frozen_string_literal: true
module DropboxApi::Results
  class DownloadZipResult < DropboxApi::Results::Base
    def file
      @file ||= DropboxApi::Metadata::Folder.new(@data['metadata'])
    end

    def link
      @data['link']
    end
  end
end
