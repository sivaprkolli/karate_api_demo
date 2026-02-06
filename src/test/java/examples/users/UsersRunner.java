package examples.users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users")
                .outputCucumberJson(true)
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testAllFeatures() {
        return Karate.run()
                .outputCucumberJson(true)
                .relativeTo(getClass());
    }
}
