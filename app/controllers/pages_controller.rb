class PagesController < ApplicationController
  def home
    @title = "Habitude &mdash; Change is habitual".html_safe
  end
  def habits
    @title = "Track your habits &mdash; Habitude".html_safe
  end
  def comfort_zone
  end
  def essentials
  end
  def guide
  end
end