<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blogs</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="pt-[100px] bg-gray-100 flex items-center justify-center min-h-screen">


	<%@include file="common/navbar.jsp"%>

	<div class="min-h-screen px-4 bg-gray-100 w-full">

		<c:if test="${not empty success}">
			<!-- Modal Background -->
			<div id="successModal1"
				class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
				<!-- Modal Box -->
				<div
					class="bg-white rounded-2xl shadow-xl p-6 w-full max-w-sm text-center">
					<h2 class="text-xl font-semibold text-green-600 mb-3">Success
						🎉</h2>
					<p class="text-gray-700 mb-4">${success}</p>
					<div class="flex justify-center">
						<button onclick="closeSuccessModal()"
							class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition">
							Ok</button>
					</div>
				</div>
			</div>

			<script>
    function closeSuccessModal() {
    	
    	document.querySelector("#successModal1").classList.add("hidden");
    	
					}

					// Auto redirect after 2 sec
					setTimeout(closeModal, 2000);
				</script>
		</c:if>


		<c:if test="${not empty error}">
			<!-- Modal Background -->
			<div id="errorModal"
				class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
				<!-- Modal Box -->
				<div
					class="bg-white rounded-2xl shadow-xl p-6 w-full max-w-sm text-center">
					<h2 class="text-xl font-semibold text-red-600 mb-3">Error</h2>
					<p class="text-gray-700 mb-4">${error}</p>
					<div class="flex justify-center">
						<button onclick="closeErrorModal()"
							class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
							Ok</button>
					</div>
				</div>
			</div>

			<script>
    function closeErrorModal() {
    	
    	document.querySelector("#errorModal").classList.add("hidden");
    	
					}

					// Auto redirect after 2 sec
					setTimeout(closeModal, 2000);
				</script>
		</c:if>


		<c:choose>
			<c:when test="${blogs.size() == 0}">
				<div
					class="w-full mx-auto max-w-md bg-white rounded-xl shadow-lg p-8 text-center">

					<!-- Message -->
					<h2 class="text-2xl font-bold text-gray-800 mb-4">No Blogs
						Posted</h2>
					<p class="text-gray-500 mb-6">Looks like you haven’t written
						any blogs yet.</p>

					<!-- Create Blog Button -->
					<a href="${pageContext.request.contextPath}/blogs/create"
						class="inline-block bg-indigo-600 text-white px-6 py-3 rounded-lg font-semibold shadow hover:bg-indigo-700 transition duration-200">
						+ Create Blog </a>

				</div>
			</c:when>
			<c:otherwise>

				<section>
					<div class="max-w-[1200px] w-full mx-auto px-4">
						<h2 class="text-3xl font-bold mb-8 text-center">My Blogs</h2>

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

											<div class="mt-4 text-center">


												<a
													href="${pageContext.request.contextPath}/blogs/update/${blog.id}"
													class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Update</a>

												<button onclick="showModal(${blog.id})" type="button"
													class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 border-none outline-none">Delete</button>

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

								<div id="successModal"
									class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 modal-${blog.id}">
									<!-- Modal Box -->
									<div
										class="bg-white rounded-2xl shadow-xl p-6 w-full max-w-sm text-center">
										<h2 class="text-xl font-semibold text-black-600 mb-3">Are
											you sure you want to delete it</h2>
										<p class="text-gray-700 mb-4">Blog will be deleted
											permanently</p>
										<div class="flex justify-center gap-5">
											<button onclick="deleteBlog(${blog.id})"
												class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition">
												Delete</button>
											<button onclick="closeModal(${blog.id})"
												class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
												Cancel</button>
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


	<script>
    function deleteBlog(id) {
      window.location.assign("<%=application.getContextPath()%>/blogs/delete/" + id);
      };
      
      function closeModal(id){
    	  let modal = document.querySelector(".modal-" + id);
    	  modal.classList.add("hidden");
      }
      
      function showModal(id){
    	  let modal = document.querySelector(".modal-" + id);
    	  modal.classList.remove("hidden");
      }
				</script>
</body>
</html>