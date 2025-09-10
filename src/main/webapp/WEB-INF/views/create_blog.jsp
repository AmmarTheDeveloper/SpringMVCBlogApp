<%@page import="com.blogapp.entities.User"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<!-- Quill CSS -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">

<!-- Quill JS -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<title>Create Blog</title>
</head>
<body
	class="pt-[100px] bg-gray-100 flex items-center justify-center min-h-screen">

	<%@include file="common/navbar.jsp"%>


	<div class="min-h-screen flex items-center justify-center">
		<div class="w-full max-w-2xl bg-white rounded-xl shadow-lg p-8">

			<h2 class="text-2xl font-bold text-gray-800 mb-6">Upload Blog</h2>

			<c:if test="${not empty success}">
				<span class="text-green-500 text-md">${success}</span>
			</c:if>

			<!-- Blog Upload Form -->
			<form action="${pageContext.request.contextPath}/blogs/create"
				method="post" enctype="multipart/form-data" class="space-y-6">

				<!-- Title -->
				<div>
					<label class="block text-gray-700 font-medium mb-2">Title</label> <input
						type="text" name="title"
						class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
						value="${blogRequest.title}"
						 />
					<c:if test="${not empty fieldErrors.title}">
						<span class="text-red-500 text-md">${fieldErrors.title}</span>
					</c:if>
				</div>

				<!-- Thumbnail Upload -->
				<div>
					<label class="block text-gray-700 font-medium mb-2">Thumbnail</label>
					<input type="file" name="thumbnail" accept="image/*"
						class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" />

					<c:if test="${not empty imgError}">
						<span class="text-red-500 text-md">${imgError}</span>
					</c:if>
				</div>

				<!-- Description -->
				<div>
					<label class="block text-gray-700 font-medium mb-2">Short
						Description</label>
					<textarea name="description" rows="3"
						class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500">${blogRequest.description}</textarea>

					<c:if test="${not empty fieldErrors.description}">
						<span class="text-red-500 text-md">${fieldErrors.description}</span>
					</c:if>
				</div>

				<!-- Content with Quill -->
				<div>
					<label class="block text-gray-700 font-medium mb-2">Content</label>
					<div id="editor" class="h-48 border border-gray-300 rounded-lg"></div>
					<!-- Hidden input to store Quill content -->
					<input type="hidden" name="content" id="contentInput" value="${blogRequest.content}" />
					<c:if test="${not empty fieldErrors.content}">
						<span class="text-red-500 text-md">${fieldErrors.content}</span>
					</c:if>
				</div>

				<!-- Submit -->
				<div>

					<c:if test="${not empty error}">
						<span class="text-red-500 text-md">${error}</span>
					</c:if>

					<button type="submit"
						class="w-full bg-indigo-600 text-white font-semibold py-3 rounded-lg shadow hover:bg-indigo-700 transition duration-200">
						Publish Blog</button>
				</div>

			</form>
		</div>
	</div>

	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    var quill = new Quill('#editor', {
	      theme: 'snow'
	    });

	    // Prepopulate content if editing
	    var existingContent = document.getElementById('contentInput').value;
	    if (existingContent) {
	      quill.root.innerHTML = existingContent;
	    }

	    // On form submit, copy editor content into hidden input
	    document.querySelector('form').addEventListener('submit', function () {
	      document.getElementById('contentInput').value = quill.root.innerHTML;
	    });
	  });
	</script>

</body>
</html>