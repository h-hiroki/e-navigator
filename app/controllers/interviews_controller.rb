class InterviewsController < ApplicationController

  def index
    @interviews = Interview.where(user_id: params[:user_id]).order(interview_datetime: :asc)
    @user       = User.find(params[:user_id])
  end

  def new
    @interview = Interview.new
  end

  def create
    if Interview.create(create_params)
      redirect_to user_interviews_path, notice: '日程を作成しました'
    else
      redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    if current_user.id == params[:user_id].to_i     # 自分の面接日程を編集する場合
      if Interview.update(params[:id], update_params)
        redirect_to user_interviews_path, notice: '日程情報を修正しました'
      else
        redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
      end
    else                                            # 他人の面接日程を承認する場合
      if Interview.where(id: params[:id]).update(state: 1)
        redirect_to user_interviews_path, notice: '面接日程を確定しました'
      else
        redirect_to user_interviews_path, alert: '日程確定に失敗しました'
      end
    end
  end

  def destroy
    if Interview.destroy(params[:id])
      redirect_to user_interviews_path, notice: '日程を削除しました'
    else
      redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
    end
  end

  private
  def create_params
    params.require(:interview).permit(:interview_datetime).merge(user_id: params[:user_id])
  end

  def update_params
    params.require(:interview).permit(:interview_datetime)
  end
end
