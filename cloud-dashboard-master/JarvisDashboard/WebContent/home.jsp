
<html>
<%
	String triggerEvent = (String) request.getAttribute("triggerEvent");
%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>Cloud Dashboard</title>

<!-- Bootstrap core CSS -->
<link
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

</head>

<div
	class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
	<h5 class="my-0 mr-md-auto font-weight-normal">
		<a href="#" onclick="window.location.href='home'"> <img
			src="img/cts.png" alt="Lowe's Logo" style="max-width: 40%" />
		</a>
	</h5>


	<ul class="nav my-2 my-md-0 mr-md-3">
		<li class="nav-item"><h4 class="display-5">Cloud JARVIS
				Dashboard</h4></li>
	</ul>

</div>


<div class="container">


	<div
		class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-5">JARVIS</h1>
		<p class="lead">Quickly build an effective pricing table for your
			potential customers with this Bootstrap example. It's built with
			default Bootstrap components and utilities with little customization.</p>


		<nav>
			<div class="nav nav-pills justify-content-center" id="pills-tab"
				role="tablist">
				<a class="nav-link btn btn-outline-primary active"
					id="pills-home-tab" data-toggle="pill" href="#pills-home"
					role="tab" aria-controls="pills-home" aria-selected="true">Pre
					Built Stack</a> <span style="margin-left: 2%"></span> <a
					class="nav-link btn btn-outline-success" id="pills-profile-tab"
					data-toggle="pill" href="#pills-profile" role="tab"
					aria-controls="pills-profile" aria-selected="false">Pre Built
					Tools</a>
			</div>
		</nav>




	</div>


	<%
			
				if (triggerEvent != null && triggerEvent.length() > 0) {
			%>

	<div class="alert alert-warning alert-dismissible fade show"
		role="alert">
		Please wait !! Stack <strong><%=triggerEvent%></strong> Setup InProgress.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<%
				}
			%>




	<hr>

	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
			aria-labelledby="pills-home-tab"><jsp:include page="stack.jsp" /></div>
		<div class="tab-pane fade" id="pills-profile" role="tabpanel"
			aria-labelledby="pills-profile-tab"><jsp:include
				page="tools.jsp" /></div>
	</div>





</div>

<hr>

<footer>

	<div class="container text-center">
		<p class="lead">
			<small class="text-muted">Cognizant Technology Solutions
				&copy; 2019 </small>
		</p>
	</div>

</footer>


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script>
	window.jQuery
			|| document
					.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
</script>
<script src="../../assets/js/vendor/popper.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<script src="../../assets/js/vendor/holder.min.js"></script>
<script>
	Holder.addTheme('thumb', {
		bg : '#55595c',
		fg : '#eceeef',
		text : 'Thumbnail'
	});
</script>

</html>