package my.mobypay.creditScore;

import java.util.Set;

import javax.annotation.PreDestroy;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.ReactiveRedisConnectionFactory;
import org.springframework.data.redis.connection.RedisConfiguration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import lombok.Setter;
import my.mobypay.creditScore.dao.CreditcheckerPDFFiles;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;
import redis.clients.jedis.Jedis;

@Configuration
@ConfigurationProperties(prefix = "spring.redis")
@Setter
public class RedisConfig {

	private String host;
	private String password;
	private String username;
	private int port;

	@Bean
	@Primary
	public ReactiveRedisConnectionFactory reactiveRedisConnectionFactory(RedisConfiguration defaultRedisConfig) {
		LettuceClientConfiguration clientConfig = LettuceClientConfiguration.builder().useSsl().build();
		return new LettuceConnectionFactory(defaultRedisConfig, clientConfig);
	}
	
	@PreDestroy 
	public void flushDb() {
		Jedis jedis = new Jedis(host, port);
		jedis.auth(username,password);
		Set<String> keys = jedis.keys("creditChecker/*");
		for (String key : keys) {
			jedis.del(key);
		}
	}

	@Bean
	public RedisConfiguration defaultRedisConfig() {
		RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
		config.setHostName(host);
		config.setPassword(RedisPassword.of(password));
		config.setUsername(username);
		return config;
	}

	@Bean
	public RedisTemplate<String, Creditcheckersysconfig> redisTemplate(RedisConnectionFactory connectionFactory) {
		RedisTemplate<String, Creditcheckersysconfig> template = new RedisTemplate<>();
		template.setConnectionFactory(connectionFactory);
		template.setKeySerializer(new StringRedisSerializer());
		return template;
	}

	@Bean
	public RedisTemplate<String, CreditcheckerPDFFiles> redisTemplateForFiles(
			RedisConnectionFactory connectionFactory) {
		RedisTemplate<String, CreditcheckerPDFFiles> template = new RedisTemplate<>();
		template.setKeySerializer(new StringRedisSerializer());
		template.setConnectionFactory(connectionFactory);
		return template;
	}
	
}
