
require_relative 'display_text'
require_relative 'youtube_api'

module VideoCommentThreads
  
  class CommentThreads
    attr_reader :kind

    def initialize(youtube_api, video_id:, api_key:)
     @youtube_api = youtube_api
     @video_id = video_id
     @api_key = api_key
     @kind = @youtube_api.comment_threads_info(@video_id)[0]['kind']
    end

    def comment_threads
      return @comment_threads_items if @comment_threads_items
    comment_threads = @youtube_api.comment_threads_info(@video_id)
    @comment_threads = comment_threads
    end
  end
 end
