Quando("realizar a requisição para logar na API") do
  $payload = @login.post_login
  pp $payload
  #expect($payload).to match_json_schema("01-login_schema")
end

Então("o sistema retorna o código {int}") do |int|
  expect($payload.code).to eq(int)
end

Então("o token da url é gerado criando a sessão") do
  puts $token = $payload['data']['attributes']['auth-token']
end

Quando("realizar a requisição para fazer logout na API") do
  $payload = @login.delete_logout($token)
end