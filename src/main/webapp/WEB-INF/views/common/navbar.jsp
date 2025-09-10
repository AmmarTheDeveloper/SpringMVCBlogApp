
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navbar -->
<nav class="bg-white shadow fixed top-0 left-0 w-full z-[99999]">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex justify-between h-16">
			<div class="flex items-center">
				<a href="${pageContext.request.contextPath}/"
					class="text-2xl font-bold text-blue-600">BlogApp</a>
			</div>

			<div class="flex items-center gap-5">
				<div class="hidden md:flex space-x-4 items-center">
					<a href="<%=application.getContextPath()%>/"
						class="hover:text-blue-600">Home</a> <a
						href="${pageContext.request.contextPath}/blogs"
						class="hover:text-blue-600">Blogs</a>

					<%--   <%
         
       		Object user = session.getAttribute("user");
         	if(user == null){
         
         %> --%>

					<!-- alternate in jstl for above scriptlet tag -->
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/login"
								class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Login</a>
							<a href="${pageContext.request.contextPath}/register"
								class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Register</a>
						</c:when>
						<c:otherwise>

							<a href="${pageContext.request.contextPath}/blogs/create"
								class="hover:text-blue-600">Add Blogs</a>

							<a href="${pageContext.request.contextPath}/blogs/my"
								class="hover:text-blue-600">My Blogs</a>

						</c:otherwise>
					</c:choose>

				</div>

				<div class="flex gap-5 items-center">
					<!-- Mobile menu button -->
					<div class="md:hidden flex items-center">
						<button type="button" id="mobile-menu-btn" class="focus:outline-none">
							<svg class="w-6 h-6" fill="none" stroke="currentColor"
								stroke-width="2" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round"
									d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
						</button>
					</div>
					<c:if test="${not empty sessionScope.user }">

						<div class="relative inline-block text-left">
							<!-- Button -->
							<button
							type="button"
								onclick="document.getElementById('dropdownMenu').classList.toggle('hidden')"
								class="inline-flex items-center justify-center rounded-full focus:outline-none">
								<!-- only works in expression tag pageContext.request.contextPath  -->
								<img
									src="${pageContext.request.contextPath}/uploads/${sessionScope.user.profile}?v=${System.currentTimeMillis()}"
									class="h-[50px] w-[50px] rounded-full border border-gray-300"
									alt="Profile" />
							</button>

							<!-- Dropdown Menu -->
							<div id="dropdownMenu"
								class="hidden absolute right-0 mt-2 w-56 rounded-md bg-white shadow-lg ring-1 ring-black/5 z-50">
								<a href="${pageContext.request.contextPath}/account"
									class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Account</a>
								<a href="#"
									class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Support</a>
								<a href="#"
									class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">License</a>
								<div class="border-t my-1"></div>
								<a href="${pageContext.request.contextPath}/logout"
									class="block px-4 py-2 text-sm text-red-600 hover:bg-red-700 hover:text-white">Logout</a>
							</div>
						</div>

					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile menu -->
	<div id="mobile-menu" class="hidden md:hidden px-4 pt-2 pb-4 space-y-1">
		<a href="${pageContext.request.contextPath}/"
			class="block hover:text-blue-600">Home</a> <a
			href="${pageContext.request.contextPath}/blogs"
			class="block hover:text-blue-600">Blogs</a>

	<c:choose>
		<c:when test="${empty sessionScope.user }">

			<a href="${pageContext.request.contextPath}/login"
				class="block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Login</a>
			<a href="${pageContext.request.contextPath}/register"
				class="block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Register</a>

		</c:when>
		<c:otherwise>
		
		 <a
			href="${pageContext.request.contextPath}/blogs/create"
			class="block hover:text-blue-600">Add Blog</a>
		
		 <a
			href="${pageContext.request.contextPath}/blogs/my"
			class="block hover:text-blue-600">My Blogs</a>
		
		</c:otherwise>
		</c:choose>
	</div>

</nav>


<!-- Mobile Menu Script -->
<script>
    const btn = document.getElementById('mobile-menu-btn');
    const menu = document.getElementById('mobile-menu');

    btn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  </script>