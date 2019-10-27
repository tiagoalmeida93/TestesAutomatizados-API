Before '@login' do
  body = {
    "session": {
      "email": CONFIG["email"],
      "password": CONFIG["password"]
    }
  }
  @body = JSON.generate(body)

  @headers = {
    "Content-Type" => "application/json",
    "Accept" => "application/vnd.taskmanager.v2"
  }
end