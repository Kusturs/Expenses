class PaymentsController < ApplicationController
  before_action :set_payment!, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @payments = pagy(Payment.order(created_at: :desc))
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payments_path
      flash[:success] = "Payment successfully created!"
    else
      render 'new'
    end
  end

  def show
    @comment = @payment.comments.build
    @pagy, @comments = pagy(@payment.comments.order(created_at: :desc))

    #@comments = @payment.comments.order(created_at: :desc)
  end

  def edit
    flash[:success] = "Payment successfully edited!"
  end

  def update
    if @payment.update(payment_params)
      redirect_to payments_path
      flash[:success] = "Payment successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_path
    flash[:success] = "Payment successfully deleted!"
  end

  private

  def payment_params
    params.require(:payment).permit(:product, :name, :amount)
  end

  def set_payment!
    @payment = Payment.find(params[:id])
  end
end
