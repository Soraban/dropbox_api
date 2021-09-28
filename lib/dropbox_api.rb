# frozen_string_literal: true
require 'dropbox_api/version'

require 'time'
require 'json'
require 'faraday'

require 'dropbox_api/authenticator'

require 'dropbox_api/metadata/base'
require 'dropbox_api/metadata/field'
require 'dropbox_api/metadata/namespace_id'

require 'dropbox_api/middleware/decode_result'
require 'dropbox_api/middleware/path_root'
require 'dropbox_api/middleware/stack'

require 'dropbox_api/metadata/tag'
require 'dropbox_api/metadata/access_level'
require 'dropbox_api/metadata/member_action'

require 'dropbox_api/metadata/dimensions'
require 'dropbox_api/metadata/location'
require 'dropbox_api/metadata/photo_metadata'
require 'dropbox_api/metadata/video_metadata'
require 'dropbox_api/metadata/media_info'
require 'dropbox_api/metadata/media_metadata'
require 'dropbox_api/metadata/member'
require 'dropbox_api/metadata/add_member'
require 'dropbox_api/metadata/name'
require 'dropbox_api/metadata/file_member_action'
require 'dropbox_api/metadata/member_action_list'
require 'dropbox_api/metadata/member_permission'
require 'dropbox_api/metadata/member_permission_list'
require 'dropbox_api/metadata/add_file_member_result'
require 'dropbox_api/metadata/parent_folder_access_info'
require 'dropbox_api/metadata/team_root_info'
require 'dropbox_api/metadata/user_root_info'
require 'dropbox_api/metadata/root_info'
require 'dropbox_api/metadata/basic_account'
require 'dropbox_api/metadata/link_permissions'
require 'dropbox_api/metadata/team'
require 'dropbox_api/metadata/team_member_info'
require 'dropbox_api/metadata/file'
require 'dropbox_api/metadata/folder_sharing_info'
require 'dropbox_api/metadata/folder'
require 'dropbox_api/metadata/deleted'
require 'dropbox_api/metadata/resource'
require 'dropbox_api/metadata/metadata_v2'
require 'dropbox_api/metadata/file_category'
require 'dropbox_api/metadata/file_categories_list'
require 'dropbox_api/metadata/file_extensions_list'
require 'dropbox_api/metadata/search_order_by'
require 'dropbox_api/metadata/file_status'
require 'dropbox_api/metadata/search_options'
require 'dropbox_api/metadata/search_match_type_v2'
require 'dropbox_api/metadata/search_match_v2'
require 'dropbox_api/metadata/search_match_field_options'
require 'dropbox_api/metadata/shared_folder_policy'
require 'dropbox_api/metadata/shared_folder'
require 'dropbox_api/metadata/file_link_metadata'
require 'dropbox_api/metadata/folder_link_metadata'
require 'dropbox_api/metadata/shared_link_metadata'
require 'dropbox_api/metadata/shared_link'
require 'dropbox_api/metadata/space_allocation'
require 'dropbox_api/metadata/space_usage'
require 'dropbox_api/metadata/upload_session_cursor'
require 'dropbox_api/metadata/write_mode'
require 'dropbox_api/metadata/commit_info'
require 'dropbox_api/metadata/thumbnail_batch_result_entry'
require 'dropbox_api/metadata/thumbnail_batch_result_data'
require 'dropbox_api/metadata/file_request'

require 'dropbox_api/errors/http_error'
require 'dropbox_api/errors/basic_error'
require 'dropbox_api/errors/already_shared_error'
require 'dropbox_api/errors/lookup_error'
require 'dropbox_api/errors/write_conflict_error'
require 'dropbox_api/errors/write_error'
require 'dropbox_api/errors/relocation_error'
require 'dropbox_api/errors/restore_error'
require 'dropbox_api/errors/revoke_shared_link_error'
require 'dropbox_api/errors/save_url_error'
require 'dropbox_api/errors/search_error'
require 'dropbox_api/errors/settings_error'
require 'dropbox_api/errors/share_path_error'
require 'dropbox_api/errors/share_folder_error'
require 'dropbox_api/errors/get_copy_reference_error'
require 'dropbox_api/errors/save_copy_reference_error'
require 'dropbox_api/errors/create_folder_batch_error'
require 'dropbox_api/errors/create_folder_error'
require 'dropbox_api/errors/create_shared_link_with_settings_error'
require 'dropbox_api/errors/download_error'
require 'dropbox_api/errors/expired_access_token_error'
require 'dropbox_api/errors/sharing_file_access_error'
require 'dropbox_api/errors/sharing_user_error'
require 'dropbox_api/errors/file_member_action_error'
require 'dropbox_api/errors/get_metadata_error'
require 'dropbox_api/errors/list_folder_error'
require 'dropbox_api/errors/list_revisions_error'
require 'dropbox_api/errors/list_shared_links_error'
require 'dropbox_api/errors/list_folder_continue_error'
require 'dropbox_api/errors/list_folder_longpoll_error'
require 'dropbox_api/errors/preview_error'
require 'dropbox_api/errors/add_member_selector_error'
require 'dropbox_api/errors/shared_folder_access_error'
require 'dropbox_api/errors/shared_link_error'
require 'dropbox_api/errors/upload_session_offset_error'
require 'dropbox_api/errors/upload_session_lookup_error'
require 'dropbox_api/errors/upload_session_finish_error'
require 'dropbox_api/errors/upload_write_failed_error'
require 'dropbox_api/errors/upload_error'
require 'dropbox_api/errors/unshare_file_error'
require 'dropbox_api/errors/poll_error'
require 'dropbox_api/errors/add_file_member_error'
require 'dropbox_api/errors/add_folder_member_error'
require 'dropbox_api/errors/too_many_requests_error'
require 'dropbox_api/errors/relocation_batch_entry_error'
require 'dropbox_api/errors/get_account_error'
require 'dropbox_api/errors/thumbnail_batch_error'
require 'dropbox_api/errors/thumbnail_error'
require 'dropbox_api/errors/create_file_request_error'
require 'dropbox_api/errors/delete_error'

