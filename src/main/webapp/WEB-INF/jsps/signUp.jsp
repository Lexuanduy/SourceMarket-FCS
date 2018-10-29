<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.5/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.5/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.6/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	// Initialize Firebase
	// TODO: Replace with your project's customized code snippet
	var config = {
		apiKey : "AIzaSyAKORCs-v8IgQGARlB3yS84mUvFxo-Z1VY",
		authDomain : "sourcemarket-220904.firebaseapp.com",
		databaseURL : "https://user.firebaseio.com",
		projectId : "sourcemarket-220904",
		storageBucket : "sourcemarket-220904.appspot.com",
		messagingSenderId : "750731303750",
	};
	firebase.initializeApp(config);
</script>
<script type="text/javascript">
    /**
     * Handles the sign in button press.
     */
    function toggleSignIn() {
      if (firebase.auth().currentUser) {
        // [START signout]
        firebase.auth().signOut();
        // [END signout]
      } else {
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        if (email.length < 4) {
          alert('Please enter an email address.');
          return;
        }
        if (password.length < 4) {
          alert('Please enter a password.');
          return;
        }
        // Sign in with email and pass.
        // [START authwithemail]
        firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
          // Handle Errors here.
          var errorCode = error.code;
          var errorMessage = error.message;
          // [START_EXCLUDE]
          if (errorCode === 'auth/wrong-password') {
            alert('Wrong password.');
          } else {
            alert(errorMessage);
          }
          console.log(error);
          document.getElementById('quickstart-sign-in').disabled = false;
          alert("Sigin success!");
          // [END_EXCLUDE]
        });
        // [END authwithemail]
      }
      document.getElementById('quickstart-sign-in').disabled = true;
      
    }
    /**
     * Handles the sign up button press.
     */
    function handleSignUp() {
      var email = document.getElementById('email').value;
      var password = document.getElementById('password').value;
      if (email.length < 4) {
        alert('Please enter an email address.');
        return;
      }
      if (password.length < 4) {
        alert('Please enter a password.');
        return;
      }
      // Sign in with email and pass.
      // [START createwithemail]
      firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/weak-password') {
          alert('The password is too weak.');
        } else {
          alert(errorMessage);
        }
        console.log(error);
        alert("Sign Up success!");
        // [END_EXCLUDE]
      });
      // [END createwithemail]
      
    }
    /**
     * Sends an email verification to the user.
     */
    function sendEmailVerification() {
      // [START sendemailverification]
      firebase.auth().currentUser.sendEmailVerification().then(function() {
        // Email Verification sent!
        // [START_EXCLUDE]
        alert('Email Verification Sent!');
        // [END_EXCLUDE]
      });
      // [END sendemailverification]
    }
    
    function sendPasswordReset() {
      var email = document.getElementById('email').value;
      // [START sendpasswordemail]
      firebase.auth().sendPasswordResetEmail(email).then(function() {
        // Password Reset Email Sent!
        // [START_EXCLUDE]
        alert('Password Reset Email Sent!');
        // [END_EXCLUDE]
      }).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/invalid-email') {
          alert(errorMessage);
        } else if (errorCode == 'auth/user-not-found') {
          alert(errorMessage);
        }
        console.log(error);
        // [END_EXCLUDE]
      });
      // [END sendpasswordemail];
    }
    /**
     * initApp handles setting up UI event listeners and registering Firebase auth listeners:
     *  - firebase.auth().onAuthStateChanged: This listener is called when the user is signed in or
     *    out, and that is where we update the UI.
     */
    function initApp() {
      // Listening for auth state changes.
      // [START authstatelistener]
      firebase.auth().onAuthStateChanged(function(user) {
        // [START_EXCLUDE silent]
        /* document.getElementById('quickstart-verify-email').disabled = true; */
        // [END_EXCLUDE]
        if (user) {
          // User is signed in.
          var displayName = user.displayName;
          var email = user.email;
          var emailVerified = user.emailVerified;
          var photoURL = user.photoURL;
          var isAnonymous = user.isAnonymous;
          var uid = user.uid;
          var providerData = user.providerData;
          // [START_EXCLUDE]
          /* document.getElementById('quickstart-sign-in-status').textContent = 'Signed in';
          document.getElementById('quickstart-sign-in').textContent = 'Sign out';
          document.getElementById('quickstart-account-details').textContent = JSON.stringify(user, null, '  '); */
          /* if (!emailVerified) {
            document.getElementById('quickstart-verify-email').disabled = false;
          }
          // [END_EXCLUDE]
        } else {
          // User is signed out.
          // [START_EXCLUDE]
          document.getElementById('quickstart-sign-in-status').textContent = 'Signed out';
          document.getElementById('quickstart-sign-in').textContent = 'Sign in';
          document.getElementById('quickstart-account-details').textContent = 'null'; */
          // [END_EXCLUDE]
        }
        // [START_EXCLUDE silent]
        /* document.getElementById('quickstart-sign-in').disabled = false; */
        // [END_EXCLUDE]
      });
      // [END authstatelistener]
      document.getElementById('quickstart-sign-in').addEventListener('click', toggleSignIn, false);
      document.getElementById('quickstart-sign-up').addEventListener('click', handleSignUp, false);
      /* document.getElementById('quickstart-verify-email').addEventListener('click', sendEmailVerification, false);
      document.getElementById('quickstart-password-reset').addEventListener('click', sendPasswordReset, false); */
    }
    window.onload = function() {
      initApp();
    };
  </script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 35%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

