class EntriesController < ApplicationController

  before_action :set_user, only: [:index]
  before_action :set_entry, except: [:index]

  def index
    @entries = @user.entries
  end

  def show
  end

  def destroy
    @entry.destroy
    redirect_to :entries, notice: 'Entry successfully deleted.'
  end

  private

  def set_user
    @user = current_user
  end

  def set_entry
    @entry = Entry.find params[:id]
  end

end
