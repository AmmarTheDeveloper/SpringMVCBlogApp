<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogs</title>
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body
	class="pt-[100px] bg-gray-100 flex items-center justify-center min-h-screen">


	<%@include file="common/navbar.jsp"%>

	<div class="min-h-screen px-4 bg-gray-100 w-full">


		<c:choose>
			<c:when test="${blogs.size() == 0}">
				<div
					class="mt-[150px] p-4 rounded-md border border-red-500 bg-white mx-auto max-w-[500px] text-red-500">
						No Blogs Found
				</div>
			</c:when>
			<c:otherwise>

				<section>
					<div class="max-w-[1200px] w-full mx-auto px-4">
						<h2 class="text-3xl font-bold mb-8 text-center">Blogs</h2>

						<div
							class="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
							<!-- Blog Card -->

							<c:forEach var="blog" items="${blogs }">

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
												<a
													href="${pageContext.request.contextPath}/blogs/${blog.id}"
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


			</c:otherwise>
		</c:choose>

	</div>

</body>
</html>