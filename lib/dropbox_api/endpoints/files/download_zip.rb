# frozen_string_literal: true
module DropboxApi::Endpoints::Files
  class DownloadZip < DropboxApi::Endpoints::ContentDownload
    Method      = :post
    Path        = '/2/files/download_zip'
    ResultType  = DropboxApi::Results::DownloadZipResult
    ErrorType   = DropboxApi::Errors::DownloadError

    # Download a file from a user's Dropbox.
    #
    # @param path [String] The path of the file to download.
    add_endpoint :download_zip do |path, &block|
      perform_request({path: path}, &block)
    end
  end
end
