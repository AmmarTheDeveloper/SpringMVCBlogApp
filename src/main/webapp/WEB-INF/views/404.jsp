<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>${errorType != null ? errorType : '404 - Not Found'}</title>

  <!-- Tailwind CDN for quick prototyping (not recommended for production) -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100 flex items-center justify-center p-6">
  <div class="max-w-4xl w-full bg-white shadow-lg rounded-2xl overflow-hidden grid grid-cols-1 md:grid-cols-2">
    <!-- Left: Illustration / big code -->
    <div class="p-10 flex flex-col items-start justify-center gap-6 bg-gradient-to-bl from-indigo-50 to-white">
      <div class="text-indigo-600 text-6xl font-extrabold tracking-tight">404</div>
      <h1 class="text-2xl md:text-3xl font-semibold text-gray-800">
        ${errorMessage != null ? errorMessage : 'Page not found'}
      </h1>
      <p class="text-sm text-gray-500">
        ${errorMessage}
      </p>

      <div class="mt-4 flex flex-wrap gap-3">
        <a href="${pageContext.request.contextPath}/" 
           class="inline-flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white rounded-lg shadow hover:bg-indigo-700 transition">
          ← Go to Home
        </a>

        <a href="javascript:history.back()" 
           class="inline-flex items-center gap-2 px-4 py-2 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50 transition">
          Go Back
        </a>
      </div>

      <div class="mt-6 text-xs text-gray-400">
        If you think this is an error, contact support or try reloading the page.
      </div>
    </div>

    <!-- Right: Card with details / small code block -->
    <div class="p-8 bg-white flex items-center justify-center">
      <div class="w-full">
        <div class="bg-gray-50 border border-gray-100 rounded-lg p-4">
          <div class="flex items-center justify-between">
            <span class="text-xs font-medium text-gray-500">Error Type</span>
            <span class="text-xs text-gray-400">${errorType != null ? errorType : '404'}</span>
          </div>

          <pre class="mt-3 text-sm text-gray-600 bg-white p-3 rounded-md overflow-x-auto">
${errorMessage != null ? errorMessage : 'No additional details available.'}
          </pre>

          <div class="mt-4 text-xs text-gray-400 flex justify-between">
            <span>Time: <%= new Date() %></span>
            <span>Path: ${path != null ? path : '-'}</span>
          </div>
        </div>

        <div class="mt-6 text-xs text-center text-gray-400">
          &copy; ${pageContext.request.serverName} • ${pageContext.request.contextPath}
        </div>
      </div>
    </div>
  </div>
</body>
</html>
