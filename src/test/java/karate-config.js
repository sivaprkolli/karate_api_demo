function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env,
        baseUrl: 'https://jsonplaceholder.typicode.com'
    }

    if (env == 'dev') {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    } else if (env == 'qa') {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    } else if (env == 'prod') {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    }

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}
