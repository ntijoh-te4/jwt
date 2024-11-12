require 'sqlite3'
require 'bcrypt'
class Seeder

  def self.seed!  
    db = SQLite3::Database.new('db/jwt_demo.db')

    db.execute 'DROP TABLE IF EXISTS users'
    db.execute 'DROP TABLE IF EXISTS qotd'

    db.execute 'CREATE TABLE users (
                "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                "username" VARCHAR(255) UNIQUE NOT NULL,
                "encrypted_password" VARCHAR(255) NOT NULL)'
    
    db.execute 'CREATE TABLE qotd (
                  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                  "author" VARCHAR(255) NOT NULL,
                  "quote" VARCHAR(255) NOT NULL)'

    encrypted_password1 = BCrypt::Password.create("123")
    encrypted_password2 = BCrypt::Password.create("abc")
    db.execute('INSERT INTO users (username, encrypted_password) VALUES (?, ?)', ["ola", encrypted_password1])
    db.execute('INSERT INTO users (username, encrypted_password) VALUES (?, ?)', ["daniel", encrypted_password2])

    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Bill Gates", "Today, you always know whether you are on the Internet or on your PC's hard drive. Tomorrow, you will not care and may not even know."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Bill Gates", "Success is a lousy teacher. It seduces smart people into thinking they can't lose."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Aristotle", "The aim of art is to represent not the outward appearance of things, but their inward significance."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Aristotle", "Youth is easily deceived because it is quick to hope."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Aristotle", "The secret to humor is surprise."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Aristotle", "The roots of education are bitter, but the fruit is sweet."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Aristotle", "The educated differ from the uneducated as much as the living from the dead."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Martin", "The greatest thing you can do is surprise yourself."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Martin", "Talking about music is like dancing about architecture."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Martin", "First the doctor told me the good news: I was going to have a disease named after me."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Wright", "What's another word for thesaurus?"])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Wright", "I have an existential map; it has 'you are here' written all over it."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Wright", "I have a hobby...I have the world's largest collection of sea shells. I keep it scattered on beaches all over the world. Maybe you've seen some of it..."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Wright", "I hate it when my leg falls sleep in the middle of the day, because that means it'll be up all night."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "Not only does God play dice, but he sometimes throws them where they cannot be seen."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "My goal is simple. It is a complete understanding of the universe, why it is as it is and why it exists at all."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Mitch Hedberg", "My fake plants died because I did not pretend to water them."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Mitch Hedberg", "Every book is a kid's book, if the kid can read."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Mitch Hedberg", "I recently took up ice sculpting. Last night I made an ice cube. This morning I made 12, I was prolific."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Mitch Hedberg", "When someone hands you a flyer, it's like they are saying - Here. You throw this away."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Mitch Hedberg", "I haven't slept for ten days, because that would be too long."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Wozniak", "My goal wasn't to make a ton of money, it was to build good computers."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Wozniak", "All the best people in life seem to like LINUX."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Carell", "Children are very smart, in their own stupid way. A child's brain is like a sponge, and you know how smart sponges are."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen King", "People think that I must be a very strange person. This is not correct. I have the heart of a small boy. It is in a glass jar on my desk."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "However difficult life may seem, there is always something that you can succeed at."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "We are all now connected by the internet, like neurons in a giant brain."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Hawking", "Success in creating AI would be the biggest event in human history. Unfortunately, it might also be the last, unless we learn how to avoid the risks."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Fry", "Old Professors never die, they just lose their faculties."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Fry", "An original idea. That can't be too hard. The library must be full of them."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Sondheim", "Math and music are intimately related. Not necessarily on a conscious level, but sure."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Irwin", "So fear helps me from making mistakes, but I make lot of mistakes."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Irwin", "Crikey means gee whiz, wow!"])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steve Irwin", "Yeah, I'm a thrill seeker, but crikey, education's the most important thing."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Stephen Seagal", "I have no fear of death. More important, I don't fear life."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Spielberg", "All of us every single year, we're a different person. I don't think we're the same person all our lives."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Spielberg", "Even though I get older, what I do never gets old, and that's what I think keeps me hungry."])
    db.execute('INSERT INTO qotd (author, quote) VALUES (?,?)' ,["Steven Spielberg", "I had a great time creating the future on 'Minority Report,' and it's a future that is coming true faster than any of us thought it would."])
  end
end