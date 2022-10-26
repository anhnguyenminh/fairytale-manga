class GetChapSerializer < ActiveModel::Serializer
  attributes :name, :time, :created_at

  def time
    time  = Time.now - object.updated_at
    month = Time.now.month - object.updated_at.month
    day   = time./86400
    hour  = time/3600
    min   = time/ 60 
    if month > 0
      return month.to_s + " months ago" 
    elsif day.to_i >0
      return day.to_i.to_s + " days ago"
    elsif hour.to_i >0 
      return hour.to_i.to_s + " hours ago"
    else
      return min.to_i.to_s + " minutes ago"
    end
    # return time
  end
end
