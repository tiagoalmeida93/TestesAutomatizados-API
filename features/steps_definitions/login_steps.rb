Quando("realizar a requisição para logar na API") do
  $payload = HTTParty.post(
    CONFIG["base_url"] + "/sessions",
    {
      :headers => {"Content-Type" => "application/json",
                  "Accept" => "application/vnd.taskmanager.v2"},
      :body => JSON.generate({
        "session": {
          "email": CONFIG["email"],
          "password": CONFIG["password"]
        }
      })
    } 

  )
end

Então("o sistema retorna o código {int}") do |int|
  expect($payload.code).to eq(int)
end

Então("o token da url é gerado criando a sessão") do
  puts 'Token: ' + $payload['data']['attributes']['auth-token']
end

Quando("realizar a requisição para fazer logou na API") do
  $token = $payload['data']['attributes']['auth-token']
  $payload = HTTParty.delete(
    "https://api-de-tarefas.herokuapp.com/sessions/#{$token}",
    :headers => {"Content-Type" => "application/json",
      "Accept" => "application/vnd.taskmanager.v2"}
  )
end