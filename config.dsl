server 'vaisakhvm.in' do
  port 80
  enable_ssl true
end

database 'demodb' do
  username 'user'
  password 'pass'
end
