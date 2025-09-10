<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog || ${blog.title }</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

	<%@include file="common/navbar.jsp"%>

<c:choose>
	<c:when test="${not empty blog }">

		<div class="pt-24 pb-12 flex justify-center">
			<div
				class="bg-white shadow-xl rounded-2xl w-full max-w-4xl overflow-hidden">

				<!-- Blog Thumbnail -->
				<img
					src="${pageContext.request.contextPath}/uploads/${blog.thumbnail}?v=${System.currentTimeMillis()}"
					alt="${blog.title}" class="w-full h-72 object-cover">

				<!-- Blog Info -->
				<div class="p-6 flex flex-col gap-4">
					<!-- User Info & Date -->
					<div class="flex items-center gap-4">
						<img
							src="${pageContext.request.contextPath}/uploads/${blog.user.profile}?v=${System.currentTimeMillis()}"
							alt="${blog.user.name}"
							class="w-14 h-14 rounded-full border border-gray-300 object-cover">
						<div>
							<p class="text-gray-900 font-semibold text-lg">${blog.user.name}</p>
							<p class="text-gray-500 text-sm">
								${blog.getCreatedAt().toLocalDate().toString()} •
								${blog.getCreatedAt().toLocalTime().toString()}</p>
						</div>
					</div>

					<!-- Blog Title -->
					<h1 class="text-3xl sm:text-4xl font-bold text-gray-900 mt-2">${blog.title}</h1>

					<!-- Blog Description -->
					<p class="text-gray-700 text-lg mt-2">${blog.description}</p>

					<!-- Blog Content -->
					<div class="prose prose-lg max-w-full text-gray-800 mt-4">
						${blog.content}</div>
				</div>

			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="mt-[150px] p-4 rounded-md border border-red-500 bg-white mx-auto max-w-[500px] text-red-500">
			Blog Not Found
		</div>
	</c:otherwise>
	
	</c:choose>

</body>
</html>
