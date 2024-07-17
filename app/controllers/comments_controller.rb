class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_payment!
  before_action :set_comment!, except: [:create]

  def create
    @comment = @payment.comments.build(comment_params)

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to payment_path(@payment, anchor: dom_id(@comment))
    else
      @comments = @payment.comments.order(created_at: :desc)
      render 'payments/show'
    end
  end

  def show
    @comment = @payment.comments.build
    @comments = Comment.order(created_at: :desc)
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Comment updated!"
      redirect_to payment_path(@payment, anchor: dom_id(@comment))
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to payment_path(@payment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_payment!
    @payment = Payment.find_by(id: params[:payment_id])
  end

  def set_comment!
    @comment = @payment.comments.find(params[:id])
  end
end
