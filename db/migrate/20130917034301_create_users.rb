class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    User.create(name: "John Uke")
    User.create(name: "Jon Howell")
    User.create(name: "Cole")
    User.create(name: "ben")
    User.create(name: "CABRILLO!")
    User.create(name: "Patrick Le Cool Burnes")
    User.create(name: "Austin bender")
    User.create(name: "Rory Soltan")
    User.create(name: "Toni.B")
    User.create(name: "Cory")
    User.create(name: "JabberWocky")
    User.create(name: "Clay")
    User.create(name: "Ken")
    User.create(name: "Nishant")
  end

  def down
    drop_table :users
  end
end
