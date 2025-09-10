<%@page import="com.blogapp.entities.User"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://cdn.tailwindcss.com"></script>
<title>Account</title>
</head>
<body
	class="pt-[100px] bg-gray-100 flex items-center justify-center min-h-screen">

	<%@include file="common/navbar.jsp"%>


	<div
		class="min-h-screen flex items-center justify-center bg-gradient-to-br from-indigo-100 via-white to-indigo-200">
		<div
			class="w-full max-w-lg bg-white rounded-2xl shadow-2xl p-8 flex flex-col items-center relative overflow-hidden">

			<!-- Decorative background -->
			<div
				class="absolute top-0 left-0 w-full h-24 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-t-2xl"></div>

			<!-- User Image -->
			<div class="relative mt-12">
				<img
					src="${pageContext.request.contextPath}/uploads/${sessionScope.user.profile}?v=${System.currentTimeMillis()}"
					alt="Profile"
					class="w-32 h-32 rounded-full border-4 border-white shadow-lg object-cover">
			</div>

			<!-- User Info -->
			<div class="mt-6 text-center">
				<h2 class="text-3xl font-bold text-gray-800">${sessionScope.user.name}</h2>
				<p class="text-gray-500 text-sm mt-1">${sessionScope.user.email}</p>
			</div>

			<!-- Extra Details -->
			<div class="mt-6 grid grid-cols-2 gap-4 text-center w-full">
				<div class="bg-gray-50 rounded-lg p-4 shadow-sm">
					<p class="text-xs uppercase text-gray-500">Profile ID</p>
					<p class="font-semibold text-gray-800">${sessionScope.user.id}</p>
				</div>
				<div class="bg-gray-50 rounded-lg p-4 shadow-sm">
					<p class="text-xs uppercase text-gray-500">Created At</p>
					<p class="font-semibold text-gray-800">
					<%-- ${sessionScope.user.createdAt} --%>
					<%
					
						User user = (User) session.getAttribute("user");
						String date = user.getCreatedAt().toLocalDate().toString();
						String time =  user.getCreatedAt().toLocalTime().toString();
					
					%>
					<%= date %> :
					<%= time %>
					</p>
				</div>
				<div class="bg-gray-50 rounded-lg p-4 shadow-sm col-span-2">
					<p class="text-xs uppercase text-gray-500">Blogs Posted</p>
					<p class="font-semibold text-indigo-600 text-xl">${sessionScope.user.blogs.size()}</p>
				</div>
			</div>

			<!-- Spacer -->
			<div class="flex-grow my-6 w-full border-t border-gray-200"></div>

			<!-- Logout Button -->
			<a href="logout"
				class="w-full text-center bg-red-600 text-white font-semibold py-3 rounded-lg shadow hover:bg-red-700 transition duration-200">
				Logout </a>
		</div>
	</div>

</body>
</html>