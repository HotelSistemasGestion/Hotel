Recaptcha.configure do |config|
  # ESTO ES PARA LOCALHOST
  #config.public_key  = '6LdQ_wYUAAAAABN4xlJ9Ym1bBSxqcis5mVk8mJ2M'
  #config.private_key = '6LdQ_wYUAAAAAA4LjqQDUyIWVrzdWCVC_S3zUC9L'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
  #ESTO ES PARA HEROKU
  config.site_key  = '6LdQ_wYUAAAAABN4xlJ9Ym1bBSxqcis5mVk8mJ2M'
  config.secret_key = '6LdQ_wYUAAAAAA4LjqQDUyIWVrzdWCVC_S3zUC9L'
end