.row {
	margin: 5px 0 10px 0;
	padding: 0 10px 0 10px;
}

input {
	width: 100%;
	height: 32px;
}

.col-sm-3 {
	background-color: #5cb85c;
	height: 32px;
	padding-top: 5px;
}

.col-sm-9 {
	height: 32px;
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
	text-align: center;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	color: white;
}

.signUp {
	width: 100%;
	height: 40px;
	background-color: #5cb85c;
	color: white;
	padding: 0 5px 0 5px;
	display:none;
}

.signIn {
	width: 100%;
	height: 40px;
	background-color: #5cb85c;
	color: white;
	padding: 0 5px 0 5px;
	display:none;
}

.sign-in {
	width: 100%;
	float: left;
	margin-top: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<!-- <div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<input class="mdl-textfield__input"
			style="display: inline; width: auto;" type="text" id="email"
			name="email" placeholder="Email" /> &nbsp;&nbsp;&nbsp; <input
			class="mdl-textfield__input" style="display: inline; width: auto;"
			type="password" id="password" name="password" placeholder="Password" />
		<br /> <br />
		<button disabled class="mdl-button mdl-js-button mdl-button--raised"
			id="quickstart-sign-in" name="signin">Sign In</button>
		&nbsp;&nbsp;&nbsp;
		<button class="mdl-button mdl-js-button mdl-button--raised"
			id="quickstart-sign-up" name="signup">Sign Up</button>
		&nbsp;&nbsp;&nbsp;
		<button class="mdl-button mdl-js-button mdl-button--raised" disabled
			id="quickstart-verify-email" name="verify-email">Send Email
			Verification</button>
		&nbsp;&nbsp;&nbsp;
		<button class="mdl-button mdl-js-button mdl-button--raised"
			id="quickstart-password-reset" name="verify-email">Send
			Password Reset Email</button>

		Container where we'll display the user details
		<div class="quickstart-user-details-container">
			Firebase sign-in status: <span id="quickstart-sign-in-status">Unknown</span>
			<pre>
							<code id="quickstart-account-details">null</code>
						</pre>
		</div>
	</div> -->

	<!-- modal -->
	<!-- Trigger/Open The Modal -->
	<button id="btnSigup">Sign Up</button>
	<button id="btnSigin">Sign In</button>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2 id="text_sig">SIGN UP</h2>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-3">
						<i class="fas fa-envelope-square"></i> <label for="email"><b>Email</b></label>
					</div>
					<div class="col-sm-9">
						<input type="text" placeholder="Enter Email" id="email"
							name="email" required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<i class="fas fa-key"></i> <label for="password"><b>Password</b></label>
					</div>
					<div class="col-sm-9">
						<input type="text" placeholder="Enter Password" id="password"
							name="password" required>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="signUp" id="quickstart-sign-up" name="signup">Sign
					Up</button>
				<button class="signIn" id="quickstart-sign-in" name="signin">Sign
					In</button>
			</div>
		</div>

	</div>

	<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btnsignUp = document.getElementById("btnSigup");
var btnsignIn = document.getElementById("btnSigin");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btnsignUp.onclick = function() {
    modal.style.display = "block";
    var str = document.getElementById("text_sig").innerHTML; 
    var res = str.replace("SIGN IN", "SIGN UP");
    document.getElementById("text_sig").innerHTML = res;
        $(".signIn").hide();
        $(".signUp").show();
        
}

btnsignIn.onclick = function() {
    modal.style.display = "block";
    var str = document.getElementById("text_sig").innerHTML; 
    var res = str.replace("SIGN UP", "SIGN IN");
    document.getElementById("text_sig").innerHTML = res;
    $(".signUp").hide();
    $(".signIn").show();
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>