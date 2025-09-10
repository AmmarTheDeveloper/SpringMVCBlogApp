<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>${errorType != null ? errorType : 'Unexpected Error'}</title>

  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-b from-red-50 to-red-100 flex items-center justify-center p-6">
  <div class="max-w-3xl w-full bg-white shadow-lg rounded-2xl overflow-hidden">
    <div class="p-10 flex flex-col items-center justify-center text-center">
      
      <!-- Icon -->
      <div class="w-20 h-20 flex items-center justify-center rounded-full bg-red-100 text-red-600 text-4xl font-bold shadow">
        !
      </div>

      <!-- Title -->
      <h1 class="mt-6 text-3xl font-semibold text-gray-800">
        ${errorType != null ? errorType : 'Something went wrong'}
      </h1>

      <!-- Message -->
      <p class="mt-3 text-gray-600">
        ${errorMessage != null ? errorMessage : 'An unexpected error has occurred. Please try again later.'}
      </p>

      <!-- Details -->
      <div class="mt-6 w-full bg-gray-50 border border-gray-200 rounded-lg p-4 text-left">
        <h2 class="text-sm font-semibold text-gray-500">Details</h2>
        <pre class="mt-2 text-sm text-gray-700 overflow-x-auto whitespace-pre-wrap">
${errorMessage != null ? errorMessage : 'No additional details available.'}
        </pre>
        <div class="mt-3 text-xs text-gray-400 flex justify-between">
          <span>Path: ${path != null ? path : '-'}</span>
          <span>Time: <%= new java.util.Date()%></span>
        </div>
      </div>

      <!-- Buttons -->
      <div class="mt-8 flex flex-wrap gap-4">
        <a href="${pageContext.request.contextPath}/" 
           class="px-6 py-2 bg-red-600 text-white rounded-lg shadow hover:bg-red-700 transition">
          Go Home
        </a>
        <a href="javascript:history.back()" 
           class="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition">
          Try Again
        </a>
      </div>
    </div>
  </div>
</body>
</html>
