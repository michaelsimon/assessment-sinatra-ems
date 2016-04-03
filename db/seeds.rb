shows = Show.all
shows.each do |show|
  Show.create(act_id: show.act_id, venue_id: show.venue_id, user_id: show.user_id, show_date: show.show_date, show_time: show.show_time, tkts_url: show.tkts_url, description: show.description, name: show.name)
end