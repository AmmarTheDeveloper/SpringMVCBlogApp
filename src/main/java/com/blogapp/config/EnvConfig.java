package com.blogapp.config;

import org.springframework.stereotype.Component;

import io.github.cdimascio.dotenv.Dotenv;

@Component
public class EnvConfig {

	private static Dotenv dotenv;

	static {
		try {
			dotenv = Dotenv.configure().ignoreIfMissing().directory(".").load();
			System.out.println("Dotenv ====================================");
			System.out.println(dotenv.entries());
		} catch (Exception e) {
			System.out.println("⚠️ Could not load .env, relying only on system environment variables");
		}
	}

	public static String getDbHost() {
		return dotenv.get("DB_HOST") != null? dotenv.get("DB_HOST") : System.getenv("DB_HOST");
	}

	public static String getDbPort() {
		return dotenv.get("DB_PORT")!= null ? dotenv.get("DB_PORT") : System.getenv("DB_PORT");
	}

	public static String getDb() {
		return dotenv.get("DB_NAME") != null? dotenv.get("DB_NAME") : System.getenv("DB_NAME");
	}

	public static String getDbUser() {
		return dotenv.get("DB_USER") != null? dotenv.get("DB_USER") : System.getenv("DB_USER");
	}

	public static String getDbPass() {
		return dotenv.get("DB_PASS") != null? dotenv.get("DB_PASS") : System.getenv("DB_PASS");
	}

}
