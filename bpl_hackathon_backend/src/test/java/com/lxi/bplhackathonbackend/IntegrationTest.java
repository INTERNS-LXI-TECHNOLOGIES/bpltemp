package com.lxi.bplhackathonbackend;

import com.lxi.bplhackathonbackend.config.AsyncSyncConfiguration;
import com.lxi.bplhackathonbackend.config.EmbeddedSQL;
import com.lxi.bplhackathonbackend.config.JacksonConfiguration;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * Base composite annotation for integration tests.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@SpringBootTest(classes = { BplHackathonBackendApp.class, JacksonConfiguration.class, AsyncSyncConfiguration.class })
@EmbeddedSQL
public @interface IntegrationTest {
}
