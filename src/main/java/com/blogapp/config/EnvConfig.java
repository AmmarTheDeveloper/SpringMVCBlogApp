package com.blogapp.config;

import org.springframework.stereotype.Component;

import io.github.cdimascio.dotenv.Dotenv;

@Component
public class EnvConfig {

	private static Dotenv dotenv;

	static {
		try {
			dotenv = Dotenv.configure().ignoreIfMissing().directory(".").load();
		} catch (Exception e) {
			System.out.println("⚠️ Could not load .env, relying only on system environment variables");
		}
	}

	public static String getDbHost() {
		return dotenv.get("DB_HOST");
	}

	public static String getDbPort() {
		return dotenv.get("DB_PORT");
	}

	public static String getDb() {
		return dotenv.get("DB_NAME");
	}

	public static String getDbUser() {
		return dotenv.get("DB_USER");
	}

	public static String getDbPass() {
		return dotenv.get("DB_PASS");
	}

}
