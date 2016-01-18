Api::Rest::User.create(nickname: "test") unless Api::Rest::User.find_by_nickname("test").present?

Api::Rest::Game.create([{name: "Monopoly", players_number: 8}, {name: "Munchkin", players_number: 4}, {name: "Mafia", players_number: 6}])

Api::Rest::Meeting.create([
  {
    name: "Новосибирск",
    starts_at: DateTime.now,
    ends_at: DateTime.now + 2.hours,
    lat: rand * 100,
    lng: rand * 100
  },
  {
    name: "Москва",
    starts_at: DateTime.now + 2.days,
    ends_at: DateTime.now + 2.days + 1.hours,
    lat: rand * 100,
    lng: rand * 100
  },
  {
    name: "Санкт-Петербург",
    starts_at: DateTime.now + 2.weeks,
    ends_at: DateTime.now + 2.weeks + 2.year,
    lat: rand * 100,
    lng: rand * 100
  }
])

Api::Rest::Meeting.all[0].games << Api::Rest::Game.all[0]
Api::Rest::Meeting.all[1].games << Api::Rest::Game.all[1]
Api::Rest::Meeting.all[2].games << Api::Rest::Game.all[2]
