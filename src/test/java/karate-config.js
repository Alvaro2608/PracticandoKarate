function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://conduit-api.bondaracademy.com/api/'
  }

  if (env == 'dev') {
    config.userEmail = 'pruebakarate@test.com'
    config.userPassword = 'karate123'
    }
  if (env == 'qa') {
    config.userEmail = 'pruebakarate2@test.com'
    config.userPassword = 'karate456'
  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}