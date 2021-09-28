# frozen_string_literal: true
module DropboxApi::Results
  class GetTemporaryUploadLinkResult < DropboxApi::Results::Base
    def link
      @data['link']
    end
  end
end
