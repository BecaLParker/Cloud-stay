require 'bcrypt'
require 'pg'

class User

  attr_reader :username, :password, :id

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.user_create(username:, password:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{encrypted_password}') RETURNING id, username, password")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      password: result[0]['password']
    )
  end

  def un_hashed_password(hash:)
    BCrypt::Password.new(hash)
  end

  def self.user_find(id:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
    return nil unless id
    result = connection.exec("SELECT * FROM users WHERE id = #{id}")
    User.new(
        id: result[0]['id'], 
        username: result[0]['username'], 
        password: result[0]['password']
    )
  end 

  def self.authenticate_user(username:, password:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
        id: result[0]['id'], 
        username: result[0]['username'], 
        password: result[0]['password']
    )
  end

end