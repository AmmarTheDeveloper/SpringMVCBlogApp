<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<title>Register Page</title>
</head>
<body
	class="pt-[100px] bg-gray-100 flex items-center justify-center min-h-screen">

	<%@include file="common/navbar.jsp"%>

	<div class="w-full max-w-md bg-white rounded-2xl shadow-lg p-8">
		<h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Register</h2>


		<c:if test="${not empty success}">
			<!-- Modal Background -->
			<div id="successModal"
				class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
				<!-- Modal Box -->
				<div
					class="bg-white rounded-2xl shadow-xl p-6 w-full max-w-sm text-center">
					<h2 class="text-xl font-semibold text-green-600 mb-3">Success
						🎉</h2>
					<p class="text-gray-700 mb-4">${success}</p>
					<div class="flex justify-center">
						<button type="button" onclick="redirectHome()"
							class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition">
							Continue</button>
					</div>
				</div>
			</div>

			<script>
    function redirectHome() {
      window.location.assign("<%=application.getContextPath()%>/");
				}

				// Auto redirect after 2 sec
				setTimeout(redirectHome, 2000);
			</script>
		</c:if>

		<form action="register" method="POST" enctype="multipart/form-data"
			class="space-y-5">
			<!-- Name -->
			<div>
				<label for="name" class="block text-sm font-medium text-gray-700">Name</label>
				<input type="text" id="name" name="name"
					class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
					placeholder="Enter your name" value="${userRegister.name}">
				<c:if test="${not empty fieldErrors.name}">
					<span class="text-red-500 text-md">${fieldErrors.name}</span>
				</c:if>
			</div>

			<!-- Email -->
			<div>
				<label for="email" class="block text-sm font-medium text-gray-700">Email</label>
				<input type="text" id="email" name="email"
					class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
					placeholder="Enter your email" value="${userRegister.email }">
				<c:if test="${not empty fieldErrors.email}">
					<span class="text-red-500 text-md">${fieldErrors.email}</span>
				</c:if>
			</div>

			<!-- Password -->
			<div>
				<label for="password"
					class="block text-sm font-medium text-gray-700">Password</label> <input
					type="password" id="password" name="password"
					class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
					placeholder="Enter your password" value="${userRegister.password }">
				<c:if test="${not empty fieldErrors.password}">
					<span class="text-red-500 text-md">${fieldErrors.password}</span>
				</c:if>
			</div>

			<!-- Profile Image -->
			<div>
				<label for="profile_image"
					class="block text-sm font-medium text-gray-700">Profile
					Image</label> <input type="file" id="profile_image" name="profile_image"
					class="mt-1 w-full text-gray-700 border border-gray-300 rounded-lg cursor-pointer focus:outline-none focus:ring-2 focus:ring-blue-500">
				<c:if test="${not empty imgError}">
					<span class="text-red-500 text-md">${imgError}</span>
				</c:if>
			</div>



			<!-- Submit Button -->
			<div>
				<c:if test="${not empty error}">
					<span class="text-red-500 text-md">${error}</span>
				</c:if>
				<button type="submit"
					class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg font-medium hover:bg-blue-700 transition">
					Register</button>
			</div>
		</form>

		<!-- Footer -->
		<p class="text-sm text-gray-600 text-center mt-6">
			Already have an account? <a href="login"
				class="text-blue-600 hover:underline">Login</a>
		</p>
	</div>

</body>
</html>
