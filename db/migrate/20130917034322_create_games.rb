class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :title
      t.timestamps
    end
    Game.create(title: "Skyrim")
    Game.create(title: "Starcraft 2")
    Game.create(title: "League of Legends")
    Game.create(title: "Dawn of War 2")
    Game.create(title: "Guild Wars 2")
    Game.create(title: "WoW")
    Game.create(title: "Halo 2")
    Game.create(title: "Call of Duty Modern Warfare")
    Game.create(title: "Planetside 2")
    Game.create(title: "Original Counterstrike")
    Game.create(title: "Command and Conquer: Tiberium Sun")
    Game.create(title: "Angry Birds")
    Game.create(title: "Need for Speed Racing")
    Game.create(title: "Rome: Total War")
    Game.create(title: "Neverwinter Nights")
  end

  def down
    drop_table :games
  end
end