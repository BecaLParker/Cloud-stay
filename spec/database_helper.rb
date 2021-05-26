require 'users'

def testcreate
  User.user_create(username: 'dbtest@mail.com', password: 'password123')
  
end