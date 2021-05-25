require 'users'

describe '.user_create' do
    it 'creates a user' do
        user = User.user_create(username: 'test3@mail.com', password: 'password123')

        expect(user.username).to eq('test3@mail.com')
        # expect(user.password).to eq('password123')
    end

    it 'hashes a password' do
        expect(BCrypt::Password).to receive(:create).with('password123')
        User.user_create(username: 'test4@mail.com', password: 'password123')
    end
end

describe '.find' do
    it 'finds a user by ID' do
        user = User.user_create(username: 'test@example.com', password: 'password123')
        result = User.user_find(id: user.id)
    
        expect(result.id).to eq user.id
        expect(result.username).to eq user.username
        expect(result.password).to eq user.password
    end

    it 'returns nil if there is no ID given' do
        expect(User.user_find(id: nil)).to eq nil
    end
end

describe '.authenticate_user' do
    it 'returns a user given a correct username and password' do
        user = User.user_create(username: 'test5@mail.com', password: 'password123')
        authenticated_user = User.authenticate_user(username: 'test5@mail.com', password: 'password123')

        expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil given an incorrect username' do
        user = User.user_create(username: 'test6@mail.com', password: 'password123')

        expect(User.authenticate_user(username: 'dsughf@mail.com', password: 'password123')).to be_nil
    end

    it 'returns nil given a incorrect password' do
        user = User.user_create(username: 'test7@mail.com', password: 'password123')

        expect(User.authenticate_user(username: 'test7@mail.com', password: 'wrong')).to be_nil
    end
end