require 'dropbox_api/result_builder'
require 'dropbox_api/results/base'
require 'dropbox_api/results/basic_account_batch'
require 'dropbox_api/results/create_folder_batch_result'
require 'dropbox_api/results/create_folder_batch_result_entry'
require 'dropbox_api/results/relocation_batch_result'
require 'dropbox_api/results/relocation_batch_result_entry'
require 'dropbox_api/results/copy_batch_result'
require 'dropbox_api/results/get_copy_reference_result'
require 'dropbox_api/results/save_copy_reference_result'
require 'dropbox_api/results/add_file_member_result_list'
require 'dropbox_api/results/get_temporary_link_result'
require 'dropbox_api/results/get_temporary_upload_link_result'
require 'dropbox_api/results/get_thumbnail_batch_result'
require 'dropbox_api/results/list_folder_result'
require 'dropbox_api/results/list_revisions_result'
require 'dropbox_api/results/list_folder_longpoll_result'
require 'dropbox_api/results/list_folder_get_latest_cursor_result'
require 'dropbox_api/results/list_shared_links_result'
require 'dropbox_api/results/save_url_result'
require 'dropbox_api/results/save_url_job_status'
require 'dropbox_api/results/search_v2_result'
require 'dropbox_api/results/share_folder_launch'
require 'dropbox_api/results/shared_file_members'
require 'dropbox_api/results/shared_folder_members'
require 'dropbox_api/results/void_result'
require 'dropbox_api/results/upload_session_start'
require 'dropbox_api/results/delete_batch_result_entry'
require 'dropbox_api/results/delete_batch_result'

require 'dropbox_api/client'
require 'dropbox_api/connection_builder'
require 'dropbox_api/options_validator'

require 'dropbox_api/endpoints/base'
require 'dropbox_api/endpoints/rpc'
require 'dropbox_api/endpoints/rpc_content'
require 'dropbox_api/endpoints/rpc_notify'
require 'dropbox_api/endpoints/content_download'
require 'dropbox_api/endpoints/content_upload'

require 'dropbox_api/endpoints/auth/token_revoke'

require 'dropbox_api/endpoints/files/copy'
require 'dropbox_api/endpoints/files/copy_batch_check'
require 'dropbox_api/endpoints/files/copy_batch'
require 'dropbox_api/endpoints/files/copy_reference_get'
require 'dropbox_api/endpoints/files/copy_reference_save'
require 'dropbox_api/endpoints/files/create_folder'
require 'dropbox_api/endpoints/files/create_folder_batch'
require 'dropbox_api/endpoints/files/delete'
require 'dropbox_api/endpoints/files/download'
require 'dropbox_api/endpoints/files/get_metadata'
require 'dropbox_api/endpoints/files/get_preview'
require 'dropbox_api/endpoints/files/get_temporary_link'
require 'dropbox_api/endpoints/files/get_temporary_upload_link'
require 'dropbox_api/endpoints/files/get_thumbnail'
require 'dropbox_api/endpoints/files/get_thumbnail_batch'
require 'dropbox_api/endpoints/files/list_folder'
require 'dropbox_api/endpoints/files/list_folder_continue'
require 'dropbox_api/endpoints/files/list_folder_longpoll'
require 'dropbox_api/endpoints/files/list_folder_get_latest_cursor'
require 'dropbox_api/endpoints/files/list_revisions'
require 'dropbox_api/endpoints/files/move'
require 'dropbox_api/endpoints/files/permanently_delete'
require 'dropbox_api/endpoints/files/restore'
require 'dropbox_api/endpoints/files/save_url'
require 'dropbox_api/endpoints/files/save_url_check_job_status'
require 'dropbox_api/endpoints/files/search'
require 'dropbox_api/endpoints/files/search_continue'
require 'dropbox_api/endpoints/files/upload'
require 'dropbox_api/endpoints/files/upload_session_start'
require 'dropbox_api/endpoints/files/upload_session_append_v2'
require 'dropbox_api/endpoints/files/upload_session_finish'
require 'dropbox_api/endpoints/files/delete_batch_check'
require 'dropbox_api/endpoints/files/delete_batch'
require 'dropbox_api/endpoints/files/create_folder_batch_check'

require 'dropbox_api/endpoints/sharing/add_file_member'
require 'dropbox_api/endpoints/sharing/list_file_members'
require 'dropbox_api/endpoints/sharing/add_folder_member'
require 'dropbox_api/endpoints/sharing/list_folder_members'
require 'dropbox_api/endpoints/sharing/revoke_shared_link'
require 'dropbox_api/endpoints/sharing/share_folder'
require 'dropbox_api/endpoints/sharing/list_shared_links'
require 'dropbox_api/endpoints/sharing/create_shared_link_with_settings'
require 'dropbox_api/endpoints/sharing/unshare_file'
require 'dropbox_api/endpoints/sharing/get_shared_link_metadata'

require 'dropbox_api/endpoints/users/get_account'
require 'dropbox_api/endpoints/users/get_account_batch'
require 'dropbox_api/endpoints/users/get_current_account'
require 'dropbox_api/endpoints/users/get_space_usage'

require 'dropbox_api/endpoints/file_requests/create_file_request'

require 'dropbox_api/chunked_uploader'

require 'dropbox_api/endpoints/virtual/upload_by_chunks'
