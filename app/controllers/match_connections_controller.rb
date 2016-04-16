# == Schema Information
#
# Table name: match_connections
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  match_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  compatibility :integer
#

class MatchConnectionsController < ApplicationController

  def create
  end

  def index
    #binding.pry
    @user = User.find(params[:user_id])
    @matches = @user.find_matches
<<<<<<< HEAD
    #@matchers.where("compatibility > 25").order("compatibility DESC")
    #@matches = @matches.reject { |match| @user.compatibility_with(match) < 25 }.sort_by { |match| @user.compatibility_with(match)}.reverse
=======
    @matches = @matches.reject { |match| @user.compatibility_with(match) < 25 }.sort_by { |match| @user.compatibility_with(match) }.reverse
>>>>>>> da9b24979e4c76dfd9d26620c9b4f7eefb32c0ce
    render 'index'
  end

  def show
    @match = User.find(params[:match_id])
    @user = current_user
    @match_connection = @user.match_connection_object_for(@match)

    bathroom = @match.cleanliness.bathroom
    @bathroom = Cleanliness.cleanliness_quantified[bathroom]
    kitchen = @match.cleanliness.kitchen
    @kitchen = Cleanliness.cleanliness_quantified[kitchen]
    common_space = @match.cleanliness.common_space
    @common_space = Cleanliness.cleanliness_quantified[common_space]

    work = @match.schedule.work
    @work = Schedule.work_schedule_quantified[work]
    sleep = @match.schedule.sleep
    @sleep = Schedule.sleep_schedule_quantified[sleep]
    bathroom_sch = @match.schedule.bathroom
    @bathroom_sch = Schedule.bathroom_schedule_quantified[bathroom_sch]
    kitchen = @match.schedule.kitchen
    @kitchen = Schedule.kitchen_schedule_quantified[kitchen]

    drinking = @match.habit.drinking
    @drinking = Habit.wildness_quantified[drinking]
    four_twenty = @match.habit.four_twenty
    @four_twenty = Habit.wildness_quantified[four_twenty]
    overnight = @match.habit.overnight_visitors
    @overnight = Habit.visitors_quantified[overnight]
    partying = @match.habit.partying
    @partying = Habit.wildness_quantified[partying]
    music = @match.habit.music
    @music = Habit.music_quantified[music]


  end


  def update

    @match = User.find(params[:match_id])
    @user = current_user
    @match_connection = @user.match_connection_object_for(@match)
    if @match_connection.update(interested: true)
      redirect_to user_match_path(@user, @match), notice: "You've sent a message to #{@user.username}."
    else
      render :show
    end
  end
end
