class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment,current_user)
    ProductChannel.broadcast_to comment.product_id, comment: render_comment(comment, current_user)

  end

  private
  def render_comment
    CommentsController.render(partial: 'comments/comment', locals: {comment: comment, current_user: request.env['warden'].current_user })
  end

end
