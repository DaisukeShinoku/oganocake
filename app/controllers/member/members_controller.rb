class Member::MembersController < ApplicationController
  before_action :authenticate_member!, except: :top

  def top
    @products = Product.joins(:genre).where(genres: { validation: true }).shuffle.first(4)
    @genres = Genre.where(validation: true)
  end

  def edit
    @member = current_member
  end

  def show
    @member = Member.find(current_member.id)
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to "/member"
    else
      render action: :edit
    end
  end

  def destroy
    member = current_member
    member.update(is_deleted: true)
    #update後にログアウトしたい。
    sign_out member
    redirect_to home_invalid_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :telephone, :postal_code, :address)
  end
end
