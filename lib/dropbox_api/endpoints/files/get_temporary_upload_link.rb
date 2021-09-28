# frozen_string_literal: true
module DropboxApi::Endpoints::Files
  class GetTemporaryUploadLink < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = '/2/files/get_temporary_upload_link'
    ResultType  = DropboxApi::Results::GetTemporaryUploadLinkResult
    ErrorType   = DropboxApi::Errors::GetMetadataError

    # Get a one-time use temporary upload link to upload a file to a Dropbox location.
    #
    # @param path [String] The path to the file you want a temporary link to.
    add_endpoint :get_temporary_upload_link do |commit_info, duration|
      perform_request({
        commit_info: commit_info,
        duration: duration
      })
    end
  end
end
