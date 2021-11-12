require 'sqlite3'
require 'bcrypt'
class Seeder

  def self.seed!  
    db = SQLite3::Database.new('db/jwt_demo.db')

    db.execute 'DROP TABLE IF EXISTS users'
    db.execute 'CREATE TABLE users (
                "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                "username" VARCHAR(255) UNIQUE NOT NULL,
                "encrypted_password" VARCHAR(255) NOT NULL)'

    encrypted_password1 = BCrypt::Password.create("123")
    encrypted_password2 = BCrypt::Password.create("abc")
    db.execute('INSERT INTO users (username, encrypted_password) VALUES (?, ?)', "ola", encrypted_password1)
    db.execute('INSERT INTO users (username, encrypted_password) VALUES (?, ?)', "daniel", encrypted_password2)
  end
end