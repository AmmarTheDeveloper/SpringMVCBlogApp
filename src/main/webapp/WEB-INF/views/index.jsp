<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BlogApp Home</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="pt-[100px] bg-gray-50 text-gray-800">

	<%@include file="common/navbar.jsp"%>

	<!-- Hero Section -->
	<section class="bg-blue-600 text-white py-20">
		<div class="max-w-7xl mx-auto text-center px-4">
			<h1 class="text-4xl md:text-5xl font-bold mb-4">Welcome to
				BlogApp</h1>
			<p class="text-lg md:text-xl mb-6">Read, Share, and Discover
				amazing blogs from around the world.</p>
			<a href="#"
				class="bg-white text-blue-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100">Get
				Started</a>
		</div>
	</section>

	<!-- Featured Blogs -->
	<section class="py-16">
		<div class="max-w-7xl mx-auto px-4">
			<h2 class="text-3xl font-bold mb-8 text-center">Featured Blogs</h2>



			<div class="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
				<!-- Blog Card -->

				<c:forEach var="blog" items="${blogs}">

					<div
						class="bg-white dark:bg-gray-800 shadow-md hover:shadow-xl rounded-2xl overflow-hidden transition transform hover:-translate-y-1 duration-300">

						<!-- Blog Thumbnail -->
						<img
							src="${pageContext.request.contextPath}/uploads/${blog.thumbnail}?v=${System.currentTimeMillis()}"
							alt="Blog Thumbnail"
							class="w-full h-56 sm:h-48 object-cover hover:scale-105 transition duration-500">

						<!-- Blog Content -->
						<div class="p-6 flex flex-col justify-between">
							<!-- Title -->
							<h3
								class="text-xl sm:text-2xl font-bold text-gray-900 dark:text-gray-100 mb-3 hover:text-indigo-500 transition">
								${blog.title}</h3>

							<!-- Description -->
							<p class="text-gray-600 dark:text-gray-300 mb-4 line-clamp-3">${blog.description}</p>

							<!-- Footer Section -->
							<div class="mt-auto">
								<!-- User Info -->
								<div class="flex items-center gap-3">
									<img
										src="${pageContext.request.contextPath}/uploads/${blog.user.profile}?v=${System.currentTimeMillis()}"
										alt="${blog.user.name}"
										class="w-12 h-12 rounded-full border border-gray-300 dark:border-gray-600 object-cover">
									<div>
										<p
											class="text-sm font-semibold text-gray-800 dark:text-gray-200">${blog.user.name}</p>
										<p class="text-xs text-gray-500 dark:text-gray-400">
											${blog.getCreatedAt().toLocalDate().toString()} •
											${blog.getCreatedAt().toLocalTime().toString()}</p>
									</div>
								</div>

								<!-- Read More Button -->
								<div class="mt-4 text-center">
									<a href="${pageContext.request.contextPath}/blogs/${blog.id}"
										class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Read
										More → </a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-gray-800 text-white py-8">
		<div
			class="max-w-7xl mx-auto px-4 flex flex-col md:flex-row justify-between items-center">
			<p>&copy; 2025 BlogApp. All rights reserved.</p>
			<div class="flex space-x-4 mt-4 md:mt-0">
				<a href="#" class="hover:text-blue-400">Facebook</a> <a href="#"
					class="hover:text-blue-400">Twitter</a> <a href="#"
					class="hover:text-blue-400">LinkedIn</a>
			</div>
		</div>
	</footer>

</body>
</html>
