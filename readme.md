# 📝 Blog Application (Spring MVC)

I have developed a **Blog Application** using **Spring MVC** with the latest **Spring 6** and **Jakarta** APIs.  
This project is focused on providing a secure and user-friendly blogging platform with essential features.

---

## Features

-  **Image Upload**  
  - Upload blog images and profile images.  

- **Blog Management**  
  - Users can **create, update, view, and delete** their blogs.  
  - **Authorization protection** → Only the blog owner can delete or update their blog.  

-  **Authentication & Authorization**  
  - **Login & Register** functionality with **session management**.  
  - **Interceptors** ensure:  
    - Logged-in users **cannot access** login/register pages.  
    - Logged-out users **cannot access** blogs, update, delete, and other restricted pages.  

-  **Security & Validation**  
  - Server-side validation with **Jakarta Validation (`jakarta.validation` package)**.  
  - Protected routes with Spring MVC interceptors.  

-  **Rich Text Editor**  
  - Integrated **Quill editor** for rich text content in blogs.  

-  **UI & Responsiveness**  
  - Styled with **Tailwind CSS** for a modern, clean, and responsive design.  
  - Fully mobile-friendly and provides a good user experience.  

---

## Tech Stack

- **Spring Framework 6**  
- **Jakarta EE APIs**  
- **MySQL** → Database  
- **Hibernate** → ORM (Object Relational Mapping)  
- **Tomcat 10.1** → Application server  
- **Tailwind CSS** → Styling & Responsive UI  
- **Java-based Configuration** (No XML configs)

---

##  Live Demo

👉 [View Live Project](https://your-live-link-here.com)

---

## ⚙️ How to Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/AmmarTheDeveloper/SpringMVCBlogApp.git
   cd SpringMVCBlogApp
   ```
   
2. Update your MySQL database details in `com.blogapp.config.JavaConfig.java`:
	- replace with your details
	
	```
		@Bean("dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource();

		ds.setUrl("jdbc:mysql://localhost:3306/YOUR_DB_NAME");
		ds.setUsername("YOUR_DB_USER");
		ds.setPassword("YOUR_DB_PASS");
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return ds;
	}
	```
